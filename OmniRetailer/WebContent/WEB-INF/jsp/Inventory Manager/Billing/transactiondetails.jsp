<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah
 * file name		        : inventorymanager/Billing/transactiondetails.jsp
 * file type		        : JSP
 * description				: display specific billing transactions
 * */ -->


<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> --%>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
  .odd{display:none!important;}
</style>
<script>
$(document).ready(function(){
	checkforTotals();
var cardNo="";

if($(".cardPay").length > 0)
 {
	cardNo = $(".cardPay").html().replace(/\d(?=\d{4})/g, "*");
	$(".cardPay").html(cardNo);
 }
 

});

function changeToBillId(id)
{
	debugger;
	var mode = $('.modeOfPayment'+id).val();
	var cardNo ="";
	
	if(mode.toLowerCase() == 'cash'){
		$('#cardPayment'+id).html("");
	
	}
	else if(mode.toLowerCase() == 'credits')
		{
		var cardId ="";
		if($('#cardInfo'+id).length > 0)
			cardId =$('#cardInfo'+id).val()
		$('#cardPayment'+id).html(cardId);
		
		}
	
	
	else if(mode.toLowerCase() == 'Credit Note')
	{
		var cardId ="";
		if($('#cardInfo'+id).length > 0)
			cardId =$('#cardInfo'+id).val()
		$('#cardPayment'+id).html(cardId);
		
		}
	else if(mode.toLowerCase() == 'card'){
		$('#cardPayment'+id).html($('#cardInfo'+id).val());
		if($('.cardPayment'+id).length>0)
		cardNo = $('.cardPayment'+id).html().replace(/\d(?=\d{4})/g, "*");
		else
		$('#cardPayment'+id).html(cardNo);
	
	}
	else
	{
		
		$('#cardPayment'+id).html("");
	}
}


function changeMOPtoTenderName(id,mode) {
	debugger
	var mop = $('#modeOfPayment'+id).val();
	if(mop != "" && mop != null){
		mop = mop.split("-");
		$('#tenderMode'+id).html(mop[1]);
	}
}


</script>


