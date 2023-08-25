<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah
 * file name		        : inventorymanager/Billing/returnedDetails.jsp
 * file type		        : JSP
 * description				: display specific bill items
 * */ -->


<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> --%>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
						
						<div class="box-header" style="text-align: center">
                                <h3>${billId } <spring:message code="returned.item.label" /></h3>
                                </div>
					</div><!-- /.box-header -->
					
                                <!-- form start -->
                                <form>
                               
                                    <div class="box-body">
                                    	<div class="row" style="text-align: right; margin-top: -65px;">
                                    		<c:if test="${flow != 'billSummary' }">
	                                    		<input type="button" class="btn bg-olive btn-inline" style="margin-left:2%;margin-right: 2%;position: relative;" onclick="viewBills('','0');" value="<spring:message code="back.label" />" />
                                    		</c:if>
                                    		<c:if test="${flow == 'billSummary' }">
	                                    		<input type="button" class="btn bg-olive btn-inline" style="margin-left:2%;margin-right: 2%;position: relative;" onclick="return viewSalesReportsCriteriaWise('','${criteria}')" value="<spring:message code="back.label" />" />
                                    		</c:if>
                                    		<hr style="margin-top: 4px;width: 99%;" />
                                    	</div>
                                     <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                                      <%-- <c:forEach var="billing" items="${billDetails.billing}"> --%>
                                    <div class="row">
                                    
                                    <div class="form-group col-lg-3">
                                            <label><spring:message code="store_location.laber" /></label>
                                            <%-- <input type="text" id="outletLocation" class="form-control" readonly value="${billDetails.store_location}"/> --%>
                                            <input type="text" class="form-control" readonly value="${billDetails.store_location}"/>
                                     </div>
                                        <div class="form-group col-lg-3">
                                            <label><spring:message code="bill.date.label" /> </label>
                                            <input type="text" class="form-control" readonly value="${billDetails.business_date}"/>
                                        </div>
                                        <div class="form-group col-lg-3">
                                        	<label><spring:message code="bill.done.by.label" /> </label>
                                            <input type="text" class="form-control" readonly value="${billDetails.cashierId}"/>
                                        </div>
                                       <%--  <div class="form-group col-lg-3">
                                         <label><spring:message code="billing_counter_id.label" /></label>
                                            <input type="text" class="form-control" readonly value="${billDetails.counterId}"/>
                                        </div> --%>
                                        
                                        
                                        <div class="form-group col-lg-2">
                                         <label><spring:message code="billing_counter_id.label" /></label>
                                            <input type="text" class="form-control" readonly id="counterIdedit"  value="${billDetails.counterId}"/>
                                      
                                       <label><spring:message code="billing_status.label" /> </label>
                                           
                                           <select class="form-control"  id="billStatus1" >
                                           <c:if test="${billDetails.status!='TA-Cancelled'}">
											 <option value=" ${billDetails.status}">${billDetails.status}</option></c:if>
												 <option value="TA-Cancelled" ${billDetails.status == 'TA-Cancelled' ? 'selected' : ''}>TA-Cancelled</option>
												
		                                  		  	</select>
		                                  		  	
		                                  		  	<input type="hidden" value="${billDetails.status}" id="billingStatus"/>
                                   
                                        </div>
                                        
                                        
                                        </div>
                                          
                                    <div class="row">
                                        <div class="form-group col-lg-3">
                                            <label><spring:message code="customerName.label" /></label>
                                            <input type="text" class="form-control" readonly value="${billDetails.customerName}"/>
                                        </div>
                                        
                                        <div class="form-group col-lg-3">
                                        	<label><spring:message code="customer.mobile.label" /></label>
                                            <input type="text" class="form-control" readonly value="${billDetails.phoneNumber}"/>
                                        </div>
                                        
                                        <div class="form-group col-lg-3">
                                        <label><spring:message code="order_type.label" /></label>
                                            <input type="text" class="form-control" readonly value="${billDetails.deliveryType} "/>
                                        </div>
                                        
                                         <div class="form-group col-lg-3">
                                             <label><spring:message code="billing_status.label" /> </label>
                                            <input type="text" class="form-control" readonly value="${billDetails.status}"/>
                                        </div>
                                     </div>
                                     
                                 <%--     </c:forEach> --%>
                                     
                                      <div class="table-responsive">
                                        <table id="returnedList" class="table table-bordered table-hover">
                                          <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><spring:message code="billing.sno.label"/></th>
                                            	<th><spring:message code="skuid.label"/></th>
                                                <th><spring:message code="item_name.label"/></th>
                                                 <th><spring:message code="price.label"/></th>
                                                <th><spring:message code="order_quantity.label"/></th>
                                                <th><spring:message code="total_bill.label"/></th>
                                           </tr>
                                          </thead>
                                          <tbody style="text-align: center;">
						                       <c:forEach var="items" items="${billDetails.billReturnItems}" varStatus="theCount">
							             		   <tr>
								             		   <td>${theCount.count}</td>
								              			<td>${items.sku_id}</td>
								                  		<td>${items.item_name}</td>
								                  		<td>${items.price}</td>
								                  		<td>${items.quantity}</td>
								                  		<td>${items.cost}</td>
							                  	   </tr>
						              		   </c:forEach> 
		 								</tbody>
                                       </table>
                                    </div>
                                   <!--  </div> -->
                                    <br/>
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
                        </div>
						<%-- <c:forEach var="billing" items="${billDetails.billing}"> --%>
						<div class="row" style="text-align: right;">
							<c:if test="${flow != 'billSummary' }">
                        		<input type="button" class="btn bg-olive btn-inline" style="margin-left:1%;margin-right: 2%;position: relative;" onclick="viewBills('','0');" value="<spring:message code="back.label" />" />
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

</div>
</div>
</section><!-- /.content -->

      
</body>
</html>
		    		 