<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri.S
 * file name		        : inventorymanager/loyaltyPrograms/viewGiftVouchers.jsp
 * file type		        : JSP
 * description				: display specific Gift Voucher Details
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
<%-- 	//<script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script> --%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/order.js"></script>
	<script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/countries.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/crm/loyaltyPrograms/giftVouchersAndGiftCoupons.js"></script>
<style>
  /* .odd{display:none!important;} */
 /*  table ,tr td{
    border:1px solid red
}
tbody {
    display:block;
    height:100px;
    overflow:auto;
}
thead, tbody tr {
    display:table;
    width:100%;
}
thead {
    width: calc( 100% - 1em )/* scrollbar is average 1em/16px width, remove it from thead width */
}
table {
    width:400px;
} */
</style>
<script type="text/javascript">
$(document).ready(function(){
	callCalender('expiryDate');
	print_country("country");
	 $("#country").val($("#countrySelected").val());
	 var date = getCurrentDate();
	 //$("#country").val("India");
	 /*var date = getCurrentDate();
	 $('#date').val(date);
	 var status = $("#orderStatus").val();
	 if(status == "pending" || status == "Pending"){
		$("#edit").css("visibility", "visible");
		$("#edit1").css("visibility", "visible");
	} 
	else
		$("#edit").css("visibility", "hidden"); 
	 var states= $("#selectedState").val();
	states = states.split(',');
	var op = "";
	for(var i=0;i<states.length;i++){
		op= op+"<option>"+states[i]+"</option>";
	}
	$("#state").html(op);
	var locations =$("#selectedLocation").val();
	locations = locations.split(',');
	op="";
	for(var i=0;i<locations.length;i++){
		op= op+"<option>"+locations[i]+"</option>";
	}
	$("#location").html(op); */
	
	 var slectedLocations = $("#selectedLocation").val().replace('[','').replace(']','').replace(/, /g,',');
		$("#location").val(slectedLocations.split(','));
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
  <div class="col-lg-12">
				<div class="box box-primary">
                                <div class="box-header" style="text-align: center">
                                <h3> <label  style="padding :5px;  border:1px solid  #808080;"><spring:message code="gift.voucher.details.label" /></label></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form >
                                   <div class="box-body">
                                	<div class="row" style="text-align: right;">
						 <input type="button" class="btnCls" style="" onclick="validateGiftVouchers('edit','giftVouchers')" value="<spring:message code="submit.label" />" />
							<input type="button" class="btn bg-olive btn-inline" style="margin-left:2%; margin-right: 1%;" onclick="viewGiftVouchers('giftVouchers','GiftVoucher','0','menu');" value="<spring:message code="back.label" />" />
						</div>
								
                                     
                                   		<div class="row">
                                   	 <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                                     <div id="Success" style="text-align:center;color:blue;font-weight:bold;">${success}</div>
                                     
                                     </div>
                                                                                  	<div style="background: #efefef;padding: 4px 20px;">
                                     
                                   	<div class="row">
                                   		<div class="form-group col-lg-2">
                                             <label style="font-family: Calibri;color: gray;"><spring:message code="promo.code.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="voucherProgramCode" name="voucherProgramCode" readonly style="width:100%;" value="${giftVoucher.voucherProgramCode}"/>
                                             <span style="color:red; font-size:2;font-weight:bold;" id="errVoucherProgramCode"></span>
                                     	</div>
                                   		<div class="form-group col-lg-2">
                                             <label style="font-family: Calibri;color: gray;"><spring:message code="promo.name.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="promoName" name="promoName" style="width:100%;"  value="${giftVoucher.promoName}"/>
                                             <span style="color:red; font-size:2;font-weight:bold;" id="errPromoName"></span>
                                     	</div>
                                   		
										
										<div class="form-group col-lg-2">
                                             <label style="font-family: Calibri;color: gray;"><spring:message code="unit.cash.value.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="unitCashValue" name="unitCashValue" style="width:65%;" value="${giftVoucher.unitCashValue}" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                            <span style="color:red; font-size:2;font-weight:bold;" id="errUnitCashValue"></span>
                                     	</div>
                                     	<div class="form-group col-lg-2">
                                             <label style="font-family: Calibri;color: gray;"><spring:message code="no.of.vouchers.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="quantity" name="quantity" readonly value="${giftVoucher.quantity}" style="width:65%;"oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                            <span style="color:red; font-size:2;font-weight:bold;" id="errQuantity"></span>
                                    	</div>
                                    	
                                    	<div class="form-group col-lg-2" style="padding-right: 0px;">
					                           <label style="font-family: Calibri;color: gray;white-space: nowrap;">Tender Name</label>
					                          <select class="form-control" name="tenderName" id="tenderName" style="width:80%;">
					                           		 <%-- <option value=""><spring:message code="ALL.label"/></option> --%>
						                             <c:forEach var="tender" items="${tenderDetails}">
						                             <c:if test="${tender.modeOfPayment == 'Gift Voucher'}">
														<option value="${tender.tenderName}" ${giftVoucher.tenderName == tender.tenderName ? 'selected' : ''}>${tender.tenderName}</option>
											 		</c:if>
											 		</c:forEach> 
						                        </select>
						                        <span style="color:red; font-size:2;font-weight: bold" id="errTenderName"></span>
					                    
                                    	</div>
                                    	
                                    	<div class="form-group col-lg-2" style="">
										  
										   <div class="from-group col-lg-12" style="padding-left: 0px;margin-top: 20px;">
									
												 <label style="font-family: Calibri;color: gray;"><spring:message code="gift.voucher.ispaid" /></label>
												<div class="col-lg-1" style="padding-left: 0px;">
												<c:choose>
                                           		<c:when test="${giftVoucher.isPaidFlag =='true'}">
	                                           <input type="checkbox" checked id="isPaidFlag" name="isPaidFlag" value="true">
	                                           </c:when>
	                                           <c:otherwise>
	                                           <input type="checkbox" id="isPaidFlag" name="isPaidFlag" value="false"> 
	                                           </c:otherwise>
	                                           </c:choose>
												
												</div>
											</div>
										  
										  </div>
                                    	
                                    	
                                    	</div>
                                    	<div class="row">
                                      	<div class="form-group col-lg-2">
                                             <label style="font-family: Calibri;color: gray;"><spring:message code="total.cash.value.label" /></label>
                                            <input type="text" class="form-control" id="totalCashValue" readonly="readonly" style="width:50%;" name="totalCashValue" value="${giftVoucher.totalCashValue}"oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
                                             <span style="color:red; font-size:2;font-weight:bold;" id="errTotalCashValue"></span>
                                    	</div>
                                    	
										<div class="form-group col-lg-2">
                                             <label style="font-family: Calibri;color: gray;"><spring:message code="date.label" /> <span style="color:red; font-size:2">*</span></label>
                                             <!-- <input type="text" class="form-control"  name="createdOn" readonly="readonly" id="date" value=""/> -->
                                            <div class="input-group">
                                            	<div class="input-group-addon">
                                                	<i class="fa fa-calendar"></i>
                                            	</div>
                                            	<input class="form-control" readonly="readonly" style="background-color: white;width:50%;" name="createdOnStr" id="createdOn" size="20" type="text" value="${giftVoucher.createdOnStr}" placeholder="DD/MM/YYYY"/>
                                            	<!-- <input type="text" name="createdOn" id="createdOn" required class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/> -->
                                       		 </div> <!-- /.input group -->
                                       		  <span style="color:red; font-size:2;font-weight:bold;" id="createdOnError"></span>
                                        </div>
                                        
                                         <div class="form-group col-lg-2">
                                             <label style="font-family: Calibri;color: gray;"><spring:message code="expiry.date.label" /> <span style="color:red; font-size:2">*</span></label>
                                             <div class="input-group">
                                            	<div class="input-group-addon">
                                                	<i class="fa fa-calendar"></i>
                                            	</div>
                                            	<input class="form-control" readonly="readonly" style="background-color: white;width:50%;" name="expiryDateStr" id="expiryDate" size="20" type="text" onfocus="callCalender('expiryDate')" onclick="callCalender('expiryDate')" value="${giftVoucher.expiryDateStr}" placeholder="DD/MM/YYYY"/>
                                            	<!-- <input type="text" name="expiryDate" id="expiryDate" required class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/> -->
                                       		 </div><!-- /.input group -->
                                       		  <span style="color:red; font-size:2;font-weight:bold;" id="expiryDateError"></span>
                                         </div>
                                         <div class="form-group col-lg-2">
                                             <label style="font-family: Calibri;color: gray;"><spring:message code="validity.period.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control"  name="validityPeriod" id="validityPeriod" value="${giftVoucher.validityPeriod}" style= "width:60%;" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.no.of.days.label" />" />
                                              <span style="color:red; font-size:2;font-weight:bold;" id="errValidityPeriod"></span>
                                    	</div>
                                    	
                                    	<div class="form-group col-lg-2" style="padding-right: 0px;">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="productGroup.label" /><!--  <span style="color:red; font-size:2">*</span> --></label>
                                             <select class="form-control" name="productGroup" id="productGroup" style="width: 80%;">
	                                            <option value="" >ALL</option>
	                                        <c:forEach var="groupsList" items="${groupsList}">
	                            			 <option value="${groupsList.groupId}" ${giftVoucher.productGroup == groupsList.groupId ? 'selected' : ''}>${groupsList.groupId}</option>
											</c:forEach>
	                                         </select>
										
                                    	</div>
                                    	
                                    	<div class="form-group col-lg-2" style="">
										  
										   <div class="from-group col-lg-12" style="padding-left: 0px;margin-top: 20px;">
									
												 <label style="font-family: Calibri;color: gray;">is<spring:message code="crm.otp.required" /></label>
												<div class="col-lg-1" style="padding-left: 0px;">
												<c:choose>
                                           		<c:when test="${giftVoucher.otp_requirement =='true'}">
	                                           <input type="checkbox" checked id="isOTPFlag" name="isOTPFlag" value="true">
	                                           </c:when>
	                                           <c:otherwise>
	                                           <input type="checkbox" id="isOTPFlag" name="isOTPFlag" value="false"> 
	                                           </c:otherwise>
	                                           </c:choose>
												
												</div>
											</div>
										  
										  </div>
                                    	</div>
									<div class="row">
                                     	  <div class="form-group col-lg-2" >
                                             <label style="font-family: Calibri;color: gray;" >Assigned</label>
                                             <select class="form-control" name="assignedStatusStr" id="assignedStatus" style="width:50%;">
	                                            <option value="0"${giftVoucher.assigned_voucher==true?'selected':''}>Yes</option>
    	                                        <option value="1"${giftVoucher.assigned_voucher==false?'selected':''}>No</option>
                                            </select>
										  
										  </div>
                                     	
                                     		<div class="form-group col-lg-2">
                                             <label style="font-family: Calibri;color: gray;">Min Bill Amount</label>
                                            <input type="text" class="form-control" id="min_bill_amount"  name="min_bill_amount" style= "width:50%;"  value="${giftVoucher.min_bill_amount}" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"  />
                                              
                                             <span style="color:red; font-size:2;font-weight:bold;" id="errTotalCashValue"></span>
                                    	</div>
                                    	
                                    	<div class="form-group col-lg-2" >
                                             <label style="font-family: Calibri;color: gray;"  >Multiple Claims<span style="color:red; font-size:2">*</span></label>
                                             <select class="form-control" name="multipleInt" onchange="multipleCheckValidation()" disabled style= "width:60%;"  id="multipleInt">
	                                            <option value="1" ${giftVoucher.multiple==true?'selected':''}>yes</option>
    	                                        <option value="0" ${giftVoucher.multiple==false?'selected':''}>no</option>
                                            </select>
										</div>
                                    	
                                     
                                     		<div class="form-group col-lg-2" style="margin-bottom: 0px;">
                                             <label style="font-family: Calibri;color: gray;"><spring:message code="loyalty.status.label" /><!--  <span style="color:red; font-size:2">*</span> --></label>
                                             <select class="form-control" name="status" id="status" style= "width:60%;" >
	                                            <option value="Active"${giftVoucher.status=='Active'?'selected':''}>Active</option>
    	                                        <option value="Suspend"${giftVoucher.status=='Suspend'?'selected':''}>Suspend</option>
                                            </select>
                                            
                                           
										</div>
										<div class="form-group col-lg-2" style=""></div>
										<div class="form-group col-lg-2" style="">
										   <div class="from-group col-lg-12" style="padding-left: 0px;margin-top: 20px;white-space: nowrap;">
									
											 <label style="font-family: Calibri;color: gray;">On discounted bill</label>
											<div class="col-lg-1" style="padding-left: 0px;">
											
											
													<c:choose>
                                           		<c:when test="${giftVoucher.on_discounted_bill_price =='true'}">
	                                           <input type="checkbox" checked id="on_discounted_bill_price" name="on_discounted_bill_price" value="true">
	                                           </c:when>
	                                           <c:otherwise>
	                                         <input type="checkbox" id="on_discounted_bill_price" name="on_discounted_bill_price" value="false">
	                                           </c:otherwise>
	                                           </c:choose>
											
	                                           
											</div>
											</div>
										  
										  </div>
										
										  </div>
										  </div>
										  
									<!--  Written by: Manideep
									Reason: To add the is paid flag  -->  	  
										  <div class="row">
										  
										
										
										 <div class="form-group col-lg-2"  style="    margin-bottom: 0px !important;">
										 <%-- <div class="row" style="margin-left: 1%">
										  <label style="font-family: Calibri;color: gray;" style="text-decoration: underline; font-size: 16px;"><spring:message code="loyalty.locations.label" /></label>
										 </div> --%>
                                             <label style="font-family: Calibri;color: gray;"><spring:message code="loyalty.country.label" /></label>
                                           <!--  <select onchange="addSelectedState(this.selectedIndex);" id="country" name ="country" class="form-control" > -->
                                            <select onchange="print_state('state',this.selectedIndex);" id="country" name ="country"style= "width:50%;"  class="form-control" >
												<!-- <option >Select Country</option> -->
											</select>
											
											<input type = "hidden" value = "${giftVoucher.country}" id="countrySelected"/>
                                     	</div>
										
										
										
													                            <input type = "hidden"   id ="actionTest" value = "true"/>
										
										
										  
										  
										  </div>
										  
										  
									<div class="row" >
									
										<div class="form-group col-lg-2">
                                             <label style="font-family: Calibri;color: gray;"><spring:message code="zones.all" /> <span style="color:red; font-size:2">*</span></label>
                                            <select onchange="getLocationsBasedonZones();" id ="zones"  style= "width:100%;"  multiple="multiple" class="form-control" >
    										 <c:forEach var="zoneList" items="${zoneList}">
    										    <c:set var="zs" value="false"/>
    										    <c:forEach var="zonestr" items="${zones}">
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
									<span style="color:red; font-size:2;font-weight:bold;" id="errStates"></span> 
                                    	</div>
										  
											<div class="form-group col-lg-2">
                                             <label style="font-family: Calibri;color: gray;"><spring:message code="loyalty.locations.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <select id ="location" multiple="multiple" class="form-control"  style= "width:100%;" >
    											<!-- <option >Select State</option> -->
    									<c:forEach var="locationDetails" items="${locationsbasedzone}">
												<option value="${locationDetails}">${locationDetails}</option>
											</c:forEach>			
    											
    										</select>
    										<span style="color:red; font-size:2;font-weight:bold;" id="errLocation"></span>
                                    	</div>
                                      
                                    	
                                      	<div class="form-group col-lg-6">
                                             <label style="font-family: Calibri;color: gray;"><spring:message code="card.description.label" /></label>
                                            <textarea style="resize:none;padding: 10px 10px;" class="form-control"  name="description" rows="3">${giftVoucher.description}</textarea>
                                     	</div>
                                     	</div>
									  
                                     	  <br>
									  
                             
                               
                               
                               <div class="col-lg-12" style="padding-left:0px;">
									
										<div class="row" style="margin-top: 1.5%"> 
								 			
								 
								   <div class="form-group col-lg-7" style="text-align:center;  margin-bottom: 0px;    ;">
										<input type="text"  class="form-control searchItems" value="${searchCriteria}" id="searchItems"  placeholder="Search Gift Vouchers here.."   style="height:30PX;text-align:left;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
											<div class="services">
						    					<div class="items">
						     						<ul class="matchedStringUl searchVoucherItems" style=""></ul>
						   						</div>
											</div>
									</div>
									
									
									<div class="col-lg-1 col-xs-1" style="width:12.5%">
				                      			<select class="form-control" id="needtoset2" style="padding: 3px 4px;" ><!-- onchange = "searchGiftVouchers('',0,false)" -->
												<option value="Active"${'Enable' ==voucher.claimStatus ? 'selected' : ''}>Active</option>
                                             <option value="InActive"${'Enable' == voucher.claimStatus ? 'selected' : ''}>InActive</option>
				                      			</select>
				                     		 </div>
				                     		 <div class="col-lg-1 col-xs-1" style="width:12.5%">
				                      			<select class="form-control" id="needtoset" style="padding: 3px 4px;"> <!-- onchange = "searchGiftVouchers('',0,false)" -->
				                      				<option value="Active"${'Enable' ==voucher.claimStatus ? 'selected' : ''}>Active</option>
                                             <option value="InActive"${'Enable' == voucher.claimStatus ? 'selected' : ''}>InActive</option>
                                           	</select>
				                     		 </div>
				                     		  <div class="col-lg-1 col-xs-1" style="">
				    <input type="button" onclick="searchGiftVouchers('',0,false)" class="btn bg-olive btn-inline  addBtn" value="GO">

				                     		 </div>
									
									
									<div class="form-group col-lg-1" style="padding: 0px;text-align:center;  margin-bottom: 0px;">
									 <input type="button" onclick="return searchGiftVouchers('',0,true)" class="btn bg-olive btn-inline  addBtn" value="SAVE">
										
																				
									</div>
									
									</div>
									</div>
									
									 <div id = "voucherDetails">
									
                                       <div class="col-lg-12" style="padding:0px;"> 
                                      <div class="table-responsive" style="overflow-x:overlay;">
                                        <table id="cardsDetails" class="table table-bordered table-hover" style=" margin-top: 0px !important;">
                                          <thead style="background-color: #3c8dbc; color: #ffffff;">
                                            <tr>
                                                <th><div style="min-width: 40px;"><spring:message code="slno.label"/></div></th>
                                            	<th><div style="min-width: 90px;"><spring:message code="gift.voucher.code.label"/></div></th>
                                            	<th><div style="min-width: 70px;"><spring:message code="gift.voucher.id.label"/></div></th> 
                                                <th><div style="min-width: 65px;"><spring:message code="issue.date.label"/></div></th>
                                                <th><div style="min-width: 80px;"><spring:message code="issued.at.label"/></div></th>
                                                <th><div style="min-width: 100px;"><spring:message code="customer.name.label"/></div></th>
                                                <th><div style="min-width: 100px;"><spring:message code="customer.mail.label"/></div></th>
                                                <th><div style="min-width: 105px;"><spring:message code="customer.mobile.label"/></div></th>
                                                <th><div style="min-width: 85px;"><spring:message code="status.label"/></div></th>
                                                <th><div style="min-width: 70px;"><spring:message code="claim.status.label"/></div></th>  
                                                <th><div style="min-width: 70px;"><spring:message code="claimed.at.label"/></div></th>       
                                                <th><div style="min-width: 45px;"><spring:message code="bill.ref.label"/></div></th>
                                                <th><div style="min-width: 90px;"><spring:message code="value.label"/></div></th>
                                                <th><div style="min-width: 80px;"><spring:message code="valid.dates.label"/></div></th>
                                                <th><div style="min-width: 80px;"><spring:message code="EmployeeForm.action"/></div></th>
                                           
                                           </tr>
                                          </thead>
                            			<tbody style="text-align: center;">
                                           <c:forEach var="voucher" items="${giftVoucher.giftVouchers}" varStatus="theCount">
                                        	 <tr style='margin-top:5px;'>
                                        	 <td>${theCount.count+index-1}</td>
                                        	 
                                        	 
                                        	 
                                        	 	<td id="voucherCode${theCount.count}">${voucher.voucherCode}</td>
                                            	<td id="voucherId${theCount.count}" >${voucher.voucherId}</td>
                                            	
                                            	
                                            	  <c:set var="inside" value="0"></c:set> 
                                   <c:forEach var="voucherInfo" items="${giftVoucher.customerGiftVouchers}" >
                                                  
                                 <c:if test="${voucher.voucherCode==voucherInfo.voucherCode}">
                                            	
                                            
                                                <td id="issueDate${theCount.count}">${voucherInfo.issuedAtStr}</td>
                                               <td ><input class="form-control issuedAt${theCount.count}" type="text"  id="issuedAt${theCount.count}"  readonly="readonly" value="${voucherInfo.issuedAt}"></td>
                                                <td><input class="form-control customerName${theCount.count}" type="text"  readonly="readonly" id="customerName${theCount.count}" value="${voucherInfo.customerName}"></td>
                                              	<td><input class="form-control customerEmail${theCount.count}" type="text"  readonly="readonly" id="customerEmail${theCount.count}" value="${voucherInfo.customerEmail}"></td>
                                                <td><input class="form-control customerMobile${theCount.count}" type="text"   readonly="readonly" id="customerMobile${theCount.count}" value="${voucherInfo.customerMobile}"></td>
                                               
                                               <c:set var="inside" value="1"></c:set> 
                                               </c:if>
                                               </c:forEach>
                                               
                                               
                                               <c:if test="${inside == 0}">
                                                <td id="issueDate${theCount.count}"></td>
                                               <td ><input class="form-control issuedAt${theCount.count}" type="text"  id="issuedAt${theCount.count}"  readonly="readonly" value=""></td>
                                                <td><input class="form-control customerName${theCount.count}" type="text"  readonly="readonly" id="customerName${theCount.count}" value=""></td>
                                              	<td><input class="form-control customerEmail${theCount.count}" type="text"  readonly="readonly" id="customerEmail${theCount.count}" value=""></td>
                                                <td><input class="form-control customerMobile${theCount.count}" type="text"   readonly="readonly" id="customerMobile${theCount.count}" value=""></td>
                                             
                                               </c:if>
                                               
                                              
                                               
                                               <input type="hidden" id="assignedStatus${theCount.count}" value="${voucher.assignedStatus}">
                                
                                 
                                                <td>
                                                <select class="form-control voucherStatus${theCount.count}" style="width:100%"  id="voucherStatus${theCount.count}"  disabled="disabled" >
                                             <option value="1"${voucher.voucherStatus == 1?'selected':''}>Active</option>
    	                                        <option value="0"${voucher.voucherStatus == 0?'selected':''}>InActive</option>
                                                </select>
                                                </td>
                                                
                                              
                                               <c:set var="inside2" value="0"></c:set> 
                                   <c:forEach var="voucherInfo" items="${giftVoucher.customerGiftVouchers}" >
                                                  
                                 <c:if test="${voucher.voucherCode==voucherInfo.voucherCode}">
                                              
                                                <td><select class="form-control claimStatus${theCount.count}" style="width:100%"  id="claimStatus${theCount.count}"  disabled="disabled" >
                                            <option value="1"${voucherInfo.claimStatus == 1?'selected':''}>Yes</option>
    	                                        <option value="0"${voucherInfo.claimStatus == 0?'selected':''}>No</option>
                                                </select>
                                                </td>
                                                <td id="claimedAt${theCount.count}">${voucherInfo.claimedAt}</td>
                                                <td id="billRef${theCount.count}">${voucherInfo.billRef}</td>
                                                <td id="voucherValue${theCount.count}">${voucherInfo.voucherValue}</td>
                                                <td id="validityDate${theCount.count}">${voucherInfo.validityDateStr}</td>
                                                 <c:set var="inside2" value="1"></c:set> 
                                                </c:if>
                                                </c:forEach>
                                                
                                                <c:if test="${inside2 == 0}">
                                                
                                                
                                                 <td><select class="form-control claimStatus${theCount.count}" style="width:100%"  id="claimStatus${theCount.count}"  disabled="disabled" >
    	                                        <option value="0"${voucherInfo.claimStatus == 0?'selected':''}>No</option>
                                                <option value="1"${voucherInfo.claimStatus == 1?'selected':''}>Yes</option>
                                                </select>
                                                </td>
                                                
                                                
                                                <td id="claimedAt${theCount.count}"></td>
                                                <td id="billRef${theCount.count}"></td>
                                                <td id="voucherValue${theCount.count}"></td>
                                                <td id="validityDate${theCount.count}"></td>
                                                
                                                </c:if>
                                                
                                                
                                            <td id="Edit${theCount.count}"> <a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return voucherEdit('${theCount.count}')">Edit</a></td>
                                                
                                            </tr>
                                           </c:forEach>
                                     
                                           </tbody>
                                        </table>
                                        <br/>
                                    </div>
                                     
                                 
                                    
                                    </div>
           
			 <div class="col-lg-12" style = "padding:0px;">
			 <c:set var ="totalRecords" value="${giftVoucher.quantity}"/>
                  <c:if test="${index-1 == 0 && totalRecords > maxRecords}">
              		<div class="form-group col-lg-6" style="padding:0px;text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="searchGiftVouchers('','${totalValue}',false)">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6" style="padding:0px;text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return searchGiftVouchers('','${index - (maxRecords + 1)}',false)"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-maxRecords <= 0}">
              		<div class="form-group col-lg-6" style="text-align: left;padding:0px;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;padding:0px;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return searchGiftVouchers('','${index - (maxRecords + 1)}',false) ;"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="searchGiftVouchers('','${totalValue}',false)">
              	</div> 
              	</c:if>
              	
              	
                  
                  
                  <div class="col-lg-6" style = "padding:0px;">
                  <div class="col-lg-6"></div>
              	<div class="col-lg-2" style="text-align: right;padding-right: 0px;margin-top: 2px;font-size: 16px;"><spring:message code="pages.label" /></div>
              	<div class="col-lg-2" style="padding-right: 0px;">
              		<select class="form-control" id="pagination">
              		<c:set var="totalRecords" value="${totalRecords}"></c:set>
              	<c:forEach var="i" begin="0" end="${totalRecords}">
              	<c:if test="${(totalRecords)>0}">
              		<option value="${(i*maxRecords)}" ${index-1 == i*maxRecords ? 'selected' : ''}> ${i+1}</option>
              		<c:set var="totalRecords" value="${totalRecords-maxRecords}"></c:set>
              	</c:if>
				</c:forEach>
					</select>
              	
              	</div>
              		<div class="col-lg-2" style="padding-right: 0px;">
              		  <input type="button" onclick="searchGiftVouchers('',document.getElementById('pagination').value,'',false);" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
             
				</div>
                  </div> 
			               
                                     <input type = "hidden" name = "zone"  id ="zone" value = ""/>
									                                     <input type="hidden" id="selectedLocation"  name="locations" value="${locationList}">
									
                                    
                               </div>      
                               
                               <br>      
						<div class="row" style="text-align: right;">
						 <input type="button" class="btnCls" style="" onclick="validateGiftVouchers('edit','giftVouchers')" value="<spring:message code="submit.label" />" />
							<input type="button" class="btn bg-olive btn-inline" style="margin-left:2%; margin-right: 1%;" onclick="viewGiftVouchers('giftVouchers','GiftVoucher','0','menu');" value="<spring:message code="back.label" />" />
						</div>
						<br/>
                                    <div class="box-footer">
                                    </div>
                         </div>           
                                </form>
                            </div>

</div>
</div>
</section><!-- /.content -->
  <!-- InputMask -->
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
<script type="text/javascript">
            $(function() {
                //Datemask dd/mm/yyyy
                $("#validityDate").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
                $("#validTo").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
            });
            </script>
        <script type="text/javascript">
            $(function() {
               $('#cardsDetails').dataTable({
            	   "bPaginate": false,
                   "bLengthChange": false,
                   "bFilter": false,
                   "bSort": false,
                   "bInfo": false,
                   "bAutoWidth": true
                });
             });
        </script>
</body>
</html>
		    		 