</head>
<body>
<!-- Content Header (Page header) -->

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
				<div class="box box-primary">
                               <div class="box-header">
					<%-- 	<c:if test="${billcontent == 'billItems'}">
							<h3 class="box-title">
								<spring:message code="billing_items.label" />
							</h3>
						</c:if>
						<c:if test="${billcontent == 'billTransactions'}">
							<h3 class="box-title">
								<spring:message code="billing_transactions.label" />
							</h3>
						</c:if> --%>
						  <div id="Errortrans" style="text-align:center;color:red;font-weight:bold;"></div>
						<div class="box-header" style="text-align: center">
                                <h3>${billId } <spring:message code="transaction.label" />  <spring:message code="details.label" /></h3>
                                </div>
					</div><!-- /.box-header -->
					
                                <!-- form start -->
                                <form>
                               
                                    <div class="box-body">
                                    	<div class="row" style="text-align: right; margin-top: -65px;">
                                    		<c:if test="${flow != 'billSummary' }">
                                    			
	                                    		<div class="col-lg-1" style="float:right">
	                                    		<input type="button" class="addBtn btn bg-olive btn-inline" style="margin-left:2%;margin-right: 2%;position: relative;" onclick="viewBills('outletBilling','0','menu','${flow}');" value="<spring:message code="back.label" />" />
                                    		</div>
                                    		 <c:if test="${status != 'Pending' && type!='view' && status != 'Returned'}">
                                    		<div class="col-lg-1" style="float:right">
	                                    	<input type="button"   class="addBtn btn bg-olive btn-inline" data-toggle="modal" data-target="#myModalUpdateTransaction" style="margin-left:1%;margin-right: 1.4%;position: relative;" <%-- onclick="CancelBillid('${billId }','','');" --%> value="<spring:message code="submit.label" />" />
	                                    	</div>
	                                    	</c:if>
                                    		</c:if>
                                    		<c:if test="${flow == 'billSummary' }">
	                                    		<input type="button" class="btn bg-olive btn-inline" style="margin-left:2%;margin-right: 2%;position: relative;" onclick="return viewSalesReportsCriteriaWise('','${criteria}')" value="<spring:message code="back.label" />" />
                                    		</c:if>
                                    		<hr style="margin-top: 4px;width: 99%;" />
                                    	</div>
                                     <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                                     <div id="success" style="text-align:center;color:blue;font-weight:bold;">${success}</div>
                                     
                                  <%--     <c:forEach var="billing" items="${billDetails.billing}"> --%>
                                    <div class="row">
                                    
                                    <div class="form-group col-lg-3">
                                            <label><spring:message code="store_location.laber" /></label>
                                            <%-- <input type="text" id="outletLocation" class="form-control" readonly value="${billDetails.store_location}"/> --%>
											<input type="text" class="form-control" readonly value="${billDetails.store_location}"/>                                            
                                  
                                   <label><spring:message code="customerName.label" /></label>
                                            <input type="text" class="form-control" readonly value="${billDetails.customerName}"/>
                                     </div>
                                    
                                        <div class="form-group col-lg-2">
                                            <label><spring:message code="bill.date.label" /> </label>
                                            <input type="text" class="form-control" readonly value="${billDetails.business_date}"/>
                                       
                                       <label><spring:message code="customer.mobile.label" /></label>
                                            <input type="text" class="form-control" readonly value="${billDetails.phoneNumber}"/>
                                       
                                        </div>
                                      
                                        <div class="form-group col-lg-2">
                                        	<label><spring:message code="bill.done.by.label" /> </label>
                                            <input type="text" class="form-control" readonly value="${billDetails.cashierId}"/>
                                       
                                       <label><spring:message code="order_type.label" /></label>
                                            <input type="text" class="form-control" readonly value="${billDetails.deliveryType} "/>
                                        </div>
                                     
                                        <div class="form-group col-lg-2">
                                         <label><spring:message code="billing_counter_id.label" /></label>
                                            <input type="text" class="form-control" readonly value="${billDetails.counterId}"/>
                                      
                                       <label><spring:message code="billing_status.label" /> </label>
                                            <input type="text" style="background-color: rgba(112, 226, 25, 0.84);" class="form-control" readonly value="${billDetails.status}"/>
                                      
                                        </div>
                                        
                                         <div class="form-group col-lg-3">
                                   	  	   <label><spring:message code="remarks.label" /></label>
		                                        <textarea class="form-control" disabled style="resize:none;height:80px" rows="3" name="remarks" id="remarks"  >${billDetails.comments}</textarea>
									 		
                                   	  </div>
                                        
                                        
                                        </div>
                                          
                                   <%--  <div class="row">
                                        <div class="form-group col-lg-2">
                                            <label><spring:message code="customerName.label" /></label>
                                            <input type="text" class="form-control" readonly value="${billDetails.customerName}"/>
                                        </div>
                                        <div class="form-group col-lg-1"></div>
                                        <div class="form-group col-lg-2">
                                        	<label><spring:message code="customer.mobile.label" /></label>
                                            <input type="text" class="form-control" readonly value="${billDetails.phoneNumber}"/>
                                        </div>
                                        <div class="form-group col-lg-1"></div>
                                        <div class="form-group col-lg-1"></div>
                                        <div class="form-group col-lg-2">
                                        <label><spring:message code="order_type.label" /></label>
                                            <input type="text" class="form-control" readonly value="${billDetails.deliveryType} "/>
                                        </div>
                                         <div class="form-group col-lg-1"></div>
                                         <div class="form-group col-lg-2">
                                             <label><spring:message code="billing_status.label" /> </label>
                                            <input type="text" style="background-color: rgba(112, 226, 25, 0.84);" class="form-control" readonly value="${billDetails.status}"/>
                                        </div>
                                     </div> --%>
                                      
                                      
                                    <%-- <c:forEach var="items" items="${billDetails.billingTransactions}" varStatus="theCount">
                                      <div class="row">
                                        <div class="form-group col-lg-3">
                                            <label><spring:message code="cardNumber.label" /></label>
                                            <input type="text" class="form-control" readonly value="${items.cardInfo}"/>
                                        </div>
                                        
                                        <div class="form-group col-lg-3">
                                        	<label></label>
                                            <input type="text" class="form-control" readonly value="${items.approvalCode}"/>
                                        </div>
                                        
                                       
                                     </div>
                                     </c:forEach>  --%>
                                     <%-- </c:forEach> --%>
                                     
                                      <div class="table-responsive" style="overflow: auto;">
                                        <table id="transactionList" class="table table-bordered table-hover">
                                          <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><spring:message code="billing.sno.label"/></th>
                                            	<th><spring:message code="transaction_id.label"/></th>
                                                <th><spring:message code="date.label"/></th>
                                                <th><spring:message code="payment_mode.label"/></th>
                                                <th><spring:message code="tender_mode.label"/></th>
                                                <th><spring:message code="card_type.label"/></th>
                                               <th><spring:message code="card_number.label"/>&nbsp/&nbsp<spring:message code="gift.voucher.code.label"/>&nbsp/&nbsp<spring:message code="bill.id.label"/></th>
                                                <th><spring:message code="approvecode.label" /></th>
                                                <th><spring:message code="paid_amount.label"/></th>
                                                
                                                <c:if test="${billDetails.status == 'DD-CB-Open' || billDetails.status =='TA-CB-Open'}">
                                                <c:if test="${fn:length(billDetails.billingTransactions) == 0}">
                                                <th><input type="button" class="addBtn btn bg-olive btn-inline" style="padding: 0px 4px;" onclick="addTransactionDetails('${billId}','${flow}');" value="+" /></th>
                                                </c:if>
                                                </c:if>
                                                
                                                </tr>
                                          </thead>
                                          <c:set var="countValue" value="0"></c:set>
                                          <tbody style="text-align: center;">
						                       <c:forEach var="transactions" items="${billDetails.billingTransactions}" varStatus="theCount">
							             		  <c:set var="countValuetender" value="0"></c:set>
							             		   <tr id='dynamicdiv${theCount.count}'>
								             		   	<td class="slno${theCount.count}">${theCount.count}</td>
								              			<td class="transaction" id="transaction${theCount.index + 1}">${transactions.transactionId}</td>
								                  		<td>${transactions.dateTime}</td>
								                  		<c:choose>
								                  		<c:when test="${type == 'edit'}">
								                  		<%-- <td><select class="form-control  modeOfPayment${theCount.index + 1}"  id="modeOfPayment${theCount.count}" onchange="changeToBillId('${theCount.count}');")>
								                  		 <c:forEach var="tender" items="${tenderDetails}" >
								                  		 <option value="${tender.modeOfPayment}" ${fn:containsIgnoreCase(tender.modeOfPayment, transactions.modeOfPayment) ? 'selected' : ''}>${tender.tenderName}</option>
								                  		 </c:forEach>
								                  		<option value="Card" ${'Card' == transactions.modeOfPayment ? 'selected' : ''}>Card</option>
								                  		<option value="Cash" ${'Cash' == transactions.modeOfPayment ? 'selected' : ''}>Cash</option>
								                  		<option value="Jio Money" ${'Jio Money' == transactions.modeOfPayment ? 'selected' : ''}>Jio Money</option>
								                  		<option value="Mall Coupon" ${'Mall Coupon' == transactions.modeOfPayment ? 'selected' : ''}>Mall Coupon</option>
								                  		<option value="Credits" ${'Credits' == transactions.modeOfPayment ? 'selected' : ''}>Credits</option>
								                  		<option value="Sodexo" ${'Sodexo' == transactions.modeOfPayment ? 'selected' : ''}>Sodexo</option>
								                  		<option value="Ticket" ${'Ticket' == transactions.modeOfPayment ? 'selected' : ''}>Ticket</option>
								                  		<option value="Credit Note" ${'Credit Note' == transactions.modeOfPayment ? 'selected' : ''}>Credit Note</option>
								                  		
								                  		</select>
																</td> --%>
																
														 <td><select class="form-control  modeOfPayment${theCount.index + 1}"  id="modeOfPayment${theCount.count}" onchange="changeToBillId('${theCount.count}');changeMOPtoTenderName('${theCount.count}');">
								                  		 <c:forEach var="tender" items="${tenderDetails}">
								                  		 <c:choose>
								                  		 <c:when test="${tender.modeOfPayment == transactions.modeOfPayment}">
								                  		   <c:set var="countValuetender" value="${countValuetender+1}"></c:set>
								                  		  </c:when>
								                  		  </c:choose>
								                  		 </c:forEach>
								                  		 
								                  		 <c:if test="${countValuetender != '0'}">
								                  		 <c:forEach var="tender" items="${tenderDetails}">
								                  		 <option value="${tender.modeOfPayment}-${tender.tenderCode}" ${transactions.modeOfPayment == tender.modeOfPayment ? 'selected' : ''}>${tender.modeOfPayment}</option>
								                  		 </c:forEach>
								                  		 </c:if>
								                  		 <c:if test="${countValuetender == '0'}">
								                  		 <option value="${transactions.modeOfPayment}" selected>${transactions.modeOfPayment}</option>
								                  		<%--  <c:forEach var="tender" items="${tenderDetails}">
								                  		 <option value="${tender.modeOfPayment}-${tender.tenderCode}">${tender.modeOfPayment}</option>
								                  		 </c:forEach> --%>
								                  		 </c:if>
								                  		
								                  		</select>
																</td>
																
																</c:when>
																<c:otherwise>
																<td  class="modeOfPayment">${transactions.modeOfPayment}</td>
																</c:otherwise>
																
																</c:choose>
														<td id="tenderMode${theCount.count}">${transactions.tenderMode}</td>
								                  		<td>${transactions.cardType}</td>
								                  		
								                  		<c:choose>
								                  		
								                  		<c:when test="${transactions.modeOfPayment == 'Credit Note'}">
								                  		<td id="cardPayment${theCount.count}">${transactions.couponNumber}</td>
								                  		</c:when>
								                  		<c:when test="${transactions.modeOfPayment == 'Credits'}">
								                  		<td id="cardPayment${theCount.count}">${transactions.couponNumber}</td>
								                  		</c:when>
								                  		
								                  		<c:when test="${transactions.modeOfPayment == 'Card'}">
								                  		<td class="cardPay cardPayment${theCount.count}" id="cardPayment${theCount.count}">${transactions.cardInfo}</td>
								                  		</c:when>
													
														<c:when test="${transactions.modeOfPayment == 'Cash'}">
								                  		<td id="cardPayment${theCount.count}"></td>
								                  		</c:when> 
								                  		<c:otherwise><td>
								                  		</td>
								                  		</c:otherwise>
								                  		</c:choose>
								                  		
								                  		<td>${transactions.approvalCode}</td>
								                  		<%-- <td>${transactions.paidAmount}</td> --%>
								                  		
								                  		<td  id="paidAmount${theCount.index + 1}" class="paidAmount${theCount.index + 1}" contenteditable='true' onblur="checkforTotals();">${transactions.paidAmount}</td>
								                  		
								                  		<c:set var ="countValue" value ="${countValue+1}"/>
								                  		<c:if test="${billDetails.status == 'DD-CB-Open' || billDetails.status =='TA-CB-Open'}">
								                  		<c:if test="${fn:length(billDetails.billingTransactions) == 0}">
								                  		<td></td>
								                  		</c:if>
								                  		</c:if>
							                  		</tr> 
							                  		
							                  		
							                  		<input type="hidden" value="${transactions.modeOfPayment}" id="paymentMode${theCount.index + 1}"/>
							                  		<input type="hidden" value="${transactions.billId}" id="paymentbillId${theCount.index + 1}"/>
							                  		
							                  		
							                  			<c:choose>
								                  		
								                  		<c:when test="${transactions.modeOfPayment == 'Credit Note'}">
															<input type="hidden" value="${transactions.couponNumber}" id="cardInfo${theCount.count}"/>
								                  		</c:when>
								                  		<c:when test="${transactions.modeOfPayment == 'Credits'}">
															<input type="hidden" value="${transactions.couponNumber}" id="cardInfo${theCount.count}"/>
								                  		
								                  		</c:when>
								                  		
								                  		<c:when test="${transactions.modeOfPayment == 'Card'}">
								                  		
															<input type="hidden" value="${transactions.cardInfo}" id="cardInfo${theCount.count}"/>
								                  		</c:when>
													
														<c:when test="${transactions.modeOfPayment == 'Cash'}">
															<input type="hidden" value="${transactions.billId}" id="cardInfo${theCount.count}"/>
								                  		</c:when> 
								                  		<c:otherwise><td>
								                  		</td>
								                  		</c:otherwise>
								                  		</c:choose>
							                  		
							                  		
