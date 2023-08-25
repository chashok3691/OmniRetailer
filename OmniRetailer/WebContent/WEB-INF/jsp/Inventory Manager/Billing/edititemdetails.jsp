<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah
 * file name		        : inventorymanager/Billing/itemdetails.jsp
 * file type		        : JSP
 * description				: display specific bill items
 * */ -->


<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> --%>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html>
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 -->

<!-- <meta charset="UTF-8"> -->
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

	 <!-- DATA TABLES -->
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/goodstransfer.js"></script>
<style>
.modal-dialogwidth {
    width: auto;
    margin: 30px auto;
}
.modal-dialogwidth
{
 margin-top: 14.5%;
 }
  .odd{display:none!important;}
  /* .labelgrn
{
margin-right: 10px;
} */
.col-lg-1
{
padding-left:0px ! important;
}
.input-group {
    position: relative;
    width: 100%;    // --> this line
    display: table; 
    border-collapse: separate;
}
.form-control {
    display:initial !important;
    margin-bottom: 4px;
}
.form-group {
    margin-bottom: 5px;
}
 @media (min-width: 1200px){
 .marginleft{
 margin-left:-1px;
 }
 .netAmountStyle
{
    text-align: center;
    font-size: 19px;
    height: 43px;
    padding-top: 4px;
    /* font-stretch: extra-expanded; */
    
    font-size: 22px;
    font-weight: bold !important;
}
.netAmount
{
    padding-top: 5px;
    padding-right: 0px;
    font-weight: bold;
    font-size: 20px;
    text-align: right;
     font-weight: bold;
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
                               <div class="box-header">
						<%-- <c:if test="${billcontent == 'billItems'}">
							<h3 class="box-title">
								<spring:message code="billing_items.label" />
							</h3>
						</c:if>
						<c:if test="${billcontent == 'billTransactions'}">
							<h3 class="box-title">
								<spring:message code="billing_transactions.label" />
							</h3>
						</c:if> --%>
					<div class="box-header" style="text-align:center;margin-top:-16px">
                                
                              <label> <h3 style="border:1px solid #a6a6a6!important;padding:3px;">Item Order Details</h3></label> 
                                </div>
							
						<div class="box-header" style="text-align:left;margin-top:-96px">
                                <h3 style="font-size:large">Bill ID :&nbsp; &nbsp; &nbsp; &nbsp;  ${billId }</h3>
                                <h3  style="font-size:large;margin-top:-5px">Serial Bill ID(Daily): ${billDetails.serialBillId} </h3>
                                <h3  style="font-size:large;margin-top:-5px">Serial Bill ID(Yearly): ${billDetails.serailBillIdYearly} </h3>
                                
                                </div>
					</div><!-- /.box-header -->
					
                                <!-- form start -->
                                <form class="">
                               
                                    <div class="box-body">
                                                              	<div class="row" style="text-align: right; margin-top: -65px;">
                                    		<c:if test="${flow != 'billSummary' }">
	                                    		<div class="col-lg-1" style="float:right">
	                                    		<input type="button" class="addBtn btn bg-olive btn-inline" style="margin-left:2%;margin-right: 1.2%;position: relative;" onclick="viewBills('outletBilling','0','menu','${flow}');" value="<spring:message code="back.label" />" />
                                    	</div>
                                    		</c:if>
                                    		<c:if test="${flow != 'billSummary' }">
                        		<%-- <div class="col-lg-1" style="float:right">
                        		<input type="button" class=" addBtn btn bg-olive btn-inline" style="margin-left:1%;margin-right: 1.4%;position: relative;" onclick="CancelBillid('${billId }','','');" value="<spring:message code="submit.label" />" />
                       		</div> --%>
                       		<div class="col-lg-1" style="float:right">
                        		<input type="button"   class=" addBtn btn bg-olive btn-inline" data-toggle="modal" data-target="#myModalcancel" style="margin-left:1%;margin-right: 1.4%;position: relative;" <%-- onclick="CancelBillid('${billId }','','');" --%> value="<spring:message code="submit.label" />" />
                       		</div>
                       		</c:if>
                                    		
                                    		<c:if test="${flow == 'billSummary' }" >
	                                    		<div class="col-lg-1" style="float:right">
	                                    		<input type="button" class=" addBtn btn bg-olive btn-inline" style="margin-left:2%;margin-right: 1.2%;position: relative;" onclick="return viewBillSummary('${billDetails.business_date}','0','${criteria}','false');" value="<spring:message code="back.label" />" />
                                    		</div>
                                    		</c:if>
                                    		<hr style="margin-top: 4px;width: 99%;" />
                                    	</div>
                                     <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                                      <div id="Error" style="text-align:center;color:blue;font-weight:bold;">${success}</div>
                                  <%--     <c:forEach var="billing" items="${billDetails.billing}"> --%>
                                    <div class="row">
                                    
                                    <div class="form-group col-lg-2">
                                            <label><spring:message code="store_location.laber" /></label>
                                           <%--  <input type="text" id="outletLocation" class="form-control" readonly value="${billDetails.store_location}"/> --%>
                                            <input type="text" class="form-control" id="location" readonly  value="${billDetails.store_location}"/>
                                            
                                            <label><spring:message code="customerName.label" /></label>
                                            <input type="text" class="form-control" id="customerName" value="${billDetails.customerName}"/>
                                     </div>
                                     <div class="form-group col-lg-2">
                                           <label>Sync Status</label><br>
                                            <select class="form-control" id="billSyncStatus" style="">
											 <option value="true" ${billDetails.billSyncStatus == 'true' ? 'selected' : ''}>Yes</option>
											 <option value="false" ${billDetails.billSyncStatus == 'false' ? 'selected' : ''}>No</option>
		                                  	</select><br>
		                                  	
                                       <label>GSTIN No</label>
                                           <input type="text" class="form-control" id="customerGstin" value="${billDetails.customerGstin}"/>
                                        </div>
                                        
                                        <div class="form-group col-lg-2">
                                            <label><spring:message code="bill.date.label" /> </label>
                                            <input type="text" class="form-control" id="businessDate" readonly  value="${billDetails.business_date}"/>
                                       
                                       <label><spring:message code="customer.mobile.label" /></label>
                                            <input type="text" class="form-control" readonly  value="${billDetails.phoneNumber}"/>
                                       
                                        </div>
                                        <div class="form-group col-lg-2">
                                        	<label><spring:message code="bill.done.by.label" /> </label>
                                            <input type="text" class="form-control" readonly  value="${billDetails.cashierId}"/>
                                        
                                        <label><spring:message code="order_type.label" /></label>
                                            <input type="text" class="form-control" readonly  value="${billDetails.deliveryType} "/>
                                        </div>
                                        <div class="form-group col-lg-2">
                                         <label><spring:message code="billing_counter_id.label" /></label>
                                            <input type="text" class="form-control" readonly id="counterIdedit"  value="${billDetails.counterId}"/>
                                      
                                       <label><spring:message code="billing_status.label" /> </label>
                                           
                                           <select class="form-control"  id="billStatus1" >
                                           <c:if test="${billDetails.status!='TA-Cancelled'}">
											 <option value=" ${billDetails.status}">${billDetails.status}</option>
											 </c:if>
											 <c:if test="${billDetails.status == 'DD-CB-Open'}">
                                            <option value="DD-CB-Closed">DD-CB-Closed</option>
                                            </c:if>
                                            <c:if test="${billDetails.status == 'TA-CB-Open'}">
                                            <option value="TA-CB-Closed">TA-CB-Closed</option>
                                            </c:if>
                                              <c:if test="${billDetails.status=='TA-Draft'}">
											 <option value="TA-Completed">TA-Completed</option>
											 </c:if>
											   <c:if test="${billDetails.status=='TA-Pending'}">
											 <option value="TA-Completed">TA-Completed</option>
											 </c:if>
											   <c:if test="${billDetails.status !='TA-Draft'}">
										  <option value="TA-Cancelled" ${billDetails.status == 'TA-Cancelled' ? 'selected' : ''}>TA-Cancelled</option>
											 </c:if>
										  <%-- <option value="TA-Cancelled" ${billDetails.status == 'TA-Cancelled' ? 'selected' : ''}>TA-Cancelled</option> --%>
												
		                                  		  	</select>
		                                  		  	
		                                  		  	<input type="hidden" value="${billDetails.status}" id="billingStatus"/>
                                   
                                        </div>
                                        
                                        <div class="form-group col-lg-2">
                                   	  	   <label><spring:message code="remarks.label" /></label>
		                                        <textarea class="form-control" disabled style="resize:none;height:81px" rows="3" name="remarks" id="remarks"  >${billDetails.comments}</textarea>
									 		
                                   	  </div>
                                        </div>
                                          
                                    <%-- <div class="row">
                                        <div class="form-group col-lg-3">
                                            <label><spring:message code="customerName.label" /></label>
                                            <input type="text" class="form-control" readonly  value="${billDetails.customerName}"/>
                                        </div>
                                        
                                        <div class="form-group col-lg-3">
                                        	 <label><spring:message code="customer.mobile.label" /></label>
                                            <input type="text" class="form-control" readonly  value="${billDetails.phoneNumber}"/>
                                        </div>
                                        
                                        <div class="form-group col-lg-3">
                                        <label><spring:message code="order_type.label" /></label>
                                            <input type="text" class="form-control" readonly  value="${billDetails.deliveryType} "/>
                                        </div>
                                        
                                         <div class="form-group col-lg-3">
                                             <label><spring:message code="billing_status.label" /> </label>
                                           
                                           <select class="form-control"  id="billStatus1" >
                                           <c:if test="${billDetails.status!='TA-Cancelled'}">
											 <option value=" ${billDetails.status}">${billDetails.status}</option></c:if>
												 <option value="TA-Cancelled" ${billDetails.status == 'TA-Cancelled' ? 'selected' : ''}>TA-Cancelled</option>
												
		                                  		  	</select>
		                                  		  	
		                                  		  	<input type="hidden" value="${billDetails.status}" id="billingStatus"/>
		                                  		  	
                                           
                                           
                                           
                                            <input type="text" class="form-control"  value="${billDetails.status}"/>
                                        </div>
                                     </div> --%>
                                     
                                   
                                     
                                         <c:set var="totalTaxValue" value="0"/>
                                     <c:set var="totalItemTaxValue" value="0"/>
                                       <c:set var="totalItemDiscountValue" value="0"/>
                                     
                                     <%-- </c:forEach> --%>
                                      <div class="table-responsive" style="overflow-x:auto;">
                                        <table id="itemsList" class="table table-bordered table-hover">
                                          <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><spring:message code="billing.sno.label"/></th>
                                            	<th><spring:message code="skuid.label"/></th>
                                                <th><div style="width:120px"><spring:message code="item_name.label"/></div></th>
                                               	<th><spring:message code="itemScanCode.label"/></th>
                                                 <th><div style="width:70px"><spring:message code="deal_id.label"/></div></th>
                                               <%--   <th><spring:message code="order_quantity.label"/></th> --%>
                                                 <th><spring:message code="sold.qty.label"/></th>
                                                <th><spring:message code="mrp.label"/></th> 
                                                  <th><spring:message code="edit.price.label"/></th> 
                                                  <th><spring:message code="manual.discount.label"/></th> 
                                               <%--   <th><spring:message code="price.label"/></th> --%>
                                            <%--    <th><spring:message code="original.price.label"/></th> --%>
                                              
                                                  <th>Offer/Deal</th>
                                                    <th><spring:message code="saleprice.label"/></th>
                                                  <th><spring:message code="tax.label"/></th>
                                                   <th><spring:message code="sale.value"/></th>
                                               <%--  <th><spring:message code="total_bill.label"/></th> --%>
                                           </tr>
                                          </thead>
                                            <tbody style="text-align: center;">
                                          
                       <c:forEach var="items" items="${billDetails.billItems}" varStatus="theCount">
             		   <tr>
             		    <td>${theCount.count}</td>
              			<td>${items.sku_id}</td>
                  		<td>${items.item_name}</td>
                  		<td>${items.itemScanCode}</td>
                  		<input type="hidden" id="empid" val="${items.employeeSaleId}"/>
                  		 <c:choose>
                  		
                  	 <c:when test= "${(0.0+billDetails.totalDiscount)>0}">
      <td>
      <c:forTokens items="${items.discountId}" delims="," var="mySplit">
   <a style="color: #0e1edc;cursor: pointer;text-decoration: underline;" onclick="getdealsandoffernames('${mySplit}','${mySplit}')"><blink><c:out value="${mySplit}"/></blink></a>
</c:forTokens>
      </td>
   
                  		</c:when> 
                  		
                  		 <c:when test= "${(items.itemDiscount+items.discountPrice)>0} ">
      <td>
      <c:forTokens items="${items.discountId}" delims="," var="mySplit">
   <a onclick=""><blink><c:out value="${mySplit}"/></blink></a>
</c:forTokens>
      
      </td>
                  		</c:when>
                  		
                  		<c:when test="${items.itemDiscount>0}">
      <td>${items.discountId}</td>
                  		</c:when>
                  		
                  		<c:when test="${items.discountPrice>0}">
      <td>${items.discountId}</td>
                  		</c:when>
                  		<c:otherwise> 
                  		<td>No Discount</td>
                  	 	
                  	 </c:otherwise>
                  		</c:choose> 
                  		<td>${items.quantity}</td>
                  		<td>${items.originalMRP}</td>
                  	<td>${items.editedPrice}</td>
                  	<c:set var="totalItemTaxValue" value="${totalItemTaxValue+items.itemDiscount}"/>
                  	
                  	
                  	<td>${items.itemDiscount}</td>
                  		
                  		<%-- <c:when test="${items.itemUnitPrice>0}">
                  			<td>${items.itemUnitPrice}</td>
                  		</c:when>
                  		<c:otherwise> --%>
                  		
                  			<%-- <td>${items.itemUnitPrice}</td> --%>
                  		<%-- </c:otherwise> --%>
                  		
                  		<%-- </c:choose> --%>
                  	<fmt:formatNumber type="number" minFractionDigits="2" groupingUsed="false" maxFractionDigits="2" value="${items.discountPrice}" var="discount"/>
                  		<%-- <c:set value="${items.itemUnitPrice-items.itemDiscount}" var="soldPrice"/> --%>
                  		<td>${discount}</td>
                  		<fmt:formatNumber type="number" minFractionDigits="2" groupingUsed="false" maxFractionDigits="2" value="${items.itemUnitPrice-((items.itemDiscount+items.discountPrice)/(items.quantity))}" var="soldPrice" />
                  		<td>${items.itemUnitPrice}</td>
                  		<td>${items.taxCost}</td>
                  		<%--	 <fmt:formatNumber var="totaltax" type="number" minFractionDigits="2" maxFractionDigits="2" value="${items.item_total_price-items.itemDiscount}" />
                  		<td>${totaltax}</td>  --%>
                  		 <c:set var="totalTaxValue" value="${totalTaxValue+items.taxCost}"/>
                  		<%--  <c:set var="totalItemDiscountValue" value="${totalItemDiscountValue+discount}"/> --%>
                  		  <fmt:formatNumber var="totalItemDiscountValue" groupingUsed="false"  type="number" minFractionDigits="2" maxFractionDigits="2" value="${totalItemDiscountValue+discount}" />
                  		 
                    <fmt:formatNumber var="totaltax" type="number" groupingUsed="false" minFractionDigits="2" maxFractionDigits="2" currencySymbol="$" value="${(((items.itemUnitPrice)-((items.itemDiscount+items.discountPrice)/(items.quantity)))*(items.quantity))}" />
                  		<td>${items.item_total_price}</td>  
                  	   </tr>
              		   </c:forEach> 
		 </tbody>
                                           </table>
                                    </div>
                                    <br/> 
                                    
                  <div>
                         <div class="row" style="padding-right: 15px;">
                           <div class="col-lg-2" >
                           </div>
                           <div class="col-lg-10" style="padding-right: 8px;    padding-left: 8px;    padding-top: 10px;  border-width:1px;  border-style: solid;border-color:	#D0D0D0; background-color: 	#F2F2F2">
                          
                 		<div class="row">
                           <div class="col-lg-3" style="padding-left: 0px;">
                           
                          
								<div class=" col-lg-6 " style="text-align: left;white-space:nowrap;"><label class="control-label " ><spring:message code="deals.or.offers.label"/></label></div>
								<div class="form-group col-lg-6">
								<input type="text" class="form-control" style=" padding-right: 0px;width:120%;" name="totalDisc" readonly value="${totalItemDiscountValue}"/>
								</div>
						</div>
							
							
							 <div class="col-lg-3" style="padding-left: 0px; width:28% !important">
							         <div class="form-group form-inline col-lg-7" style="white-space:nowrap;padding-right: 10px; display: inline-block;"> <label > <spring:message code="gift.voucher.coupon.label"/> </label></div>
								<div class="form-group col-lg-5 ">
<%-- 								<fmt:formatNumber var="subTotal" type="number" minFractionDigits="2" maxFractionDigits="2" value="${billDetails.subTotal}"/> --%>
								
								<input type="text" class="form-control" style=" padding-right: 0px; width:140% !important; margin-right:0px;width: 120%;" name="voucherDiscounts" readonly value="${billDetails.voucherDiscounts}"/>
								</div>
                           
                           </div>
                     
                        
                           
                       
                           <div class="col-lg-3" style="padding-left: 0px;width:21% !important">
                           <div class=" col-lg-6 " style="white-space:nowrap;text-align: left; padding-LEFT: 17%;"><label ><spring:message code="sub.total.label"/></label></div>
								<div class="col-lg-6">
								 <fmt:formatNumber var="subTotal" type="number" groupingUsed="false" minFractionDigits="2" maxFractionDigits="2" value="${billDetails.subTotal}"/>
								
								<input type="text" class="form-control"  style=" width:140% !important;" name="subTotal" readonly value="${subTotal}"/>
								</div>
                         </div>
                         <div class="col-lg-3" style="padding-left: 0px;width:26% !important">
                            <div class=" col-lg-6" style="text-align: left;white-space:nowrap;"><label  style="white-space:nowrap ;padding-right: 10px;/* display: block;white-space:nowrap;text-align:start;overflow: auto;overflow-x: hidden;element-sizing: fixed | relative;text-sizing: fixed | relative; position: fixed;  position: absolute; */"><spring:message code="total.bill.value.label"/></label ></div>
								
								<div class="col-lg-6">
						
						<c:choose>
								<c:when test="${billDetails.totalDiscount != 'null'}">
								<%-- <c:set var="totaldisc" value="${billDetails.totalDiscount}"/> --%>
								 <fmt:formatNumber  var="totaldisc" groupingUsed="false" type="number" minFractionDigits="2" maxFractionDigits="2" value="${billDetails.totalDiscount}"/>
								</c:when>
									<c:otherwise>
								<c:set var="totaldisc" value="0"/>
								
								</c:otherwise>
								</c:choose>
						
						
								<input type="text" class="form-control" style=" width : 120% !important;padding-right: 0px;" name="totalPrice" readonly value="${billDetails.totalPrice+totaldisc}"/>
								</div>
								</div>
								</div>
								
								<div class="row">
								
								
								<div class="col-lg-3" style="padding-left: 0px;">
                           
                          
								<div class=" col-lg-6 " style="text-align: left; white-space:nowrap;"><label class="control-label " ><spring:message code="other.discounts.label"/></label></div>
								<div class="form-group col-lg-6">
								<input type="text" class="form-control" style=" padding-right: 0px;width:120% !important;" name="discount" readonly value="${billDetails.otherDisc}"/>
								</div>
						</div>
							
							
							 <div class="col-lg-3" style="padding-left: 0px;width:28% !important">
							         <div class="form-group form-inline col-lg-7" style="white-space:nowrap; display: inline-block;"><label ><spring:message code="return.or.exchanges.label"/></label></div>
								<div class="form-group col-lg-5 ">
								<input type="text" class="form-control" style=" width:140% !important; padding-right: 0px;margin-right:0px;width:120%;" style="margin-right:1%; padding-right: 0px;" name="returnOrExchange" readonly value="${billDetails.returnorExchangeAmt}"/>
								</div>
                           
                           </div>
                     
                           <div class="col-lg-3" style="padding-left: 0px;width:21% !important">
                           <div class=" col-lg-6 " style="text-align: left; padding-LEFT: 17%;white-space:nowrap;"><label ><spring:message code="cgst.sgst.label"/></label></div>
								<div class="col-lg-6">
								 <fmt:formatNumber groupingUsed="false" var="cgstsgst" type="number" minFractionDigits="2" maxFractionDigits="2" value="${totalTaxValue}"/>
								<input type="text" class="form-control"  style=" padding-right: 0px;width:140% !important;" name="Cgsg" readonly value="${cgstsgst}"/>
								</div>
                         </div>
                         <div class="col-lg-3" style="padding-left: 0px;width:26% !important">
                            <div class=" col-lg-6" style="text-align: left;"><label  style="white-space:nowrap ;padding-right: 10px;"><spring:message code="total.deductions.label"/></label ></div>
								
								<div class="col-lg-6">
						
						
						<c:choose>
								<c:when test="${billDetails.totalDiscount != 'null'}">
								<c:set var="td" value="${billDetails.totalDiscount}"/>
								
								</c:when>
									<c:otherwise>
								<c:set var="td" value="0"/>
								
								</c:otherwise>
								
								</c:choose>
									<c:choose>
								<c:when test="${billDetails.otherDisc != 'null'}">
								<c:set var="bo" value="${billDetails.otherDisc}"/>
								
								</c:when>
									<c:otherwise>
								<c:set var="bo" value="0"/>
								
								</c:otherwise>
								</c:choose>
						
						
						
						
								<input type="text" class="form-control" style=" width:120%; padding-right: 0px;" name="deductions" readonly value="${0.0 + td}"/>
								</div>
								</div>
								
								
								</div>
								
								
							
                           </div>
                           <div class="col-lg-2"></div>
                           	<div class="col-lg-10"style="background-color: 	#606060;">
								<div class="col-lg-10 netAmountStyle" style="text-align: center;">
								 <font color="white"> <label><b><spring:message code="net.bill.amount.label" /></b></label></font>
								</div>
								<div class="col-lg-2 netAmount" >
								<fmt:formatNumber var="priceTotal" groupingUsed="false" type="number" minFractionDigits="2" maxFractionDigits="2" value="${billDetails.billAmount}"/>
								
								<input type="text" readonly="readonly"  style=" padding-right: 0px;background-color: white; text-align: center;   font: -webkit-pictograph;  font-size: 16px;    width: 110px; height: 30px;" class="form-control" id="totalCost" name="totalCost"  value="${priceTotal}" />

								</div>
								</div>
		
                           </div>
                           
                          
                          </div>
                           
                           
                      
                           
        		 <div id="triggerEvent"></div>
   <div class="modal fade" id="myModalIos" role="dialog" tabindex="-1">
    <div class="modal-dialog iosmodeldialog">
    
      <!-- Modal content-->
      <div class="modal-content iospopup" style="    width: 50%!important;">
        <div class="modal-header" style="    padding: 10px;font-size: 20px;">
       Deal / Offer Name
          <button type="button" class="close" onclick="" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body" style="    padding: 10px;font-size: 20px;">
        <div id="offername"></div>
        </div>
        <br/>
     
      </div>
      
		</div>
		</div>
            
                              
                              
                              
                              
                              <div class="modal fade" id="myModalcancel" role="dialog" tabindex="-1">
    <div class="modal-dialogwidth iosmodeldialog">
    
      <!-- Modal content-->
      <div class="modal-content iospopup">
        <div class="modal-header">
       
          <button type="button" class="close" onclick="" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
       <div class="form-group col-lg-12" style="padding: 0px;font-size: 15px">Do you want to Update the  bill,this operation can not be reverted back ?
       
          <!-- <div class="col-lg-1"> -->
          <input type="hidden" id="stockdownloadurl" value="${downloadurl}">
        <!--  </div> -->
         </div>
        <div class="form-group col-lg-12"></div>
          <div class="col-lg-2 col-sm-6 col-xs-6" style=""></div>
          <div class="form-group col-lg-8 col-sm-6 col-xs-6" style="padding-left: 0px; padding-right: 0px;">
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
 <input type="button" class="iosclosebutton1" onclick="CancelBillid('${billId }','','','edit');"  value="Ok">
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
                              
                              
                              
                              
                              
                              
                                   <%--  
                                    
                                    
                                    
						 <div class="row">
                               <div class="form-group col-lg-8"></div>   
                                <div class="form-group col-lg-2" style="text-align: left;"> <label><spring:message code="gift.voucher.coupon.label" /></label></div>
                              <div class="form-group col-lg-2">
                                      <input type="text" class="form-control" name="shipmentCharges" readonly value="${billDetails.voucherDiscounts}"/>
                               </div>
                        </div> 
                         <div class="row">
                               <div class="form-group col-lg-8"></div>   
                                <div class="form-group col-lg-2" style="text-align: left;"> <label><spring:message code="deals.or.offers.label" /></label></div>
                              <div class="form-group col-lg-2">
                                      <input type="text" class="form-control" name="shipmentCharges" readonly value="${billDetails.totalDiscount}"/>
                               </div>
                        </div>
                         <div class="row">
                               <div class="form-group col-lg-8"></div>   
                                <div class="form-group col-lg-2" style="text-align: left;"> <label><spring:message code="sub.total.label" /></label></div>
                              <div class="form-group col-lg-2">
                                      <input type="text" class="form-control" name="shipmentCharges" readonly value="${billDetails.subTotal}"/>
                               </div>
                        </div>
                         <div class="row">
                               <div class="form-group col-lg-8"></div>   
                                <div class="form-group col-lg-2" style="text-align: left;"> <label><spring:message code="tax.label" /></label></div>
                              <div class="form-group col-lg-2">
                                      <input type="text" class="form-control" name="shipmentCharges" readonly value="${billDetails.tax}"/>
                               </div>
                        </div>
                         <div class="row">
                               <div class="form-group col-lg-8"></div>   
                                <div class="form-group col-lg-2" style="text-align: left;"> <label><spring:message code="total_bill.label" /></label></div>
                              <div class="form-group col-lg-2">
                                      <input type="text" class="form-control" name="shipmentCharges" readonly value="${billDetails.totalPrice}"/>
                               </div>
                        </div>
                         <div class="row">
                               <div class="form-group col-lg-8"></div>   
                                <div class="form-group col-lg-2" style="text-align: left;"> <label><spring:message code="other.discounts.label" /></label></div>
                              <div class="form-group col-lg-2">
                                      <input type="text" class="form-control" name="shipmentCharges" readonly value="${billDetails.otherDisc}"/>
                               </div>
                        </div>
                         <div class="row">
                               <div class="form-group col-lg-8"></div>   
                                <div class="form-group col-lg-2" style="text-align: left;"> <label><spring:message code="bill.due.label" /></label></div>
                              <div class="form-group col-lg-2">
                                      <input type="text" class="form-control" name="shipmentCharges" readonly value="${billDetails.dueAmount}"/>
                               </div>
                        </div> --%>
						<%-- <c:forEach var="billing" items="${billDetails.billing}"> --%>
						<br>
						<div class="row" style="text-align: right;">
							<c:if test="${flow != 'billSummary' }">
                        		<div class="col-lg-1" style="float:right">
                        		<input type="button" class=" addBtn btn bg-olive btn-inline" style="margin-left:1%;margin-right: 1.4%;;position: relative;" onclick="viewBills('outletBilling','0','menu','${flow}');" value="<spring:message code="back.label" />" />
                       		</div>
                       		</c:if>
                       		
                       		<c:if test="${flow != 'billSummary' }">
                       		<div class="col-lg-1" style="float:right">
                        		<input type="button"   class=" addBtn btn bg-olive btn-inline" data-toggle="modal" data-target="#myModalcancel" style="margin-left:1%;margin-right: 1.4%;position: relative;" <%-- onclick="CancelBillid('${billId }','','');" --%> value="<spring:message code="submit.label" />" />
                       		</div>
                        	<%-- 	<div class="col-lg-1" style="float:right">
                        		<input type="button" class=" addBtn btn bg-olive btn-inline" style="margin-left:1%;margin-right: 1.4%;margin-top:7px;position: relative;" onclick="CancelBillid('${billId }','','');" value="<spring:message code="submit.label" />" />
                       		</div> --%>
                       		</c:if>
                       		<c:if test="${flow == 'billSummary' }">
                        	<div class="col-lg-1" style="float:right">
                        		<input type="button" class="addBtn btn bg-olive btn-inline" style="margin-left:1%;margin-right: 1.4%;position: relative;" onclick="return viewBillSummary('${billDetails.business_date}','0','${criteria}','false');" value="<spring:message code="back.label" />" />
                       		</div>
                       		</c:if>
						</div>
						<%-- </c:forEach> --%>
						</div><!-- /.box-body -->
						<br/>
						 <!--  <input type="hidden" id="billStatus" value=${status}> -->
                                    <div class="box-footer">
                                     <!--    <button type="submit" class="btn btn-primary">Submit</button> -->
                                    </div>
                                  <input type="hidden" id="billStatus" value="${status}"> 
                                </form>
                            </div>

</div>
</div>
</section><!-- /.content -->

    
</body>
</html>
		    		 