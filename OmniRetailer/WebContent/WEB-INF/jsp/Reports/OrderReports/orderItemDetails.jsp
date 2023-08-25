<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah
 * file name		        : inventorymanager/Billing/itemdetails.jsp
 * file type		        : JSP
 * description				: display specific bill items
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/goodstransfer.js"></script>
<style>
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
						
						<div class="box-header" style="text-align: center">
                                <h3>${cartList[0].cartId} <spring:message code="item.label" />  <spring:message code="details.label" /></h3>
                                </div>
					</div><!-- /.box-header -->
					
                                <!-- form start -->
                                <form class="">
                               
                                    <div class="box-body">
                                  <div class="row" style="text-align: right; margin-top: -65px;">
                                  
                                  <div class="col-lg-1" style="float:right">
	                                    <input type="button" class="addBtn btn bg-olive btn-inline" style="margin-left:2%;margin-right: 1.2%;position: relative;" onclick="viewPendingCartsReports('0','','pendingCartReport')" value="<spring:message code="back.label" />" />
                                   </div>
                                   <hr style="margin-top: 4px;width: 99%;" />
                                    	</div>
                                     <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                                 
                                    <div class="row" style="display: none;">
                                    
                                    <div class="form-group col-lg-3">
                                            <label><spring:message code="store_location.laber" /></label>
                                           <%--  <input type="text" id="outletLocation" class="form-control" readonly value="${billDetails.store_location}"/> --%>
                                            <input type="text" class="form-control" id="location" readonly value="${billDetails.store_location}"/>
                                            
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
                                            <input type="text" class="form-control" id="counterId" readonly value="${billDetails.counterId}"/>
                                     
                                      <label><spring:message code="billing_status.label" /> </label>
                                            <input type="text" class="form-control" readonly value="${billDetails.status}"/>
                                        </div>
                                        
                                      <div class="form-group col-lg-3">
                                   	  	   <label><spring:message code="remarks.label" /></label>
		                                        <textarea class="form-control" disabled style="resize:none;height:81px" rows="3" name="remarks" id="remarks" >${billDetails.comments}</textarea>
                                   	   </div>       
                                        
                                        </div>
                                          
                                    <%-- <div class="row">
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
                                                <th><spring:message code="item_name.label"/></th>
                                            	<th>Item Price</th>
                                            	<th>Quantity</th>
                                            	<th>Discount</th>
                                            	<th>tax</th>
                                            	<th>Total Price</th>
                                           </tr>
                                          </thead>
                                          <tbody style="text-align: center;">
                                          
                       <c:forEach var="items" items="${cartList[0].itemsList}" varStatus="theCount">
             		   <tr>
             		    <td>${theCount.count}</td>
              			<td>${items.skuId}</td>
                  		<td>${items.itemName}</td>
                  		<td>${items.itemPrice}</td>
                  		<td>${items.quantity}</td>
                  		<td>${items.discountPrice}</td>
                  		<td>${items.tax}</td>
                  		<td>${items.totalPrice}</td>
                  	
                  	
                  	   </tr>
              		   </c:forEach> 
		 </tbody>
                                       </table>
                                    </div>
                                   
                                    <br/> 
                                    
                         
<div>
                           <div class="row" style="padding-right: 15px;">
                           <div class="col-lg-2" style="display: none;">
                           </div>
                           <div class="col-lg-10" style="padding-right: 8px;    padding-left: 8px;    padding-top: 10px;  border-width:1px;  border-style: solid;border-color:	#D0D0D0; background-color: 	#F2F2F2;display:none;">
                          
                 		<div class="row">
                 		
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
								<c:set var="totaldisc" value="${billDetails.totalDiscount}"/>
								
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
								 <fmt:formatNumber var="cgstsgst" type="number" groupingUsed="false" minFractionDigits="2" maxFractionDigits="2" value="${totalTaxValue}"/>
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
                         <%-- <div class="col-lg-3" style="padding-left: 0px;width:26% !important">
                            <div class=" col-lg-6" style="text-align: left;"><label  style="white-space:nowrap ;padding-right: 10px;"><spring:message code="total.deductions.label"/></label ></div>
								
								<div class="col-lg-6">
						
								<input type="text" class="form-control" style=" width:120%; padding-right: 0px;" name="deductions" readonly value="${0.0+billDetails.totalDiscount+billDetails.otherDisc}"/>
								</div>
								</div> --%>
								
								
								</div>
								
								
							
                           </div>
                           <div class="col-lg-2"></div>
                           	<div class="col-lg-10"style="background-color: 	#606060;">
								<div class="col-lg-10 netAmountStyle" style="text-align: center;">
								 <font color="white"> <label><b>Net Order Amount</b></label></font>
								</div>
								<div class="col-lg-2 netAmount" >
								<fmt:formatNumber var="priceTotal" groupingUsed="false" type="number" minFractionDigits="2" maxFractionDigits="2" value="${cartList[0].totalCost}"/>
								
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
            
                              
                              
                         
						<br>
						<div class="row" style="text-align: right;">
							<div class="col-lg-1" style="float:right">
                        		<input type="button" class=" addBtn btn bg-olive btn-inline" style="margin-left:1%;margin-right: 1.4%;margin-top:7px;position: relative;" onclick="viewPendingCartsReports('0','','pendingCartReport')" value="<spring:message code="back.label" />" />
                       		</div>
						</div>
						
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
		    		 