<%-- 							                  		<td id="cardPayment${theCount.count}">${transactions.cardInfo}</td> --%>
						              		   </c:forEach> 
										 </tbody>
                                       </table>
                                    </div>
                                    <br/>
                                     <input type="hidden" id="tableRowCount" value="${countValue}"/>
				 <div class="row">
                               <div class="form-group col-lg-9"></div>   
                                 <div class="form-group col-lg-3">
                                  <div class="form-group col-lg-6" style="text-align: left;  white-space:nowrap;  "> <label><spring:message code="net.bill.amount.label" /></label></div>
                               <div class="form-group col-lg-6" style="padding-right: 0px;">
                                      <input type="text" class="form-control" id="netAmt" name="shipmentCharges" disabled="disabled" value="${billDetails.totalPrice}"/>
                               </div>
                        </div> 
                        
                        </div>
                         <c:forEach var="items" items="${billDetails.billingTransactions}" varStatus="theCount">
                        <c:if test="${items.modeOfPayment =='Cash' }">
                        <div class="row">
                               <div class="form-group col-lg-9"></div>   
                               <div class="form-group col-lg-3">
                                <div class="form-group col-lg-6" style="text-align: left; white-space:nowrap;"> <label><spring:message code="currencyreceived.label" /></label></div>
                              <div class="form-group col-lg-6" style="padding-right:0px">
                                      <input type="text" class="form-control" name="shipmentCharges" readonly value="${items.receivedAmountt}"/>
                               </div>
                        </div> 
                        </div>
                        <div class="row">
                               <div class="form-group col-lg-9"></div>   
                               <div class="form-group col-lg-3">
                                <div class="form-group col-lg-6" style="text-align: left; white-space:nowrap;"> <label><spring:message code="currencyreturned.label" /></label></div>
                              <div class="form-group col-lg-6" style="padding-right:0px">
                                      <input type="text" class="form-control" name="shipmentCharges" readonly value="${empty items.changeReturn ? 0.0 : items.changeReturn}"/>
                               </div>
                        </div> 
                        </div>
                        </c:if>
                        </c:forEach>
                        <div class="row">
                               <div class="form-group col-lg-9"></div>   
                               <div class="form-group col-lg-3">
                                <div class="form-group col-lg-6" style="text-align: left; white-space:nowrap;"><label><spring:message code="paymentdue.label" /></label></div>
                              <div class="form-group col-lg-6" style="padding-right:0px">
                                      <input type="text" style="background-color: rgba(241, 183, 19, 0.84);" class="form-control" id="dueAmountVal" name="shipmentCharges" readonly value="${billDetails.dueAmount}"/>
                               </div>
                        </div> 
                        </div>
                        <%--  <div class="row">
                               <div class="form-group col-lg-8"></div>   
                                <div class="form-group col-lg-2" style="text-align: left;"> <label><spring:message code="deals.or.offers.label" /></label></div>
                              <div class="form-group col-lg-2">
                                      <input type="text" class="form-control" name="shipmentCharges" readonly value="${billDetails.totalDiscount}"/>
                               </div>
                        </div> --%>
                    <%--      <div class="row">
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
				<%-- 	<c:forEach var="billing" items="${billDetails.billing}"> --%>
						<div class="row" style="text-align: right;">
							<c:if test="${flow != 'billSummary' }">
							
							<div class="col-lg-1" style="float:right">
                        		<input type="button" class="addBtn btn bg-olive btn-inline" style="margin-left:1%;margin-right: 2%;position: relative;" onclick="viewBills('outletBilling','0','menu','${flow}');" value="<spring:message code="back.label" />" />
                       		</div>
                       		 <c:if test="${status != 'Pending' && type!='view' && status != 'Returned'}">
                       		<div class="col-lg-1" style="float:right">
							  <input type="button"   class="addBtn btn bg-olive btn-inline" data-toggle="modal" data-target="#myModalUpdateTransaction" style="margin-left:1%;margin-right: 1.4%;position: relative;" <%-- onclick="CancelBillid('${billId }','','');" --%> value="<spring:message code="submit.label" />" />
							</div>
							</c:if>
                       		</c:if>
                       		<c:if test="${flow == 'billSummary' }">
                       		
                        		<input type="button" class="btn bg-olive btn-inline" style="margin-left:1%;margin-right: 2%;position: relative;" onclick="return viewSalesReportsCriteriaWise('','${criteria}')" value="<spring:message code="back.label" />" />
                       		</c:if>
						</div>
					<%-- 	</c:forEach> --%>
						</div><!-- /.box-body -->
						<br/>
                                    <div class="box-footer">
                                     <!--    <button type="submit" class="btn btn-primary">Submit</button> -->
                                    </div>
                                   <input type="hidden" id="billStatus" value=${status}>  
                                </form>
                            </div>
                            
                            
                                   <div class="modal fade" id="myModalUpdateTransaction" role="dialog" tabindex="-1">
    <div class="modal-dialogwidth iosmodeldialog">
    
      <!-- Modal content-->
      <div class="modal-content iospopup">
        <div class="modal-header">
       
          <button type="button" class="close" onclick="" data-dismiss="modal">&times;</button>
        </div>
        <div id="modal-body"class="modal-body">
       <div class="form-group col-lg-12" style="padding: 0px;font-size: 15px">Do you want to update the payment mode of the bill ?
          <!-- <div class="col-lg-1"> -->
          <input type="hidden" id="stockdownloadurl" value="${downloadurl}">
        <!--  </div> -->
         </div>
        <div class="form-group col-lg-12"></div>
          <div class="col-lg-2 col-sm-6 col-xs-6" style=""></div>
          <div class="form-group col-lg-8 col-sm-6 col-xs-6" style="padding-left: 0px; padding-right: 0px;">
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">

 <c:if test="${(billDetails.status != 'DD-CB-Open' && billDetails.status !='TA-CB-Open') || fn:length(billDetails.billingTransactions) > 0}">
 
 <input type="button" class="iosclosebutton1" onclick="updateBillTransaction('${billId}','','','edit','payTransaction');"  value="Ok">
 </c:if>
 
 <c:if test="${billDetails.status == 'DD-CB-Open' || billDetails.status =='TA-CB-Open'}">
 <c:if test="${fn:length(billDetails.billingTransactions) == 0}">
 <input type="button" class="iosclosebutton1" onclick="createBillTransaction('${billId}','','','edit','payTransaction');"  value="Ok">
 </c:if>
 </c:if>
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
                              
      
</div>
</div>


 <c:choose>
        <c:when test="${status=='all'}">
         <input type="hidden" id="billStatus" value="">
        </c:when>
        <c:otherwise>
         <input type="hidden" id="billStatus" value="${status}">
        </c:otherwise>
        </c:choose>
</section><!-- /.content -->

</body>
</html>
		    		 