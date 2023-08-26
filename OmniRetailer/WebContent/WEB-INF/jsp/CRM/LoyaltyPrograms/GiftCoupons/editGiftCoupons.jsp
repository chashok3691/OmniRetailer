<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 *modified by               : Manasa
 * file name		        : Inventory Manager/loyaltyPrograms/newGiftCoupons.jsp
 * file type		        : JSP
 * description				: The new product is displayed using this jsp
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Home | Omni Retailer</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/countries.js"></script>
<link
	href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/controller.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/crm/loyaltyPrograms/giftVouchersAndGiftCoupons.js"></script>


<style type="text/css">
.col-xs-6 {
	width: 82% ! important;
}

.modal-backdrop {
	opacity: 0.0 !important;
}

.modal {
	
}

.modal-dialog {
	margin-top: 10%;
}

.modal-content {
	background-color: #fefefe;
	text-align: left;
	width: 80%;
	margin-left: 60%;
	overflow-y: scroll;
	overflow-x: hidden;
	height: 150px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
				callCalender('createdOn');
				callCalender('expiryDate');
				print_country("country");
				var date = getCurrentDate();
				//	 $('#date').val(date);
				$("#country").val("India");
				// 	 getLocationsBasedonZones();
				// 		print_state('state',104);
				// 		getLocations();
				debugger
				/* Added by : Swathi */
				setDealSlabDivContent();
				setDealProductDivContent();
			
				var slectedLocations = $("#selectedLocation").val().replace(
						'[', '').replace(']', '').replace(/, /g, ',');
				$("#location").val(slectedLocations.split(','));
				
				

			
	
	$("#promoName").keydown(function() {
		$("#errPromoName").html("");
		$("#Error").html("");
	});

	$("#startDateStr").keydown(function() {
		$("#errCreatedOn").html("");
		$("#Error").html("");
	});

	$("#zones").change(function() {
		$("#errStates").html("");
		$("#Error").html("");
	});

	// $("#state").change(function(){
	// 	   $("#errStates").html("");
	// 	   $("#Error").html("");
	// });
	$("#location").change(function() {
		$("#errLocation").html("");
		$("#Error").html("");
	});

	/* $("#nofClaims").change(function(){
	 $("#errnofClaims").html("");
	 $("#Error").html("");
	 }); */

	$("#expiryDate").keydown(function() {
		$("#errExpiryDate").html("");
		$("#Error").html("");
	});
	$("#quantity").keyup(function() {
		$("#errQuantity").html("");
		$("#Error").html("");
	});
	$("#validityPeriod").keyup(function() {
		$("#errValidityPeriod").html("");
		$("#Error").html("");
	});
	$("#unitCashValue").keyup(function() {
		$("#errUnitCashValue").html("");
		$("#Error").html("");
	});

	$("#quantity").blur(function() {
		var unitVal = parseFloat($("#unitCashValue").val());
		var quantity = parseInt($("#quantity").val());
		if (!isNaN(unitVal) && !isNaN(quantity)) {
			$("#discountTotal").val(unitVal * quantity);
		}
	});

	$("#unitCashValue").blur(function() {
		var unitVal = parseFloat($("#unitCashValue").val());
		var quantity = parseInt($("#quantity").val());
		var noOfClaimsLimited = parseInt($("#noOfClaimsLimited").val());
		
		if(!isNaN(unitVal)&& !isNaN(quantity)){
			if(noOfClaimsLimited == "0"){
			$("#discountTotal").val(unitVal*quantity);	
			}else{
			$("#discountTotal").val(unitVal*quantity*noOfClaimsLimited);	
			}
			
		}
		
	});
	
	 $("#searchCoupons").val($("#searchname").val());
		$("#searchCoupons").focus();  
		debugger;
			$("#searchItems").focus();
			// var search = $('#searchItems').val();
			$('#searchItems').on('input',function(e){
				debugger;
				if($(this).val().trim()==""){
					var couponProgramCode = $('#promoCode').val();
					editLoyaltyGiftCouponForPagination(couponProgramCode,'0','','false');
				}
			});
			
			 $('#mySearch').click(function(){
			    return editLoyaltyGiftCouponForPagination('${giftCoupon.couponProgramCode}','0','','false');
			    });
			    $('#searchItems').keypress(function(e){
			        if(e.which == 13){//Enter key pressed
			            $('#mySearch').click();//Trigger search button click event
			        }
			    }); 
	
	});	
