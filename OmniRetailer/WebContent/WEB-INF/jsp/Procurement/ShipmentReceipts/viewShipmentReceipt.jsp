<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/warehouse/procurement/viewProcurementReceipt.jsp
 * file type		        : JSP
 * description				: The new product is displayed using this jsp
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
<%-- 	<script src="${pageContext.request.contextPath}/js/jquery-1.6.4.min.js"></script>  --%>

 <script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
 	<script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/procurement/purchaseOrderAndReceipts.js"></script>


<script type="text/javascript">
$(document).ready(function(){
	changeTotalitems();
});


</script>
</head>
<style>
 .p:first-child { 
   border-bottom: none !important;
    width:0% !important; 
    padding-left: 0px !important;
    padding-right: 0px !important;
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
.form-group {
    margin-bottom: 5px;
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
.labelgrn
{
margin-top: 3px;
}

#overflowtext{

width : 200px;
overflow: hidden;
text-overflow: ellipsis;
 text-align: left;
white-space: nowrap;
}

</style>
<body>
<!-- Content Header (Page header) -->
<%-- <section class="content-header">
	<h1><spring:message code="warehouse.management.label" />
		<small><spring:message code="procurement.label" /></small>
	</h1>
    <ol class="breadcrumb">
        <li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
		<li class="active"><spring:message code="warehouse.management.label" /></li>
    </ol>
</section> --%>

<!-- Main content -->
<section class="content">
 <div class="row">
  <div class="col-lg-12">
				<div class="box box-primary">
            <div class="box-header" style="text-align: center">
            <br/>
            <div class="form-group">
            <div class="form-group col-lg-6"  style="">
                 <h3 style="text-align: right; margin-top: 5px;" ><label style="border-radius: 5px; padding-left: 10px;padding-right: 10px;border: 1px solid;"><spring:message code="procurement.view.grn.label" /></label></h3>
            </div>
            
             <div class="form-group col-lg-6"  style="">
                <div class="form-group col-lg-6" style="text-align: right;    margin-top: 12px;"><spring:message code="rate.delivery" /></div>
            
            <div class="form-group col-lg-6">
              <div class="form-group col-lg-9">
											<div class="stars" id="stars_group">
												<input class="star star-6" id="star-5" type="radio" 
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
											  <div class="form-group col-lg-3" style="    margin-top: 2%;">
													<%-- <c:if test="${procurementReceipt.docLink !=''}">
							
						<img style="width: 30px;height: 30px;display:none" id="skuMasterImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
                         <img src="${pageContext.request.contextPath}/images/downloadicon.png"
											alt="" style="max-width: 30px !important;float: right; margin-right: 20px;	pointer-events:all" id="GRNAttachmentDownload" onclick="downloadlogedit();" />
				
					</c:if> --%>
											</div>
											
											
										</div>
            </div>
            
           </div>
            </div><!-- /.box-header -->
            <!-- form start -->
            <form id="viewProcurementReceipt" method="post" >
                <div class="box-body">
                 <input type="hidden" id="flowUnder" value="${flowUnder}">
               	 <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${err}</div>
	        	 <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
               	 <c:choose>
                                             <c:when test="${flowUnder == 'warehouse' || flowUnder == 'procurement'}">
                                             <input type="hidden" value="Submitted" name="status" >
                                                <input type="hidden" value=0 name="vendorRating" id="outlet_rating">
									<div class="row">
										<div class="form-group col-lg-3">
											<label><spring:message code="po.reference.label" /></label>
											<input type="text" readonly class="form-control searchItems" value="${procurementReceipt.poRef}"
												style="height:30PX;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"
												placeholder="<spring:message code="enter.po.reference.label" />"
												id="po_reference" />
											<div class=services>
												<div class="items">
													<ul class="matchedStringUl poRef"
														style="width: 89% !important; padding: 0px !important;"></ul>
												</div>
											</div>
										</div>
										<div class="form-group col-lg-2">
											<label><spring:message code="supplier.code.label" /></label>
											<input type="text" readonly class="form-control" readonly="readonly"
												name="supplierId" id="supplier_Id" value="${procurementReceipt.supplierId}" />
										</div>	
										<div class="form-group col-lg-1"></div>
										
										<div class="form-group col-lg-2">
                                            <label><spring:message code="inspected.by.label" /></label>
                                         <input type="hidden" id="desc"/>
                                         <input type="text"  class="form-control searchItems searchBar" readonly name="inspectedBy" id="inspectedBy"  value="${procurementReceipt.inspectedBy}" placeholder="<spring:message code="search.items.here.label" />"    />
										<div class="services">
							    			<div class="items">
							     				<ul class="matchedStringUl insemployee" style=""></ul>
							   				</div>
										</div>
									</div>
										
									
									<!-- 	<div class="form-group col-lg-2">
                                            <label><spring:message code="inspected.by.label" /> </label>
                                            <input type="text" readonly class="form-control" value="${procurementReceipt.inspectedBy}" name="inspectedBy" id="inspectedBy" required  placeholder="<spring:message code="enter.inspected.by.label" />"  />
                                            <span id="inspectedByError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div> 	<div class="form-group col-lg-1"></div>-->

										<div class="form-group col-lg-2">
											<label><spring:message code="select.location" /></label> <select
												class="form-control" readonly id="warehouse_location">
												<c:forEach var="location" items="${workLocationsList}">
													<option value="${location.businessActivity}"
														${location.locationId == procurementReceipt.location ? 'selected' : ''}>${location.locationId}</option>
												</c:forEach>
											</select> <input type="hidden" name="location" id="location">
										</div>	
										
										<div class="form-group col-lg-2">
                                            <label>Due <spring:message code="date.label" /></label>
                                            
                                        <input class="form-control calendar_icon" readonly="readonly" value="${procurementReceipt.dueDateStr}" style="background-color: white;" name="dueDateStr" id="date" size="20" type="text" onfocus="callCalender('date')" onclick="callCalender('date')" placeholder="DD/MM/YYYY"/>
                                            <span id="dateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>	
									</div>
								
									<div class="row">
										<div class="form-group col-lg-2">
											<label><spring:message code="invoice.number.label" />
												</label> 
												 <div class="form-group col-lg-12" style="padding-left:0px;padding-right:0px;">
												<input type="text" class="form-control" readonly name="invoiceRefNumber" id="invoiceRefNumber" value="${procurementReceipt.invoiceRefNumber}" placeholder="<spring:message code="enter.invoice.number.label" />" />
											</div>
											<span id="invoiceNumberError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
										</div>
										<div class="form-group col-lg-1"></div>
										<div class="form-group col-lg-3">
                                   		<label><spring:message code="supplier.name.label" /> </label>
                                           <!--  <input type="text" class="form-control" readonly="readonly" name="supplier_name" id="supplier_name" required /> -->
                                        	<input type="text" readonly class="form-control searchItems" style="height:30PX;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" name="supplierName" value="${procurementReceipt.supplierName}" placeholder="<spring:message code="enter.supplierName.label" />"  id="searchSupplier" />
											<div class=services>
									    		<div class="items">
									     			<ul class="matchedStringUl supplier" style="width: 89%!important;padding: 0px!important;"></ul>
									   			</div>
											</div>								
											<span id="supplierNameError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                                        </div>
										<div class="form-group col-lg-2">
											<label><spring:message code="receivedby.label" />
												</label>
												<input type="text"  class="form-control searchItems searchBar" readonly name="receivedBy" id="receivedBy" value="${procurementReceipt.receivedBy}"  placeholder="<spring:message code="search.items.here.label" />" />
										<div class="services">
							    			<div class="items">
							     				<ul class="matchedStringUl recemployee" style=""></ul>
							   				</div>
										</div>
												
												</div>
												<div class="form-group col-lg-2">
											<label><spring:message code="delivered.by.label" />
												</label> <input
												type="text" class="form-control" readonly name="deliveredBy" value="${procurementReceipt.deliveredBy}"
												id="delivered_by" required
												placeholder="<spring:message code="enter.delivered.by.label" />" />
											<span id="deliveredByError"
												style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
										</div>
										
												<div class="form-group col-lg-2">
                                            <label><spring:message code="delivery_date.label" /></label>
                                            
                                        <input class="form-control calendar_icon"  readonly value="${procurementReceipt.deliveredOnStr}" style="background-color: white;" name="deliveredOnStr" id="deliveredOnStr" size="20" type="text" onfocus="callCalender('deliveredOnStr')" onclick="callCalender('deliveredOnStr')" placeholder="DD/MM/YYYY"/>
                                            <span id="dateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>	
                                        
												<!--  <input
												type="text" readonly class="form-control" name="receivedBy"
												id="receivedby" required value="${procurementReceipt.receivedBy}"
												placeholder="<spring:message code="enterreceivedby.label" />" />
											<span id="deliveredByError"
												style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
										</div> 	<div class="form-group col-lg-1"></div>-->

										
									</div>
										<%-- <div class="row">
										
                                        
                                        <div class="form-group col-lg-2">
											<label><spring:message code="submitedby.label" />
												</label> <input
												type="text" readonly class="form-control"  name="submittedBy" value="${procurementReceipt.submittedBy}"
												id="submitedby" required
												placeholder="<spring:message code="entersubmitedby.label" />" />
											<span id="deliveredByError"
												style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
										</div>	<div class="form-group col-lg-1"></div>
										
										
										 <div class="form-group col-lg-3">
											<label><spring:message code="invoice.number.label" />
												</label> 
												 <div class="form-group col-lg-12" style="padding-left:0px;padding-right:0px;">
												<input type="text" class="form-control" readonly name="invoiceRefNumber" id="invoiceRefNumber" value="${procurementReceipt.invoiceRefNumber}" placeholder="<spring:message code="enter.invoice.number.label" />" />
											</div>
											<span id="invoiceNumberError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
										</div>	
											<div class="form-group col-lg-1"></div>

										<div class="form-group col-lg-2">
											<label><spring:message code="Approvedby.label" />
												</label> <input
												type="text" class="form-control" readonly name="approvedBy" value="${procurementReceipt.approvedBy}"
												id="Approvedby" required
												placeholder="<spring:message code="enterApprovedby.label" />" />
											<span id="deliveredByError"
												style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
										</div>	<div class="form-group col-lg-1"></div>
									</div>
									 --%>
									
									
									
										<div class="row">
										
									<!-- 	<div class="form-group col-lg-2">
											<label><spring:message code="handled.by.label" />
												</label> <input type="text" class="form-control" name="handledBy" id="handledBy" value="${procurementReceipt.handledBy}" placeholder="<spring:message code="enter.handled.by.label" />" />
										</div>	 
										<div class="form-group col-lg-1"></div>-->
										
									
									</div>
									
									
									
									
									<br>
										  <c:if test="${flowUnder=='warehouse' ||  flowUnder=='procurement'}">
      									 <div class="col-lg-12" style="background: #eee;padding: 10px 0px 10px 0px;margin-bottom: 10px">
      										
      										<div class="row">
              			 <div class="form-group col-lg-12" style="margin-bottom:0px;margin-left: 10px;">
              			 <c:forEach var="previousWorkFlowDate" items="${procurementReceipt.grnWorkFlowLogList}" varStatus="TheCount">
              			 <fmt:formatDate value="${previousWorkFlowDate.updatedDate}" var="startFormat" pattern="dd-MM-yyyy HH:mm:ss"/> 
						<input class="form-control" readonly="readonly" style="background-color: white;width: 14%;margin: 0px;display: inline-block;margin-right: 10px;" name="updated_due_date" id="updatedDate" size="20" type="text" value="${startFormat}"/>
						
                         </c:forEach>
                          </div>
              			</div>
      										
      										<div class="col-lg-9">
      									<div class="col-lg-9" style="padding-left: 0px;padding-top: 13px;">
      									  <c:forEach var="previousWorkFlowList" items="${procurementReceipt.grnWorkFlowLogList}">
      									  <div class="p" style="display:inline-block;"></div>
                                             <span class=" border" style="padding-left: 0px;padding-top: 17px;font-size: 16px;">
      									<img alt="" style="height:30px" src="${pageContext.request.contextPath}/images/workflow_arrow.png">${previousWorkFlowList.status}
      									</span>
      									
                                             </c:forEach></div>
      									</div>
      									<div class="col-lg-2">
      								<input type="hidden" id="linktoDownload" value="${procurementReceipt.docLink}"/>
      									</div>
      									<c:if test="${procurementReceipt.docLink != '' && procurementReceipt.docLink != null}">
						<div class="col-lg-1 nopadding">
                         <img src="${pageContext.request.contextPath}/images/downloadicon.png"
											alt="" style="max-width: 30px !important;float: right;cursor: pointer;margin-right: 20px;pointer-events:all" id="GRNAttachmentDownload" onclick="downloadlogedit('${procurementReceipt.docLink}');" />
						</div>
					</c:if>
      									
      									</div>
      									<br>
      									</c:if>
								</c:when>
                                             <c:otherwise>
               	<div class="row">
               		<div class="form-group col-lg-4">
                        <label><spring:message code="supplier.code.label" /></label>
                         <input type="text" class="form-control" readonly="readonly" name="supplier_id" id="supplier_id" value="${procurementReceipt.supplier_id}" required />
                    </div>
                 	<div class="form-group col-lg-4">
                        <label><spring:message code="supplier.name.label" /> </label>
                        <input type="text" class="form-control" readonly="readonly" name="supplier_name" id="supplier_name" value="${procurementReceipt.supplier_name}" required />
                    </div>
                    <div class="form-group col-lg-4">
                        <label><spring:message code="procurement.location.label" /></label>
                        <select class="form-control" disabled="disabled" id="warehouse_location">
                            <c:forEach var="location" items="${workLocationsList}">
								<option value="${location.businessActivity}" ${location.locationId == procurementReceipt.location ? 'selected' : ''}>${location.locationId}</option>
							</c:forEach>
                         </select>
                          <input type="hidden" name="location" id="location" value="${procurementReceipt.location}" />
                   </div>
				</div>
                           <div class="row">
                             <div class="form-group col-lg-4">
                                 <label><spring:message code="delivered.by.label" /></label>
                        <input type="text" class="form-control" readonly="readonly" name="delivered_by" id="delivered_by" value="${procurementReceipt.delivered_by}"  />
                     </div>
                     <div class="form-group col-lg-4">
                        <label><spring:message code="inspected.by.label" /></label>
                        <input type="text" class="form-control" readonly="readonly" name="inspected_by" id="inspected_by" value="${procurementReceipt.inspected_by}"  />
                       
                     </div>
                     <div class="form-group col-lg-4">
                        <label><spring:message code="shipment.note.label" /></label>
                        <input type="text" class="form-control" readonly="readonly" name="shipment_note" id="shipment_note" value="${procurementReceipt.shipment_note}"  />
                     </div>
                     
                    </div>
                     <div class="row">
                     <div class="form-group col-lg-4">
                        <label><spring:message code="po.reference.label" /></label>
                        <input type="text" class="form-control" readonly="readonly" name="po_reference" id="po_reference" value="${procurementReceipt.po_reference}"  />
                    </div>
                     <div class="form-group col-lg-4">
                        <label><spring:message code="procurement.status.label" /></label>
                         <input type="text" class="form-control" readonly="readonly" name="status" id="status" value="${procurementReceipt.status}"  />
                     </div>
                     <div class="form-group col-lg-4">
                        <label><spring:message code="date.label" /></label>
                        <input type="text" readonly="readonly" readonly="readonly" class="form-control" name="date" value="${procurementReceipt.date}" id="date" />
                    </div>
                     </div>
                    </c:otherwise>
                    </c:choose>
                    
                     <c:choose>
                    <c:when test="${flowUnder == 'warehouse' || flowUnder == 'procurement'}">
                         <div class="table-responsive scrolltable" style="">
                    <table id="productsList" class="table table-bordered table-hover" style="table-layout: fixed;">
                      <thead style="background-color: #3c8dbc; color: #ffffff">
                        <tr>
                        	<th style="width: 60px;"><div><spring:message code="sl.no.label" /></div></th>
                        	<th style="width: 111px;"><spring:message code="skuid.label"/></th>
                        		<th style="width: 111px;"><spring:message code="ean.label"/></th>
                        		<th style="width: 111px;"><spring:message code="hsnCode.label"/></th>
                        		<th style="width: 111px;"><spring:message code="ScanCode.label"/></th>
                            <th style="width: 200px;"><spring:message code="item.desc.label"/></th>
                             <th style="width: 91px;"><spring:message code="suppliedqty.label"/></th>
                               <th style="width: 71px;">M Range</th>
                             <th style="width: 71px;"><spring:message code="uom.label"/></th>
                                <th style="width: 80px;"><spring:message code="mrp.label"/></th>
                            <th style="width: 71px;"><spring:message code="prqty.label"/></th>
                            <th style="width: 71px;"><spring:message code="prprice.label"/></th>
                              <th style="width: 71px;"> Disc %</th>
                               <th style="width: 95px;" >Disc Amount</th>
                            <th style="width: 71px;">Free Qty</th>
                               <th style="width: 71px;"><spring:message code="tax.label"/>%</th>
                                <th style="width: 71px;"><spring:message code="cgst.label"/></th>
                            <th style="width: 71px;"><spring:message code="sgst.label"/></th>
                            <th style="width: 71px;"><spring:message code="igst.label"/></th>
                            <th style="width: 71px;">CESS</th>
                           
                            <th style="width: 91px;"><spring:message code="suppliedprice.label"/></th>
                             <th style="width: 71px;">Net Value</th>
                             <th style="width: 200px;">Storage Ref</th> 
                             <th style="width: 158px;"><spring:message code="handled.by.label" /></th>
                              <th style="width: 121px;"><spring:message code="batch.number.label" />
                                 <th style="width: 121px;"><spring:message code="warrant_mfg.date.label"/></th>
                                 <th style="width: 115px;"><spring:message code="grn.expiredDateStr.label"/></th>
                            <%-- <th><spring:message code="action.label"/></th> --%>
                        </tr>
                      </thead>
                      <tbody style="text-align: center;">
                       <c:forEach var="item" items="${procurementReceipt.items}" varStatus="theCount">
             		   <tr>
             		   	<td>${theCount.count}</td>
              			<td>${item.skuId}</td>
              			<td>${item.ean}</td>
              			<td id="hsnCode${theCount.count}">${item.hsnCode}</td>
                  	    <td id="itemScanCode${theCount.count}">${item.itemScanCode}</td>
                  		
                  	<td ><div id="overflowtext"> <a href="#" data-toggle="tooltip"  title="${item.itemDesc}">${item.itemDesc}</a></div></td>    
                  		<td class="Pack" id="Pack${theCount.count}">${item.suppliedQty }</td>
                  		<td>${item.measurementRange}</td>
                  		<td>${item.uom}</td>
                  		<td><input type="text" id="mrp"  style="width:70px;text-align:center" value="${item.mrp}"></td>
                  		<td>${item.orderQty }</td>
                  		<td>${item.orderPrice}</td>
                  	    <td><input type="text" id="discountpercentage${theCount.count}"  style="width:70px;text-align:center" value="${item.discount}"></td>
                  	    <td><input type="text" id="discountAmt${theCount.count}"  style="width:70px;text-align:center" value="${item.discountAmt}"></td>
                  		<td><input type="text" id="freeqty${theCount.count}"   style="width:70px;text-align:center" value="${item.freeQty}"></td>
                  		<td id="tax${theCount.count}" onblur="changeGrnTax(this);" contenteditable="true" >${item.itemTax}</td>
                  		<td id="cgsttax${theCount.count}">${item.cgstValue}</td>
                        <td id="sgsttax${theCount.count}">${item.sgstValue}</td>
                  	    <td id="igsttax${theCount.count}">${item.igstValue}</td>
                  	    <td id="cess${theCount.count}">${item.cessAmt}</td>
                  		
                  		<td>${item.supplyPrice}</td>
                  		<td>${item.totalCost}</td>
                  	    <td><select autofocus style='width:180px' class='storageRefence'  id='storageRef${theCount.count}'>
                  								   <c:forEach var="StorageRefNumber" items="${item.storageRefList}">
                  									<option value="${StorageRefNumber.storageSystemId}" ${item.storageRef == StorageRefNumber.storageSystemId ? 'selected' : ''} >${StorageRefNumber.storageSystemId}</option>
                  								</c:forEach>
                  								</select>
                  								
                  								</td>
                  	<td><select autofocus style='width:150px' class='handledBy'  disabled="disabled" id='handledBy${theCount.count}'>
                  							
                  								   <c:forEach var="empList" items="${empList}">
                  								
                  									<option value="${empList}" ${empList==item.handledBy ? 'selected' : ''} >${empList}</option>
						</c:forEach>
                  								
                  								</select>
                  								  <input type="hidden"  id="selectedEmployee" value="${item.handledBy}"></td> 
                  	   
                  	   
                  	   <td><textarea id="batchNum${theCount.count}" rows=1 style='resize:none;width: 87px;'>${item.bactchNum}</textarea></td>
                     <td><input class="form-control calendar_icon manufactedDate" value="${item.manufacturedDateStr}" readonly="readonly" style="width:108px;background-color: white;" disabled="disabled" id="manuFacturedDate${theCount.count}" type="text" onfocus="callCalender('manuFacturedDate${theCount.count}')" onclick="callCalender('manuFacturedDate${theCount.count}')" placeholder='DD/MM/YYYY' /></td>
                  		<td><input class="form-control calendar_icon expiryDate" value="${item.expiryDateStr}" readonly="readonly" style="width:108px;background-color: white;" disabled="disabled" id="expiryDate${theCount.count}" type="text" onfocus="callCalender('expiryDate${theCount.count}')" onclick="callCalender('expiryDate${theCount.count}')" placeholder='DD/MM/YYYY' /></td>
                  	  
                  	  
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
                            <%-- <th><spring:message code="action.label"/></th> --%>
                        </tr>
                      </thead>
                      <tbody style="text-align: center;">
                       <c:forEach var="item" items="${procurementReceipt.items}" varStatus="theCount">
             		   <tr>
             		   	<td>${theCount.count}</td>
              			<td>${item.skuId}</td>
                  		<td>${item.item_description}</td>
                  		<td>${item.price}</td>
                  		<td>${item.pack }</td>
                  		<td>${item.cost}</td>
                  		<td>${item.make}</td>
                  		<td>${item.supplied }</td>
                  		<td>${item.received}</td>
                  		<td>${item.reject}</td>
                  	   </tr>
              		   </c:forEach> 
		 </tbody>
                   </table></div>
                   </c:otherwise>
                   </c:choose>
                
               
               <%--  <div class="row">
                
								<div class="col-lg-8"></div>
								<div class="form-group col-lg-3 labelgrn" style="text-align: right;"><label><spring:message code="total.GRN.value"/></label></div>
								<div class="form-group col-lg-1">
									<input type="text" readonly="readonly" class="form-control" id="totalQty" name="totalQty"  value="${procurementReceipt.totalGRNValue}" />
								</div>
							</div> --%>
                  
                    
                    <div class="col-lg-12 nopadding" style="margin-top: 10px;">
					<div class="col-lg-5"></div>
					<div class="col-lg-2 nopadding">
					<div class="form-group col-lg-7 " style="text-align: right;"><label><spring:message code="sub.total.label" /> </label></div>
					<div class="form-group col-lg-5 nopadding">
						<input type="text" class="form-control" id="subtotalCostgrn" name="totalCost" readonly="readonly" value="${procurementReceipt.subTotal}"/>
					</div>
					</div>
					<div class="col-lg-2 nopadding">
					
					<div class="form-group col-lg-8 " style="text-align: right;"><label style="font-family: Calibri;color: gray;">No Of Items</label></div>
						<div class="form-group col-lg-4 nopadding">
					
						<input type="number" class="form-control" id="noofitems" name="noofitems" readonly="readonly" value="0"/>
					</div>
					</div>
					
					<div class="col-lg-3 nopadding">
						<div class="form-group col-lg-8 " style="text-align: right;"><label><spring:message code="shipping.cost.label" /><span style="color:red; font-size:2">*</span> </label></div>
						<div class="form-group col-lg-4 nopadding">
						<input type="text" class="form-control" id="shipping_costgrn" name="shipmentCharges" readonly="readonly" value="${procurementReceipt.shipmentCharges}"  oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
						</div></div>
						<span id="shipCostError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
				</div>
                  <div class="col-lg-12 nopadding">
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
						<input type="text" class="form-control" readonly="readonly"  id="discountgrn" name="totalDiscount" value="${procurementReceipt.totalDiscount}"  oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
						</div></div>
					</div>
					 <!-- <div class="col-lg-12 nopadding">
					<div class="col-lg-6"></div> -->
					
				
				
					
						
					<div class="col-lg-12 nopadding">
						<div class="col-lg-5">
						<div class="row" style="text-align: center;margin-top: 50px;">
                        <input type="button" class="btnCls" onclick="return searchShipmentReceipt('','','0');" value="<spring:message code="cancel.label" />" />
                        </div>
                        </div>
						<div class="col-lg-7 nopadding">
						
							<div class="col-lg-1"></div>
						<div class=" col-lg-3" style="    font-size: 22px;    background-color: #f4f4f4;padding: 7px 0px; border-top: 1px solid #ccc;">&nbsp</div>
						<div class=" col-lg-8 nopadding"style="    background-color: #f4f4f4;padding: 7px 0px; border-top: 1px solid #ccc;">
						
						
						<div class=" col-lg-5 nopadding" style="font-size: 22px;"><label><spring:message code="tquantity.label" /> </label></div>
						<div class=" col-lg-3"></div>
						<div class=" col-lg-4" style="padding-right: 0px;padding-left: 7px;">
						<c:set var="tqty" value="0" scope="page" />
						 <c:forEach var="summaryList" items="${procurementReceipt.items}" varStatus="thecount">
				<c:set var="tqty" value="${tqty+((summaryList.suppliedQty))}" scope="page" />
				</c:forEach>
						<input type="text" style="background-color: #fff;" class="form-control"  name="total_po_value" readonly="readonly" value="${tqty}"/>
					</div></div> 
						
						
						<div class=" col-lg-1"></div>
						<div class=" col-lg-3" style="    font-size: 22px;    background-color: #f4f4f4;padding: 7px 0px; border-top: 1px solid #ccc;">&nbsp</div>
						<div class=" col-lg-8 nopadding"style="    background-color: #f4f4f4;padding: 7px 0px; border-top: 1px solid #ccc;">
						<div class=" col-lg-5 nopadding" style="font-size: 22px;"><label><spring:message code="cost.label" /> </label></div>
						<div class=" col-lg-3"></div>
						<div class=" col-lg-4" style="padding-right: 0px;padding-left: 7px;">
						<input type="text" style="background-color: #fff;" class="form-control" id="totalCost" name="totalCost" readonly="readonly" value="${procurementReceipt.totalCost}"/>
					</div></div></div>
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
                      <c:choose>
                    <c:when test="${flowUnder == 'warehouse' || flowUnder == 'procurement'}">
                    </c:when>
                    <c:otherwise>
                      <div class="row">
                     <!-- <div class="col-lg-3"></div> -->
                     <div class="form-group  col-lg-12">
                     	<label><spring:message code="remarks.label" /></label>
                        <textarea class="form-control" readonly="readonly" style="resize: none;" name="remarks" id="remarks" rows="2" >${procurementReceipt.remarks}</textarea>
					</div>
                            <!--  <div class="col-lg-3"></div> -->
                    </div>
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
					</div>
					</c:otherwise></c:choose>
                </div><!-- /.box-body -->
			  <div class="row" style="text-align: center;">
<%-- 			<input type="button" class="btnCls" onclick="return searchShipmentReceipt('','','0');" value="<spring:message code="cancel.label" />" />
 --%>			</div>  
		<br/>
		 <!--added by manasa  -->
               	<input type="hidden" id="operation" value="${operation}">
         <input type="hidden" id="skuidpo" value="${skuObj.skuId}"> 
   <%-- <input type="hidden" id="searchItems" value="${skuObj.brand}"> --%>
    <input type="hidden" id="warehouseLocation" value="${skuObj.location}">
     <input type="hidden" id="from" value="${skuObj.startDate}"> 
      <input type="hidden" id="to" value="${skuObj.endDate}"> 
 <input type="hidden"  class="itemwise" name="supplier_name" id="searchSupplier" value="${skuObj.itemName}" /> 
      <input type="hidden" id="searchShipmentReceiptId" value="${skuObj.searchCriteria}">
      <input type="hidden" id="maxRecords" value="${skuObj.maxRecords}">
      <input type="hidden" id="doclinkfile" value="${procurementReceipt.docLink}">
               <!--added by manasa  -->
		
        <div class="box-footer">
                             
        </div>
     </form>
   </div>
     
</div>
</div>
</section><!-- /.content -->
 <script type="text/javascript">
            $(function() {
               
             });
           /* if($("#selectedEmployee").val()!=''||undefined){
          	  $("#handledBy").val($("#selectedEmployee").val());
          }*/
           $("#handledBy").val($("#selectedEmployee").val());
          /*  if($("#selectedState").val()!=''||undefined){
            	  $("#state").val($("#selectedState").val());
          }
            
            if($("#quoteReference").val()!=''||undefined){
          	  $("#rquoteRef").val($("#quoteReference").val());
        }*/
        </script>

</body>
</html>