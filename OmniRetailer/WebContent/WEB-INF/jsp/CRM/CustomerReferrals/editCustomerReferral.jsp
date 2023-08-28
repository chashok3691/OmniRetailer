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
	<script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
 	<script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/crm/customerReferral.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
	<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/Csvreader/readcsv.js"></script> --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/excelReader/excelreader.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	callCalender('from');
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
          <h3>${customerReferralMaster.referralProgramId}-Detalis</h3>
            
            </div><!-- /.box-header -->
            <!-- form start -->
            <form id="viewProcurementReceipt" method="post" >
                <div class="box-body">
                <input type="hidden" id="operation" value="">
                
                
                 <input type="hidden" id="expiry" value="">
                  <input type="hidden" id="productGroup" value="${customerReferralMaster.productGroup}">
                   <input type="hidden" id="assignedStatus" value="${customerReferralMaster.assignedReferral}">
                    <input type="hidden" id="multiUser" value="${customerReferralMaster.multiUser}">
                     <input type="hidden" id="validityPeriod" value="${customerReferralMaster.validatePeriod}">
                      <input type="hidden" id="discountType" value="${customerReferralMaster.discountType}">
                      <input type="hidden" id="referralValue" value="${customerReferralMaster.referralValue}">
                 <input type="hidden" id="status" value="${customerReferralMaster.status}">
                  <input type="hidden" id="noOfReferral" value="${customerReferralMaster.autoGenerated}">
                   <input type="hidden" id="otpRequired" value="${customerReferralMaster.otpRequired}">
                     <input type="hidden" id="autoCoupons" value="${customerReferralMaster.autoGenerated}">
                      
                      
                      
                      
                <div class="row" style="text-align: right;">
                
				 	<div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 20px; margin-top: -20px">${err}</div>
	        		<div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 20px; margin-top: -20px">${success}</div>
	        		
				</div>
<%--             <c:forEach var="customerReferralMaster" items="${customerReferralMaster}">      --%>
               	<div class="row">
               		<div class="form-group col-lg-2">
                        <label><spring:message code="referral.programId.label" /> <span style="color:red; font-size:2">*</span></label>
						<input type="text" class="form-control"  id="programId" value="${customerReferralMaster.referralProgramId}" required />
                     	<span id=referralError style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>    
                    </div>
                    <div class="form-group col-lg-1"></div>
                 	<div class="form-group col-lg-2">
                        <label><spring:message code="coupon.batch.ref.label" /></label>
						<input type="text" class="form-control searchItems" value="${customerReferralMaster.couponBatchReference}" style="height:30PX;;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" id="couponRef" placeholder="<spring:message code="gift.coupon.id.label" />" />
						<div class=services>
					    		<div class="items">
