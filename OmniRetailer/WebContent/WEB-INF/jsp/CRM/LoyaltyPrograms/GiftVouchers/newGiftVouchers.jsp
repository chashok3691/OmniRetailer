<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/loyaltyPrograms/newGiftVouchers.jsp
 * file type		        : JSP
 * description				: The new product is displayed using this jsp
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
 	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/countries.js"></script>
 	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
 	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/crm/loyaltyPrograms/giftVouchersAndGiftCoupons.js"></script>
 	<script type="text/javascript" src="${pageContext.request.contextPath}/js/order.js"></script>
 
<script type="text/javascript">
$(document).ready(function(){
	callCalender('createdOn');
	callCalender('expiryDate');
	print_country("country");
	 var date = getCurrentDate();
//	 $('#date').val(date);
	 $("#country").val("India");
// 		print_state('state',104);
});
$("#promoName").keydown(function(){
	   $("#errPromoName").html("");
	   $("#Error").html("");
});

$("#unitCashValue").keydown(function(){
	   $("#errUnitCashValue").html("");
	   $("#Error").html("");
});

$("#createdOn").keydown(function(){
	   $("#errCreatedOn").html("");
	   $("#Error").html("");
});

$("#state").change(function(){
	   $("#errStates").html("");
	   $("#Error").html("");
});
$("#location").change(function(){
	   $("#errLocation").html("");
	   $("#Error").html("");
});

$("#expiryDate").keydown(function(){
	   $("#errExpiryDate").html("");
	   $("#Error").html("");
});
$("#quantity").keyup(function(){
	   $("#errQuantity").html("");
	   $("#Error").html("");
});

$("#validityPeriod").keyup(function(){
	   $("#errValidityPeriod").html("");
	   $("#Error").html("");
});
$("#unitCashValue").keyup(function(){
	   $("#errUnitCashValue").html("");
	   $("#Error").html("");
});

$("#quantity").blur(function(){
	var unitVal = parseFloat($("#unitCashValue").val());
	var quantity = parseInt($("#quantity").val());
	if(!isNaN(unitVal)&& !isNaN(quantity)){
		$("#totalCashValue").val(unitVal*quantity);
	}
});

