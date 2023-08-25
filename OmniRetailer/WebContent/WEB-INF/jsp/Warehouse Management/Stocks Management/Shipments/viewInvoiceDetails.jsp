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
	
	callCalender('deliveryNoteDate');
	callCalender('deliveryDate');
	
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
                                <div class="box-header" style="text-align: left;">
                                <h3 style="text-align:center;"><spring:message code="invoice.label" /></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                              
                                    <div class="box-body">
                                     <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                                     <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
                <br>     
                <c:forEach var="itemLists" items="${invoiceList.whInvoiceList}"  >    
                <div class="row">  
                   
         <div class="col-lg-4" style=""> 
         
                 <select class="form-control form-group" id="fromLocation" disabled="disabled" onload="return changeAddressOfInvoice();" onchange="return changeAddressOfInvoice();" >
	             
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
           <input type="text" name="counter"  disabled="disabled" class="form-control" id="counter" value="${itemLists.counterId}">
        </div>
        </div>
         <div class="row" style="padding: 4px;white-space:nowrap;">
        <div  class="col-lg-3 col-xs-3 col-sm-3">
         <label><spring:message code="gstin.or.uin.label"/></label>
        </div>
          <div  class="col-lg-6 col-xs-6 col-sm-6">
           <input type="text" name="gstin" id="gstin" disabled="disabled" class="form-control" value="${itemLists.gstn}">
        </div>
        </div>
         <div class="row" style="padding: 4px;white-space:nowrap;">
        <div  class="col-lg-3 col-xs-3 col-sm-3">
         <label><spring:message code="statename.label"/></label>
        </div>
          <div  class="col-lg-6 col-xs-6 col-sm-6">
           <input type="text" name="stateName"  class="form-control" disabled="disabled" id="stateName" value="">
        </div>
        </div>
           <div class="row" style="padding: 4px;white-space:nowrap;">
        <div  class="col-lg-3 col-xs-3 col-sm-3">
         <label><spring:message code="pin.label"/></label>
        </div>
          <div  class="col-lg-6 col-xs-6 col-sm-6">
           <input type="text" name="pinValue"  disabled="disabled" class="form-control" id="pinValue" value="${itemLists.shippedToZipCode}">
        </div>
        </div>
           <div class="row" style="padding: 4px;white-space:nowrap;">
        <div  class="col-lg-3 col-xs-3 col-sm-3">
         <label><spring:message code="customer.newfeedback.email"/></label>
        </div>
          <div  class="col-lg-6 col-xs-6 col-sm-6">
           <input type="text" name="emailId" disabled="disabled" class="form-control" id="emailId"  value="${itemLists.email}">
        </div>
        </div>
         
         
           <div class="row" style="padding: 4px;white-space:nowrap;">
        <div  class="col-lg-3 col-xs-3 col-sm-3">
         <label><spring:message code="shipment.ref.label"/></label>
        </div>
          <div  class="col-lg-6 col-xs-6 col-sm-6">
           <input type="text" name="shipmentRef"  disabled="disabled" class="form-control" id="shipmentRef"  value="${itemLists.goodsReceiptNoteRef}">
        </div>
        </div>
        </div>
        
         <div class="col-lg-4 col-xs-4 col-sm-4">
         <div class="row" style="padding: 4px;">
        <div  class="col-lg-5 col-xs-5 col-sm-5" style="width:32%;white-space:nowrap;">
         <label><spring:message code="invoice.number.label"/></label>
        </div>
          <div  class="col-lg-6 col-xs-6 col-sm-6">
                  
                         
           			<input type="text" name="invoiceNumber"  disabled="disabled" class="form-control" id="invoiceNumber" value="${itemLists.shipmentId}">
  
    
        </div>
        </div>
        <div class="row" style="padding: 4px;">
        <div  class="col-lg-5 col-xs-5 col-sm-5" style="width:32%;white-space:nowrap;">
         <label><spring:message code="delivery.note.label"/></label>
        </div>
          <div  class="col-lg-6 col-xs-6 col-sm-6">
           <input type="text" name="deliveryNote" id="deliveryNote" disabled="disabled" class="form-control" value="${itemLists.shipmentNoteId}">
        </div>
        </div>
         <div class="row" style="padding: 4px; ">
        <div  class="col-lg-5 col-xs-5 col-sm-5" style="width:32%;white-space:nowrap;">
         <label><spring:message code="supplier.reference.label"/></label>
        </div>
              <div  class="col-lg-6 col-xs-6 col-sm-6">
           <input type="text" class="form-control searchItems" style="height:30PX;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" name="supplierName" value="${itemLists.supplierName}" placeholder="<spring:message code="enter.supplierName.label" />"  id="searchSupplier" />
           <div class=services>
									    		<div class="items">
									     			<ul class="matchedStringUl supplier" style="width: 89%!important;padding: 0px!important;"></ul>
									   			</div>
											</div>
           <%-- <input type="text" name="supplierRef" id="supplierRef" value="${itemLists.supplierName}"> --%>
        </div>
        </div>
        
          <div class="row" style="padding: 4px;">
        <div  class="col-lg-5 col-xs-5 col-sm-5" style="width:32%;white-space:nowrap;">
         <label><spring:message code="buyers.order.number"/></label>
        </div>
          <div  class="col-lg-7 col-xs-7 col-sm-7">
        <input type="text" class="form-control searchItems" disabled="disabled"	style="height:30PX;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" 	value="${itemLists.orderId}" placeholder="<spring:message code="enter.po.reference.label" />" id="po_reference" />
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
        
          <div class="row" style="padding: 4px;">
        <div  class="col-lg-5 col-xs-5 col-sm-5" style="width:32%;white-space:nowrap;">
         <label><spring:message code="delivery.by,label"/></label>
        </div>
          <div  class="col-lg-6 col-xs-6 col-sm-6">
           <input type="text" name="deliveryBy" class="form-control"  disabled="disabled" id="deliveryBy" value="${itemLists.shipmentAgency}">
        </div>
        </div>

        </div>
        
        
          <div class="col-lg-4 col-xs-4 col-sm-4">
         <div class="row" style="padding: 4px;">
        <div  class="col-lg-5 col-xs-5 col-sm-5" style="white-space:nowrap;">
         <label><spring:message code="buyer.label"/></label>
        </div>
          <div  class="col-lg-6 col-xs-6 col-sm-6">
           
           <select class="form-control" id="buyer" onchange="" disabled="disabled">
	                            <c:forEach var="location" items="${outletLocations}">
									<option value="${location}" ${location == itemLists.shipmentReceivedBy ? 'selected' : ''} id="${location}" >${location}</option>
								
						 		</c:forEach>
	                        </select>
           
           
        </div>
        </div>
        <div class="row" style="padding: 4px;">
        <div  class="col-lg-5 col-xs-5 col-sm-5" style="white-space:nowrap;">         
        <label><spring:message code="delivery.note.date.label"/></label>
        </div>
          <div  class="col-lg-5 col-xs-5 col-sm-5">
          <input class="form-control calendar_icon"  disabled="disabled" class="form-control"readonly="readonly"  name="deliveryNoteDate" id="deliveryNoteDate" value="${itemLists.createdOnStr}" style="background-color: white;"  size="20" type="text" onfocus="callCalender('deliveryNoteDate')" onclick="callCalender('deliveryNoteDate')" placeholder="DD/MM/YYYY">
          
        </div>
        </div>
         
         
         
         <div class="row" style="padding: 4px;">
        <div  class="col-lg-5 col-xs-5 col-sm-5" style="white-space:nowrap;">         <label><spring:message code="Paymentmode.label"/></label>
        </div>
          <div  class="col-lg-4 col-xs-5 col-sm-5">