</script>
</head>
<body>
	<!-- Content Header (Page header) -->
	<%-- <section class="content-header">
   <h1><spring:message code="loyaltyprogram.label" />
     <small><spring:message code="giftCoupons.label" /></small>
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

						<h3>
							<label 
								style="padding :5px;  border:1px solid  #808080;">Coupon
								Configuration - ${giftCoupon.couponProgramCode}</label>
						</h3>
						<%--                                 <h3><spring:message code="new.gift.coupons.label" /></h3> --%>


						<a
							style="float: right; color: #2e7ea7 !important; cursor: pointer; width: 20%; margin-top: -45px;"
							data-toggle="modal" data-target="#myModal1"><u>Help</u></a>

						<div class="modal fade" id="myModal1" role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title"></h4>
									</div>
									<div class="modal-body">
										<p>TechnoLabs Retail Cloud platform provides Customer
											Loyalty program to the Retail Brands. Retailer can configure
											Coupons (both electronic and printed), issue, and monitor and
											take reports. Coupons can be used across sales channels i.e.
											Outlet POS, Online, Mobile Shopping, and Self Checkouts.
											Please note that TechnoLabs offers services for both Digital
											Commerce and Brick Mortar business.</p>
										<br>
										<p>It all starts with planning your campaign and
											configuration of Coupon programs. You can run multiple coupon
											programs at a time. In this section we are trying to make it
											simple for even first time user.</p>
										<br>
										<p>With TechnoLabs cloud platform, you can issue the below
											category/types of coupons with several constraints or
											scenarios.</p>
										<br>
										<ol style="list-style: none;">
											<li><b>1. Assigned Coupons - </b>Coupon must be assigned
												or mapped to the customer. Then only the customer can redeem
												the coupon while ordering online or billing at the POS
												(Point of Sale). Assigned coupons can be claimed only once.
												In other words, the coupon is marked as 'Claimed' once the
												customer does the redemption. You can set the below
												parameters against of Assigned Coupons.
												<ol style="list-style: none;">
													<li><b>a) Start Date:</b>Date from which the Coupon
														Program is active. It means from the start date, coupons
														can be issued to the customers. Customers can do
														redemption.</li>
													<li><b>b) End Date:</b> Last day of the Coupon
														program. After which the Coupons cannot be issued or
														claimed.</li>
													<li><b>c) Validity Period:</b>No of days a Coupon is
														valid from the date of Issue. No of days cannot exceed the
														difference between start date and end date. For example,
														if the validity period is 2 days, the customer has to
														redeem within 2 days from date of issue even though expiry
														date is far away.</li>
													<li><b>d) Min Bill Amount:</b>You need to enter the
														minimum amount the customer has to bill to claim the
														Coupon issued before. At POS level, the system rejects
														unless the bill values exceeds the min bill amount.</li>
													<li><b>e) Max Bill Amount:</b>Like previous one, this
														restriction sets the maximum bill amount while doing Bill
														at POS level. The same restriction is applied while
														ordering Online or using Mobile, provided the sales
														channels/locations are selected.</li>
													<li><b>f) Multiple Users:</b>By setting this option
														'Yes', same coupon can be issued to multiple users. For
														examples, company issues a coupon to its employees. The
														same coupon can be claimed by all employees only one time.
														You can set the limit for no of users/claims by entering
														value against of the field 'Total Claims'. By selecting
														option 'No', a coupon can be issued to only one user. It
														can be claimed the same user. When a coupon is of type
														'Single User', you can generate more than one coupon by
														entering the number against off the field 'No of Coupons'.</li>
													<li><b>g) No. of Coupons:</b>If the Coupon Program is
														of type 'multi-user', the default value is set as 1. On
														the other hand, if the program is of type Single User
														(Multi User option set as No), you need to a number
														indicating the no of coupons. This field sets the maximum
														number of coupons you can generate, issue, and then
														customers can redeem.</li>
													<li><b>h) Total Claims:</b>If the Coupon Program is of
														type Multi-User, you can set the cap on no of claims
														allowed with the Coupon. The coupons can be assigned or
														unassigned which is determined the option 'Assigned'.</li>
													<li><b>i) Split Redeem and Redemptions/Coupon:</b>The
														total value of the coupon can be claimed by billing
														multiple times.. For instance, total 1000 USD coupon can
														be claimed only by billing 4 times with minimum bill
														amount. This feature ensures that Customer comes back more
														than once.</li>
													<li><b>j) Discount Type:</b>The coupon can be of type
														Flat/Fixed value or % of the Bill value. You can set the
														coupon value by entering number in the 'Coupon Value'
														field.</li>
													<li><b>k) Coupon Value:</b>Depends on the previous
														parameter, Discount Type, one has to set the coupon value.
														You need to be careful when the Discount Type is of %
														Type. This value is sets discount percentage while doing
														Order or Bill. Customer does the Order when he/she is
														using TechnoLabs Online or Mobile commerce. The same
														coupon can be claimed at Outlets, provided locations are
														selected.</li>
													<li><b>l) Discount Total:</b>This gives final figure
														of the total coupon program. This is applicable to Flat
														Coupon type only. With % coupon type, we don't know what
														would be discount.</li>
													<li><b>m) Auto Generated:</b>With this option set, the
														system generates coupons. You can also import the coupon
														Ids using excel sheet. For a given program, the maximum
														number of coupons you can import is equal to the figure
														you entered against of the field No. of Coupons.</li>
													<li><b>n) OTP Required:</b>POS or Online commerce
														forces the customer to enter the OTP before Coupon
														redemption happens. If this option is not set, the
														customer can redeem the Coupon just by mentioning his/her
														phone number.</li>
												</ol></li>
											<li><b>2. Unassigned Coupons - </b> These are open
												coupons like you may publish in Facebook or other social
												media. All option mentioned above are applicable to
												Unassigned Coupons as well. However, the following options
												are not applicable to Unassigned Coupons.

												<ul style="list-style: none;">
													<li>a) OTP required is not applicable to Unassigned
														Coupons.</li>
													<li>b) For Unassigned Coupons, any user who comes with
														the Coupon is eligible. However, he/she can claim once.</li>
												</ul></li>
											<li><b>3. Other Options - Zone/Locations </b> You have
												provision to define the Zone or Locations where the Coupons
												are valid. Each zone may have multiple locations. Please
												note that location B2C is special. This location is logical
												location that indicates Digital Commerce.</li>
											<li><b>4. Coupons Import - </b> When the user doesn't
												select Auto Generate option, he/she has the option to import
												the coupons from the excel sheet. You need to prepare the
												excel sheet before importing. You may contact TechnoLabs for
												excel templates.</li>
										</ol>
									</div>
								</div>

							</div>
						</div>




					</div>
					<!-- /.box-header -->
					<!-- form start -->
					<form id="newGiftCoupons" method="post">
						<div class="box-body">
							<div id="Error"
								style="text-align: center; color: red; font-size: 2; font-weight: bold;">${err}</div>
							<div id="Success" class="Error"
								style="text-align: center; color: blue; font-size: 2; font-weight: bold;">${success}</div>

                                    	<div style="background: #efefef;padding: 4px 20px;">

							<div class="row">
								<div class="form-group col-lg-2">
									<div class="col-lg-12" style="">
										<label style="font-family: Calibri;color: gray;"><spring:message code="promo.code.label" /> </label><span
											style="color: red; font-size: 2">*</span> <input type="text"
											class="form-control" id="promoCode" style="width: 80%;"
											readonly="readonly"
											style="opacity: 1.5; pointer-events: none;"
											name="couponProgramCode"
											value="${giftCoupon.couponProgramCode}" /> <span
											class="clearErrors"
											style="color: red; font-size: 2; white-space: nowrap;"
											id="errpromoCode"></span>
									</div>
								</div>
								<%-- <div class="form-group col-lg-3">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="voucher.type.label" /><!--  <span style="color:red; font-size:2">*</span> --></label>
                                             <select class="form-control" name="card_type" id="card_type">
	                                            <option value="Voucher">Voucher</option>
    	                                        <option value="Coupon">Coupon</option>
                                            </select>
										</div> --%>
								<div class="form-group col-lg-2" style="padding-right: 35px;">
									<label style="font-family: Calibri;color: gray;"><spring:message code="date.label" /> <span
										style="color: red; font-size: 2">*</span></label>
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</div>
										<input class="form-control" readonly="readonly"
											style="opacity: 1.5; pointer-events: none;"
											style="background-color: white;" name="createdOnStr"
											id="createdOn" size="20" type="text"
											value="${giftCoupon.createdOnStr}"
											onfocus="callCalender('createdOn')"
											onclick="callCalender('createdOn')" placeholder="DD/MM/YYYY" />
										<!-- <input type="text" name="createdOn" id="createdOn" required class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/> -->
									</div>
									<!-- /.input group -->
									<span class="clearErrors" style="color: red; font-size: 2"
										id="createdOnError"></span>
								</div>
								<div class="form-group col-lg-2">
									<label style="font-family: Calibri;color: gray;">Assigned</label> <select class="form-control"
										name="assignedStatusStr" id="assignedStatus" disabled
										style="width: 45%;">
										<option value="0"
											${giftCoupon.assignedCoupon==true?'selected':''}>Yes</option>
										<option value="1"
											${giftCoupon.assignedCoupon==false?'selected':''}>No</option>
									</select>
								</div>

								<div class="form-group col-lg-2" style="">
									<label style="font-family: Calibri;color: gray;">Multiple Claims<span
										style="color: red; font-size: 2">*</span></label> <select
										class="form-control" name="multiplesStr" id="multiplesValue"
										disabled style="width: 50%;">
										<option value="0" ${giftCoupon.multiples==true?'selected':''}>Yes</option>
										<option value="1" ${giftCoupon.multiples==false?'selected':''}>No</option>
									</select>
								</div>
								<!-- <input type="hidden" id="multiplesValue" name="multiplesSStr" value=""> -->
								
								
								
								<div class="form-group col-lg-2" style="">
									<label style="font-family: Calibri;color: gray;"><spring:message code="no.of.coupons.label" /> <span
										style="color: red; font-size: 2">*</span></label> <input type="text"
										readonly="readonly"
										style="opacity: 1.5; pointer-events: none; width: 50%;"
										class="form-control" id="quantity" name="quantity"
										value="${giftCoupon.noOfCoupons}"
										oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
									<span class="clearErrors" style="color: red; font-size: 2"
										id="errQuantity"></span>
								</div>

								<div class="form-group col-lg-2" style="">
									<label style="font-family: Calibri;color: gray;"><spring:message code="no.of.claims.label" /> <span
										style="color: red; font-size: 2">*</span></label> <input type="text"
										class="form-control" style="width: 60%;" id="nofClaims" disabled
										name="noOfCliams" value="${giftCoupon.noOfCliams}"
										oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
									<span class="clearErrors" style="color: red; font-size: 2"
										id="errnofClaims"></span>
								</div>


								<!--                                       <div class="form-group col-lg-2" > -->
								<!-- 										   <label style="font-family: Calibri;color: gray;">Discount value</label> -->
								<!-- 	 									   <input type="text" class="form-control" id="discount" name="unitCashValue" placeholder="XX.XX"/> -->

								<!-- 										</div> -->
							</div>
							<%--                                     	 <input type="hidden" id="stockdownloadurl" value="${downloadurl}"> --%>
							<div class="row">
								<div class="form-group col-lg-2">
									<div class="col-lg-12 ">
										<label style="font-family: Calibri;color: gray;"><spring:message code="promo.name.label" /> <span
											style="color: red; font-size: 2">*</span></label> <input type="text"
											class="form-control"
											style="opacity: 1.5;" id="promoName"
											name="promoName" value="${giftCoupon.promoName}" /> <span
											class="clearErrors" style="color: red; font-size: 2"
											id="errPromoName"></span>
									</div>
								</div>
								<div class="form-group col-lg-2" style="padding-right: 35px;">
									<label style="font-family: Calibri;color: gray;"><spring:message code="expiry.date.label" /> <span
										style="color: red; font-size: 2">*</span></label>
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</div>
										<input class="form-control" readonly="readonly"
											style="background-color: white;" name="expiryDateStr"
											id="expiryDate" size="20" type="text"
											value="${giftCoupon.expiryDateStr}"
											onfocus="callCalender('expiryDate')"
											onclick="callCalender('expiryDate')" placeholder="DD/MM/YYYY" />
										<!-- <input type="text" name="expiryDate" id="expiryDate" required class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/> -->
									</div>
									<!-- /.input group -->
									<span class="clearErrors" style="color: red; font-size: 2"
										id="expiryDateError"></span>
								</div>
								<div class="form-group col-lg-2" style="">
									<label style="font-family: Calibri;color: gray;"><spring:message code="validity.period.label" />
										<span style="color: red; font-size: 2">*</span></label> <input
										type="text" class="form-control" style="width: 65%;"
										name="validityPeriod" id="validityPeriod"
										value="${giftCoupon.validityPeriod}"
										oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
										placeholder="<spring:message code="enter.no.of.days.label" />" />
									<span class="clearErrors" style="color: red; font-size: 2"
										id="errValidityPeriod"></span>
								</div>
								<div class="form-group col-lg-2" style="">
									<label style="font-family: Calibri;color: gray;"><spring:message code="split_claim.label" /> </label>
									<select class="form-control" name="limitedUseCouponStr"
										id="limitedUseCoupon" onchange="limitCheckValidation()" disabled
										style="width: 50%;">
										<option value="0"
											${giftCoupon.limitedUseCoupon==true?'selected':''}>Yes</option>
										<option value="1"
											${giftCoupon.limitedUseCoupon==false?'selected':''}>No</option>
									</select>
								</div>
								<div class="form-group col-lg-2" style="white-space: nowrap;">
									<label style="font-family: Calibri;color: gray;"><spring:message code="split_claim_coupon.label" /></label>
									<c:if test="${giftCoupon.limitedUseCoupon==true}">
										<input type="text" class="form-control" id="noOfClaimsLimited"
											style="width: 65%;" disabled name="noOfClaimsLimited"
											value="${giftCoupon.noOfClaimsLimited}"
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
									</c:if>
									<c:if test="${giftCoupon.limitedUseCoupon!=true}">
										<input type="text" class="form-control" id="noOfClaimsLimited"
											style="width: 65%;" disabled name="noOfClaimsLimited"
											value="${giftCoupon.noOfClaimsLimited}"
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
									</c:if>
									<span class="clearErrors" style="color: red; font-size: 2"
										id="SplitClamesError"></span>
								</div>


								<%-- 	<div class="form-group col-lg-2">
                                             <label style="font-family: Calibri;color: gray;">Discount value</label> <span style="color:red; font-size:2">*</span>
                                            <input type="text" class="form-control" id="unitCashValue" name="unitCashValue" value="${giftCoupon.unitCashValue}" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                            <span style="color:red; font-size:2" id="errUnitCashValue"></span>
                                            
                                     	</div> --%>




								<div class="form-group col-lg-2" style="">
									<label style="font-family: Calibri;color: gray;">Max Discount<span style="color:red; font-size:2">*</span></label></label> <input type="text"
										class="form-control" style="width: 60%;"
										id="max_discount_amount" name="max_discount_amount"
										value="${giftCoupon.max_discount_amount}"
										oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
									<span class="clearErrors" style="color: red; font-size: 2"
										id="errMaxDiscValue"></span>


								</div>



							</div>
							<div class="row">
								<div class="from-group col-lg-2">
									<div class="col-lg-12" style="">
										<label style="font-family: Calibri;color: gray;"><spring:message code="minBillAmt.label" /> <span style="color:red; font-size: 2" >*</span></label><input
											type="text" class="form-control" style="width: 80%;"
											id="minsaleamount" name="min_sale_amount"
											value="${giftCoupon.min_sale_amount}"
											oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
									</div>
								</div>
								<!-- 										<div class="from-group col-lg-1" ></div> -->
								<div class="from-group col-lg-2" style="">
									<label style="font-family: Calibri;color: gray;"><spring:message code="maxBillAmt.label" /> <span style="color:red; font-size: 2" >*</span></label>
									<!-- 										    <span style="color:red; font-size:2">*</span> -->
									<input type="text" class="form-control" style="width: 80%;"
										id="max_sale_amount" name="max_sale_amount"
										value="${giftCoupon.max_sale_amount}"
										oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
									<span class="clearErrors" style="color: red; font-size: 2"
										id="maxBillError"></span>
								</div>


								<div class=" col-lg-2" style="">
									<label style="font-family: Calibri;color: gray;">Discount Total</label> <input type="text"
										class="form-control" style="width: 80%;" id="discountTotal"
										name="totalCashValue" readonly
										value="${giftCoupon.totalCashValue}"
										placeholder="Enter Discount Total" />
								</div>
								<div class="form-group col-lg-2" style="">
									<label style="font-family: Calibri;color: gray;"><spring:message code="discounttype.label" /> <span
										style="color: red; font-size: 2">*</span></label> <select
										class="form-control" name="discountType" id="discountType"
										style="width: 65%;">
										<option value="Flat"
											${giftCoupon.discountType=='Flat'?'selected':''}>Flat</option>
										<option value="percentage"
											${giftCoupon.discountType=='percentage'?'selected':''}>Percentage</option>
									</select>
								</div>
								<div class="form-group col-lg-2" style="">
									<label style="font-family: Calibri;color: gray;">Coupon value</label> <span
										style="color: red; font-size: 2">*</span> <input type="text"
										class="form-control" style="width: 65%;" id="unitCashValue"
										name="unitCashValue" value="${giftCoupon.unitCashValue}"
										onkeypress="return (event.charCode !=8 && event.charCode ==0 || (event.charCode >= 48 && event.charCode <= 57))"  autocomplete="off" />
									<span class="clearErrors" style="color: red; font-size: 2"
										id="errUnitCashValue"></span>
								</div>
								<div class="form-group col-lg-2" style="">
									<label style="font-family: Calibri;color: gray;"><spring:message code="loyalty.status.label" />
										<!--  <span style="color:red; font-size:2">*</span> --></label> <select
										class="form-control" name="status" id="status"
										style="width: 60%;">
										<option value="Active"
											${'Active' == giftCoupon.status ? 'selected' : ''}>Active</option>
										<option value="Suspend"
											${'Suspend' == giftCoupon.status ? 'selected' : ''}>Suspend</option>
									</select>
								</div>


								<%-- <div class="from-group col-lg-2" style="top:20px;right: 15px;">
									
										<label style="font-family: Calibri;color: gray;"><spring:message code="crm.otp.required" /></label>
										<div class="col-lg-1">
										 <c:choose>
                                           <c:when test="${giftCoupon.otpRequirement =='true'}">
                                          <input type="checkbox" checked id="otpRequired" name="requiredOTP" value="0">
                                           </c:when>
                                           <c:otherwise>
                                           <input type="checkbox" id="otpRequired" name="requiredOTP" value="1">
                                           </c:otherwise>
                                           </c:choose>
                                          
									</div>
								</div> --%>

							</div>
							<div class="row">
							
							
							<div class="form-group col-lg-2" style="margin-top: -10px;margin-bottom: 0px;" >
							<div class="form-group col-lg-12" >
									
                              <label style="font-family: Calibri;color: gray;"><spring:message code="productGroup.label" /><!--  <span style="color:red; font-size:2">*</span> --></label>
                              <select class="form-control" name="productGroup" id="productGroup" style="width: 100%;">
	                         
	                         
	                           <option value="" >ALL</option>
	                            <c:forEach var="groupsList" items="${groupsList}">
	                                        
	                             <option value="${groupsList.groupId}" ${groupsList.groupId == giftCoupon.productGroupMaster ? 'selected' : ''}>${groupsList.groupId}</option>
	                                        
							</c:forEach>
	                                        
	                                        
	                                            </select>
										</div> 
							</div>
							
							

			                <div class="form-group col-lg-2" style="margin-top: -10px;margin-bottom: 0px;padding-left:0px">
									<div class="form-group col-lg-12" >
									
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="customer.group.label" /><!--  <span style="color:red; font-size:2">*</span> --></label>
                                             <select class="form-control" name="customerGroupval" id="customerGroupval" style="width: 90%;">
	                                            <option value="" >ALL</option>
	                                        <c:forEach var="groupsid" items="${groupids}">
	                            			 <option value="${groupsid}"  ${groupsid == giftCoupon.customerGroup ? 'selected' : ''}>${groupsid}</option>
	                                        
											</c:forEach>
	                                        
	                                        
	                                            </select>
										</div> 
										</div>
							
							
										<div class="form-group col-lg-2" style="margin-top: -10px;margin-bottom: 0px;padding-left:0px">
										<div class="form-group col-lg-12">
										   <label style="font-family: Calibri;color: gray;">Per User Claims</label>
	 									   <%-- <c:if test="${giftCoupon.perUserClaims == 0 || giftCoupon.perUserClaims eq 0}">
												<input type="text" style="width: 73%;" class="form-control" id="perUserClaims" name="perUserClaims" value="" placeholder="Enter user claims"/>
											</c:if>
											<c:if test="${giftCoupon.perUserClaims != 0 || giftCoupon.perUserClaims ne 0}">
	 									   	<input type="text" style="width: 73%;" class="form-control" id="perUserClaims" name="perUserClaims" value="${giftCoupon.perUserClaims}" placeholder="Enter user claims"/>
											</c:if> --%>
										   <c:choose>
                                           <c:when test="${giftCoupon.perUserClaims == 0 || giftCoupon.perUserClaims eq 0}">
                                          		<input type="text" style="width: 73%;" class="form-control" id="perUserClaims" name="perUserClaims" value="" placeholder="Enter user claims"/>
                                           </c:when>
                                           <c:otherwise>
                                           		<input type="text" style="width: 73%;" class="form-control" id="perUserClaims" name="perUserClaims" value="${giftCoupon.perUserClaims}" placeholder="Enter user claims"/>
                                           </c:otherwise>
                                           </c:choose>
										</div>
										</div>
							
							<div class="form-group col-lg-2" style="margin-top: -10px;margin-bottom: 0px;padding-left:0px">
								<div class="form-group col-lg-12">
								 <label style="font-family: Calibri;color: gray;">Split Period</label>
	 								<input type="text" style="width: 73%;" class="form-control" id="splitPeriod" name="splitPeriod" value="${giftCoupon.splitPeriod}" placeholder="Enter split claims"/>
								</div>
								</div>
							<div class="form-group col-lg-2" style="margin-top: -10px;margin-bottom: 0px;">
							<label style="font-family: Calibri;color: gray;"><spring:message code="couponType.label" /> <span style="color:red; font-size: 2" >*</span></label>
                                             <select class="form-control" name="isDiscountCoupon" id="isDiscountCoupon" style="width: 100%;">
	                                          <option value="paid" ${giftCoupon.couponType=='paid'?'selected':''}>Paid Coupon</option>
    	                                        <option value="discount" ${giftCoupon.couponType=='discount'?'selected':''}>Discount Coupon</option>
                                            </select></div>
								<!-- <div class="from-group col-lg-4">
									<hr style="width: 102%; margin-left: 1%; margin-bottom: 1px" />
								</div> -->
								<div class="from-group col-lg-2">

									<label style="font-family: Calibri;color: gray;"><spring:message code="crm.otp.required" /></label>
									<div class="col-lg-1">
										<c:choose>
											<c:when test="${giftCoupon.otpRequirement =='true'}">
												<input type="checkbox" checked id="otpRequired"
													name="requiredOTP" value="0">
											</c:when>
											<c:otherwise>
												<input type="checkbox" id="otpRequired" name="requiredOTP"
													value="1">
											</c:otherwise>
										</c:choose>

									</div>
								</div>
								
								
								
							</div>
							</div>
							<div class="row">
								<div class="form-group col-lg-4">
									<%-- <div class="row" style="margin-left: 1%">
										 <label style="font-family: Calibri;color: gray;" style="text-decoration: underline; font-size: 16px;"><spring:message code="loyalty.locations.label" /></label>
										 </div> --%>
									<div class="col-lg-12">
										<label style="font-family: Calibri;color: gray;"><spring:message code="loyalty.country.label" /></label>
										<!--  <select onchange="addSelectedState(this.selectedIndex);" id="country" name ="country" class="form-control" > -->
										<select onchange="print_state('state',this.selectedIndex);"
											id="country" name="country" class="form-control">
											<!-- <option >Select Country</option> -->
										</select>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-lg-2">
									<div class="col-lg-12">
										<label style="font-family: Calibri;color: gray;"><spring:message code="zones.all" /> <span
											style="color: red; font-size: 2">*</span></label> <select
											onchange="getLocationsBasedonZones();" id="zones"
											multiple="multiple" class="form-control"
											style="height: 200px;">
											<c:forEach var="zoneList" items="${zoneList}">
												<c:set var="zs" value="false" />
												<c:forEach var="zonestr" items="${zones}">
													<c:if test="${zonestr == zoneList.zoneID}">
														<c:set var="zs" value="true" />
													</c:if>

												</c:forEach>
												<c:choose>
													<c:when test="${zs == 'true'}">
														<option selected value="${zoneList.zoneID}">${zoneList.zoneID}</option>
													</c:when>
													<c:otherwise>
														<option value="${zoneList.zoneID}">${zoneList.zoneID}</option>
													</c:otherwise>
												</c:choose>


											</c:forEach>
											<!-- <option >Select State</option> -->
										</select> <span class="clearErrors" style="color: red; font-size: 2"
											id="errStates"></span>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<label style="font-family: Calibri;color: gray;"><spring:message code="loyalty.locations.label" />
										<span style="color: red; font-size: 2">*</span></label> <select
										id="location" multiple="multiple" class="form-control"
										style="height: 200px;">
										<c:forEach var="locationDetails" items="${locationsbasedzone}">
											<option value="${locationDetails}">${locationDetails}</option>
										</c:forEach>


									</select> <span class="clearErrors" style="color: red; font-size: 2"
										id="errLocation"></span>
								</div>
								<div class="col-lg-8" style="">
									<!--                              <div class="table-responsive" style=""> -->
									<label style="font-family: Calibri;color: gray;"><strong>Discount Coupons Generated</strong></label> <span
										style="color: red; margin-left: 15px; font-size: 2"
										id="errtable"></span>


									<div class="row" style="margin-right: 3%;">


										<div class="form-group col-lg-6"
											style="text-align: center; margin-bottom: 0.3%; margin-left: 0px; padding-right: 0px;">
											<input type="text" class="form-control searchItems" value=""
												id="searchItems" placeholder="Search CouponId,Phone Number"
												style="width: 110%; height: 30PX; text-align: left; background: url(/OmniRetailer/images/search.png) no-repeat; background-position: right;">
											<!-- <datalist id="skuList"></datalist> -->
											<div class="services">
												<div class="items">
													<ul class="matchedStringUl searchCouponItems"
														style="display: none;"></ul>
												</div>
											</div>
											<input type="hidden" id="searchname" value="">
										</div>

										<!-- Added by : Swathi -->
										<div class="col-lg-2"
											style="margin-right: -8px; width: 16%; margin-left: 25px; text-align: center; padding-right: 0px; padding-bottom: 5px;">
											<input type="button" onclick="return addCoupon();" style=""
												class="btn bg-olive btn-inline  addBtn" value="New">

										</div>


										<div class="col-lg-2"
											style="margin-right: -8px; width: 16%; margin-left: 0px; text-align: center; padding-right: 0px; padding-bottom: 5px;">
											<input type="button"
												class="addBtn btn bg-olive btn-inline addBtn"
												data-toggle="modal" data-target="#myModalIos"
												style="font-size: 14px;" value="Save">
										</div>

										<div class="col-lg-2"
											style="width: 16%; text-align: center; padding-right: 0px; padding-bottom: 4px;">
											<input type="button"
												class="addBtn btn bg-olive btn-inline addBtn"
												onclick="validateGiftCoupons('edit','giftCoupons','true')"
												style="font-size: 14px;" value="Activate All"/>
										</div>

									</div>
									<%-- <div class="row" style="margin-right: 3%;">
										

										<div class="form-group col-lg-10"
											style="text-align: center; margin-bottom: 0.3%; margin-left: 0px; padding-right: 0px;">
											<input type="text" class="form-control searchItems" value="${searchCriteria}" id="searchItems" placeholder="Search CouponId,Phone Number"
												style="height:30PX;text-align:left;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;">
											<!-- <datalist id="skuList"></datalist> -->
											<div class="services">
												<div class="items">
													<ul class="matchedStringUl searchCouponItems" style=""></ul>
												</div>
											</div>
											<input type="hidden" id="searchname" value="${searchName}">										</div>

										<!-- Added by : Swathi -->
										<div class="col-lg-1"
											style="text-align: center; padding-right: 0px; padding-bottom: 4px;">
											<input type="button" onclick="return addCoupon();" style=""
												class="btn bg-olive btn-inline  addBtn"
												value="<spring:message code="new.label" />" />

										</div>


										<div class="col-lg-1"
											style="text-align: center; padding-right: 0px; padding-bottom: 4px;">
											<input type="button"
												class="addBtn btn bg-olive btn-inline addBtn"
												data-toggle="modal" data-target="#myModalIos"
												style="font-size: 14px;"
												value="<spring:message code="save.label" />" />
										</div>



									</div> --%>

									<div id="row">
										<div id="generatedCoupons" style="margin-right: 3%;">
											<div class="table-responsive" role="grid"
												style="overflow-x: auto; width: 100%; position: relative; white-space: nowrap;">
												<!-- <div id="example1_wrapper" class="table table-bordered table-striped table-responsive" role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;">
                
								 -->
												<table id="cardsDetails"
													class="table table-bordered table-hover table-striped"
													style="margin-bottom: -8px; margin-left: 2px; min-height: 150px;">
													<!-- <table id="cardsDetails" class="table table-striped table-bordered table-hover" style="margin-bottom: -8px;margin-left:2px"> -->

													<thead
														style="background-color: #eeee !important; border-left: hidden; border-right: hidden;">

														<tr id="cardsDetailsTr">

															<th class="col-sm-1"><spring:message
																	code="slno.label" /></th>
															<th class="col-sm-3"
																style="padding-left: 50px; padding-right: 35px;">Coupon Code</th>
																<th class="col-sm-3"
																style="padding-left: 50px; padding-right: 35px;">Coupon ID</th>
															<th class="col-sm-2"
																style="padding-left: 17px; padding-right: 17px;"><spring:message
																	code="customer.mobile.no.label" /></th>
															<th class="col-sm-1"
																style="padding-left: 21px; padding-right: 15px;"><spring:message
																	code="start.date.label" /></th>
															<th class="col-sm-1"
																style="padding-left: 21px; padding-right: 22px;"><spring:message
																	code="end.date.label" /></th>
															<th class="col-sm-1"
																style="padding-left: 5px; padding-right: 5px;"><spring:message
																	code="claim.status.label" /></th>
															<th class="col-sm-1"
																style="padding-left: 2px; padding-right: 2px;"><spring:message
																	code="pending.claims.label" /></th>
															<th class="col-sm-1"
																style="padding-left: 25px; padding-right: 27px;"><spring:message
																	code="status.label" /></th>
															<th class="col-sm-1"><spring:message
																	code="action.label" /></th>
														</tr>
													</thead>
													<tbody style="text-align: center;">


														<c:if test="${giftCoupon.totolGiftCoupons != 0}">

															<c:forEach var="coupon" items="${giftCoupon.giftCoupons}"
																varStatus="theCount">
																<tr style='margin-top: 5px;' id="productrange1">
																	<!-- <tr id="range1">
													<td style="display: none;"><span id="1rangename">range1</span></td> -->
																	<%-- <td>${theCount.count}</td> --%>
																	<td id="productcoupon1">${theCount.count}</td>
																	<td><input
																		class="form-control couponCode${theCount.count}"
																		type="text" value="${coupon.couponCode}"
																		readonly="readonly" id="couponCodes${theCount.count}" /></td>
																		<td><input
																		class="form-control couponCode${theCount.count}"
																		type="text" value="${coupon.couponId}"
																		readonly="readonly" id="couponCodes${theCount.count}" /></td>
																		


																	<input class="form-control couponID${theCount.count}"
																		type="hidden" value="${coupon.couponId}"
																		 id="couponIDs${theCount.count}" />
																		 
																		 
																		 
																		 <input type="hidden"  id="couponProgramCode${theCount.count}" value="${coupon.couponProgramCode}" />		 

																<input type="hidden"  id="assignedStatus${theCount.count}" value="${coupon.assignedStatus}" />		 

																<input type="hidden"  id="couponStatus${theCount.count}" value="${coupon.couponStatus}" />
																
																			<input type="hidden"  id="noOfClaims${theCount.count}" value="${coupon.noOfClaims}" />		 
																
																
																
																  <c:set var="inside" value="0"></c:set> 
                                   <c:forEach var="CouponInfo" items="${giftCoupon.customerGiftCoupons}" >
                                                  
                                 <c:if test="${coupon.couponCode==CouponInfo.couponCode}">
																		 
																		 
																		 
																		<td><input
																		class="form-control customerMobile${theCount.count}"
																		type="text" value="${CouponInfo.customerMobile}"
																		readonly="readonly"
																		id="customerMobile${theCount.count}" /></td>

																<input type="hidden"  id="sNo${theCount.count}" value="${CouponInfo.sNo}" />	
															
																<input type="hidden"  id="issuedAt${theCount.count}" value="${CouponInfo.issuedAt}" />		 

																<input type="hidden"  id="customerName${theCount.count}" value="${CouponInfo.customerName}" />		 

																<input type="hidden"  id="customerEmail${theCount.count}" value="${CouponInfo.customerEmail}" />	
																

																<input type="hidden"  id="claimedAt${theCount.count}" value="${CouponInfo.claimedAt}" />		 

																<input type="hidden"  id="billRef${theCount.count}" value="${CouponInfo.billRef}" />		 
																<input type="hidden"  id="couponValue${theCount.count}" value="${CouponInfo.couponValue}" />		 

																<input type="hidden"  id="totalRecords${theCount.count}" value="${CouponInfo.totalRecords}" />		 

																<input type="hidden"  id="couponId${theCount.count}" value="${CouponInfo.couponId}" />		 

																<input type="hidden"  id="issuedAtStr${theCount.count}" value="${CouponInfo.issuedAtStr}" />
																<input type="hidden"  id="validityDateStr${theCount.count}" value="${CouponInfo.validityDateStr}" />		 	 
                                                                     
                                                                     <c:set var="inside" value="1"></c:set> 

																</c:if>
																</c:forEach>
																
																<c:if test="${inside == 0}">
																
																
																	
																<td><input
																		class="form-control customerMobile${theCount.count}"
																		type="text" value=""
																		readonly="readonly"
																		id="customerMobile${theCount.count}" /></td>
																		
															<input type="hidden"  id="sNo${theCount.count}" value="" />		 
																
																
																<input type="hidden"  id="issuedAt${theCount.count}" value="" />		 

																<input type="hidden"  id="customerName${theCount.count}" value="" />		 

																<input type="hidden"  id="customerEmail${theCount.count}" value="" />	
																
																<input type="hidden"  id="noOfClaims${theCount.count}" value="" />		 

																<input type="hidden"  id="claimedAt${theCount.count}" value="" />		 

																<input type="hidden"  id="billRef${theCount.count}" value="" />		 
																<input type="hidden"  id="couponValue${theCount.count}" value="" />		 

																<input type="hidden"  id="totalRecords${theCount.count}" value="" />		 

																<input type="hidden"  id="issuedAtStr${theCount.count}" value="" />
																<input type="hidden"  id="validityDateStr${theCount.count}" value="" />		 	 
															
																
																</c:if>
				
																		 
																
																	
																	<td><input
																		class="form-control startDateStr${theCount.count}"
																		type="text" value="${giftCoupon.createdOnStr}"
																		readonly="readonly" id="startDateStr${theCount.count}" /></td>
																	<td><input
																		class="form-control endDateStr${theCount.count}"
																		type="text" value="${giftCoupon.expiryDateStr}"
																		readonly="readonly" id="endDateStr${theCount.count}" /></td>
																	<input type="hidden" value="${giftCoupon.noOfCliams}" />
																	<input type="hidden" value="${coupon.noOfCliams}" />
																	<input type="hidden"
																		value="${giftCoupon.noOfCliams-coupon.noOfCliams}" />
																	<%-- <c:choose>
				                             <c:when test="${giftCoupon.noOfCliams-coupon.noOfCliams == '0'}"> --%>
																
																
																
																
																<c:set var="inside2" value="0"></c:set> 
                                   <c:forEach var="CouponInfo" items="${giftCoupon.customerGiftCoupons}" >
                                                  
                                 <c:if test="${coupon.couponCode==CouponInfo.couponCode}">
																
																
																	<td>
																		
                                                           <select
																		class="form-control claimStatus${theCount.count}"
																		disabled="disabled" id="claimStatus${theCount.count}">
																			<option value="1"
																				${giftCoupon.noOfCliams-CouponInfo.noOfClaims != '0' ? 'selected' : ''}>YES</option>
																			<option value="0"
																				${giftCoupon.noOfCliams-CouponInfo.noOfClaims == '0' ? 'selected' : ''}>NO</option>
																	</select>
																	<c:set var="inside2" value="1"></c:set> 
																	</td>
																	
																	</c:if>
																	</c:forEach>
																	
																	<c:if test="${inside2 == 0}">
																	
																	<td>
																		
                                                           <select
																		class="form-control claimStatus${theCount.count}"
																		disabled="disabled" id="claimStatus${theCount.count}">
																			<option value="1"
																				${giftCoupon.noOfCliams-coupon.noOfCliams != '0' ? 'selected' : ''}>YES</option>
																			<option value="0"
																				${giftCoupon.noOfCliams-coupon.noOfCliams == '0' ? 'selected' : ''}>NO</option>
																	</select>
																	</td>
																	
																	</c:if>
																	

																	<%--  </c:when>
				                             <c:otherwise>
				                              <td><input class="form-control claimStatus${coupon.couponCode}" value="YES" readonly="readonly"
														type="text" id="${theCount.count}claimStatus"/></td>
				                             </c:otherwise>
				                             </c:choose>
				                             --%>
																	<%-- <td>${giftCoupon.noOfCliams-coupon.noOfCliams}</td>  --%>
																	<input type="hidden" value="${coupon.noOfCliams}" />
																	
																	  <c:forEach var="CouponInfo" items="${giftCoupon.customerGiftCoupons}" >
                                                  
                                                                  <c:if test="${coupon.couponCode==CouponInfo.couponCode}">
																	
																	
																	
																	<td><input
																		class="form-control noOfCliams${theCount.count}"
																		type="text" value="${CouponInfo.noOfClaims}"
																		readonly="readonly" id="noOfCliams${theCount.count}"
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
                                                                    </c:if>
																	</c:forEach>
																	
																	<c:if test="${inside2 == 0}">
																	<td><input
																		class="form-control noOfCliams${theCount.count}"
																		type="text" value="${coupon.noOfCliams}"
																		readonly="readonly" id="noOfCliams${theCount.count}"
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
																	
																	</c:if>

																	<%-- <c:set var="statusofCard" value="${coupon.couponStatus}"/>
                                          <c:choose>
                                        <c:when test="${statusofCard == false}"> --%>
																	<td style="width: 15%">
																		<%-- <input class="form-control couponState${coupon.couponCode}" value="InActive" readonly="readonly"
														type="text" id="${theCount.count}couponState"/> --%> <select
																		class="form-control couponState${theCount.count}"
																		disabled="disabled" id="couponState${theCount.count}">
																			<option value="Active"
																				${true == coupon.couponStatus ? 'selected' : ''}>Active</option>
																			<option value="InActive"
																				${false == coupon.couponStatus ? 'selected' : ''}>InActive</option>
																	</select>
																	</td>
																	<%-- </c:when>
                                      <c:otherwise>
                                     <td style="width: 12%"><input class="form-control couponState${coupon.couponCode}" value="Active" readonly="readonly"
														type="text" id="${theCount.count}couponState"/></td>
                                     </c:otherwise>
                                       </c:choose> --%>
																	<td id="Edit${theCount.count}"><a
																		style="color: #2e7ea7 !important; cursor: pointer;"
																		onclick="return couponEdit('${theCount.count}')">Edit</a></td>

																</tr>
															</c:forEach>
														</c:if>




														<c:if test="${giftCoupon.totolGiftCoupons == 0}">


															<tr id="productrange1">
																<td style="display: none;"><span id="1rangename">productrange1</span></td>
																<td id="productcoupon1">1</td>
																<%-- <td>${theCount.count}</td>  --%>
																<!-- <td id="productoffer1">1</td> -->
																<td style="width: 12%"><input
																	class="form-control couponCode" type="text"
																	id="couponCodes1" /></td>
																	
																	<input
																	class="form-control couponID" type="hidden"
																	id="couponIDs1" />
																	
																<td style="width: 12%"><input
																	class="form-control customerMobile" type="text"
																	id="customerMobile1"
																	oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>


																<td style="width: 12%"><input
																	class="form-control startDate"
																	value="${giftCoupon.createdOnStr}" readonly="readonly"
																	type="text" id="1startDate" /></td>

																<td style="width: 12%"><input
																	class="form-control endDate" type="text"
																	value="${giftCoupon.expiryDateStr}" readonly="readonly"
																	id="endDate1" name="1endDate" /></td>
																<c:choose>
																	<c:when
																		test="${giftCoupon.noOfCliams-coupon.noOfCliams == '0'}">
																		<td style="width: 12%"><input
																			class="form-control claimStatus" value="NO"
																			readonly="readonly" type="text" id="claimStatus1" /></td>
																	</c:when>
																	<c:otherwise>
																		<td style="width: 12%"><input
																			class="form-control claimStatus" value="YES"
																			readonly="readonly" type="text" id="claimStatus1" /></td>
																	</c:otherwise>
																</c:choose>
																<!-- <td style="width: 12%"><input class="form-control 1claimStatus" 
														type="text" id="1claimStatus"/></td>  -->
																<td style="width: 12%"><input
																	class="form-control noOfCliams"
																	value="${giftCoupon.noOfCliams}" readonly="readonly"
																	type="text" id="noOfCliams1"
																	oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>

																<!--  <td style="width: 12%"><input class="form-control 1couponStatus"  
														type="text" id="1couponStatus"/></td> -->

																<c:set var="statusofCard" value="${coupon.couponStatus}" />
																<c:choose>
																	<c:when test="${statusofCard == false}">
																		<td style="width: 12%"><input
																			class="form-control couponStatus" value="InActive"
																			readonly="readonly" type="text" id="1couponState" /></td>
																	</c:when>
																	<c:otherwise>
																		<td style="width: 12%"><input
																			class="form-control couponStatus" value="Active"
																			readonly="readonly" type="text" id="couponState1" /></td>
																	</c:otherwise>
																</c:choose>

																<td style="width: 7%"><div style="width: 60px;">
																		<a style="color: #2e7ea7 !important; cursor: pointer;"
																			onclick="return couponEdit()">Edit</a>
																	</div></td>


															</tr>

														</c:if>


													</tbody>

												</table>
											</div>
											<!--  </div>
                                 </div> -->



											<div class="col-lg-12"
												style="margin-left: -4%; margin-top: 13px">


												<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
													<div class="form-group col-lg-6" style="text-align: left;">
														<input type="button" class='paginationButton'
															value="&#60;" onclick=""> ${index} -
														${totalValue} of ${totalRecords} <input type="button"
															class='paginationButton' value="&#62;"
															onclick="editLoyaltyGiftCouponForPagination('${giftCoupon.couponProgramCode}','${totalValue}','${searchCriteria}','false')">
													</div>
												</c:if>

												<c:if test="${totalValue == totalRecords}">
													<c:if test="${totalValue-maxRecords >0}">
														<div class="form-group col-lg-6" style="text-align: left;">
															<input type="button" class='paginationButton'
																value="&#60;"
																onclick="return editLoyaltyGiftCouponForPagination('${giftCoupon.couponProgramCode}','${index - (maxRecords + 1)}','${searchCriteria}','false');">
															${index} - ${totalValue} of ${totalRecords} <input
																type="button" class='paginationButton' value="&#62;">
														</div>
													</c:if>
													<c:if test="${totalValue-maxRecords <= 0}">
														<div class="form-group col-lg-6" style="text-align: left;">
															<input type="button" class='paginationButton'
																value="&#60;"> ${index} - ${totalValue} of
															${totalRecords} <input type="button"
																class='paginationButton' value="&#62;">
														</div>
													</c:if>
												</c:if>
												<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
													<div class="form-group col-lg-6" style="text-align: left;">
														<input type="button" class='paginationButton'
															value="&#60;"
															onclick="return editLoyaltyGiftCouponForPagination('${giftCoupon.couponProgramCode}','${index - (maxRecords + 1)}','${searchCriteria}');">
														${index} - ${totalValue} of ${totalRecords} . <input
															type="button" class='paginationButton' value="&#62;"
															onclick="editLoyaltyGiftCouponForPagination('${giftCoupon.couponProgramCode}','${totalValue}','${searchCriteria}','false')">
													</div>
												</c:if>


												<div class="form-group col-lg-6"
													style="float: right; margin-right: -15%;">
													<div class="col-lg-4"
														style="text-align: right; padding-right: 0px; margin-top: 4px; font-size: 16px;">
														<spring:message code="pages.label" />
													</div>
													<div class="col-lg-3" style="padding-right: 0px;">
														<select class="form-control" id="pagination">
															<c:set var="totalRecords" value="${totalRecords}"></c:set>
															<c:forEach var="i" begin="0" end="${totalRecords}">
																<c:if test="${(totalRecords)>0}">
																	<option value="${(i*maxRecords)}"
																		${index-1 == i*maxRecords ? 'selected' : ''}>
																		${i+1}</option>
																	<c:set var="totalRecords"
																		value="${totalRecords-maxRecords}"></c:set>
																</c:if>
															</c:forEach>
														</select>

													</div>
												 <div class="col-lg-3" style="padding-right: 0px;">
														<input type="button"
															onclick="editLoyaltyGiftCouponForPagination('${giftCoupon.couponProgramCode}',document.getElementById('pagination').value,'${searchCriteria}','false');"
															class="btn bg-olive btn-inline  addBtn" value="GO">
													</div> 

												</div>
											</div>


											<div id="triggerEvent"></div>

											<div class="modal fade" id="myModalIos" role="dialog"
												tabindex="-1">
												<div class="modal-dialog iosmodeldialog">

													<!-- Modal content-->
													<div class="modal-content iospopup"
														style="width: 58% !important;height: 150px !important;">
														<div class="modal-header">

															<button type="button" class="close" onclick=""
																data-dismiss="modal">&times;</button>
														</div>
														<div class="modal-body">
															<div class="form-group col-lg-12"
																style="padding: 0px; font-size: 15px">
																Are you sure,you want to save the file

																<!-- <div class="col-lg-1"> -->
																<div id="generatedCoupons">
																	<input type="hidden" id="downloadurl"
																		value="${downloadurl}">
																</div>

																<!--  </div> -->
															</div>
															<div class="form-group col-lg-12"></div>
															<div class="col-lg-4 col-sm-6 col-xs-6" style=""></div>
															<div class="form-group col-lg-8 col-sm-8 col-xs-8"
																style="padding-left: 0px; padding-right: 0px;">
																<div class="col-lg-3 col-sm-4 col-xs-6"
																	style="margin-left: 29%;">
																	<input type="hidden" value="${giftCoupon.quantity}" />
																	<input type="hidden" value="${giftCoupon.noOfCoupons}" />

																	<input type="button" class="iosclosebutton1"
																		onclick="editLoyaltyGiftCouponForPagination('${giftCoupon.couponProgramCode}','0','${searchCriteria}','true');"
																		value="Ok">


																</div>




																<!-- <div class="col-lg-1 col-sm-4 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
  <input type="button" class="iosclosebutton1" data-dismiss="modal" value="Cancel">
