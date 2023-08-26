<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/warehouse/procurement/viewPurchaseOrder.jsp
 * file type		        : JSP
 * description				: The purchase order is displayed using this jsp
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
	<script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
 	<script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/procurement/purchaseOrderAndReceipts.js"></script>


<script type="text/javascript">

</script>
<style type="text/css">
#overflowtext{

width : 200px;
overflow: hidden;
text-overflow: ellipsis;
 text-align: left;
white-space: nowrap;
}
.buttons {
	float: left;
	padding-top: 0px;
	margin-right: 2%;
	margin-top:1%;
}
  .p:first-child { 
   border-bottom: none !important;
    width:0% !important; 
    padding-left: 0px !important;
    padding-right: 0px !important;
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
<script>
$(document).ready(function(){
changeTotalOrderCost(); 

});

</script>
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
            <h3>${purchaseOrderBeanObj.PO_Ref} - <spring:message code="po.details.label" /></h3>
            </div><!-- /.box-header -->
            <!-- form start -->
            <form id="viewProcurementReceipt" method="post" >
                <div class="box-body">
                <input type="hidden" id="operation" value="">
                <div class="row" style="text-align: right; margin-top: -27px;padding-right:14px">
				 	<div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
				 	<c:if test="${sessionScope.role == 'super admin'}">
						 <c:forEach var="activity" items="${purchaseOrderBeanObj.nextActivities}">
						 	<input type="button" style="margin-left:1%;width: 80px;position: relative;" class="btn bg-olive btn-inline" onclick="validatePurchaseOrder('${activity}','edit');" value="${activity}" />
						 </c:forEach>
					  </c:if>
					 <%--  <c:if test="${sessionScope.role != 'super admin'}">
							 <c:forEach var="activity" items="${purchaseOrderBeanObj.nextActivities}">
							 	<c:forEach var="accessControl" items="${sessionScope.procurementActivity}">
							 		<c:if test="${accessControl.appDocument == 'PurchaseOrder' && activity == accessControl.appDocumentActivity}">
									 	<input type="button" style="margin-left:1%;width: 80px;position: relative;" class="btn bg-olive btn-inline" onclick="validatePurchaseOrder('${activity}','edit');" value="${activity}" />
							 		</c:if>
			     				</c:forEach> 
							 </c:forEach>
				      </c:if> --%>
				 	 <%-- <c:forEach var="activity" items="${purchaseOrderBeanObj.nextActivities}">
					 	<input type="button" style="margin-left:1%;width: 80px;position: relative;" class="btn bg-olive btn-inline" onclick="validatePurchaseOrder('${activity}','edit');" value="${activity}" />
					 </c:forEach> --%>
<%-- 					<input type="button" class="btn bg-olive btn-inline" style="margin-left:1%;width: 80px;margin-right: 1%;position: relative;" onclick="viewPurchaseOrder('','outletPurchaseOrder','0');" value="<spring:message code="cancel.label" />" /> --%>
					<input type="button" class="btnCls" style="text-align:center;" onclick="viewPurchaseOrder('','outletPurchaseOrder','0');" value="<spring:message code="cancel.label" />" />
					<hr style="margin-top: 4px;width: 99%;" />
				</div>
                 
               	<%-- <div class="row">
               		<div class="form-group col-lg-2">
                        <label style="font-family: Calibri;color: gray;"><spring:message code="order_date.label" /></label>
                        <input type="hidden" name="pO_Ref" value="${purchaseOrderBeanObj.PO_Ref}">
                         <input type="text" class="form-control" readonly="readonly" name="order_date" id="orderDate" value="${purchaseOrderBeanObj.ordereDate}" required />
                         <span id="orderDateError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span> 
                    </div>
                    <div class="form-group col-lg-1"></div>
                 	<div class="form-group col-lg-2">
                        <label style="font-family: Calibri;color: gray;"><spring:message code="delivery_date.label" /></label>
                        <input type="text" class="form-control" readonly="readonly" name="delivery_due_date" id="deliveryDate" value="${purchaseOrderBeanObj.deliveryDate}" required />
                        <span id="deliveryDateError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                    </div>
                    <div class="form-group col-lg-1"></div>
                    <div class="form-group col-lg-2">
                        <label style="font-family: Calibri;color: gray;"><spring:message code="order.submitted.by.label" /></label>
                        <input type="text" class="form-control" readonly="readonly" name="order_submitted_by" id="order_submitted_by" value="${purchaseOrderBeanObj.order_submitted_by}" required />
                         <span id="orderSubmittedByError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                    </div><div class="form-group col-lg-1"></div>
                    <div class="form-group col-lg-2">
                        <label style="font-family: Calibri;color: gray;"><spring:message code="order.approved.by.label" /></label>
                        <input type="text" class="form-control" readonly="readonly" name="order_approved_by" id="order_approved_by" value="${purchaseOrderBeanObj.order_approved_by}" required />
                        <span id="orderApprovedByError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                     </div><div class="form-group col-lg-1"></div>
				</div> --%>
				
				
					<div class="row">
               		<div class="form-group col-lg-2">
                        <label style="font-family: Calibri;color: gray;"><spring:message code="order_date.label" /> <span style="color:red; font-size:2">*</span></label>
                        <input type="hidden" name="pO_Ref" id="pO_Ref" value="${purchaseOrderBeanObj.PO_Ref}">
						<input class="form-control calendar_icon" readonly="readonly" style="background-color: white;" name="order_date" id="orderDate" value="${purchaseOrderBeanObj.ordereDate}" size="20" type="text" onfocus="callCalender('orderDate')" onclick="callCalender('orderDate')" placeholder="DD/MM/YYYY"/>
                     	<span id="orderDateError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>    
                    </div>
                  
                 	<div class="form-group col-lg-2">
                        <label style="font-family: Calibri;color: gray;"><spring:message code="delivery_date.label" /> <span style="color:red; font-size:2">*</span></label>
						<input class="form-control calendar_icon" readonly="readonly" style="background-color: white;" name="delivery_due_date" id="deliveryDate" size="20" type="text" value="${purchaseOrderBeanObj.deliveryDate}" onfocus="callCalender('deliveryDate')" onclick="callCalender('deliveryDate')" placeholder="DD/MM/YYYY"/>
						<span id="deliveryDateError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                    </div>
                    
                    
                   <div class="form-group col-lg-1"></div>
                    
                     <div class="form-group col-lg-3" style="padding-right: 0px">
                        <label style="font-family: Calibri;color: gray;"><spring:message code="supplier.name.label" /> <span style="color:red; font-size:2">*</span></label>
                        <input type="text"  class="form-control searchItems" readonly="readonly" placeholder="<spring:message code="search.supplier.label" />"  style="height:30PX;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" name="supplier_name" id="searchSupplier" value="${purchaseOrderBeanObj.supplier_name}" />
						<div class="services">
				    		<div class="items">
				     			<ul class="matchedStringUl supplier" style="width: 89%!important;padding: 0px!important;"></ul>
				   			</div>
						</div>
						<span id="supplierNameError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                     </div>
                    
                    
                    
                    
                    
                   <%--  <div class="form-group col-lg-2">
                        <label style="font-family: Calibri;color: gray;"><spring:message code="order.submitted.by.label" /> <span style="color:red; font-size:2">*</span></label>
                        <input type="text" class="form-control" name="order_submitted_by" id="order_submitted_by" value="${purchaseOrderBeanObj.order_submitted_by}" required />
                        <span id="orderSubmittedByError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                    </div> --%>
                    
                    
                     <div class="form-group col-lg-2">
                        <label style="font-family: Calibri;color: gray;"><spring:message code="supplier.shippment.label" /></label>
                        <input type="text" class="form-control" readonly="readonly" name="order_approved_by" id="order_approved_by" value="${purchaseOrderBeanObj.order_approved_by}" required />
                        <span id="orderApprovedByError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                  </div> 
                    <%-- <div class="form-group col-lg-2">
                        <label style="font-family: Calibri;color: gray;"><spring:message code="order.approved.by.label" /></label>
                        <input type="text" class="form-control" name="order_approved_by" id="order_approved_by" value="${purchaseOrderBeanObj.order_approved_by}" required />
                        <span id="orderApprovedByError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                  </div> --%>
                        <div class="form-group col-lg-2">
                        <label style="font-family: Calibri;color: gray;"><spring:message code="order.submitted.by.label" /> <span style="color:red; font-size:2">*</span></label>
                        <input type="text" class="form-control" readonly="readonly" name="order_submitted_by" id="order_submitted_by" value="${purchaseOrderBeanObj.order_submitted_by}" required />
                        <span id="orderSubmittedByError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                    </div>
				</div>
			
                <%-- div class="row">
                	 <div class="form-group col-lg-2">
                        <label style="font-family: Calibri;color: gray;"><spring:message code="location.label" /></label>
                        <input type="text" class="form-control" readonly="readonly" name="storeLocation" id="warehouse_location" value="${purchaseOrderBeanObj.storeLocation}" required />
                       <select class="form-control" disabled="disabled" id="warehouseLocation" >
                         <c:forEach var="location" items="${locationBeanList}">
							<option value="${location.businessActivity}" ${location.locationId == purchaseOrderBeanObj.warehouse_location ? 'selected' : ''}>${location.locationId}</option>
						 </c:forEach>
					   </select>
                       	<input type="hidden" name="storeLocation" id="storeLocation" value="${purchaseOrderBeanObj.warehouse_location}" />
                       	<input type="hidden" id="warehouse_location">
                     </div><div class="form-group col-lg-1"></div>
                     <div class="form-group col-lg-2">
                        <label style="font-family: Calibri;color: gray;"><spring:message code="supplier.name.label" /></label>
                        <input type="text" class="form-control" name="supplier_name" id="searchSupplier" readonly="readonly" value="${purchaseOrderBeanObj.supplier_name}" required />
                     </div><div class="form-group col-lg-1"></div>
                     <div class="form-group col-lg-2">
                        <label style="font-family: Calibri;color: gray;"><spring:message code="supplier.contact.name.label" /></label>
                        <input type="text" class="form-control" readonly="readonly" name="supplier_contact_name" id="supplier_contact_name" value="${purchaseOrderBeanObj.supplier_contact_name}" required />
                       <input type="hidden" class="form-control" name="supplier_Id" id="supplier_Id" readonly="readonly" value="${purchaseOrderBeanObj.supplier_Id}"/>
                     </div><div class="form-group col-lg-1"></div>
                     <div class="form-group col-lg-2">
                       <label style="font-family: Calibri;color: gray;"><spring:message code="shipment_mode.label" /></label>
                        <input type="text" class="form-control" readonly="readonly" name="shipping_mode" id="shipping_mode" value="${purchaseOrderBeanObj.shipping_mode}" required />
                     </div>
                     <div class="form-group col-lg-1"></div>
              	</div> --%>
              	
              	                <div class="row">
                	 <div class="form-group col-lg-2">
                        <label style="font-family: Calibri;color: gray;"><spring:message code="location.label" /></label>
						<select class="form-control" id="warehouseLocation" readonly="readonly" >
                         <c:forEach var="location" items="${locationBeanList}">
<%-- 							<option value="${location.businessActivity}" ${location.locationId == purchaseOrderBeanObj.warehouse_location ? 'selected' : ''}>${location.locationId}</option> --%>
						
						 <c:if test="${operation != 'warehouse'}">
						<c:choose>
						                                      <c:when test="${location.description == ''}">
						                                       <c:if test="${location.businessActivity != 'Warehouse'}">
							                                   <option value="${location.businessActivity}" ${location.locationId == purchaseOrderBeanObj.warehouse_location ? 'selected' : ''}>${location.locationId}</option>
							                                </c:if>
							                                 </c:when>
							                                  <c:otherwise>
							                                   <c:if test="${location.businessActivity != 'Warehouse'}">
							                                  <option value="${location.businessActivity}" ${location.locationId == purchaseOrderBeanObj.warehouse_location ? 'selected' : ''}>${location.locationId}</option>
							                                </c:if>
							                                </c:otherwise>
							                              </c:choose>
							                              </c:if>
							                              
							                               <c:if test="${operation == 'warehouse'}">
							                               <c:choose>
						                                      <c:when test="${location.description == ''}">
							                                   <option value="${location.businessActivity}" ${location.locationId == purchaseOrderBeanObj.warehouse_location ? 'selected' : ''}>${location.locationId}</option>
							                              
							                                 </c:when>
							                                  <c:otherwise>
							                                  <option value="${location.businessActivity}" ${location.locationId == purchaseOrderBeanObj.warehouse_location ? 'selected' : ''}>${location.locationId}</option>
							                                </c:otherwise>
							                              </c:choose>
							                               </c:if>
						 </c:forEach>
					   </select>
                       
                       	<input type="hidden" name="storeLocation" readonly="readonly" id="storeLocation" value="${purchaseOrderBeanObj.warehouse_location}" />
                       	<input type="hidden" id="warehouse_location" value="Warehouse">
                     </div>
                     
                     <div class="form-group col-lg-3" style="padding-right: 0px">
						<label style="font-family: Calibri;color: gray;"><spring:message code="quote.ref.label" /> </label>
						<input type="text" readonly="readonly" class="form-control searchItems" value="${purchaseOrderBeanObj.quoteRef}" style="height:30PX;;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" id="quoteRef" placeholder="<spring:message code="quote.ref.label" />" />
						<div class=services>
					    		<div class="items">
					     			<ul class="matchedStringUl quoteRef" style="width: 89%!important;padding: 0px!important;"></ul>
					   			</div>
							</div>
						<!-- <span id="supplierNameError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span> -->
						<input type="hidden" name="quoteRef" id="quoteReference" value="${purchaseOrderBeanObj.quoteRef}"  />
					</div>
                   
                   
                    <div class="form-group col-lg-2">
                        <label style="font-family: Calibri;color: gray;"><spring:message code="supplier.code.label" /></label>
                        <input type="text" readonly="readonly" class="form-control" name="order_approved_by" id="order_approved_by" value="${purchaseOrderBeanObj.supplier_Id}" required />
                        <span id="orderApprovedByError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                  </div>
                   
                    <div class="form-group col-lg-1"></div>
                     <input type="hidden" class="form-control"  id="supplier_flag" readonly="readonly" value=""/>
                      <input type="hidden" class="form-control" name="supplier_Id" id="supplier_Id" readonly="readonly" value="${purchaseOrderBeanObj.supplier_Id}"/>
                        <input type="hidden" class="form-control"  id="supplier_Name" readonly="readonly" value="${purchaseOrderBeanObj.supplier_Id}"/>
                     <%-- <div class="form-group col-lg-3">
                        <label style="font-family: Calibri;color: gray;"><spring:message code="supplier.contact.name.label" /> <span style="color:red; font-size:2">*</span></label>
                        <input type="text" class="form-control" name="supplier_contact_name" id="supplier_contact_name" value="${purchaseOrderBeanObj.supplier_contact_name}" required />
                     </div> --%>
                     <div class="form-group col-lg-2">
                       <label style="font-family: Calibri;color: gray;"><spring:message code="shipment_mode.label" /></label>
                     	<select class="form-control" readonly="readonly" name="shipping_mode" id="shipping_mode">
                           <option value="Rail" ${'Rail' == purchaseOrderBeanObj.shipping_mode ? 'selected' : ''}>Rail</option>
                           <option value="Flight" ${'Flight' == purchaseOrderBeanObj.shipping_mode ? 'selected' : ''}>Flight</option>
                           <option value="Express" ${'Express' == purchaseOrderBeanObj.shipping_mode ? 'selected' : ''}>Express</option>
                           <option value="Ordinary" ${'Ordinary' == purchaseOrderBeanObj.shipping_mode ? 'selected' : ''}>Ordinary</option>
                        </select>
                     </div>
                     
                     <div class="form-group col-lg-2">
                        <label style="font-family: Calibri;color: gray;"><spring:message code="order.approved.by.label" /></label>
                        <input type="text" class="form-control" readonly="readonly" name="order_approved_by" id="order_approved_by" value="${purchaseOrderBeanObj.order_approved_by}" required />
                        <span id="orderApprovedByError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                  </div> 
                    
              	</div>
              	
              	<div class="col-lg-12" style="background: #eee;padding: 10px 0px 10px 0px;    margin-bottom: 25px;margin-top: 30px;">
      									<div class="col-lg-9">
      									
      									<div class="col-lg-9" style="padding-left: 0px;    padding-top: 5px;">
      									  <c:forEach var="previousWorkFlowList" items="${purchaseOrderBeanObj.previousStates}">
      									  <div class="p" style="display:inline-block;"></div>
                                             <span class=" border" style="padding-left: 0px;padding-top: 17px;font-size: 16px;"><img alt="" style="height:30px" src="${pageContext.request.contextPath}/images/workflow_arrow.png">${previousWorkFlowList}
      									
      									</span>
      									
                                             </c:forEach></div>
      									</div>
      									
      									<div class="col-lg-1"></div>
      									</div>
                    <div class="table-responsive" >
                    <div class="col-lg-12" style="overflow: auto !important;padding: 0px;">
                    <table id="productsList" class="table table-bordered table-hover">
                      <thead style="background-color: #3c8dbc; color: #ffffff">
                        <tr>
                        	<th><div><spring:message code="sl.no.label" /></div></th>
                        	<th><spring:message code="sku.id.label"/></th>
                            <th><div style="width:60px"><spring:message code="ean.label"/></div></th>
                        	<th><spring:message code="hsnCode.label"/></th>
                            <th><spring:message code="item.desc.label"/></th>
                            <th>PR <spring:message code="price.label"/></th>
                            <th>Qty</th>
                            <th><spring:message code="Tax.label"/>%</th>
                            <!--added taxes  by manasa  -->
                            <th><spring:message code="cgst.label"/></th>
                            <th><spring:message code="sgst.label"/></th>
                            <th><spring:message code="igst.label"/></th>
                            <th><spring:message code="cost"/></th>
                             <th>MRP</th>
                            <th>Sale Price</th>
                            <th>MBQ</th>
                             <th>Profit(%)</th>
                            <th><spring:message code="uom.label"/></th>
                            <th><spring:message code="avail.qty.label"/></th>
                            <th>Avg Sale</th>
                            <th><spring:message code="colour.label"/></th>
                            <th><spring:message code="size.label"/></th>
                            <th style="display: none;"><spring:message code="action.label"/></th>
                        </tr>
                      </thead>
                      <tbody style="text-align: center;">
                       <c:forEach var="item" items="${purchaseOrderBeanObj.purchaseItems}" varStatus="theCount">
             		  <%--  <tr>
             		   	<td>${theCount.count}</td>
              			<td>${item.itemId}</td>
                  		<td>${item.itemDesc}</td>
                  		<td>${item.itemPrice}</td>
                  		<td>${item.quantity }</td>
                  		<td>${item.totalCost}</td>
                  		<td>${item.make}</td>
                  		<td>${item.model }</td>
                  		<td>${item.color}</td>
                  		<td>${item.size}</td>
                  	   </tr> --%>
                  	   <tr id="dynamicdiv${theCount.count}">
             		   		<td class="slno">${theCount.count}</td>
	              			<td id="itemId${theCount.count}">${item.skuId}</td>
	              			<td id="ean${theCount.count}">${item.ean}</td>
	              			<td id="hsnCode${theCount.count}">${item.hsnCode}</td>
	              			<input type="hidden" id="skuId${theCount.count}" value="${item.skuId}" />
	              			<input type="hidden" id="pluCode${theCount.count}" value="${item.pluCode}"/>
           
             <input type='hidden' id="cgsttax${theCount.count}" value="${item.cgstRate}"/>
              			               <input type='hidden' id="sgsttax${theCount.count}" value="${item.sgstRate}"/>
              					 <input type='hidden' id="igsttax${theCount.count}" value="${item.igstRate}"/>
              						
           	<td id="itemDesc${theCount.count}"><div id="overflowtext"> <a href="#" data-toggle="tooltip"  title="${item.itemDesc}">${item.itemDesc}</a></div></td>    
	              			
<%-- 	                  		<td id="itemDesc${theCount.count}">${item.itemDesc}</td>
 --%>	                  		<td id="itemPrice${theCount.count}" class="Price">${item.itemPrice}</td>
	                  		<td id="quantity${theCount.count}" class="Pack">${item.quantity }</td>
	                  		<td id="tax${theCount.count}" class="Pack">${item.tax}</td>
	                  		<td id="cgsttaxvalue${theCount.count}">${item.cgstValue}</td>
                  		    <td id="sgsttaxvalue${theCount.count}">${item.sgstValue}</td>
                  		    <td id="igsttaxvalue${theCount.count}">${item.igstValue}</td>
	                  		<td id="totalCost${theCount.count}" class="cost" >${item.totalCost}</td>
	                  		
	                  		<td id="mrp${theCount.count}">${item.mrp}</td>
			                <td id="salePrice${theCount.count}">${item.itemPrice}</td>
			                 <td id="mbq${theCount.count}">${item.mbq}</td>
	                  		<td id="profitability${theCount.count}">${item.profitability}</td>

	                  		<td id="make${theCount.count}">${item.uom}</td>
	                  		<td id="model${theCount.count}">${item.availableQty}</td>
	                  		<td id="avgSale${theCount.count}">${item.avlQty}</td>
	                  		<td id="color${theCount.count}">${item.color}</td>
	                  		<td id="size${theCount.count}">${item.size}</td>
	                  		<td style="display: none;" id="Del${theCount.count}"><img id="Img${theCount.count}" src="${pageContext.request.contextPath}/images/itemdelete.png" style="width:15%;cursor:pointer;" onclick="deleteItemDetails(this);" title="Delete"/></td>
                  	   </tr>
              		   </c:forEach> 
		 </tbody>
                   </table>
                   </div>
                </div>
                  <br>
                   <%--  <div class="col-lg-12 nopadding">
					<div class="col-lg-6"></div>
					<div class="col-lg-3 nopadding">
					<div class="form-group col-lg-7 " style="text-align: right;"><label style="font-family: Calibri;color: gray;"><spring:message code="sub.total.label" /> </label></div>
					<div class="form-group col-lg-5 nopadding">
					 <c:forEach var="summaryList" items="${purchaseOrderBeanObj.purchaseItems}" varStatus="thecount">
				<c:set var="qtyissued" value="${qtyissued+((summaryList.quantity)*(summaryList.itemPrice))}" scope="page" />
				</c:forEach>
						<input type="text" class="form-control" id="subtotalCost" name="products_cost" readonly="readonly" value="${purchaseOrderBeanObj.products_cost}"/>
					</div></div>
					<div class="col-lg-3 nopadding">
						<div class="form-group col-lg-7 " style="text-align: right;"><label style="font-family: Calibri;color: gray;"><spring:message code="shipping.cost.label" /> </label></div>
						<div class="form-group col-lg-5 nopadding">
						<input type="text" class="form-control" id="shipping_cost" readonly name="shipping_cost" value="${purchaseOrderBeanObj.shipping_cost}"  oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
						</div></div>
						<span id="shipCostError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
				</div> --%>
<%-- 				  <div class="col-lg-12 nopadding">
					<div class="col-lg-8 nopadding"></div>
					<div class="col-lg-2 ">
					<label style="font-family: Calibri;color: gray;"><spring:message code="sub.total.label" /> </label>
					
					 <c:forEach var="summaryList" items="${purchaseOrderBeanObj.purchaseItems}" varStatus="thecount">
				<c:set var="qtyissued" value="${qtyissued+((summaryList.quantity)*(summaryList.itemPrice))}" scope="page" />
				</c:forEach>
						<input type="text" class="form-control" readonly="readonly" id="subtotalCost" name="products_cost" readonly="readonly" value="${purchaseOrderBeanObj.products_cost}"/>
					</div>
					<div class="col-lg-2 ">
						<label style="font-family: Calibri;color: gray;"><spring:message code="shipping.cost.label" /><span style="color:red; font-size:2">*</span> </label>
						
						<input type="text" class="form-control"  readonly="readonly" id="shipping_cost" name="shipping_cost" pattern= "[0-9]" value="${purchaseOrderBeanObj.shipping_cost}" />
					<span id="shipCostError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						
						</div>
						
						
						
				</div> --%>
                 <%--  <div class="col-lg-12 nopadding">
                  <input type="hidden" name="itemDetails" id="whPurchaseItems">
                  <input type="hidden" name="deliveryLocations" id="deliveryLocations">
					 <input type="hidden" class="form-control" readonly="readonly" name="status" id="orderStatus"  value="${purchaseOrderBeanObj.status}"/> 
						<div class="col-lg-6"></div>
					<div class="col-lg-3 nopadding">
						<div class="form-group col-lg-7 " style="text-align: right;"><label style="font-family: Calibri;color: gray;"><spring:message code="total.Othertax.label" /></label></div>
						<div class="form-group col-lg-3 nopadding">
						<input type="text" class="form-control" readonly id="total_tax" name="total_tax"  value="${purchaseOrderBeanObj.total_tax}"  oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
						<span id="totalTaxError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						
						<div class="form-group col-lg-2 nopadding">
						<input type="text" class="form-control"  style="margin-left: 3px;" id="other_tax" name="other_tax"  value="${purchaseOrderBeanObj.otherTaxAmt}"  oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
						<span id="totalTaxError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						</div>
						<div class="col-lg-3 nopadding">
						<div class="form-group col-lg-7 " style="text-align: right;"><label style="font-family: Calibri;color: gray;"><spring:message code="total.discounts.label" /> </label></div>
						<div class="form-group col-lg-5 nopadding">
						<input type="text" class="form-control" id="discount" readonly name="shipping_cost" value="${purchaseOrderBeanObj.discount}"  oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
						</div></div>
						<span id="shipCostError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
					
					
					<div class="row">
						<div class="col-lg-8"></div>
							</div>
					</div> --%>
					
					
					<div class="row" style="margin-top: 173px;pointer-events: none;">
					<div class="form-group col-lg-8">
					
					
					<div class="" style="margin-top: 8px;cursor: pointer;margin-bottom: 0px;" ><span style="font-weight: bold;font-size: 16px;color:#666;cursor: pointer;"><spring:message code="delivery.locations.label" /></span></div>
        <hr style="border-top: 1px solid rgb(181,230,29);margin-top: 0px;width:72%;
    margin-left: 0px;">
        <div class="row" style="margin-right: -331px;margin-top: -47px;">
        	<div class="form-group col-lg-7" id="locationAddError" style="text-align: center;color: red;font-size: 2;font-weight: bold;"></div>
			<div class="form-group col-lg-2" style="margin-left:-123px;padding-left: 0px; padding-right: 0px;width: 12%;margin-bottom: 0px;">
				<label style="font-family: Calibri;color: gray;"><spring:message code="location.label" /></label>
				<select class="form-control" id="deliveryLocation" >
					<c:forEach var="location" items="${workLocationsList}">
						<option value="${location}" ${location == selectedLocation ? 'selected' : ''}>${location}</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group col-lg-2" style="padding-top: 15px;margin-bottom: 0px;">
				<div class="buttons" style="">
					<a onclick="appendLocationsDiv()" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>
				</div>
			</div>
		</div>
		<div id="locations" style="display: none;margin: 0px;">
			<div class="row-fluid-5 locationRow" id="locations0" >
				<div class="form-group span2" style="margin-bottom: 0px;margin-top: -4px;">
					<label style="font-family: Calibri;color: gray;"><spring:message code="location.label" /> <span style="color:red; font-size:2">*</span></label> 
					<input type="text" readonly="readonly" class="form-control addedLocation" id="location0" />
				</div>
				<div class="form-group span2" style="margin-bottom: 0px;margin-top: -4px;">
					<label style="font-family: Calibri;color: gray;"><spring:message code="shipment_street.label" /> <span style="color:red; font-size:2">*</span></label>
					<input type="text" readonly="readonly"  class="form-control" id="street0" />
				</div>
				<div class="form-group span2" style="margin-bottom: 0px;margin-top: -4px;" >
					<label style="font-family: Calibri;color: gray;"><spring:message code="area.label" /> <span style="color:red; font-size:2">*</span></label>
					<input type="text" readonly="readonly"  class="form-control" id="area0"  />
				</div>
				<div class="form-group span2" style="margin-bottom: 0px;margin-top: -4px;">
					<label style="font-family: Calibri;color: gray;"><spring:message code="shipment_city.label" /> <span style="color:red; font-size:2">*</span></label> 
					<input type="text" readonly="readonly" class="form-control" id="city0" />
				</div>
				<div class="form-group span2" style="padding-top: 15px;margin-bottom: 0px;margin-top: -4px;">
					<div class="buttons" style="">
						<a onclick="showPopUp(this);" id="popup0" class="button" style="width:110px;text-align: center;"><font size="2px"><spring:message code="shipments.label" /></font></a>
					</div>
					<span style="width: 60px;margin-left: 0px;">
						<img id="img0" src="${pageContext.request.contextPath}/images/itemdelete1.png" style="width: 24px;cursor: pointer;padding-top: 5px;" onclick="deleteDiv(this)">
					</span>
				</div>
				<div id="relatedItemsDiv0" style="display: none;"><table id="relatedItemsTable0"><tbody></tbody></table></div>
			</div>
		</div>
		<div class="locationsAdded" style="width:100%; white-space: nowrap">
			 <c:forEach var="item" items="${purchaseOrderBeanObj.selectedLocationList}" varStatus="theCount">
			 	<div class="row-fluid-5 locationRow" id="locations${theCount.count}">
				<div class="form-group span2" style="margin-bottom: 0px;margin-top: -4px;">
					<label style="font-family: Calibri;color: gray;"><spring:message code="location.label" /> <span style="color:red; font-size:2">*</span></label> 
					<input type="text" readonly="readonly" value="${item.locationId}" class="form-control addedLocation" id="location${theCount.count}" />
				</div>
				<div class="form-group span2" style="margin-bottom: 0px;margin-top: -4px;">
					<label style="font-family: Calibri;color: gray;"><spring:message code="shipment_street.label" /> <span style="color:red; font-size:2">*</span></label>
					<input type="text" readonly="readonly" value="${item.address}" class="form-control" id="street${theCount.count}" />
				</div>
				<div class="form-group span2" style="margin-bottom: 0px;margin-top: -4px;">
					<label style="font-family: Calibri;color: gray;"><spring:message code="area.label" /> <span style="color:red; font-size:2">*</span></label>
					<input type="text" readonly="readonly" value="${item.area}" class="form-control" id="area${theCount.count}"  />
				</div>
				<div class="form-group span2" style="margin-bottom: 0px;margin-top: -4px;">
					<label style="font-family: Calibri;color: gray;"><spring:message code="shipment_city.label" /> <span style="color:red; font-size:2">*</span></label> 
					<input type="text" readonly="readonly" value="${item.city}" class="form-control" id="city${theCount.count}" />
				</div>
				<div class="form-group span2" style="padding-top: 15px;margin-bottom: 0px;margin-top: -4px;">
					<div class="buttons" style="">
						<a onclick="showPopUp(this);" id="popup${theCount.count}" class="button" style="width:110px;text-align: center;"><font size="2px"><spring:message code="shipments.label" /></font></a>
					</div>
					<span style="width: 60px;margin-left: 0px;">
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
		     	<td id="selectedItemDesc_${poCount}"><div id="overflowtext"> <a href="#" data-toggle="tooltip"  title="${poLoc.skuName}">${poLoc.skuName}</a></div></td>    
									
<%-- 									<td id='selectedItemDesc_${poCount}'>${poLoc.skuName}</td>
 --%>									<td id='selectedItemPrice_${poCount}'>${poLoc.skuPrice}</td>
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
		
		 <div class="form-group col-lg-6" style="padding-left:0px;margin-bottom:0px !important">
                        <label style="font-family: Calibri;color: gray;"><spring:message code="credit.terms.label" /></label>
                        <textarea class="form-control" name="credit_terms" style="resize: none;" id="credit_terms" required >${purchaseOrderBeanObj.credit_terms}</textarea>
                    </div>
                
                     <div class="form-group col-lg-6" style="padding-right:0px;margin-bottom:0px !important">
                        <label style="font-family: Calibri;color: gray;"><spring:message code="payment.terms.label" /></label>
                        <textarea class="form-control" style="resize: none;" id="payment_terms" name="payment_terms">${purchaseOrderBeanObj.payment_terms}</textarea>
                    </div>
                
                    			<div class="form-group col-lg-6" style="padding-left:0px;margin-bottom:0px !important">
							<label style="font-family: Calibri;color: gray;"><spring:message code="shipping.terms.label" /></label>
							<textarea  class="form-control" name="shipping_terms" id="shipping_terms" style="resize: none;" >${purchaseOrderBeanObj.shipping_terms}</textarea>
						</div>
					
						<div class="form-group col-lg-6" style="padding-right:0px;margin-bottom:0px !important">
							<label style="font-family: Calibri;color: gray;"><spring:message code="remarks.label" /></label>
							<textarea  class="form-control" name="remarks" id="remarks" style="resize: none;" >${purchaseOrderBeanObj.remarks}</textarea>
						</div>
					
		</div>
		
		 <div class="col-lg-4">
		
		
		  <div class="col-lg-12 nopadding">
					
					<div class="col-lg-6">
					<label style="font-family: Calibri;color: gray;"><spring:message code="sub.total.label" /> </label>
					
					 <c:forEach var="summaryList" items="${purchaseOrderBeanObj.purchaseItems}" varStatus="thecount">
				<c:set var="qtyissued" value="${qtyissued+((summaryList.quantity)*(summaryList.itemPrice))}" scope="page" />
				</c:forEach>
						<input type="text" class="form-control" id="subtotalCost" name="products_cost" readonly="readonly" value="${purchaseOrderBeanObj.products_cost}"/>
					</div>
					<div class="col-lg-6 ">
						<label style="font-family: Calibri;color: gray;"><spring:message code="shipping.cost.label" /><span style="color:red; font-size:2">*</span> </label>
						
						<input type="text" class="form-control" readonly="readonly" id="shipping_cost" name="shipping_cost" pattern= "[0-9]" value="${purchaseOrderBeanObj.shipping_cost}" />
					<span id="shipCostError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						
						</div>
						
						
						
				</div>
				
				
				
				<div class="col-lg-12 nopadding">
                  <input type="hidden" name="itemDetails" id="whPurchaseItems">
                   <input type="hidden" name="cgstAmt" id="cgstAmt" value="${purchaseOrderBeanObj.cgstAmt}">
                  <input type="hidden" name="deliveryLocations" id="deliveryLocations">
					 <input type="hidden" class="form-control" readonly="readonly" name="status" id="orderStatus"  value="${purchaseOrderBeanObj.status}"/> 
					
					<div class="col-lg-6 ">
						<label style="font-family: Calibri;color: gray;"><spring:message code="total.Othertax.label" /></label>
						<div class="col-lg-8 nopadding" >
						<input type="text" class="form-control" readonly="readonly" id="total_tax" name="total_tax"  value="${purchaseOrderBeanObj.total_tax}"  oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
						<span id="totalTaxError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						
						<div class="col-lg-4 nopadding">
						<input type="text" class="form-control" readonly="readonly" style="margin-left: 3px;" id="otherTaxAmt" name="otherTaxAmt"  placeholder="otherTaxes" value="${purchaseOrderBeanObj.otherTaxAmt}"  oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
						<span id="totalTaxError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						
						</div>
						<div class="col-lg-6">
						<label style="font-family: Calibri;color: gray;"><spring:message code="total.discounts.label" /> </label>
						
						<input type="text" class="form-control" id="discount" readonly="readonly" name="shipping_cost" value="${purchaseOrderBeanObj.discount}" />
						</div>
<!-- 						<span id="shipCostError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> -->
					
					<div class="row">
						<div class="col-lg-8 "></div>
							</div>
					</div>
					
					
					 <div class="col-lg-12 nopadding">
					
					<div class="col-lg-6">
					<label style="font-family: Calibri;color: gray;">No Of Items</label>
					
						<input type="number" class="form-control" id="noofitems" name="noofitems" readonly="readonly" value="0"/>
					</div>
				
				
					<div class="col-lg-6 ">
						<label style="font-family: Calibri;color: gray;">Total Qty</label>
						
						<input type="number" class="form-control" id="totalqty" readonly="readonly" name="totalqty" pattern= "[0-9]" value="0" />
						
						</div>
						
				</div>
					
					
					
					<div class="col-lg-12 nopadding">
						
						<div class="col-lg-12 ">
						
						<div class=" col-lg-2" style="    font-size: 22px;    background-color: #f4f4f4;padding: 3px 0px; border-top: 1px solid #ccc;margin-top: 2px;">&nbsp</div>
						<div class=" col-lg-10 nopadding"style="    background-color: #f4f4f4;padding: 3px 0px; border-top: 1px solid #ccc;margin-top: 2px;">
						<div class=" col-lg-5 nopadding" style="font-size: 22px;"><label style="font-family: Calibri;color: gray;"><spring:message code="cost.label" /> </label></div>
						<div class=" col-lg-3"></div>
						<div class=" col-lg-4" style="padding-right: 0px;padding-left: 7px;">
						 <c:forEach var="summaryList" items="${purchaseOrderBeanObj.purchaseItems}" varStatus="thecount">
				<c:set var="qty" value="${qty+((summaryList.quantity)*(summaryList.itemPrice))}" scope="page" />
				</c:forEach>
						<input type="text" style="background-color: #fff;" class="form-control" id="totalCost" name="total_po_value" readonly="readonly" value="${purchaseOrderBeanObj.total_po_value}"/>
					</div></div></div>
					</div>
				
				
				
				
				
		</div>
		
		
		</div>
					
					
					 <%-- <div class="col-lg-12 nopadding">
                  <input type="hidden" name="itemDetails" id="whPurchaseItems">
                   <input type="hidden" name="cgstAmt" id="cgstAmt" value="${purchaseOrderBeanObj.cgstAmt}">
                  <input type="hidden" name="deliveryLocations" id="deliveryLocations">
					 <input type="hidden" class="form-control" readonly="readonly" name="status" id="orderStatus"  value="${purchaseOrderBeanObj.status}"/> 
						<div class="col-lg-8 nopadding"></div>
					<div class="col-lg-2 ">
						<label style="font-family: Calibri;color: gray;"><spring:message code="total.Othertax.label" /></label>
						<div class="col-lg-8 nopadding" >
						<input type="text" class="form-control" readonly="readonly" id="total_tax" name="total_tax"  value="${purchaseOrderBeanObj.total_tax}"  oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
						<span id="totalTaxError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						
						<div class="col-lg-4 nopadding">
						<input type="text" class="form-control"  readonly="readonly" style="margin-left: 3px;" id="otherTaxAmt" name="otherTaxAmt"  placeholder="otherTaxes" value="${purchaseOrderBeanObj.otherTaxAmt}"  oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
						<span id="totalTaxError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						
						</div>
						<div class="col-lg-2">
						<label style="font-family: Calibri;color: gray;"><spring:message code="total.discounts.label" /> </label>
						
						<input type="text" class="form-control" readonly="readonly" id="discount" name="shipping_cost" value="${purchaseOrderBeanObj.discount}" />
						</div>
<!-- 						<span id="shipCostError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> -->
					
					<div class="row">
						<div class="col-lg-8 "></div>
							</div>
					</div> --%>
					
					<input type="hidden" id="fromDate" value="">
				<input type="hidden" id="toDate" value="">
				
					<%-- <div class="col-lg-12 nopadding">
						<div class="col-lg-8"></div>
						<div class="col-lg-4 " style="margin-top: 2px;">
						
						<div class=" col-lg-2" style="    font-size: 22px;    background-color: #f4f4f4;padding: 3px 0px; border-top: 1px solid #ccc;">&nbsp</div>
						<div class=" col-lg-10 nopadding"  style="background-color: #f4f4f4;padding: 3px 0px; border-top: 1px solid #ccc;">
						
						
						<div class=" col-lg-8 nopadding" style="font-size: 22px;"><label style="font-family: Calibri;color: gray;"><spring:message code="tquantity.label" /> </label></div>
						
						<div class=" col-lg-4" style="padding-right: 0px;padding-left: 7px;">
						<c:set var="tqty" value="0" scope="page" />
						 <c:forEach var="summaryList" items="${purchaseOrderBeanObj.purchaseItems}" varStatus="thecount">
				<c:set var="tqty" value="${tqty+((summaryList.quantity))}" scope="page" />
				</c:forEach>
						<input type="text" style="background-color: #fff;" class="form-control"  name="total_po_value" readonly="readonly" value="${tqty}"/>
					</div></div>
						
					
						
						<div class=" col-lg-2" style="font-size: 22px;    background-color: #f4f4f4;padding: 3px 0px; border-top: 1px solid #ccc;margin-top: 2px">&nbsp</div>
						<div class=" col-lg-10 nopadding" style="margin-top: 2px;background-color: #f4f4f4;padding: 3px 0px; border-top: 1px solid #ccc;">
						<div class=" col-lg-8 nopadding" style="font-size: 22px;"><label style="font-family: Calibri;color: gray;"><spring:message code="cost.label" /> </label></div>
						
						<div class=" col-lg-4" style="padding-right: 0px;padding-left: 7px;">
						 <c:forEach var="summaryList" items="${purchaseOrderBeanObj.purchaseItems}" varStatus="thecount">
				<c:set var="qty" value="${qty+((summaryList.quantity)*(summaryList.itemPrice))}" scope="page" />
				</c:forEach>
						<input type="text" style="background-color: #fff;" class="form-control" id="totalCost" name="total_po_value" readonly="readonly" value="${purchaseOrderBeanObj.total_po_value}"/>
					</div>
					
					</div></div>
					</div> --%>
					
					
					
					
					
					
 <%--                <div class="" style="margin-top: 8px;cursor: pointer;margin-bottom: 0px;" ><span style="font-weight: bold;font-size: 16px;color:#666;cursor: pointer;"><spring:message code="delivery.locations.label" /></span></div>
        		<hr style="border-top: 1px solid rgb(181,230,29);margin-top: 0px;">
                <div id="locations" style="display: none;">
			<div class="row-fluid-5 locationRow" id="locations0">
				<div class="form-group span2" >
					<label style="font-family: Calibri;color: gray;"><spring:message code="location.label" /> <span style="color:red; font-size:2">*</span></label> 
					<input type="text" readonly="readonly" class="form-control addedLocation" id="location0" />
				</div>
				<div class="form-group span2" >
					<label style="font-family: Calibri;color: gray;"><spring:message code="shipment_street.label" /> <span style="color:red; font-size:2">*</span></label>
					<input type="text" readonly="readonly"  class="form-control" id="street0" />
				</div>
				<div class="form-group span2" >
					<label style="font-family: Calibri;color: gray;"><spring:message code="area.label" /> <span style="color:red; font-size:2">*</span></label>
					<input type="text" readonly="readonly"  class="form-control" id="area0"  />
				</div>
				<div class="form-group span2" >
					<label style="font-family: Calibri;color: gray;"><spring:message code="shipment_city.label" /> <span style="color:red; font-size:2">*</span></label> 
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
					<label style="font-family: Calibri;color: gray;"><spring:message code="location.label" /> <span style="color:red; font-size:2">*</span></label> 
					<input type="text" readonly="readonly" value="${item.locationId}" class="form-control addedLocation" id="location${theCount.count}" />
				</div>
				<div class="form-group span2" >
					<label style="font-family: Calibri;color: gray;"><spring:message code="shipment_street.label" /> <span style="color:red; font-size:2">*</span></label>
					<input type="text" readonly="readonly" value="${item.address}" class="form-control" id="street${theCount.count}" />
				</div>
				<div class="form-group span2" >
					<label style="font-family: Calibri;color: gray;"><spring:message code="area.label" /> <span style="color:red; font-size:2">*</span></label>
					<input type="text" readonly="readonly" value="${item.area}" class="form-control" id="area${theCount.count}"  />
				</div>
				<div class="form-group span2" >
					<label style="font-family: Calibri;color: gray;"><spring:message code="shipment_city.label" /> <span style="color:red; font-size:2">*</span></label> 
					<input type="text" readonly="readonly" value="${item.city}" class="form-control" id="city${theCount.count}" />
				</div>
				<div class="form-group span2" style="padding-top: 15px;">
					<div class="buttons" style="">
						<a onclick="showPopUp(this,'view');" id="popup${theCount.count}" class="button" style="width:110px;text-align: center;"><font size="2px"><spring:message code="shipments.label" /></font></a>
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
									<td id='selectedQuantity_${poCount}' class='selectedPack ${poLoc.pluCode}' >${poLoc.quantity}</td>
									<td class='selectedCost' id='selectedTotalCost_${poCount}'>${poLoc.totalCost}</td>
									<td style="display: none;" id='selectedDel_${poCount}' ><img id='selectedImg_${poCount}' src="${pageContext.request.contextPath}/images/itemdelete.png" style='width:15%;cursor:pointer;' onclick='deleteSelectedItemDetails(this);' title='Delete ${poLoc.skuId}'/></td>
									<c:set var="poCount" value="${poCount + 1}" />
								</tr>
						 </c:if>
					</c:forEach>
				</tbody></table></div>
			</div>
			 </c:forEach>
		</div> --%>
		<%-- <br>
         <div class="row">
                     <div class="form-group col-lg-6">
                        <label style="font-family: Calibri;color: gray;"><spring:message code="credit.terms.label" /></label>
                        <textarea class="form-control" readonly="readonly" name="credit_terms" style="resize: none;" id="credit_terms" required >${purchaseOrderBeanObj.credit_terms}</textarea>
                    </div>
                 
                     <div class="form-group col-lg-6">
                        <label style="font-family: Calibri;color: gray;"><spring:message code="payment.terms.label" /></label>
                        <textarea readonly="readonly" class="form-control" style="resize: none;" name="payment_terms">${purchaseOrderBeanObj.payment_terms}</textarea>
                    </div>
                 </div>
                    
                    <div class="row">
						<div class="form-group col-lg-6">
							<label style="font-family: Calibri;color: gray;"><spring:message code="shipping.terms.label" /></label>
							<textarea  class="form-control" readonly="readonly" name="shipping_terms" style="resize: none;" >${purchaseOrderBeanObj.shipping_terms}</textarea>
						</div>
					
						<div class="form-group col-lg-6">
							<label style="font-family: Calibri;color: gray;"><spring:message code="remarks.label" /></label>
							<textarea  class="form-control" readonly="readonly" name="remarks" style="resize: none;" >${purchaseOrderBeanObj.remarks}</textarea>
						</div>
					</div>        --%>
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
                             <th><spring:message code="item.desc.label"/></th>
                             <th><spring:message code="price.label"/></th>
                         </tr>
                       </thead>
                       <tbody style="text-align: center;">
			 			</tbody>
                    </table>
                 </div>
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
							 <th style="display: none;"><spring:message code="action.label"/></th>
                         </tr>
                       </thead>
                       <tbody style="text-align: center;">
                       	
			 			</tbody>
                    </table>
                 </div>
                 <div class="row" style="text-align: center;">
                 		<%-- <input type="button" id="saveSelection"  class="btn bg-olive btn-inline" style="margin-left:1%;margin-right:1%;width: 68px;" onclick="saveSelectedSkus();" value="<spring:message code="save.label" />" /> --%>
						<!-- <button type="button" class="close" data-dismiss="modal" aria-hidden="true">�</button> -->
						<input type="button" id="cancelSelection" class="btnCls" style="" data-dismiss="modal" aria-hidden="true" value="<spring:message code="cancel.label" />" />
                 </div>
              </div>
             </form> 
         </div><!-- /.modal-content -->
     </div><!-- /.modal-dialog -->
 </div><!-- /.modal -->
			  <div class="row" style="text-align: right;padding-right: 14px;">
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
			  <%-- <c:forEach var="activity" items="${purchaseOrderBeanObj.nextActivities}">
			 	<input type="button" style="margin-left:1%;width: 80px;" class="btn bg-olive btn-inline" onclick="validatePurchaseOrder('${activity}','edit');" value="${activity}" />
			 </c:forEach> --%>
			<input type="button" class="btnCls" style="text-align:center;" onclick="viewPurchaseOrder('','outletPurchaseOrder','0');" value="<spring:message code="cancel.label" />" />
			</div>  
		<br/>
        <div class="box-footer"></div>
        </div>
        
         <input type="hidden" id="warehouseLocation" value="${skuObj.storeLocation}">
<%--      <input type="hidden" id="from" value="${skuObj.startDateStr}">  --%>
<%--      <input type="hidden" id="to" value="${skuObj.endDateStr}">  --%>
       <input type="hidden" id="maxRecords" value="${skuObj.maxRecords}"> 
        
     </form>
   </div>
     
</div>
</div>
</section><!-- /.content -->

</body>
</html>