<!--            <input type="text" name="paymentMode" id="paymentMode" value=""> -->
   <select class="form-control" id="shipmentPaymentMode" onchange="" disabled="disabled">
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
         
           <select class="form-control" disabled="disabled" id="shipmentDispatches" onchange="">
				 					 <option value="Rail"${'Rail' == itemLists.shipmentMode ? 'selected' : ''} >Rail</option>
                                            <option value="Express" ${'Express' == itemLists.shipmentMode ? 'selected' : ''}>Express</option>
                                            <option value="Flight" ${'Flight' == itemLists.shipmentMode  ? 'selected' : ''}>Flight</option>
                                         
					
	                        </select>
        </div>
        </div>
        
          <div class="row" style="padding: 4px;">
        <div  class="col-lg-5 col-xs-5 col-sm-5" style="white-space:nowrap;">         <label><spring:message code="delivery.note.date.label"/></label>
        </div>
          <div  class="col-lg-5 col-xs-6 col-sm-6">
          
           <input class="form-control calendar_icon form-group" disabled="disabled"class="form-control"  readonly="readonly"  name="deliveryDate" id="deliveryDate" value="" style="background-color: white;"  size="20" type="text" value="${itemList.shipmentDateStr}" onfocus="callCalender('deliveryDate')" onclick="callCalender('deliveryDate')" placeholder="DD/MM/YYYY">
       
       
       
       
        </div>
        </div>
        </div>
       
        </div>
       </c:forEach> 
      <div class="row">
              <div class="col-lg-12 col-xs-12" style="text-align:center;">
       	 		 <input type="text"  disabled="disabled" class="form-control searchItems"  value="" id="searchItems" placeholder="<spring:message code="search.items.here.label" />"style="margin-top: 10px;" />
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
                                      <div class="table-responsive" style="width:100%">
                                        <table id="invoiceproductsList" class="table table-bordered table-hover">
                                          <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><div style=""><spring:message code="sl.no.label" /></div></th>
                                            	<th><spring:message code="sku.code.label"/></th>
                                                <th><spring:message code="description.of.goods.label"/></th>
                                                <th><spring:message code="ean.label"/></th>
                                                <th><spring:message code="hsn.sac.label"/></th>
                                                <th><spring:message code="qty.label"/></th>
                                                <th><spring:message code="rate.label"/></th>
                                                <th><spring:message code="cgst.rate.label"/></th>
                                                 <th><spring:message code="cgst.label"/></th>
                                                 <th><spring:message code="sgst.rate.label"/></th>
                                                 <th><spring:message code="sgst.label"/></th>
                                                 <th><spring:message code="report.price.label"/></th>
                                                <th><spring:message code="cost.label"/></th>
                                                <th><spring:message code="action.label"/></th>
                                                
                                           </tr>
                                          </thead>
                                          <tbody style="text-align: center;" id="skuList">
                                              <!-- <tbody style="text-align: center;"> -->
                                           <tr id='dynamicdiv1'>
	  	 				  </tr>
	  	 				         <c:set var="totals" value="0"  />
                       
                         <c:forEach var="itemLists" items="${invoiceList.whInvoiceList}"  >
                          <c:forEach var="itemList" items="${itemLists.whInvoiceItemsList}" varStatus="theCount">
                       <tr id=id="dynamicdiv${theCount.count}">
                       <td class="slno" id="">${theCount.count}</td>
                       <td id="itemCode${theCount.count}">${itemList.skuId}</td>
                       <input type='hidden' id='color${theCount.count}' value="${itemList.color}" />
			<input type='hidden' id="size${theCount.count}" value="${itemList.size}">
			<input type='hidden' id="uom${theCount.count}" value="${itemList.unitOfMeasurement}"/>
			<input type='hidden' id="pluCode${theCount.count}" value="${itemList.pluCode}" />
			<input type='hidden' id="model${theCount.count}" value="${itemList.skuId}"/>
			<input type='hidden' id="category${theCount.count}" value="${itemList.category}" />
			<input type='hidden' id="subCategory${theCount.count}" value="${itemList.subCategory}" />
                       
                     					<td id="itemDesc${theCount.count}">${itemList.itemDescription}</td>
                     					<td id="ean${theCount.count}">${itemList.ean}</td>
                     					<td id="HSN${theCount.count}">${itemList.hsnCode}</td>