$("#unitCashValue").blur(function(){
	var unitVal = parseFloat($("#unitCashValue").val());
	var quantity = parseInt($("#quantity").val());
	if(!isNaN(unitVal)&& !isNaN(quantity)){
		$("#totalCashValue").val(unitVal*quantity);
	}
});
</script>
</head>
<body>
<!-- Content Header (Page header) -->
<%-- <section class="content-header">
   <h1><spring:message code="loyaltyprogram.label" />
     <small><spring:message code="giftvouchers.label" /></small>
    </h1>
      <ol class="breadcrumb">
      	<li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><a style="cursor: pointer;" onclick="showLoyaltyFlow();"><spring:message code="loyaltyprogram.label" /></a></li>
       </ol>
 </section> --%>

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
				<div class="box box-primary">
                                <div class="box-header" style="text-align: center">
                                
                                <h3> <label style="padding :5px;  border:1px solid  #808080;"><spring:message code="generate.new.gift.cards.label" /></label></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form id="newGiftVouchers" method="post" >
                                    <div class="box-body">
                                   	<div id="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;">${err}</div>
                                   		<div id="error" style="text-align: center;color: red;font-size: 2;font-weight: bold;">${err}</div>
                                    <div id="success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;">${success}</div>
                                    	<div style="background: #efefef;padding: 4px 20px;">
                                   	<div class="row">
                                   	
                                   	
                                   		<div class="form-group col-lg-2">
                                             <label style="font-family: Calibri;color: gray;"><spring:message code="promo.code.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="voucherProgramCode" name="voucherProgramCode" style="width:100%;" value="${giftVoucher.voucherProgramCode}"/>
                                             <span style="color:red; font-size:2;font-weight: bold" id="errVoucherProgramCode"></span>
                                     	</div>
                                   		<div class="form-group col-lg-2">
                                             <label style="font-family: Calibri;color: gray;"><spring:message code="promo.name.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="promoName" name="promoName" style="width:100%;"  value="${giftVoucher.promoName}"/>
                                             <span style="color:red; font-size:2;font-weight: bold" id="errPromoName"></span>
                                     	</div>
                                   		<div class="form-group col-lg-2">
                                             <label style="font-family: Calibri;color: gray;"><spring:message code="unit.cash.value.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="unitCashValue" name="unitCashValue" style="width:65%;" value="${giftVoucher.unitCashValue}" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                            <span style="color:red; font-size:2;font-weight: bold" id="errUnitCashValue"></span>
                                     	</div>
                                     	<div class="form-group col-lg-2">
                                             <label style="font-family: Calibri;color: gray;"><spring:message code="no.of.vouchers.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="quantity" name="quantity" value="${giftVoucher.quantity}" style="width:65%;"oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                            <span style="color:red; font-size:2;font-weight: bold" id="errQuantity"></span>
                                    	</div>
                                   		<div class="form-group col-lg-2" style="padding-right: 0px;">
					                           <label style="font-family: Calibri;color: gray;white-space: nowrap;">Tender Name</label>
					                          <select class="form-control" name="tenderName" id="tenderName" style="width:80%;">
					                           		 <%-- <option value=""><spring:message code="ALL.label"/></option> --%>
						                             <c:forEach var="tender" items="${tenderDetails}">
						                             <c:if test="${tender.modeOfPayment == 'Gift Voucher'}">
														<option value="${tender.tenderName}" ${selectedTender == tender.tenderName ? 'selected' : ''}>${tender.tenderName}</option>
											 		</c:if>
											 		</c:forEach> 
						                        </select>
						                        <span style="color:red; font-size:2;font-weight: bold" id="errTenderName"></span>
					                    
                                    	</div>
                                    	
										
                                    	<div class="form-group col-lg-2" style="">
										  
										   <div class="from-group col-lg-12" style="padding-left: 0px;margin-top: 20px;">
									
											 <label style="font-family: Calibri;color: gray;"><spring:message code="gift.voucher.ispaid" /></label>
											<div class="col-lg-1" style="padding-left: 0px;">
											<input type="checkbox" id="isPaidFlag" name="isPaidFlag" value="false">
											</div>
											</div>
										  
										  </div>
                                    	
                                    	</div>
                                    	<div class="row">
                                      	<div class="form-group col-lg-2">
                                             <label style="font-family: Calibri;color: gray;"><spring:message code="total.cash.value.label" /></label>
                                            <input type="text" class="form-control" id="totalCashValue" readonly="readonly" style="width:50%;" name="totalCashValue" value="${giftVoucher.totalCashValue}"oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                                             <span style="color:red; font-size:2;font-weight: bold" id="errTotalCashValue"></span>
                                    	</div>
										<div class="form-group col-lg-2">
                                             <label style="font-family: Calibri;color: gray;"><spring:message code="date.label" /> <span style="color:red; font-size:2">*</span></label>
                                             <!-- <input type="text" class="form-control"  name="createdOn" readonly="readonly" id="date" value=""/> -->
                                            <div class="input-group">
                                            	<div class="input-group-addon">
                                                	<i class="fa fa-calendar"></i>
                                            	</div>
                                            	<input class="form-control" readonly="readonly" style="background-color: white;width:50%;" name="createdOn" id="createdOn" size="20" type="text" value="${giftVoucher.createdOn}"onfocus="callCalender('createdOn')" onclick="callCalender('createdOn')" placeholder="DD/MM/YYYY"/>
                                            	<!-- <input type="text" name="createdOn" id="createdOn" required class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/> -->
                                       		 </div> <!-- /.input group -->
                                       		  <span style="color:red; font-size:2;font-weight: bold" id="createdOnError"></span>
                                        </div>
                                         <div class="form-group col-lg-2">
                                             <label style="font-family: Calibri;color: gray;"><spring:message code="expiry.date.label" /> <span style="color:red; font-size:2">*</span></label>
                                             <div class="input-group">
                                            	<div class="input-group-addon">
                                                	<i class="fa fa-calendar"></i>
                                            	</div>
                                            	<input class="form-control" readonly="readonly" style="background-color: white;width:50%;" name="expiryDate" id="expiryDate" size="20" type="text" onfocus="callCalender('expiryDate')" onclick="callCalender('expiryDate')" value="${giftVoucher.expiryDate}" placeholder="DD/MM/YYYY"/>
                                            	<!-- <input type="text" name="expiryDate" id="expiryDate" required class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/> -->
                                       		 </div><!-- /.input group -->
                                       		  <span style="color:red; font-size:2;font-weight: bold" id="expiryDateError"></span>
                                         </div>
                                         <div class="form-group col-lg-2">
                                             <label style="font-family: Calibri;color: gray;"><spring:message code="validity.period.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control"  name="validityPeriod" id="validityPeriod" value="${giftVoucher.validityPeriod}" style= "width:60%;" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.no.of.days.label" />" />
                                              <span style="color:red; font-size:2;font-weight: bold" id="errValidityPeriod"></span>
                                    	</div>
                                    	<div class="form-group col-lg-2" style="padding-right: 0px;">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="productGroup.label" /><!--  <span style="color:red; font-size:2">*</span> --></label>
                                             <select class="form-control" name="productGroup" id="productGroup" style="width: 80%;">
	                                            <option value="" >ALL</option>
	                                        <c:forEach var="groupsList" items="${groupsList}">
	                            			 <option value="${groupsList.groupId}" >${groupsList.groupId}</option>
											</c:forEach>
	                                         </select>
										
                                    	</div>
                                    	
                                    	  <div class="form-group col-lg-2">
										  
										   <div class="from-group col-lg-12" style="padding-left: 0px;margin-top: 20px;">
									
											 <label style="font-family: Calibri;color: gray;">Is<spring:message code="crm.otp.required" /></label>
											<div class="col-lg-1" style="padding-left: 0px;">
											<input type="checkbox" id="isOTPFlag" name="isOTPFlag" value="false">
											</div>
											</div>
										  
										  </div>
                                    	  
                                    	</div>
									<div class="row">
                                    
									
										  <div class="form-group col-lg-1" style="padding-right: 0px;">
                                             <label style="font-family: Calibri;color: gray;" >Assigned</label>
                                             <select class="form-control" name="assignedStatusStr" id="assignedStatus">
	                                            <option value="0"  ${giftVoucher.assignedStatus==true?'selected':''}>Yes</option>
    	                                        <option value="1"  ${giftVoucher.assignedStatus==false?'selected':''}>No</option>
                                            </select>
										  </div>
										  
                                    	
                                    	
										 <div class="form-group col-lg-1"></div>
										  
                                     		<div class="form-group col-lg-2">
                                             <label style="font-family: Calibri;color: gray;">Min Bill Amount<span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="min_bill_amount"  name="min_bill_amount" style= "width:60%;"  value="${giftVoucher.min_bill_amount}" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"  />
                                              
                                             <span style="color:red; font-size:2;font-weight: bold" id="errmin_bill_amount"></span>
                                    	</div>
                                    	
                                    	<div class="form-group col-lg-2" >
                                             <label style="font-family: Calibri;color: gray;"  >Multiple Claims<span style="color:red; font-size:2">*</span></label>
                                             <select class="form-control" name="multipleInt" onchange="multipleCheckValidation()"  style= "width:60%;"  id="multipleInt">
	                                            <option value="1" ${giftVoucher.multiple==true?'selected':''}>yes</option>
    	                                        <option value="0" ${giftVoucher.multiple==false?'selected':''}>no</option>
                                            </select>
										</div>
                                    	
                                     
                                     		<div class="form-group col-lg-2" style="    margin-bottom: 0px;">
                                             <label style="font-family: Calibri;color: gray;"><spring:message code="loyalty.status.label" /><!--  <span style="color:red; font-size:2">*</span> --></label>
                                             <select class="form-control" name="status" id="status" style= "width:60%;" >
	                                            <option value="Active"${giftVoucher.status=='Active'?'selected':''}>Active</option>
    	                                        <option value="Suspend"${giftVoucher.status=='Suspend'?'selected':''}>Suspend</option>
                                            </select>
	            
										</div>
										<div class="form-group col-lg-2"></div>
										
										   <div class="form-group col-lg-2">
										   <div class="from-group col-lg-12" style="padding-left: 0px;margin-top: 20px;white-space: nowrap;">
											 <label style="font-family: Calibri;color: gray;">On Discounted bill</label>
											<div class="col-lg-1" style="padding-left: 0px;">
											<input type="checkbox" id="on_discounted_bill_price" name="on_discounted_bill_price" value="false">
											</div>
											</div>
										  
										  </div>
										
										  </div>
										  </div>
		<!--  Written by: Manideep
		Reason: To add the is paid flag  -->   			  
										   <div class="row">
										    <div class="form-group col-lg-2" style="    margin-bottom: 0px !important;">
										 <%-- <div class="row" style="margin-left: 1%">
										  <label style="font-family: Calibri;color: gray;" style="text-decoration: underline; font-size: 16px;"><spring:message code="loyalty.locations.label" /></label>
										 </div> --%>
                                             <label style="font-family: Calibri;color: gray;"><spring:message code="loyalty.country.label" /></label>
                                           <!--  <select onchange="addSelectedState(this.selectedIndex);" id="country" name ="country" class="form-control" > -->
                                            <select onchange="print_state('state',this.selectedIndex);" id="country" name ="country"style= "width:60%;"  class="form-control" >
												<!-- <option >Select Country</option> -->
											</select>
                                     	</div>
										  
										
										  
										
										  
										  </div>
										  
										  
									<div class="row" >
									
										<div class="form-group col-lg-2">
                                             <label style="font-family: Calibri;color: gray;"><spring:message code="zones.all" /> <span style="color:red; font-size:2">*</span></label>
                                            <select onchange="getLocationsBasedonZones();" id ="zones"  style= "width:90%;"  multiple="multiple" class="form-control" >
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
   										<span style="color:red; font-size:2;;font-weight: bold" id="errStates"></span> 
                                    	</div>
										  
											<div class="form-group col-lg-2">
                                             <label style="font-family: Calibri;color: gray;"><spring:message code="loyalty.locations.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <select id ="location" multiple="multiple" class="form-control"  style= "width:90%;" >
    											<!-- <option >Select State</option> -->
    										</select>
    										<span style="color:red; font-size:2;font-weight: bold" id="errLocation"></span>
                                    	</div>
                                    	
                                      <div class="form-group col-lg-2">
                                    	 <label style="font-family: Calibri;color: gray;"><spring:message code="card.description.label" /></label>
                                            <textarea style="resize:none;padding: 10px 10px;" class="form-control" id="description" name="description" rows="3">${giftVoucher.description}</textarea>
                                            <span style="color:red; font-size:2;font-weight: bold" id="errdescription"></span>
                                      </div>
                                    	
                                      	<div class="form-group col-lg-6">
                                      	
                                     	<div class="col-lg-12" style="left:0px">
                                    	<div class="col-lg-4" style="padding:0px">
                                    	<label style="font-family: Calibri;color: gray;"><strong>Discount Vouchers Generated</strong></label>
                                    	</div>
                                    	<div class="col-lg-6" style="padding-right: 0px;margin-bottom: 5px;">
										<input type="file" class="btn bg-olive btn-inline" accept=".xlsx" title="To import, Choose the valid Exel Sheet format" style="height: 30px;display: inline-block;padding: 3px !important;width: 100%;" id="coupons" name="uploadedfilePath" onchange="addNameToTextBox('vouchers');" /> 
										<input type="hidden" id="vouchers_refId" name="vouchers" /> 
										<input type="hidden" id="vouchers_name" />
                                    	</div>
                                    	<div class="col-lg-2" style="padding-right: 0px;">
                                    	<input type="button" class="btnCls" style="width: 100%;font-size: 15px;padding: 4px 4px;" onclick="importVoucherDataxls()" value="Import">
                                    	</div>
                                    	<table class="table table-striped table-bordered">
                                    	<thead style="background-color: #eeee !important; border-left: hidden;border-right: hidden;" >
                                    	<tr>
				                        	<th class="col-sm-1" ><spring:message code="slno.label"/></th>
				                        	<th class="col-sm-3" style="text-align: left"><spring:message code="gift.coupon.id.label"/></th>
				                        	<th class="col-sm-1"><spring:message code="start.date.label"/></th>
				                        	<th class="col-sm-1"><spring:message code="end.date.label"/></th>
				                        	<th class="col-sm-1"><spring:message code="status.label"/></th>
				                              </tr>      	
				                             </thead>
                                    	</table>
                                    	</div>
                                     	
                                     	</div>
                                     	</div>
									  
									  
                                    </div><!-- /.box-body -->
                                    
                                    <input type = "hidden" name = "zone"  id ="zone" value = ""/>
                                    <input type = "hidden" name = "locations"  id ="locations" value = ""/>
									
						<div class="row" style="text-align: center;">
						 <input type="button" class="btn bg-olive btn-inline" style="width: 65px;" onclick="validateGiftVouchers('new','giftVouchers')" value="<spring:message code="submit.label" />" />
					 <c:if test="${sessionScope.role == 'super admin'}"> 
					 	<input type="button" class="btn bg-olive btn-inline" style="margin-left:25%;" onclick="viewGiftVouchers('giftvoucher','GiftVoucher','0','menu');" value="<spring:message code="cancel.label" />" />
					 </c:if>
					<c:forEach var="accessControl" items="${sessionScope.CustomerLoyality}">
                        <c:if test="${accessControl.appDocument == 'GiftVoucher' && accessControl.write == true && accessControl.read == true}">
							<input type="button" class="btn bg-olive btn-inline" style="margin-left:25%;" onclick="viewGiftVouchers('giftvoucher','GiftVoucher','0','menu');" value="<spring:message code="cancel.label" />" />
						</c:if>
					</c:forEach>
						</div>
									<br/>
                                    <div class="box-footer">
                                     
                                    </div>
                                </form>
                            </div>
                            
</div>
</div>
</section><!-- /.content -->
  <!-- InputMask -->
      <%--   <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script>
<script type="text/javascript">
            $(function() {
                //Datemask dd/mm/yyyy
                $("#expiryDate").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
                $("#createdOn").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
            });
            </script> --%>
</body>
</html>