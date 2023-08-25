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
	 <%--  <script type="text/javascript" src="${pageContext.request.contextPath}/js/crm/customerReferral.js"></script> --%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
	<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/Csvreader/readcsv.js"></script> --%>
   <script type="text/javascript" src="${pageContext.request.contextPath}/js/crm/signUp.js"></script>
<script type="text/javascript">

$(document).ready(function(){
// 	callCalender('from');
	callCalender('to');
		
	
	
	
	
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

            </div><!-- /.box-header -->
            
            	<h3 class="box-title" style="text-align: center">
				<spring:message code="edit.customer.signup.label" />
		</h3>
            
            <br>
            <!-- form start -->
            <form id="viewProcurementReceipt" method="post"  action="/createCustomerSignup">
                <div class="box-body">
                <input type="hidden" id="operation" value="">
                <div class="row" style="text-align: right;">
                	<input type="hidden" id="type" value="${type}">
				 	<div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 20px; margin-top: -20px">${err}</div>
	        		<div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 20px; margin-top: -20px">${success}</div>
				</div>
              
              <div class="row">
                 	<div class="form-group col-lg-9">
               	<div class="row">
               	
               		<div class="form-group col-lg-2">
                        <label>Program ID <span style="color:red; font-size:2">*</span></label>
						<input type="text" class="form-control"  id="programId" disabled value="${customerSignup.campaignId}" required />
                     	<span id="programIdError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>    
                    </div>
                    
                     <div class="form-group col-lg-1"></div> 
                    <div class="form-group col-lg-2" style="padding-right: 0px">
                        <div class="form-group col-lg-12" style="padding-left: 0px">
                        <label>Reward type</label>
						<select class="form-control" name="rewardtype" id="rewardtype">
						<option value="coupan"${customerSignup.signupPriority == 'coupan'?'selected':''}>Coupon</option>
						<option value="Loyalty Point"${customerSignup.signupPriority == 'Loyalty Point'?'selected':''}>Loyalty Point</option>
						<option value="offers"${customerSignup.signupPriority == 'offers'?'selected':''}>Offers</option>
						</select>
					</div>	
                     </div>
                    
                    
                 <!--    <div class="form-group col-lg-1"></div> -->
                    
                 	<div class="form-group col-lg-3">
                 	<div class="form-group col-lg-11" style="padding-left:0px">
                        <label>Coupan Batch Ref</label>
						<input type="text" class="form-control searchItems"  value="${customerSignup.couponBatchReference}" style="height:30PX;;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" id="couponRef" placeholder="<spring:message code="gift.coupon.id.label" />" />
						<div class=services>
					    		<div class="items">
<!-- 					     			<ul class="matchedStringUl quoteRef" style="width: 89%!important;padding: 0px!important;"></ul> -->
					   			<ul class="matchedStringUl couponRef" style="width: 89%!important;padding: 0px!important;"></ul>
					   			</div>
							</div>
						<span id="couponRefError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                    </div>
                   </div>
                  
                       
                    
                     <!-- <div class="form-group col-lg-1"></div> -->
                  
                     
                     <div class="form-group col-lg-2">
                 	<div class="form-group col-lg-11" style="padding-left:0px">
                        <label>Loyalty Plan</label>
						<input type="text" class="form-control searchItems"   style="height:30PX;;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" id="loyaltyPlan" />
						<div class=services>
					    		<div class="items">
<!-- 					     			<ul class="matchedStringUl quoteRef" style="width: 89%!important;padding: 0px!important;"></ul> -->
					   			<ul class="matchedStringUl loyaltyRef" style="width: 89%!important;padding: 0px!important;"></ul>
					   			</div>
							</div>
						<span id="loyaltyPlanError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                    </div>
                   </div>
                     
                   <div class="form-group col-lg-2">
                       <label><spring:message code="offer_start_date.label"/><span style="color:red; font-size:2">*</span></label>
                	 	<input class="form-control calendar_icon form-group"  readonly="readonly" value="${customerSignup.startDateStr}" style="background-color: white;" id="from" size="20" type="text"  placeholder="DD/MM/YYYY" />
                     	<span id="fromError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>    
                     </div>
				</div>
				
                <div class="row">
                	 <div class="form-group col-lg-3">
                	  <div class="form-group col-lg-11" style="padding-left:0px">
                        <label>Product Description</label>
						<input type="text" class="form-control" name="programDescription" id="programDescription" value="${customerSignup.campaignDescription}" required />
                      </div> 
                     </div>
                     
                     <div class="form-group col-lg-2" style="padding-left:0px">
             	<div class="form-group col-lg-11" style="padding-left: 16px; width: 110%;"> 
   
                        <label>Offer</label>
						<input type="text" class="form-control searchItems"   style="height:30PX;;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" id="Offer" />
						<div class=services>
					    		<div class="items">
<!-- 					     			<ul class="matchedStringUl quoteRef" style="width: 89%!important;padding: 0px!important;"></ul> -->
					   			<ul class="matchedStringUl offerRef" style="width: 89%!important;padding: 0px!important;"></ul>
					   			</div>
							</div>
						<span id="offerError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                    </div>
                   </div>
                   
                   <div class="form-group col-lg-2" style="padding-right: 0px;white-space:nowrap">
						<!--  <div class="form-group col-lg-9" style="padding-left: 0px"> -->
						<label>signUp Cash <span style="color:red;font-size:2px">*</span> </label>
						 <input type="number" class="form-control" name="noOfReferral" id="signupCash" value="${customerSignup.signupCash}" required />
					<!-- </div> -->
					</div>
                   
                   <div class="form-group col-lg-1"></div>
                   <div class="form-group col-lg-2" style="padding-left: 0px;" >
                                     	  <div class="form-group col-lg-12" style="">
                                            <label><spring:message code="loyalty.status.label" /><!--  <span style="color:red; font-size:2">*</span> --></label>
                                             <select class="form-control" name="status" id="status">
	                                            <option value="true"${customerSignup.status == 'true' ? 'selected' : ''}>Active</option>
    	                                        <option value="false"${customerSignup.status == 'false' ? 'selected' : ''}>Suspend</option>
                                            </select>
                                    	</div>
                                     </div>	
                   
                     
                     
                    
                      <!-- <div class="form-group col-lg-1"></div> -->
                     <%-- <div class="form-group col-lg-3">
                        <label><spring:message code="supplier.contact.name.label" /> <span style="color:red; font-size:2">*</span></label>
                        <input type="text" class="form-control" name="supplier_contact_name" id="supplier_contact_name" value="${purchaseOrderBeanObj.supplier_contact_name}" required />
                     </div> --%>
                     
                     
                     
                     <div class="form-group col-lg-2">
                     	  <label><spring:message code="offer_end_date.label"/><span style="color:red; font-size:2">*</span></label>
	                 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${customerSignup.endDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
                     <span id="toError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>    
                     </div>
              	</div><br>
              	
              	
              	
              	<div class="row">
              	
              	 <div class="form-group col-lg-2" style="padding-right: 0px">
                        <div class="form-group col-lg-12" style="padding-left: 0px">
                        <label><spring:message code="signup.priority.label" /></label>
						<select class="form-control" name="referralPriority" id="referralPriority">
						<option value="yes"${customerSignup.signupPriority == 'yes'?'selected':''}>Yes</option>
						<option value="no"${customerSignup.signupPriority == 'no'?'selected':''}>No</option>
						</select>
					</div>	
                     </div> 
              	
              	<div class="form-group col-lg-1"></div>
              	 <div class="form-group col-lg-2" style="padding-right: 0px">
                        <div class="form-group col-lg-12" style="padding-left: 0px">
                        <label><spring:message code="customer.type.label" /></label>
						<select class="form-control" name="customerType" id="customerType">
													<option value="PREMIUM"${customerSignup.customerType == 'PREMIUM'?'selected':''}>PREMIUM</option>
													<option value="PLUS"${customerSignup.customerType == 'PLUS'?'selected':''}>PLUS</option>
													<option value="BASIC"${customerSignup.customerType == 'BASIC'?'selected':''}>BASIC</option>
													<option value="GENERIC"${customerSignup.customerType == 'GENERIC'?'selected':''}>GENERIC</option>
													<option value="EMPLOYEE"${customerSignup.customerType == 'EMPLOYEE'?'selected':''}>EMPLOYEE</option>
					</select>
					</div>	
                     </div> 
              	
              	 <div class="form-group col-lg-2" style="padding-right: 0px;white-space:nowrap; width: 25%;">
						 <div class="form-group col-lg-9" style="padding-left: 0px">
						<label><spring:message code="no.of.signups.label" /><span style="color:red;font-size:2px">*</span> </label>
						 <input type="number" class="form-control" name="noOfReferral" id="noOfReferral" value="${customerSignup.noOfSignUps}" required />
					<span id="noOfReferralError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
					</div>
					</div>
					
					
                  <div class="form-group col-lg-2">
                     <div class="form-group col-lg-12" style="padding: 0px ;white-space: nowrap;">
                        <label><spring:message code="min.purchase.Amt.label" /><span style="color:red; font-size:2">*</span> </label>
                       <input type="text" class="form-control" name="minPurchaseAmt" id="minPurchaseAmt" value="${customerSignup.minimumPurchaseAmount}" required />
                        <span id="minimumPurchaseamtError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                  </div>
                    </div>
                      	</div>
              	
              	<div class="row">
      			  <div class="col-lg-12" style="margin-top:-6px"> 
      			  <div class="col-lg-12 col-xs-12" style="padding-left: 0px;padding-right: 0px; margin-right:0px;">
                      	<div class="wrapper">
	        	 		 <input type="text"  class="form-control" value="${searchName}" id="supplierReport" placeholder="<spring:message code="search.items.here.label" />" />
							<!-- <input type="button" value="Search" id="mySearch">  -->
						<button id="mySearch" class="searchbutton"></button>
					</div>
                   	<input type="hidden" id="stock" value="${searchName}">
                    </div>
              	</div></div>
              	<br>
              	
              	<div class="row">
      			 <div class="col-lg-12" style="margin-top:-6px">
						<div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;    border: 1px #cccc solid;height: 156px">
                     <table id="rewardranges" class="table table-bordered table-striped" style="">
                         <thead style="background-color: #eeeeee !important;">
                                 <tr>
                                  <th><div style="width:50px">S.No</div><%-- <spring:message code="crm.reward.criteria.label" /> --%></th>
                                  <th><spring:message code="date.label" /></th>
                                  <th><spring:message code="customer.id.label" /></th>
                                  <th><spring:message code="customer.name.label" /></th>
                                  <th><spring:message code="signup.amt.label" /></th>
                                  <th><spring:message code="searcg.coupon.id" /></th>
                                 </tr>
                         </thead>
                         <tbody style="text-align: center;">
                        <c:forEach var="customerDetails" items="${customerSignup.customerSignUp}" varStatus="theCount">
                         <tr>
                         <td>${theCount.count}</td>
                         <td></td>
                         <td>${customerDetails.customerId}</td>
                         <td>${customerDetails.customerName}</td>
                         <td>${customerDetails.minimumPurchaseAmount}</td>
                         <td>${customerDetails.couponId}</td>
                         </tr>
                        </c:forEach> 
                         </tbody>
                     </table>
                     </div>
				  </div>
      		      </div>	
      			</div>
      			
      				<div class="form-group col-lg-3">
      				  <label><spring:message code="help.label" /> </label>
      				 <textarea class="form-control" rows="15" id="help"  value=""></textarea>
      				</div>
      				
      				    <div class="col-lg-12" style="    text-align: center;    margin-top: 25px;">
      				 <input type="button"  style="" class="btnCls" onclick="validateCustomerSignup('edit');" value="<spring:message code="submit.label" />" />
      				<input type="button" class="btnCls buttonMargin" style="" onclick="viewCustomerSignUp('CustomerSignUp','0','false');" value="<spring:message code="cancel.label" />" />
      				 </div>
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