<%--                      				<td id="Received${theCount.count}"><input style='text-align: center;width:75px;' type='number' id='Received${theCount.count}' class='Received'  name='Received'  onBlur='changePack(this);' value='${itemList.quantity}' /></td> --%>
                     					<td id="qty${theCount.count}"><input disabled="disabled" class="form-control" style='text-align: center;width:75px;' type='number' id='Received${theCount.count}' class='Received'  name='Received'  onBlur='changePack(this);' value='${itemList.quantity}' /></td>
                     					
                     					<td id="TaxRate"><input disabled="disabled" style='text-align: center;width:75px;' type='number' id='rate${theCount.count}' class='rate'  name='rate'  onBlur='changePackRate(this);' value='${itemList.taxRate}' /></td>
                     					<td id="cgstrate${theCount.count}">${itemList.cgstRate}</td>
                     					<td class="cgst" id="cgst${theCount.count}">${itemList.cgstAmt}</td>
                     					<td id="sgstrate${theCount.count}">${itemList.sgstRate}</td>
                     					<td class="sgst" id="sgst${theCount.count}">${itemList.sgstAmt}</td>
                     					<td id="costPrice${theCount.count}">${itemList.price}</td>
                     					<td class="amount" id="amount${theCount.count}">${itemList.total}</td>
                     					<td id="Del${theCount.count}"><img id="Img${theCount.count}" src="${pageContext.request.contextPath}/images/itemdelete.png" style="width:12%;cursor:pointer;" title="Delete${itemList.skuId}" onclick='deleteItem(this);'/></td>
									
                       </tr>
                     
        </c:forEach>
              		   </c:forEach>


							<c:forEach var="itemLists" items="${invoiceList.whInvoiceList}" >
              		    <tr  id="subTotalRow" style="background-color: #EBEBEB; color: #000000">
              		      <td colspan="5" style="border: 2px solid #a2a2a2 !important;"><b>Sub Totals</b></td>
              		      <td id="totalQty" style="border: 2px solid #a2a2a2 !important;"></td>
              		      <td style="border: 2px solid #a2a2a2 !important;"></td>
              		      <td style="border: 2px solid #a2a2a2 !important;"></td>
              		      <td  id="CGSTTotal" style="border: 2px solid #a2a2a2 !important;">${itemLists.cgstAmt}</td>
              		      <td style="border: 2px solid #a2a2a2 !important;"></td>
              		      <td  id="SGSTTotal" style="border: 2px solid #a2a2a2 !important;">${itemLists.cgstAmt}</td>
              		      <td  style="border: 2px solid #a2a2a2 !important;"></td>
              		      <c:set var="total" value="${itemLists.totalItemCost}"/>
              		      <c:if test="${not empty total }">
              		      <td  id="grandTotal"style="border: 2px solid #a2a2a2 !important;">${itemLists.totalItemCost}</td>
              		       </c:if>
              		       <c:if test="${empty total}">
              		      <td  id="grandTotal"style="border: 2px solid #a2a2a2 !important;">0.0</td>
              		       </c:if>
              		       <td style="border: 2px solid #a2a2a2 !important;"></td>
	  	 				  </tr> 
	  	 			</c:forEach>
              		  </tbody>
              		   
                  	  
	
                                        <!--   </tbody> -->
                                       </table>
                                       
                                       <table>
                                       
                                       
                                       
                                       </table>
                                       
                                       </div>
