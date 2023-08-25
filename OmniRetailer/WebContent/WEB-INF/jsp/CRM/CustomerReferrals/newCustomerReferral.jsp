<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/warehouse/procurement/newCustomerReferal.jsp
 * file type		        : JSP
 * description				: The purchase order is displayed using this jsp and allows modify and save
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/countriesAndStates.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	callCalender('from');
	callCalender('to');
	callCalender('expiry');
	print_country("country");
		
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
            <h3>New Customer Referrals</h3>
            
           
            
            </div><!-- /.box-header -->
            <!-- form start -->
            <form id="viewProcurementReceipt" method="post" >
                <div class="box-body">
                <input type="hidden" id="operation" value="">
                <div class="row" style="text-align: right;">
                	<input type="hidden" id="type" value="${type}">
				 	<div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 20px; margin-top: -20px">${err}</div>
	        		<div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 20px; margin-top: -20px">${success}</div>
	        		
				</div>
                 <div style="background: #efefef;padding: 4px 20px;">
               	<div class="row">
               		<div class="form-group col-lg-3" >
               		<div class="form-group col-lg-11" style="padding-left:0px">
                        <label><spring:message code="referral.programId.label" /> <span style="color:red; font-size:2">*</span></label>
						<input type="text" class="form-control"  id="programId" value="${customerReferralMaster.referralProgramId}" required />
                     	<span id="referralError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>    
                    </div>
                    </div>
                 	<div class="form-group col-lg-2" style="padding-right: 0px" >
                        <label style="font-family: Calibri;color: gray;"  >Assigned</label>
                         <select class="form-control" name="assignedStatusStr" id="assignedStatus" style="width: 45%;">
                         <option value="0">Yes</option>
                         <option value="1">No</option>
                        </select>
					</div>
                    <div class="form-group col-lg-2">
                     <div class="form-group col-lg-11" style="padding-left: 0px">
                        <label><spring:message code="min.purchase.Amt.label" /> <span style="color:red; font-size:2">*</span></label>
                       <input type="text" class="form-control" name="minPurchaseAmt" id="minPurchaseAmt" value="${customerReferralMaster.minumumPurchaseAmount}" required oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                        <span id="minpurchaseError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                 	 </div>
                    </div>
                    
                    <div class="form-group col-lg-2" >
                           <label style="font-family: Calibri;color: gray;">Multi User</label>
                            <select class="form-control" name="multiUser" id="multiUser" style="width: 45%;">
                            <option value="0">Yes</option>
                            <option value="1">No</option>
                           </select>
					</div>
					
                    <div class="form-group col-lg-2">
                       <label><spring:message code="offer_start_date.label"/><span style="color:red; font-size:2">*</span></label>
                	 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${customerReferralMaster.startDateStr}" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
                    	<span id="offer_start_dateError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
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
                     
                 <div class="form-group col-lg-2" style="margin-bottom: 0px;">
					<div class="form-group col-lg-12" style="padding: 0px;">
					
                          <label style="font-family: Calibri;color: gray;"><spring:message code="productGroup.label" /><!--  <span style="color:red; font-size:2">*</span> --></label>
                         <select class="form-control" name="productGroup" id="productGroup" style="width: 100%;">
                       <option value="" >ALL</option>
                       <c:forEach var="groupsList" items="${groupsList}">
                         <option value="${groupsList.groupId}" >${groupsList.groupId}</option>
                        </c:forEach>
                        </select>
						</div> 
					</div>
                     
                     <div class="form-group col-lg-2" style="padding-right: 0px">
                        <div class="form-group col-lg-10" style="padding-left: 0px">
                        <label><spring:message code="referral.priority.label" /></label>
						<select class="form-control" name="referralPriority" id="referralPriority">
						<option value="yes">Yes</option>
						<option value="no">No</option>
						</select>
					</div>	
                     </div>
                     
                     <div class="form-group col-lg-2" style="padding-right: 0px;white-space:nowrap">
						 <div class="form-group col-lg-8" style="padding-left: 0px">
						<label><spring:message code="no.of.referrals.label" /> </label>
						 <input type="text" class="form-control" name="noOfReferral" id="noOfReferral" value="${customerReferralMaster.noOfReferrals}" required oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
					<span id="noOfReferralError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
					</div>
					</div>
					
                     <div class="form-group col-lg-2">
                      <label><spring:message code="offer_end_date.label"/><span style="color:red; font-size:2">*</span></label>
	                 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${customerReferralMaster.endDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
                    	<span id="offer_end_dateError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                     </div>
                    
              	</div>
              	
      		<div class="row">
               <div class="form-group col-lg-3">
                  <div class="form-group col-lg-11" style="padding-left:0px">
                  	  <label>Expiry Date<span style="color:red; font-size:2">*</span></label>
               		<input class="form-control calendar_icon form-group" readonly="readonly" value="${customerReferralMaster.endDateStr}" style="background-color: white;" id="expiry" size="20" type="text" onfocus="callCalender('expiry')" onclick="callCalender('expiry')" placeholder="DD/MM/YYYY" />
                   <span id="offer_expiry_dateError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                 </div>
                </div>
                     
                   <div class="form-group col-lg-2" style="padding-right: 0px;">
					 <div class="form-group col-lg-8" style="padding-left: 0px">
					<label>validity Period<span style="color:red; font-size:2">*</span></label>
					 <input type="text" class="form-control" name="validityPeriod" id="validityPeriod" placeholder="Validity Period" value="" required oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
					<span id="validityPeriodError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
					</div>
                   </div>
                   
                     <div class="form-group col-lg-2" style="padding-right: 0px;">
                         <label style="font-family: Calibri;color: gray;"><spring:message code="discounttype.label" /> <span style="color:red; font-size: 2" >*</span></label>
                          <select class="form-control" name="discountType" id="discountType" style="width: 50%;">
                          <option value="Flat" ${giftCoupon.discountType=='Flat'?'selected':''}>Flat</option>
                          <option value="percentage" ${giftCoupon.discountType=='percentage'?'selected':''}>Percentage</option>
                         </select>
					</div>
                     
                    <div class="form-group col-lg-2"  style="padding-right: 0px;white-space:nowrap" >
					 	<div class="form-group col-lg-8" style="padding-left: 0px">
						<label>Referral Value</label>
					 	<input type="text" class="form-control" name="referralValue" placeholder="Referral Value" id="referralValue" value="" required oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
						<span id="referralValueError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
						</div>
					</div>

                     <div class="form-group col-lg-2" >
                        <label style="font-family: Calibri;color: gray;"><spring:message code="loyalty.status.label" /><!--  <span style="color:red; font-size:2">*</span> --></label>
                         <select class="form-control" name="status" id="status" style="width: 60%;">
                         <option value="Active"${'Active' == giftCoupon.status ? 'selected' : ''}>Active</option>
                         <option value="Suspend"${'Suspend' == giftCoupon.status ? 'selected' : ''}>Suspend</option>
                        </select>
					</div> 
              	</div>
              	<div class="row">	
							<div class="from-group col-lg-7">
								<hr style="width:102%;margin-left:1%;margin-bottom:1px" />	
							</div>
								<div class="from-group col-lg-2" style="padding-left: 0px;">
										<label style="font-family: Calibri;color: gray;"><spring:message code="crm.auto.generated" /></label>
										<div class="col-lg-1">
											<input type="checkbox" id="autoCoupons" name="genareteCoupons" value="0">
										
									</div>
								</div>
								 <div class="from-group col-lg-2" style="padding-left: 0px;">
									<label style="font-family: Calibri;color: gray;"><spring:message code="crm.otp.required" /></label>
								<div class="col-lg-1">
									<input type="checkbox" id="otpRequired" name="requiredOTP" value="0">
								</div>
								</div> 
				</div>
				</div>
				</div>
							<div class="row">
								<div class="form-group col-lg-2">
										 <%-- <div class="row" style="margin-left: 1%">
										 <label style="font-family: Calibri;color: gray;" style="text-decoration: underline; font-size: 16px;"><spring:message code="loyalty.locations.label" /></label>
										 </div> --%>
							 	<div class="col-lg-12">
                                         <label style="font-family: Calibri;color: gray;"><spring:message code="loyalty.country.label" /></label>
                                        <!--  <select onchange="addSelectedState(this.selectedIndex);" id="country" name ="country" class="form-control" > -->
                                         <select onchange="print_state('state',this.selectedIndex);" id="country" name ="country" class="form-control" >
										<!-- <option >Select Country</option> -->
										</select>
								</div>
                                </div>
							</div>
								
									<div class="row">
                                      	<div class="form-group col-lg-3">
                                      		<div class="col-lg-12">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="zones.all" /> <span style="color:red; font-size:2">*</span></label>
                                            <select onchange="getLocationsBasedonZones();" id ="zones" multiple="multiple" class="form-control" >
    										 <c:forEach var="zoneList" items="${zoneList}">
    										    <c:set var="zs" value="false"/>
    										    <c:forEach var="zonestr" items="${giftCoupon.zones}">
    										    <c:if test="${zonestr == zoneList.zoneID}">
    										    	<c:set var="zs" value="true"/>
    										    </c:if>
    										    
    										    </c:forEach>
    										    <c:choose>
    										    <c:when test="${zs == 'true'}">
													<option selected value="${zoneList.zoneID}">${zoneList.zoneID}</option>
						 					</c:when>
						 					  <c:otherwise>
													<option  value="${zoneList.zoneID}">${zoneList.zoneID}</option>
						 					</c:otherwise>
						 					</c:choose>
						 					</c:forEach>	<!-- <option >Select State</option> -->
    										</select>
    										<span class="clearErrors" style="color:red; font-size:2;font-weight: bold;" id="errStates"></span>
    										</div>
                                    	</div>
                                    	<div class="form-group col-lg-2">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="loyalty.locations.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <select id ="location" multiple="multiple" class="form-control" >
    											<c:forEach var="locationDetails" items="${locationsbasedzone}">
												<option value="${locationDetails}">${locationDetails}</option>
											</c:forEach>
    										</select>
    										<span style="color:red; font-size:2;font-weight: bold" id="errLocation"></span>
                                    	</div>
                                    	<div class="col-lg-7" style="left:0px">
                                    	
                                    	
                                    	
                    <div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;    border: 1px #cccc solid;height: 149px">
                     <table id="rewardranges" class="table table-bordered table-striped" style="">
                         <thead style="background-color: #eeeeee !important;">
                                 <tr>
                                  <th><div style="width:50px">S.No</div><%-- <spring:message code="crm.reward.criteria.label" /> --%></th>
                                  <th><spring:message code="date.label" /></th>
                                  <th><spring:message code="referred.to.label" /></th>
                                  <th>Referral Code</th>
                                  <th><spring:message code="referral.amt.label" /></th>
                                  <th><spring:message code="cumulative.amt.label" /></th>
                                 </tr>
                         </thead>
                         <tbody style="text-align: center;">
                         
                         </tbody>
                     </table>
                     </div>
                   </div>
			  </div>
			  
      		<div class="row">
   				<div class="col-lg-3" >
   				</div>
      			<div class="col-lg-6" style="margin-top:-6px;margin-top: 50px;">
      			    <input type="button"  style="width: 30%" class="btnCls" onclick="validateCustomerReferral('new');" value="<spring:message code="submit.label" />" />
      				<input type="button" class="btnCls buttonMargin" style="width: 30%;" onclick="viewCustomerReferrals('CustomerReferal','0','false');" value="<spring:message code="cancel.label" />" />
      			</div>
      			<div class="col-lg-3" >
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