<!-- 					     			<ul class="matchedStringUl quoteRef" style="width: 89%!important;padding: 0px!important;"></ul> -->
					   			<ul class="matchedStringUl couponRef" style="width: 89%!important;padding: 0px!important;"></ul>
					   			</div>
							</div>
						<span id="deliveryDateError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                    </div>
                    <div class="form-group col-lg-1"></div>
                    <div class="form-group col-lg-2">
                     <div class="form-group col-lg-11" style="padding-left: 0px">
                        <label><spring:message code="min.purchase.Amt.label" /> </label>
                       <input type="text" class="form-control" name="minPurchaseAmt" id="minPurchaseAmt" value="${customerReferralMaster.minumumPurchaseAmount}" required oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                        <span id="orderSubmittedByError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                  </div>
                    </div>
                     <div class="form-group col-lg-1"></div>
                    <div class="form-group col-lg-2">
                       <label><spring:message code="offer_start_date.label"/></label>
                	 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${customerReferralMaster.startDateStr}" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
                     </div>
                     
				</div>
                <div class="row">
                	 <div class="form-group col-lg-3">
                	  <div class="form-group col-lg-11" style="padding-left:0px">
                        <label><spring:message code="program.description.label" /></label>
						<input type="text" class="form-control" name="programDescription" id="programDescription" value="${customerReferralMaster.programDescription}" required />
                        <span id="programDescriptionError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                      </div> 
                     </div>
                     
                 <div class="form-group col-lg-2" style="padding-right: 0px;white-space:nowrap">
					<div class="form-group col-lg-8" style="padding-left: 0px">
						<label><spring:message code="no.of.referrals.label" /> </label>
						 <input type="text" class="form-control" name="noOfReferral" id="noOfReferral" value="${customerReferralMaster.noOfReferrals}" required oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
					      <span id="noOfReferralError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
					</div>
				</div>
					 <div class="form-group col-lg-1"></div>
                  
                     <div class="form-group col-lg-2" style="padding-right: 0px">
                        <div class="form-group col-lg-10" style="padding-left: 0px">
                        <label><spring:message code="referral.priority.label" /></label>
						<select class="form-control" name="referralPriority" id="referralPriority">
						<option value="yes"${customerReferralMaster.referralPriority == 'yes'?'selected':''}>Yes</option>
						<option value="no"${customerReferralMaster.referralPriority == 'no'?'selected':''}>No</option>
						</select>
					   </div>	
                   </div>
                     
                      <div class="form-group col-lg-1"></div>
                 
                     <%-- <div class="form-group col-lg-3">
                        <label><spring:message code="supplier.contact.name.label" /> <span style="color:red; font-size:2">*</span></label>
                        <input type="text" class="form-control" name="supplier_contact_name" id="supplier_contact_name" value="${purchaseOrderBeanObj.supplier_contact_name}" required />
                     </div> --%>
                   <div class="form-group col-lg-2">
                     <label><spring:message code="offer_end_date.label"/></label>
	                 <input class="form-control calendar_icon form-group" readonly="readonly" value="${customerReferralMaster.endDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
                     <span id="offer_end_dateError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                   </div>
                     <div class="form-group col-lg-1"></div>
              	</div>
              	<br>
      			
      			<div class="row">
      			 <div class="col-lg-6" style="margin-top:-6px">
      			
					<div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-y:auto;width:100%;position: relative;border: 1px #cccc solid;height: 149px">
                     <table id="rewardranges" class="table table-bordered table-striped" style="">
                         <thead style="background-color: #eeeeee !important;">
                                 <tr>
                                  <th><div style="width:50px">S.No</div><%-- <spring:message code="crm.reward.criteria.label" /> --%></th>
                                  <th><spring:message code="date.label" /></th>
                                  <th><spring:message code="referred.to.label" /></th>
                                  <th><spring:message code="referral.amt.label" /></th>
                                  <th><spring:message code="cumulative.amt.label" /></th>
                                 </tr>
                         </thead>
                         <tbody style="text-align: center;">
                         <c:forEach var="customerDetails" items="${customerReferralMaster.customerReferrals}" varStatus="theCount">
                         <tr>
                         <td>${theCount.count}</td>
                         <td>${customerDetails.referralDate}</td>
                         <td>${customerDetails.referredTo}</td>
                         <td>${customerDetails.referralAmount}</td>
                         <td>${customerDetails.cummulativeAmount}</td>
                         </tr>
                        </c:forEach> 
                       </tbody>
                     </table>
                     </div>
					</div>
      			
      				 <div class="col-lg-6" style="margin-top:-6px;margin-top: 103px;">
      				 <input type="button"  style="width: 30%" class="btnCls" onclick="validateCustomerReferral('edit');" value="<spring:message code="submit.label" />" />
      				<input type="button" class="btnCls buttonMargin" style="width: 30%" onclick="viewCustomerReferrals('CustomerReferal','0','false');" value="<spring:message code="cancel.label" />" />
      				 </div>
      		</div>	
		<br/>
        <div class="box-footer"></div>
<%--         </c:forEach> --%>
        </div>
     </form>
   </div>
</div>
</div>
</section><!-- /.content -->
</body>
</html>