<c:forEach var="itemLists" items="${invoiceList.whInvoiceList}" >
                                       <div class="row">
                                       <div class="col-lg-4"></div>
	                                       <div class="col-lg-8">
	                                       <div class="col-lg-8">
	                                       	                                       </div>
	                                       <div class="col-lg-4">
	                                       <div class="row" style="padding-bottom:2px;">
	                                       <div class="col-lg-6">
	                                       Other Taxes  </div>
	                                       <div class="col-lg-6" style="">
	                                       <input type="text" disabled="disabled" class="form-control"id="otherTaxes" style="width:100%;" onBlur="changeInvoiceTotal();" value="${itemLists.otherTaxAmt}"/>
	                                       </div>
	                                       </div>
	                                           <div class="row">
	                                       <div class="col-lg-6">
	                                       Discounts </div>
	                                       <div class="col-lg-6" style="">
	                                       <input type="text"  disabled="disabled" class="form-control"id="discounts" style="width:100%;" onBlur="changeInvoiceTotal();" value="0.0"/>
	                                       </div>
	                                       </div>
	                                       </div>
	                                       <div class="col-lg-12"><hr></div>
	                                      <div class="col-lg-8">
	                                      
	                                      <b>Invoice Total</b><br>
	                                     
	                                      </div>
	                                       <div class="col-lg-4" style="padding:0px;" id="totalInvoice">
	                                    	<input type="text" disabled="disabled" class="form-control" id="total"  style="width:40%;float:right;"  name="total" value="${itemLists.totalItemCost}" readonly="readonly" />
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
					<input type="button" class="btn bg-olive btn-inline btnCls" style="margin-right: 25%;" onclick="return createWarehouseShipmentInvoices('whInvoice','${quoteObj.invoiceId}','edit') ;" value="<spring:message code="submit.label" />" />
					
				    </c:if>
				 				 	<input type="button" class="btn bg-olive btn-inline btnCls" style="margin-right: 25%;" onclick="return viewShipmentInvoice('wShipmentInvoice','0','warehouse');" value="<spring:message code="cancel.label" />" />
				 
				  
				</div>
				</div>
						
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
		    		 