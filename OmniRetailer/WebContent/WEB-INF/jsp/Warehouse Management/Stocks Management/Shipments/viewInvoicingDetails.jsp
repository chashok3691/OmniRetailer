<!--/*
 * Project Name 	        : OmniRetailer
 * Written By		        : Vijay
 * file name		        : Warehouse Management/Stocks Management/shipments/newInvoicing.jsp
 * file type		        : JSP
 * description				: The new Creation form of shipment invoice is displayed using this jsp
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 -->

<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

	 <!-- DATA TABLES -->
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/invoices/wareHouseShipmentInvoice.js"></script>
	<script type="text/javascript">
$(document).ready(function(){
	debugger;
	callCalender('deliveryNoteDate');
	callCalender('deliveryDate');
	
	changeTotalCost();
	changeTotalSubQuantities();
	changeInvoiceTotal();
	
});
</script>
<style type="text/css">
  /* .odd{display:none!important;} */
.buttons {
	float: left;
	padding-top: 0px;
	margin-right: 2%;
	margin-top: 1%;
}
a.button, .list a.button {
position:relative;
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 3.6px 10px 3.8px 10px;
	/* border-radius: 5px; */
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
	font-weight: normal; 
    background-color: rgb(128,128,128);
}
@media (min-width:1200px) and (max-width:1600px)
{
	.lbl{
		text-align:right;
		padding-right: 0px;
	}
}
@media only screen and (max-width:1200px)
{
.lbl{
		text-align:left;
	}
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

<script type="text/javascript">

$(document).ready(function(){
        
        changeAddressOfInvoice();                
        });

</script>

</head>
<body>
<!-- Content Header (Page header) -->

<!-- Main content -->
<section class="content">
<div class="row" style="Pointer-events: none;">
  <div class="col-lg-12">
				<div class="box box-primary">
                                <div class="box-header" style="text-align: center;">
                                <h3 class="box-title" style="text-align:center;padding :5px;  border:1px solid  #808080;font-weight: bold;"><spring:message code="invoice.label" /></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                              
                                    <div class="box-body">
                                     <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                                     <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
                <br>     
             
                <div class="row">  
                   
         <div class="col-lg-4" style=""> 
         
                 <select class="form-control form-group" id="fromLocation" readonly disabled onload="return changeAddressOfInvoice();" onchange="return changeAddressOfInvoice();" >
	             
	             	<c:forEach var="location" items="${invoiceloc}" >
						<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option>
					</c:forEach>
	            </select>
	                       <!-- <input type="text" class="form-control" name="fromLoc" id="fromLoc" value="" placeholder=""/> -->
					<span id="fromLocError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>                     
				</div> 
				</div>  
				
        <div class="row">
        <div class="col-lg-4 col-xs-4 col-sm-4">
       
        <div class="row" style="padding: 4px; white-space:nowrap;">
        <div  class="col-lg-3 col-xs-3 col-sm-3">
         <label><spring:message code="counters.label"/></label>
        </div>
          <div  class="col-lg-6 col-xs-6 col-sm-6">
           <input type="text" name="counter" readonly disabled id="counter" value="${itemLists.counterId}">
        </div>
        </div>
         <div class="row" style="padding: 4px;white-space:nowrap;">
        <div  class="col-lg-3 col-xs-3 col-sm-3">
         <label><spring:message code="gstin.or.uin.label"/><span style="color:red; font-size:2">*</span></label>
        </div>
          <div  class="col-lg-6 col-xs-6 col-sm-6">
           <input type="text" name="gstin" id="gstin" readonly disabled value="${itemLists.gstn}">
           <span id="gstinError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
        </div>
        </div>
         <div class="row" style="padding: 4px;white-space:nowrap;">
        <div  class="col-lg-3 col-xs-3 col-sm-3">
         <label><spring:message code="statename.label"/></label>
        </div>
          <div  class="col-lg-6 col-xs-6 col-sm-6">
           <input type="text" name="stateName" readonly disabled id="stateName" value="${itemLists.state}">
        </div>
        </div>
           <div class="row" style="padding: 4px;white-space:nowrap;">
        <div  class="col-lg-3 col-xs-3 col-sm-3">
         <label><spring:message code="pin.label"/></label>
        </div>
          <div  class="col-lg-6 col-xs-6 col-sm-6">
           <input type="text" name="pinValue" readonly disabled id="pinValue" value="${itemLists.shippedToZipCode}">
        </div>
        </div>
           <div class="row" style="padding: 4px;white-space:nowrap;">
        <div  class="col-lg-3 col-xs-3 col-sm-3">
         <label><spring:message code="customer.newfeedback.email"/></label>
        </div>
          <div  class="col-lg-6 col-xs-6 col-sm-6">
           <input type="text" name="emailId" id="emailId" readonly disabled value="${itemLists.email}">
        </div>
        </div>
        
         <div class="row" style="padding: 4px;white-space:nowrap;">
        <div  class="col-lg-3 col-xs-3 col-sm-3">
         <label><spring:message code="grn.ref.label"/></label>
        </div>
              <div  class="col-lg-6 col-xs-6 col-sm-6">
        <input type="text" class="form-control searchItems"	value="${itemLists.goodsReceiptNoteRef}" readonly disabled style="height:30PX;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" onblur=""	placeholder="<spring:message code="enter.shipment.ref.label" />" id="grn_reference" />
												 <span id="shipment_referenceError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
											<div class=services>
												<div class="items">
													<ul class="matchedStringUl grnRef"
														style="width: 89% !important; padding: 0px !important;"></ul>
												</div>
											</div>
											<span id="shipmentRefError" style="text-align:right;color:red;font-weight:bold;"></span>
											<input type="hidden" name="shipmentRef" id="selected_shipment_ref"
												value="">
        </div>
        </div>
      
     
        </div>
        
         <div class="col-lg-4 col-xs-4 col-sm-4">
         <div class="row" style="padding: 4px;">
        <div  class="col-lg-5 col-xs-5 col-sm-5" style="width:32%;white-space:nowrap;">
         <label><spring:message code="invoice.number.label"/><span style="color:red; font-size:2">*</span></label>
        </div>
          <div  class="col-lg-6 col-xs-6 col-sm-6">
           		<input type="text" name="invoiceNumber" id="invoiceNumber" readonly disabled value="${itemLists.invoiceId}">
           		<span id="invoiceNumberError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
        </div>
        </div>
        <div class="row" style="padding: 4px;">
        <div  class="col-lg-5 col-xs-5 col-sm-5" style="width:32%;white-space:nowrap;">
         <label><spring:message code="delivery.note.label"/></label>
        </div>
          <div  class="col-lg-6 col-xs-6 col-sm-6">
           <input type="text" name="deliveryNote" id="deliveryNote" readonly disabled value="${itemLists.shipmentNoteId}">
        </div>
        </div>
        
          <div class="row" style="padding: 4px;">
        <div  class="col-lg-5 col-xs-5 col-sm-5" style="width:32%;white-space:nowrap;">
         <label><spring:message code="buyers.order.number"/></label>
        </div>
          <div  class="col-lg-7 col-xs-7 col-sm-7">
        <input type="text" class="form-control searchItems" readonly disabled style="height:30PX;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" 	value="${itemLists.orderId}" placeholder="<spring:message code="enter.po.reference.label" />" id="po_reference" />
												 <span id="po_referenceError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
											<div class=services>
												<div class="items">
													<ul class="matchedStringUl invoicepoRef"
														style="width: 89% !important; padding: 0px !important;"></ul>
												</div>
											</div>
											<span id="poRefError" style="text-align:right;color:red;font-weight:bold;"></span>
											<input type="hidden" name="poRef" id="selected_po_ref"
												value="">
        </div>
        </div>
        
        <div class="row" style="padding: 4px; ">
        <div  class="col-lg-5 col-xs-5 col-sm-5" style="width:32%;white-space:nowrap;">
         <label><spring:message code="skuMaster.supplier.name.label"/><span style="color:red; font-size:2">*</span></label>
        </div>
               <div  class="col-lg-6 col-xs-6 col-sm-6">
           <input type="text" class="form-control searchItems" readonly disabled style="height:30PX;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" name="supplierName" value="${itemLists.supplierName}" placeholder="<spring:message code="enter.supplierName.label" />"  id="searchSupplier" />
           <div class=services>
									    		<div class="items">
									     			<ul class="matchedStringUl supplier" style="width: 89%!important;padding: 0px!important;"></ul>
									   			</div>
											</div>
											 <%-- <input type="hidden" class="form-control" name="supplier_Id" id="supplier_Id" readonly="readonly" value="${itemLists.supplierId}"/> --%>
           <%-- <input type="text" name="supplierRef" id="supplierRef" value="${itemLists.supplierName}"> --%>
        </div>
        </div>
        
        <div class="row" style="padding: 4px; ">
         <div  class="col-lg-5 col-xs-5 col-sm-5" style="width:32%;white-space:nowrap;">
			<label style="font-family: Calibri;"><spring:message code="supplier.code.label" /><span style="color:red; font-size:2">*</span></label>
											</div>
					<div  class="col-lg-6 col-xs-6 col-sm-6">						
											<input type="text" class="form-control" readonly="readonly"
												name="supplier_Id" id="supplier_Id" readonly disabled value="${itemLists.supplierId}" />
												</div>
		</div>
										
		<div class="row" style="padding: 4px; ">
         <div  class="col-lg-5 col-xs-5 col-sm-5" style="width:32%;white-space:nowrap;">
											<label style="font-family: Calibri;">Supplier State</label>
											</div>
					<div  class="col-lg-6 col-xs-6 col-sm-6">						
											<input type="text" class="form-control" readonly="readonly"
												name="supplier_state" id="supplier_state" value="${itemLists.supplier_state}" />
												</div>
		</div>
										
        
          <%-- <div class="row" style="padding: 4px;">
        <div  class="col-lg-5 col-xs-5 col-sm-5" style="width:32%;white-space:nowrap;">
         <label><spring:message code="delivery.by,label"/></label>
        </div>
          <div  class="col-lg-6 col-xs-6 col-sm-6">
           <input type="text" name="deliveryBy" id="deliveryBy" value="${itemLists.shipmentAgency}">
        </div>
        </div> --%>

        </div>
        
        
          <div class="col-lg-4 col-xs-4 col-sm-4">
          
          <div class="row" style="padding: 4px;">
        <div  class="col-lg-5 col-xs-5 col-sm-5" style="white-space:nowrap;">
         <label><spring:message code="delivery.by,label"/><span style="color:red; font-size:2">*</span></label>
        </div>
          <div  class="col-lg-6 col-xs-6 col-sm-6">
           <input type="text" name="deliveryBy" id="deliveryBy" readonly disabled value="${itemLists.shipmentAgency}">
        </div>
        </div>
        
         <%-- <div class="row" style="padding: 4px;">
        <div  class="col-lg-5 col-xs-5 col-sm-5" style="white-space:nowrap;">
         <label><spring:message code="buyer.label"/></label>
        </div>
          <div  class="col-lg-6 col-xs-6 col-sm-6">
           
           <select class="form-control" id="buyer" onchange="">
	                            <c:forEach var="location" items="${outletLocations}">
									<option value="${location}" ${location == itemLists.shipmentReceivedBy ? 'selected' : ''} id="${location}" >${location}</option>
								
						 		</c:forEach>
	                        </select>
           
           
        </div>
        </div> --%>
        <div class="row" style="padding: 4px;">
        <div  class="col-lg-5 col-xs-5 col-sm-5" style="white-space:nowrap;">         
        <label><spring:message code="delivery.note.date.label"/></label>
        </div>
          <div  class="col-lg-5 col-xs-5 col-sm-5">
          <input class="form-control calendar_icon"  readonly="readonly"  name="deliveryNoteDate" id="deliveryNoteDate" value="${itemLists.createdOnStr}" style="background-color: white;"  size="20" type="text" onfocus="callCalender('deliveryNoteDate')" onclick="callCalender('deliveryNoteDate')" placeholder="DD/MM/YYYY">
          
        </div>
        </div>
         
         
         
         <div class="row" style="padding: 4px;">
        <div  class="col-lg-5 col-xs-5 col-sm-5" style="white-space:nowrap;"><label><spring:message code="Paymentmode.label"/></label>
        </div>
          <div  class="col-lg-4 col-xs-5 col-sm-5">
<!--            <input type="text" name="paymentMode" id="paymentMode" value=""> -->
   <select class="form-control" id="shipmentPaymentMode" readonly disabled onchange="">
<%-- 	                            <c:forEach var="paymentMode" items="${shipmentPaymentModeList}"> --%>
								                  	<option value="Card" ${'Card' == itemLists.paymentTerms ? 'selected' : ''}>Card</option>
								                  		<option value="Cash" ${'Cash' == itemLists.paymentTerms ? 'selected' : ''}>Cash</option>
								                  		<option value="Jio Money" ${'Jio Money' == itemLists.paymentTerms ? 'selected' : ''}>Jio Money</option>
								                  		<option value="Mall Coupon" ${'Mall Coupon' == itemLists.paymentTerms ? 'selected' : ''}>Mall Coupon</option>
								                  		<option value="Credits" ${'Credits' == itemLists.paymentTerms ? 'selected' : ''}>Credits</option>
								                  		<option value="Sodexo" ${'Sodexo' == itemLists.paymentTerms ? 'selected' : ''}>Sodexo</option>
								                  		<option value="Ticket" ${'Ticket' == itemLists.paymentTerms ? 'selected' : ''}>Ticket</option>
								                  		<option value="Credit Note" ${'Credit Note' == itemLists.paymentTerms ? 'selected' : ''}>Credit Note</option>
								                  		


<%-- 						 		</c:forEach> --%>
	                        </select>
        </div>
        </div>
        
          <div class="row" style="padding: 4px;">
        <div  class="col-lg-5 col-xs-5 col-sm-5" style="white-space:nowrap;">       
          <label><spring:message code="dispatched.through.label"/></label>
        </div>
        
        
          <div  class="col-lg-5 col-xs-6 col-sm-6">
         
           <select class="form-control" readonly disabled id="shipmentDispatches" onchange="">
				 					 <option value="Rail"${'Rail' == itemLists.shipmentMode ? 'selected' : ''} >Rail</option>
                                            <option value="Express" ${'Express' == itemLists.shipmentMode ? 'selected' : ''}>Express</option>
                                            <option value="Flight" ${'Flight' == itemLists.shipmentMode  ? 'selected' : ''}>Flight</option>
                                         
					
	                        </select>
        </div>
        </div>
        
          <div class="row" style="padding: 4px;">
        <div  class="col-lg-5 col-xs-5 col-sm-5" style="white-space:nowrap;"><label>Delivery Date</label>
        </div>
          <div  class="col-lg-5 col-xs-6 col-sm-6">
          
           <input class="form-control calendar_icon form-group"  readonly="readonly"  name="deliveryDate" id="deliveryDate"  style="background-color: white;"  size="20" type="text" value="${itemLists.shipmentDateStr}" onfocus="callCalender('deliveryDate')" onclick="callCalender('deliveryDate')" placeholder="DD/MM/YYYY">
       
        </div>
        </div>
        </div>
       
        </div>
        <div class="col-lg-12" style="background: #eee; padding: 10px 0px 10px 0px;margin-bottom: 10px;">
      									
      									<%-- <div class="row">
              			 <div class="form-group col-lg-12" style="margin-bottom:0px;margin-left: 10px;">
              			 <c:forEach var="previousWorkFlowDate" items="${itemList.grnWorkFlowLogList}" varStatus="TheCount">
              			 <fmt:formatDate value="${previousWorkFlowDate.updatedDate}" var="startFormat" pattern="dd-MM-yyyy HH:mm:ss"/> 
						<input class="form-control" readonly="readonly" style="background-color: white;width: 14%;margin: 0px;display: inline-block;margin-right: 10px;" name="updated_due_date" id="updatedDate" size="20" type="text" value="${startFormat}"/>
						
                         </c:forEach>
                          </div>
              			</div> --%>
      									
      									<div class="col-lg-9">
      									
      									<div class="col-lg-9" style="padding-left: 0px;padding-top: 13px;">
      									 <%--  <c:forEach var="previousWorkFlowList" items="${itemList.invoiceStatus}"> --%>
      									  <div class="p" style="display:inline-block;"></div>
                                      <span class=" border" style="padding-left: 0px;padding-top: 17px;font-size: 16px;">
      									<img alt="" style="height:30px" src="${pageContext.request.contextPath}/images/workflow_arrow.png">${itemLists.invoiceStatus}
      									<input type="hidden" value="${itemLists.invoiceStatus}" id="status" name="status" >
      									</span>
      									
                                        <%--  </c:forEach> --%>
                                         </div>
      									</div>
      									<div class="col-lg-2">
      						
      									
      									</div>	<div class="form-group col-lg-1"></div>
      									</div> 
      
      <div class="row">
              <div class="col-lg-12 col-xs-12" style="text-align:center;">
       	 		 <input type="text"  class="form-control searchItems"  value="" id="searchItems" placeholder="<spring:message code="search.items.here.label" />"style="margin-top: 10px;" />
					<div class="services">
		    			<div class="items">
		     				<ul class="matchedStringUl invoicesWarehouseShipmentDetails" style=""></ul>
		   				</div>
					</div>
					<input type="hidden" id="ordersSearch" value="${searchName}">
       	 	</div>
       	 	</div>
             
             <div class="row">
                                     <div class="form-group col-lg-12" style="margin-top: 0.2%;">
                                      <div class="table-responsive" style="width:100%;overflow: auto;white-space: nowrap;Pointer-events: all;">
                                        <table id="invoiceproductsList" class="table table-bordered table-hover" style="Pointer-events: all;">
                                          <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><div style=""><spring:message code="sl.no.label" /></div></th>
                                            	<th><spring:message code="sku.code.label"/></th>
                                                <th><spring:message code="description.of.goods.label"/></th>
                                                <th><spring:message code="ean.label"/></th>
                                                <th><spring:message code="hsn.sac.label"/></th>
                                                <th>Batch No</th>
                                                <th>Expiry Date</th>
                                                <th><spring:message code="qty.label"/></th>
                                                <th><spring:message code="rate.label"/>(%)</th>
                                                <th><spring:message code="cgst.rate.label"/></th>
                                                <th><spring:message code="cgst.label"/></th>
                                                 <th><spring:message code="sgst.rate.label"/></th>
                                                 <th><spring:message code="sgst.label"/></th>
                                                 <th>IGST Rate</th>
                                                 <th>IGST</th>
                                                 <th>CESS Rate</th>
                                                 <th>CESS</th>
                                                 <th>Free Qty</th>
                                                 <th>Discount %</th>
                                                 <th>Discount Amt</th>
                                                 <th><spring:message code="report.price.label"/></th>
                                                <th><spring:message code="cost.label"/></th>
                                                <!-- <th>Net Amount</th> -->
                                                <th><spring:message code="action.label"/></th>
                                                
                                           </tr>
                                          </thead>
                                         <tbody style="text-align: center;" id="skuList">
                                           <tr id='dynamicdiv1'>
	  	 				 			 </tr>
	  	 				         <c:set var="totals" value="0"  />
                       
                         <c:forEach var="itemLists" items="${invoiceList.whInvoiceList}"  >
                          <c:forEach var="itemList" items="${itemLists.whInvoiceItemsList}" varStatus="theCount">
                       <tr id="dynamicdiv${theCount.count}">
                       <td class="slno" id="">${theCount.count}</td>
                       <td id="itemCode${theCount.count}">${itemList.skuId}</td>
            <input type='hidden' id='color${theCount.count}' value="${itemList.color}" />
			<input type='hidden' id="size${theCount.count}" value="${itemList.size}">
			<input type='hidden' id="uom${theCount.count}" value="${itemList.unitOfMeasurement}"/>
			<input type='hidden' id="pluCode${theCount.count}" value="${itemList.pluCode}" />
			<input type='hidden' id="model${theCount.count}" value="${itemList.skuId}"/>
			<input type='hidden' id="category${theCount.count}" value="${itemList.category}" />
			<input type='hidden' id="subCategory${theCount.count}" value="${itemList.subCategory}" />
			<input type='hidden' id="taxvalue${theCount.count}" value="${itemList.totaltaxAmt}" />
			<input type='hidden' id="taxationlist${theCount.count}" value='${itemList.taxdetailsStr}'/>
            <input type='hidden' id="pricereal${theCount.count}" value='${itemList.originalSupplyPrice}'/>
            <input type='hidden' id="pricerealedit${theCount.count}" value=''/>
                       
                     					<td id="itemDesc${theCount.count}">${itemList.itemDescription}</td>
                     					<td id="ean${theCount.count}">${itemList.ean}</td>
                     					<td id="HSN${theCount.count}">${itemList.hsnCode}</td>
                     				
                     					<td><textarea id="batchNum${theCount.count}" rows=1 style='resize:none;width: 87px;'>${item.bactchNum}</textarea></td>
                  						 <td><input class="form-control calendar_icon startDate" value="${item.expiryDateStr}" readonly="readonly" style="width:100px;background-color: white;" id="expiryDate${theCount.count}" onfocus="callCalender('expiryDate${theCount.count}')" onclick="callCalender('expiryDate${theCount.count}')" placeholder='DD/MM/YYYY' type="text"/></td>
                  					
                     				<td><input style='text-align: center;width:75px;' type='number' id='Received${theCount.count}' class='Received'  name='Received'  onBlur='changePack(this);' value='${itemList.quantity}' /></td> 
<%--                      					<td id="qty${theCount.count}"><input style='text-align: center;width:75px;' type='number' id='Received${theCount.count}' class='Received'  name='Received'  onBlur='changePack' value='${itemList.quantity}' /></td>
 --%>                     					<td id="TaxRate"><input style='text-align: center;width:75px;' type='number' id='rate${theCount.count}' class='rate'  name='rate'  readonly="readonly" onBlur='changePackRate(this);' value='${itemList.taxRate}' /></td>
                     					
                     					<td id="cgstrate${theCount.count}">${itemList.cgstRate}</td>
                     					<td class="cgst" id="cgst${theCount.count}">${itemList.cgstAmt}</td>
                     					<td id="sgstrate${theCount.count}">${itemList.sgstRate}</td>
                     					<td class="sgst" id="sgst${theCount.count}">${itemList.sgstAmt}</td>
                     					<td id="igstrate${theCount.count}">${itemList.igstRate}</td>
                     					<td class="igst" id="igst${theCount.count}">${itemList.igstAmt}</td>
                     					<td id="cessrate${theCount.count}">${itemList.cessRate}</td>
                     					<td class="cess" id="cess${theCount.count}">${itemList.cessAmt}</td>
                     				    <td><input type="text" id="freeqty${theCount.count}" onBlur="changeSupplyPrice(this);changeTotalCost()" contenteditable="true" onkeypress='return (this.innerText.length < 10)'  style="width:70px;text-align:center" value="${itemList.freeQty}"></td>
                  				        <td><input type="text" id="discountpercentage${theCount.count}" onBlur="changeDiscPerc(this);" contenteditable="true" onkeypress='return (this.innerText.length < 10)' style="width:70px;text-align:center" value="${itemList.discount}"></td>
                  					    <td><input type="text" id="discountAmt${theCount.count}" onBlur="changeDiscAmt(this);" contenteditable="true" onkeypress='return (this.innerText.length < 10)' style="width:70px;text-align:center" value="${itemList.discountAmt}"></td>
                     					<td id="costPrice${theCount.count}" contenteditable="true" onBlur='changeSupplyPrice(this);'>${itemList.price}</td>
                     					<td class="amount" id="amount${theCount.count}">${itemList.total}</td>
                     					<td id="Del${theCount.count}"><img id="Img${theCount.count}" src="${pageContext.request.contextPath}/images/itemdelete.png" style="width:35%;cursor:pointer;" title="Delete${itemList.skuId}" onclick='deleteItem(this);'/></td>
									
                       </tr>
                     
        </c:forEach>
              		   </c:forEach>


							<c:forEach var="itemLists" items="${invoiceList.whInvoiceList}" >
              		    <tr  id="subTotalRow" style="background-color: #EBEBEB; color: #000000">
              		      <td colspan="5" style="border: 2px solid #a2a2a2 !important;"><b>Sub Totals</b></td>
              		      <td style="border: 2px solid #a2a2a2 !important;"></td>
              		      <td style="border: 2px solid #a2a2a2 !important;"></td>
              		      <td id="totalQty" style="border: 2px solid #a2a2a2 !important;"></td>
              		      <td style="border: 2px solid #a2a2a2 !important;"></td>
              		      <td style="border: 2px solid #a2a2a2 !important;"></td>
              		      <td  id="CGSTTotal" style="border: 2px solid #a2a2a2 !important;">${itemLists.cgstAmt}</td>
              		      <td style="border: 2px solid #a2a2a2 !important;"></td>
              		      <td  id="SGSTTotal" style="border: 2px solid #a2a2a2 !important;">${itemLists.cgstAmt}</td>
              		      <td style="border: 2px solid #a2a2a2 !important;"></td>
              		      <td  id="IGSTTotal" style="border: 2px solid #a2a2a2 !important;">${itemLists.igstAmt}</td>
              		      <!-- <td style="border: 2px solid #a2a2a2 !important;"></td>
              		      <td  id="CESSTotal" style="border: 2px solid #a2a2a2 !important;">0.0</td> -->
              		      <td style="border: 2px solid #a2a2a2 !important;"></td>
              		      <td style="border: 2px solid #a2a2a2 !important;"></td>
              		       <td style="border: 2px solid #a2a2a2 !important;"></td>
              		      <td style="border: 2px solid #a2a2a2 !important;"></td>
              		      <td id="totaldiscount" style="border: 2px solid #a2a2a2 !important;"></td>
              		      <td  style="border: 2px solid #a2a2a2 !important;"></td>
              		      <c:set var="total" value="${itemLists.totalItemCost}"/>
              		      <c:if test="${not empty total }">
              		      <td  id="grandTotal"style="border: 2px solid #a2a2a2 !important;">${itemLists.totalItemCost}</td>
              		       </c:if>
              		       <c:if test="${empty total}">
              		       </c:if>
	  	 				  </tr> 
	  	 			</c:forEach>
              		  </tbody>
              		   
                  	  
	
                                        <!--   </tbody> -->
                                       </table>
                                       
                                       <table>
                                       
                                       
                                       
                                       </table>
                                       
                                       </div>
                                       
                                       
                                       
							   <c:forEach var="itemLists" items="${invoiceList.whInvoiceList}" >                   
                  <div class="col-lg-12 nopadding" style="margin-top: 10px;">
					<div class="col-lg-5"></div>
					<div class="col-lg-2 nopadding">
					<div class="form-group col-lg-6 " style="text-align: right;white-space: nowrap;"><label><spring:message code="sub.total.label" /> </label></div>
					<div class="form-group col-lg-6 nopadding">
						<input type="text" class="form-control" id="subtotalCostInv" name="subTotal" readonly="readonly" value="${itemLists.subTotal}"/>
					</div>
					</div>
					<div class="col-lg-2 nopadding">
					<div class="form-group col-lg-8" style="text-align: right;"><label style="font-family: Calibri;color: gray;">No Of Items</label></div>
						<div class="form-group col-lg-4 nopadding">
					
						<input type="number" class="form-control" id="noofitems" name="noofitems" readonly="readonly" value="0"/>
					</div>
					</div>
					<div class="col-lg-3 nopadding">
						<div class="form-group col-lg-8" style="text-align: right;"><label><spring:message code="shipping.cost.label" /> </label></div>
						<div class="form-group col-lg-4 nopadding">
						<input type="text" class="form-control" id="shipmentCharges" readonly name="shipmentCharges" onBlur="changeTotalCost();"  value="${itemLists.shipmentCharges}" />
						</div>
						</div>
						<span id="shipCostError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
				</div>
                  <div class="col-lg-12 nopadding" style="margin-top: -10px;">
						<div class="col-lg-5"></div>
					<div class="col-lg-2 nopadding">
						<div class="form-group col-lg-6 " style="text-align: right;white-space: nowrap;"><label><spring:message code="taxes.label" /> </label></div>
						<div class="form-group col-lg-4 nopadding">
						<input type="text" class="form-control" readonly id="tax" name="tax"  value="${itemLists.tax}"  oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
						<span id="totalTaxError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						<div class="form-group col-lg-2 nopadding">
						<input type="text" class="form-control"  style="margin-left: 3px;" readonly id="other_taxgrn" name="otherTaxAmt"  value="${itemLists.otherTaxAmt}"  oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
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
						 <input type="text" class="form-control" readonly id="discounts" onBlur="changeInvoiceTotal();" value="0.0"/>
						</div></div>
					</div>
					
									
                                       <div class="row">
                                       <div class="col-lg-4"></div>
	                                       <div class="col-lg-8">
	                                       <div class="col-lg-8">
	                                       	</div>
	                                       <%-- <div class="col-lg-4">
	                                       <div class="row" style="padding-bottom:2px;">
	                                       <div class="col-lg-6">
	                                       Other Taxes  </div>
	                                       <div class="col-lg-6" style="">
	                                       <input type="text" id="otherTaxes" style="width:100%;" onBlur="changeInvoiceTotal();" value="${itemLists.otherTaxAmt}"/>
	                                       </div>
	                                       </div>
	                                           <div class="row">
	                                       <div class="col-lg-6">
	                                       Discounts </div>
	                                       <div class="col-lg-6" style="">
	                                       <input type="text" id="discounts" style="width:100%;" onBlur="changeInvoiceTotal();" value="0.0"/>
	                                       </div>
	                                       </div>
	                                       </div> --%>
	                                       <div class="col-lg-12"><hr></div>
	                                      <div class="col-lg-4"></div>
	                                      <div class="col-lg-4">
	                                      <b>Invoice Total</b><br>
	                                      </div>
	                                       <div class="col-lg-4" style="padding:0px;" id="totalInvoice">
	                                    	<input type="text" class="form-control" id="totalAmt"  style="width:40%;float:right;"  name="total" value="${itemLists.totalCost}" readonly="readonly" />
	                                      </div>
	                                      
	                                       <div class="col-lg-12"><hr></div>
	                                      
	                                       </div>
                                       </div>
                                    
                                  </c:forEach>
                                        
                                    </div>
                                    </div>
                               
                                    
             <br>
             
              <div class="form-group col-lg-5" style="text-align:left;margin-left:3%;">                   
					<%-- <label><spring:message code="date.label" /> <span style="color:red; font-size:2"></span></label> --%>
					</div>
					<div class="form-group col-lg-4" style="text-align:right;margin-left:12%;">                   
					<%-- <label><spring:message code="signature.label" /> <span style="color:red; font-size:2"></span></label> --%>
					</div>
					 
					    <div class="form-group col-lg-9" style="text-align:center;margin-left:12%;margin-top: 4%;margin-bottom:4%;">                   
					<%-- <label><spring:message code="thankyou.msg.label" /> <span style="color:red; font-size:2"></span></label> --%>
					</div>
           <br>				                                    

						</div><!-- /.box-body -->
						<div class="row" style="text-align: center;">
					<div class="form-group col-lg-12 col-xs-6" style="">
					<input type="hidden" id="flowUnder" value="${flowUnder}">
					<c:if test="${type == 'edit'}">
					<%-- <input type="button" class="btn bg-olive btn-inline btnCls" style="margin-right: 25%;" onclick="return createWarehouseShipmentInvoices('whInvoice','${quoteObj.invoiceId}','edit') ;" value="<spring:message code="submit.label" />" /> --%>
					
				    </c:if>
				 				 	<input type="button" class="btn bg-olive btn-inline btnCls" style="Pointer-events: all;" onclick="return viewShipmentInvoice('wShipmentInvoice','0','warehouse');" value="<spring:message code="cancel.label" />" />
				 
				  
				</div>
				</div>
						<input type="hidden" value="${type}" id="type"/>
                                    <div class="box-footer">
                                    </div>
                                    </div>
                                
                            </div>

</div>

</section><!-- /.content -->

        <script type="text/javascript">
            $(function() {
               /* $('#productsList').dataTable({
                    "bPaginate": false,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": false,
                    "bInfo": false,
                    "bAutoWidth": false
                }); */
             });
        </script>
</body>
</html>
		    		 