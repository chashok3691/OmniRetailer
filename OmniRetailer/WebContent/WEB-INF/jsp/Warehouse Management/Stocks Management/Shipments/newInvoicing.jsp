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
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/invoices/wareHouseShipmentInvoice.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script type="text/javascript">
$(document).ready(function(){
	debugger;
	callCalender('deliveryNoteDate');
	callCalender('deliveryDate');
	changeAddressOfInvoice();	
	
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



</head>
<body>
<!-- Content Header (Page header) -->

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
				<div class="box box-primary">
                                <div class="box-header" style="text-align: center;">
                                <h3 class="box-title" style="text-align:center;padding :5px;  border:1px solid  #808080;font-weight: bold;"><spring:message code="invoice.label" /></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                              
                                    <div class="box-body">
                                     <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                                     <div id="Success"  style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
                <br>     
                <div class="row">               
         <div class="col-lg-4" style="">
                 <select class="form-control form-group" id="fromLocation" onload="return changeAddressOfInvoice();" onchange="return changeAddressOfInvoice();" >
	             	<!-- <option disabled selected>Select Location</option> -->
	             	<c:forEach var="location" items="${invoiceloc}" >
						<option value="${location}" ${location == selectedLocation ? '' : ''} id="${location}" >${location}</option>
					</c:forEach>
	            </select>
			<span id="fromLocError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>                     
	                       <!-- <input type="text" class="form-control" name="fromLoc" id="fromLoc" value="" placeholder=""/> -->
				</div> 
				</div>      
        <div class="row">
        <div class="col-lg-4 col-xs-4 col-sm-4">
       
        <div class="row" style="padding: 4px; white-space:nowrap;">
        <div  class="col-lg-3 col-xs-3 col-sm-3">
         <label><spring:message code="counters.label"/></label>
        </div>
          <div  class="col-lg-6 col-xs-6 col-sm-6">
           <input type="text" class="form-control"  name="counter" id="counter" value="">
        </div>
        </div>
         <div class="row" style="padding: 4px;white-space:nowrap;">
        <div  class="col-lg-3 col-xs-3 col-sm-3">
         <label><spring:message code="gstin.or.uin.label"/><span style="color:red; font-size:2">*</span></label>
        </div>
          <div  class="col-lg-6 col-xs-6 col-sm-6">
           <input type="text"class="form-control"  name="gstin" id="gstin" value="">
        <span id="gstinError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
        </div>
        </div>
         <div class="row" style="padding: 4px;white-space:nowrap;">
        <div  class="col-lg-3 col-xs-3 col-sm-3">
         <label><spring:message code="statename.label"/></label>
        </div>
          <div  class="col-lg-6 col-xs-6 col-sm-6">
           <input type="text" name="stateName" readonly="readonly" class="form-control"  id="stateName" value="">
        </div>
        </div>
           <div class="row" style="padding: 4px;white-space:nowrap;">
        <div  class="col-lg-3 col-xs-3 col-sm-3">
         <label><spring:message code="pin.label"/></label>
        </div>
          <div  class="col-lg-6 col-xs-6 col-sm-6">
           <input type="text" name="pinValue" readonly="readonly" class="form-control"  id="pinValue" value="">
        </div>
        </div>
           <div class="row" style="padding: 4px;white-space:nowrap;">
        <div  class="col-lg-3 col-xs-3 col-sm-3">
         <label><spring:message code="customer.newfeedback.email"/></label>
        </div>
          <div  class="col-lg-6 col-xs-6 col-sm-6">
           <input type="text" name="emailId" readonly="readonly" class="form-control"  id="emailId" value="">
        </div>
        </div>
         
         
           <div class="row" style="padding: 4px;white-space:nowrap;">
        <div  class="col-lg-3 col-xs-3 col-sm-3">
         <label><spring:message code="grn.ref.label"/></label>
        </div>
              <div  class="col-lg-6 col-xs-6 col-sm-6">
        <input type="text" class="form-control searchItems"	style="height:30PX;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" onblur=""	placeholder="<spring:message code="enter.shipment.ref.label" />" id="goodsReceiptNoteRef" />
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
           <input type="text" name="invoiceNumber" id="invoiceNumber" value="">
           <span id="invoiceNumberError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
        </div>
        </div>
        <div class="row" style="padding: 4px;">
        <div  class="col-lg-5 col-xs-5 col-sm-5" style="width:32%;white-space:nowrap;">
         <label><spring:message code="delivery.note.label"/></label>
        </div>
          <div  class="col-lg-6 col-xs-6 col-sm-6">
           <input type="text" name="deliveryNote" id="deliveryNote" value="">
        </div>
        </div>
        
        <div class="row" style="padding: 4px;">
        <div  class="col-lg-5 col-xs-5 col-sm-5" style="width:32%;white-space:nowrap;">
         <label><spring:message code="buyers.order.number"/></label>
        </div>
          <div  class="col-lg-7 col-xs-7 col-sm-7">
        <input type="text" class="form-control searchItems"	style="height:30PX;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" onblur=""	placeholder="<spring:message code="enter.po.reference.label" />" id="po_reference" />
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
         <label><spring:message code="supplier.reference.label"/><span style="color:red; font-size:2">*</span></label>
        </div>
       <div  class="col-lg-6 col-xs-6 col-sm-6">
           <input type="text" class="form-control searchItems" style="height:30PX;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" name="supplierName" value="" placeholder="<spring:message code="enter.supplierName.label" />"  id="searchSupplier" />
           <div class=services>
									    		<div class="items">
									     			<ul class="matchedStringUl supplier" style="width: 89%!important;padding: 0px!important;"></ul>
									   			</div>
											</div>
											 <!-- <input type="hidden" class="form-control" name="supplier_Id" id="supplier_Id" readonly="readonly" value=""/> --> 
											 <span id="searchSupplierError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
           <%-- <input type="text" name="supplierRef" id="supplierRef" value="${itemLists.supplierName}"> --%>
        </div>
        </div>
        
         <div class="row" style="padding: 4px; ">
         <div  class="col-lg-5 col-xs-5 col-sm-5" style="width:32%;white-space:nowrap;">
			<label style="font-family: Calibri;"><spring:message code="supplier.code.label" /><span style="color:red; font-size:2">*</span></label>
											</div>
					<div  class="col-lg-6 col-xs-6 col-sm-6">						
											<input type="text" class="form-control" readonly="readonly"
												name="supplier_Id" id="supplier_Id" value="" />
												</div>
										</div>
										
										<div class="row" style="padding: 4px; ">
         <div  class="col-lg-5 col-xs-5 col-sm-5" style="width:32%;white-space:nowrap;">
											<label style="font-family: Calibri;">Supplier State</label>
											</div>
					<div  class="col-lg-6 col-xs-6 col-sm-6">						
											<input type="text" class="form-control" readonly="readonly"
												name="supplier_state" id="supplier_state" value="" />
												</div>
										</div>
        
          

        </div>
        
        
          <div class="col-lg-4 col-xs-4 col-sm-4">
          <%-- <div class="row" style="padding: 4px;">
        <div  class="col-lg-5 col-xs-5 col-sm-5" style="white-space:nowrap;">
         <label><spring:message code="buyer.label"/></label>
        </div>
          <div  class="col-lg-6 col-xs-6 col-sm-6">
           
           <select class="form-control" id="buyer" onchange="">
	                            <c:forEach var="location" items="${outletLocations}">
									<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option>
								
						 		</c:forEach>
	                        </select>
           
           
        </div>
        </div>  --%>
        
        <div class="row" style="padding: 4px;">
        <div  class="col-lg-5 col-xs-5 col-sm-5" style="white-space:nowrap;">
         <label><spring:message code="delivery.by,label"/><span style="color:red; font-size:2">*</span></label>
        </div>
          <div  class="col-lg-6 col-xs-6 col-sm-6">
           <input type="text" name="deliveryBy" id="deliveryBy" value="">
           <span id="deliveryByError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
        </div>
        </div>
        
        <div class="row" style="padding: 4px;">
        <div  class="col-lg-5 col-xs-5 col-sm-5" style="white-space:nowrap;">         
        <label><spring:message code="delivery.note.date.label"/></label>
        </div>
          <div  class="col-lg-5 col-xs-5 col-sm-5">
          <input class="form-control calendar_icon"  readonly="readonly"  name="deliveryNoteDate" id="deliveryNoteDate" value="" style="background-color: white;"  size="20" type="text" onfocus="callCalender('deliveryNoteDate')" onclick="callCalender('deliveryNoteDate')" placeholder="DD/MM/YYYY">
          
        </div>
        </div>
         <div class="row" style="padding: 4px;">
        <div  class="col-lg-5 col-xs-5 col-sm-5" style="white-space:nowrap;">         <label><spring:message code="Paymentmode.label"/></label>
        </div>
          <div  class="col-lg-4 col-xs-5 col-sm-5">
<!--            <input type="text" name="paymentMode" id="paymentMode" value=""> -->
   <select class="form-control" id="shipmentPaymentMode" onchange="">
<%-- 	                            <c:forEach var="paymentMode" items="${shipmentPaymentModeList}"> --%>
										<option value="Card" >Card</option>
								                  		<option value="Cash"}>Cash</option>
								                  		<option value="Jio Money">Jio Money</option>
								                  		<option value="Mall Coupon">Mall Coupon</option>
								                  		<option value="Credits">Credits</option>
								                  		<option value="Sodexo">Sodexo</option>
								                  		<option value="Ticket">Ticket</option>
								                  		<option value="Credit Note">Credit Note</option>
								                  		


<%-- 						 		</c:forEach> --%>
	                        </select>
        </div>
        </div>
        
          <div class="row" style="padding: 4px;">
        <div  class="col-lg-5 col-xs-5 col-sm-5" style="white-space:nowrap;">       
          <label><spring:message code="dispatched.through.label"/></label>
        </div>
          <div  class="col-lg-5 col-xs-6 col-sm-6">
         
           <select class="form-control" id="shipmentDispatches" onchange="">
<%-- 	                            <c:forEach var="dispatchList" items="${dispatchList}"> --%>
<%-- 									<option value="${zoneList.zoneID}" ${zoneList == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option> --%>
						 					 <option value="Rail"${Rail == rail ? 'selected' : ''} >Rail</option>
                                            <option value="Express" ${Express == Express? 'selected' : ''}>Express</option>
                                            <option value="Flight" ${Flight == Flight ? 'selected' : ''}>Flight</option>
                                         
						 	
						 	
<%-- 						 		</c:forEach> --%>
	                        </select>
        </div>
        </div>
        
          <div class="row" style="padding: 4px;">
        <div class="col-lg-5 col-xs-5 col-sm-5" style="white-space:nowrap;">
        <label>Delivery Date</label>
        </div>
          <div  class="col-lg-5 col-xs-6 col-sm-6">
          
           <input class="form-control calendar_icon form-group"  readonly="readonly"  name="deliveryDate" id="deliveryDate" value="" style="background-color: white;"  size="20" type="text" onfocus="callCalender('deliveryDate')" onclick="callCalender('deliveryDate')" placeholder="DD/MM/YYYY">
        </div>
        </div>
        </div>
        </div>
        
      <div class="row">
              <div class="col-lg-12 col-xs-12" style="text-align:center;">
       	 		 <input type="text"  class="form-control searchItems"  	style="height:30PX;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"  value="" id="searchItems" placeholder="<spring:message code="search.items.here.label" />"style="margin-top: 10px;" />
					<div class="services">
		    			<div class="items">
		     				<ul class="matchedStringUl invoicesWarehouseShipmentDetails" style=""></ul>
		   				</div>
					</div>
					<input type="hidden" id="ordersSearch" value="${searchName}">
					<input type="hidden" id="statusofInvoice" value="Submitted">
					
					
       	 	</div>
       	 	</div>
             <!-- <input type="hidden" id="supplier_Id" value=""> -->
             <div class="row">
                                     <div class="form-group col-lg-12" style="margin-top: 0.2%;">
                                      <div class="table-responsive" style="width:100%;overflow: auto;white-space: nowrap;">
                                        <table id="invoiceproductsList" class="table table-bordered table-hover">
                                          <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><div style=""><spring:message code="sl.no.label" /></div></th>
                                            	<th><spring:message code="sku.id.label"/></th>
                                                <th><spring:message code="description.of.goods.label"/></th>
                                                <th><spring:message code="ean.label"/></th>
                                                <th><spring:message code="hsn.sac.label"/></th>
                                                <th>Batch No</th>
                                                <th>Expiry Date</th>
                                                <th><spring:message code="qty.label"/></th>
                                                <th>Tax(%)</th>
                                                <%-- <th><spring:message code="taxrate.label"/></th> --%>
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
                                                <!-- <th>Net Price</th>  -->
                                                <th><spring:message code="action.label"/></th>
                                                
                                           </tr>
                                          </thead>
                                          <tbody style="text-align: center;" id="skuList">
                                            
                                            
                                               <c:set var="totals" value="0"  />

             		      <tr id='dynamicdiv1'>
	  	 				  </tr>
	  	 				

              		    <tr  id="subTotalRow" style="background-color: #EBEBEB; color: #000000">
              		      <td colspan="5" style="border: 2px solid #a2a2a2 !important;"><b>Sub Totals</b></td>
              		      <td style="border: 2px solid #a2a2a2 !important;"></td>
              		      <td style="border: 2px solid #a2a2a2 !important;"></td>
              		      <td id="totalQty" style="border: 2px solid #a2a2a2 !important;">0.0</td>
              		      <td style="border: 2px solid #a2a2a2 !important;"></td>
              		      <td style="border: 2px solid #a2a2a2 !important;"></td>
              		      <td  id="CGSTTotal" style="border: 2px solid #a2a2a2 !important;">0.0</td>
              		      <td style="border: 2px solid #a2a2a2 !important;"></td>
              		      <td  id="SGSTTotal" style="border: 2px solid #a2a2a2 !important;">0.0</td>
              		      <td style="border: 2px solid #a2a2a2 !important;"></td>
              		      <td  id="IGSTTotal" style="border: 2px solid #a2a2a2 !important;">0.0</td>
              		      <!-- <td style="border: 2px solid #a2a2a2 !important;"></td>
              		      <td  id="CESSTotal" style="border: 2px solid #a2a2a2 !important;">0.0</td> -->
              		      <td style="border: 2px solid #a2a2a2 !important;"></td>
              		      <td id="CESSTotal" style="border: 2px solid #a2a2a2 !important;"></td>
              		       <td id="totalfreeqty" style="border: 2px solid #a2a2a2 !important;"></td>
              		      <td style="border: 2px solid #a2a2a2 !important;"></td>
              		      <td id="totaldiscount" style="border: 2px solid #a2a2a2 !important;"></td>
              		      <td style="border: 2px solid #a2a2a2 !important;"></td>
              		      <td  id="grandTotal"style="border: 2px solid #a2a2a2 !important;">0.0</td>
              		      <!--  <td style="border: 2px solid #a2a2a2 !important;"></td> -->
	  	 				  </tr> 
              		  </tbody>
              		   
                                   
                                       </table>
                                       
                                      
                                       
                                       </div>
                                       
                 <div class="col-lg-12 nopadding" style="margin-top: 10px;">
					<div class="col-lg-5"></div>
					<div class="col-lg-2 nopadding">
					<div class="form-group col-lg-6 " style="text-align: right;white-space: nowrap;"><label><spring:message code="sub.total.label" /> </label></div>
					<div class="form-group col-lg-6 nopadding">
						<input type="text" class="form-control" id="subtotalCostInv" name="subTotal" readonly="readonly" value=""/>
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
						<input type="text" class="form-control" id="shipmentCharges" name="shipmentCharges" value=""  onBlur="changeInvoiceTotal();"/>
						</div>
						</div>
						<span id="shipCostError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
				</div>
                  <div class="col-lg-12 nopadding" style="margin-top: -10px;">
						<div class="col-lg-5"></div>
					<div class="col-lg-2 nopadding">
						<div class="form-group col-lg-6 " style="text-align: right;white-space: nowrap;"><label><spring:message code="taxes.label" /> </label></div>
						<div class="form-group col-lg-4 nopadding">
						<input type="text" class="form-control" readonly id="tax" name="tax"  value=""  oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
						<span id="totalTaxError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						<div class="form-group col-lg-2 nopadding">
						<input type="text" class="form-control"  style="margin-left: 3px;" id="other_taxgrn" name="otherTaxAmt"  value=""  onBlur="changeInvoiceTotal();" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
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
						<!-- <input type="text" class="form-control" id="discountgrn" name="totalDiscount" value="" /> -->
						 <input type="text" id="discounts" style="width:100%;" onBlur="changeInvoiceTotal();" value="0.0"/>
						</div></div>
					</div>

                                       <div class="row">
                                       <div class="col-lg-4"></div>
	                                       <div class="col-lg-8">
	                                       <div class="col-lg-8">
	                                       	                                       </div>
	                              
	                                       <div class="col-lg-12"><hr></div>
	                                       <div class="col-lg-4"></div>
	                                      <div class="col-lg-4">
	                                      <b>Invoice Total</b><br>
	                                      </div>
	                                       <div class="col-lg-4" style="padding:0px;" id="totalInvoice">
	                                    	<input type="text" class="form-control"  style="width:40%;float:right;"  name="total" id="totalAmt" value="0.0" readonly="readonly" />
	                                      </div>
	                                      
	                                       <div class="col-lg-12"><hr></div>
	                                      
	                                       </div>
                                       </div>
                                    
                                  
                                        
                                    </div>
                                    </div>
                               
                                    
             <br>
             
              <div class="form-group col-lg-5" style="text-align:left;margin-left:3%;">                   
					</div>
					<div class="form-group col-lg-4" style="text-align:right;margin-left:12%;">                   
					</div>
					 
					    <div class="form-group col-lg-9" style="text-align:center;margin-left:12%;margin-top: 4%;margin-bottom:4%;">                   
					</div>
           <br>				                                    

						</div><!-- /.box-body -->
						<div class="row" style="text-align: center;">
					<div class="form-group col-lg-12 col-xs-6" style="">
					<input type="hidden" id="flowUnder" value="${flowUnder}">
					<c:if test="${type == 'new'}">
				       <input type="button" class="btn bg-olive btn-inline btnCls" style="margin-right: 25%;" onclick="return createWarehouseShipmentInvoices('whInvoice','','${quoteObj.invoiceId}','new') ;" value="<spring:message code="submit.label" />" />
				    </c:if>
				 	<input type="button" class="btn bg-olive btn-inline btnCls" style="" onclick="return viewShipmentInvoice('wShipmentInvoice','0','warehouse');" value="<spring:message code="cancel.label" />" />
				 
				  
				</div>
				</div>
						
                                    <div class="box-footer">
                                    </div>
                                    </div>
                                
                            </div>

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
		    		 