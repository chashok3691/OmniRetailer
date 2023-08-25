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
 
<script type="text/javascript">
$(document).ready(function(){
	callCalender('createdOn');
	callCalender('expiryDate');
	print_country("country");
	 var date = getCurrentDate();
//	 $('#date').val(date);
	 $("#country").val("India");
		print_state('state',104);
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
                                <br/>
                                <h3><spring:message code="generate.new.gift.cards.label" /></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form id="newGiftVouchers" method="post" >
                                    <div class="box-body">
                                   	<div id="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;">${err}</div>
                                   	<div class="row">
                                   		<div class="form-group col-lg-3">
                                            <label><spring:message code="promo.name.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="promoName" name="promoName" value=""/>
                                             <span style="color:red; font-size:2" id="errPromoName"></span>
                                     	</div>
                                   		<%-- <div class="form-group col-lg-3">
                                            <label><spring:message code="voucher.type.label" /><!--  <span style="color:red; font-size:2">*</span> --></label>
                                             <select class="form-control" name="card_type" id="card_type">
	                                            <option value="Voucher">Voucher</option>
    	                                        <option value="Coupon">Coupon</option>
                                            </select>
										</div> --%>
										
										<div class="form-group col-lg-3">
                                            <label><spring:message code="unit.cash.value.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="unitCashValue" name="unitCashValue" value="" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                            <span style="color:red; font-size:2" id="errUnitCashValue"></span>
                                     	</div>
                                     	<div class="form-group col-lg-3">
                                            <label><spring:message code="no.of.vouchers.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="quantity" name="quantity" value="" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                            <span style="color:red; font-size:2" id="errQuantity"></span>
                                    	</div>
                                      	<div class="form-group col-lg-3">
                                            <label><spring:message code="total.cash.value.label" /></label>
                                            <input type="text" class="form-control" id="totalCashValue" readonly="readonly" name="totalCashValue" value="" />
                                             <span style="color:red; font-size:2" id="errTotalCashValue"></span>
                                    	</div>
                                    	</div>
                                    	<div class="row">
                                    	
										<div class="form-group col-lg-3">
                                            <label><spring:message code="date.label" /> <span style="color:red; font-size:2">*</span></label>
                                             <!-- <input type="text" class="form-control"  name="createdOn" readonly="readonly" id="date" value=""/> -->
                                            <div class="input-group">
                                            	<div class="input-group-addon">
                                                	<i class="fa fa-calendar"></i>
                                            	</div>
                                            	<input class="form-control" readonly="readonly" style="background-color: white;" name="createdOn" id="createdOn" size="20" type="text" onfocus="callCalender('createdOn')" onclick="callCalender('createdOn')" placeholder="DD/MM/YYYY"/>
                                            	<!-- <input type="text" name="createdOn" id="createdOn" required class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/> -->
                                       		 </div> <!-- /.input group -->
                                       		  <span style="color:red; font-size:2" id="createdOnError"></span>
                                        </div>
                                         <div class="form-group col-lg-3">
                                            <label><spring:message code="expiry.date.label" /> <span style="color:red; font-size:2">*</span></label>
                                             <div class="input-group">
                                            	<div class="input-group-addon">
                                                	<i class="fa fa-calendar"></i>
                                            	</div>
                                            	<input class="form-control" readonly="readonly" style="background-color: white;" name="expiryDate" id="expiryDate" size="20" type="text" onfocus="callCalender('expiryDate')" onclick="callCalender('expiryDate')" placeholder="DD/MM/YYYY"/>
                                            	<!-- <input type="text" name="expiryDate" id="expiryDate" required class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/> -->
                                       		 </div><!-- /.input group -->
                                       		  <span style="color:red; font-size:2" id="expiryDateError"></span>
                                         </div>
                                         <div class="form-group col-lg-3">
                                            <label><spring:message code="validity.period.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control"  name="validityPeriod" id="validityPeriod" value="" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.no.of.days.label" />" />
                                              <span style="color:red; font-size:2" id="errValidityPeriod"></span>
                                    	</div>
                                    	<div class="form-group col-lg-3">
                                            <label><spring:message code="loyalty.status.label" /><!--  <span style="color:red; font-size:2">*</span> --></label>
                                             <select class="form-control" name="status" id="status">
	                                            <option value="Active">Active</option>
    	                                        <option value="Suspend">Suspend</option>
                                            </select>
										</div>
									</div>
									<div class="row">
										 <div class="form-group col-lg-3">
										 <%-- <div class="row" style="margin-left: 1%">
										 <label style="text-decoration: underline; font-size: 16px;"><spring:message code="loyalty.locations.label" /></label>
										 </div> --%>
                                            <label><spring:message code="loyalty.country.label" /></label>
                                           <!--  <select onchange="addSelectedState(this.selectedIndex);" id="country" name ="country" class="form-control" > -->
                                            <select onchange="print_state('state',this.selectedIndex);" id="country" name ="country" class="form-control" >
												<!-- <option >Select Country</option> -->
											</select>
                                     	</div>
                                      	<div class="form-group col-lg-3">
                                            <label><spring:message code="loyalty.state.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <select onchange="getLocations();" id ="state" multiple="multiple" class="form-control" >
    											<!-- <option >Select State</option> -->
    										</select>
    										<span style="color:red; font-size:2" id="errStates"></span>
                                    	</div>
                                    	<div class="form-group col-lg-3">
                                            <label><spring:message code="loyalty.locations.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <select id ="location" multiple="multiple" class="form-control">
    											<!-- <option >Select State</option> -->
    										</select>
    										<span style="color:red; font-size:2" id="errLocation"></span>
                                    	</div>
                                    	
									  </div>
									  
                                        <div class="row" >
                                      	<div class="form-group col-lg-12">
                                            <label><spring:message code="card.description.label" /></label>
                                            <textarea style="resize:none" class="form-control"  name="description" rows="2"></textarea>
                                     	</div>
                                     	</div>
									  
									  
                                     <input type="hidden" id="selectedState" name="states">
                                     <input type="hidden" id="selectedLocation" name="locations">
                                    </div><!-- /.box-body -->
									
						<div class="row" style="text-align: center;">
						 <input type="button" class="btn bg-olive btn-inline" style="width: 65px;" onclick="validateGiftVouchers('new','giftVouchers')" value="<spring:message code="save.label" />" />
					 <c:if test="${sessionScope.role == 'super admin'}"> 
					 	<input type="button" class="btn bg-olive btn-inline" style="margin-left:5%;" onclick="viewGiftVouchers('giftVouchers','0');" value="<spring:message code="cancel.label" />" />
					 </c:if>
					<c:forEach var="accessControl" items="${sessionScope.loyaltyProgram}">
                        <c:if test="${accessControl.appDocument == 'GiftVoucher' && accessControl.write == true && accessControl.read == true}">
							<input type="button" class="btn bg-olive btn-inline" style="margin-left:5%;" onclick="viewGiftVouchers('giftVouchers','0');" value="<spring:message code="cancel.label" />" />
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