</div> -->
															</div>
															<br />
														</div>
														<br />
														<div class="modal-footer" style="padding: 0px;">
															<!--  <input type="button" class="iosclosebutton" data-dismiss="modal" value="Close"/> -->
														</div>
													</div>

												</div>
											</div>

										</div>
									</div>


								</div>

							</div>





							<!--                                     	</div> -->
							<!-- 									  </div> -->
							<%-- 									<input type="hidden" id="selectedStateList"   value="${statesList}">   --%>
							<input type="hidden" id="outletLocation" value=""> 
						      <input type = "hidden"   id ="actionTest" value = "true"/>
							
							
							<input	type="hidden" id="outletZone" value=""> <input
								type="hidden" id="couponStartDate" value=""> <input
								type="hidden" id="couponEndDate" value=""> <input
								type="hidden" id="searchCoupons" value=""> <input
								type="hidden" id="selectedZone" name="selectdZones"
								value="${zones}"> <input type="hidden"
								id="selectedLocation" name="locations" value="${locationList}">
							<%--    <input type="hidden" id="selectedAllLocation"   value="${locationList}"> --%>
						</div>
						<!-- /.box-body -->

						<div class="row" style="text-align: center; margin-top: 16px;">
							<input type="button" class="btnCls" style=""
								onclick="validateGiftCoupons('edit','giftCoupons')"
								value="<spring:message code="submit.label" />" />
							<%-- <input type="button" class="btnCls" style="" onclick="saveForCoupon('${giftCoupon.couponProgramCode}','0');" value="<spring:message code="submit.label" />" /> --%>
							<c:if test="${sessionScope.role == 'super admin'}">
								<input type="button" class="btnCls buttonMargin" style=""
									onclick="viewGiftCoupons('loyalitycoupons','GiftCoupons','0','menu');"
									value="<spring:message code="cancel.label" />" />
									
									
							</c:if>
							<c:forEach var="accessControl"
								items="${sessionScope.CustomerLoyality}">
								<c:if
									test="${accessControl.appDocument == 'GiftCoupons' && accessControl.write == true && accessControl.read == true}">
									<input type="button" class="btnCls buttonMargin" style=""
										onclick="viewGiftCoupons('loyalitycoupons','GiftCoupons','0','menu');"
										value="<spring:message code="cancel.label" />" />
								</c:if>
							</c:forEach>
						</div>
						<br /> <input type="hidden" id="contextPathValue"
							value="${pageContext.request.contextPath}">
						<div class="box-footer"></div>
				</div>
				</form>
			</div>

		</div>
		</div>
	</section>
	<!-- /.content -->
	<script
		src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js"
		type="text/javascript"></script>
	<%-- <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script>
         <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
         --%>
	<script type="text/javascript">
		$(function() {
			//Datemask dd/mm/yyyy
			/* $("#validFrom").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
			$("#validTo").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"}); */
			//  $("#cardsDetails").dataTable();
		});

		/*   $(function() {
		      //    $("#cardsDetails").dataTable();
		           $("#cardsDetails").dataTable({
		  			 "bPaginate": true,
		               "bLengthChange": true,
		               "bFilter": false,
		               "bSort": false,
		               "bInfo": false,
		               "bAutoWidth": true
		 			}); 
		            }); */
	</script>
</body>
</html>