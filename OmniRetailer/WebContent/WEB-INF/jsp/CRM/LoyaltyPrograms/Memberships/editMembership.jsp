<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Vasudeva Reddy.G
  * file name		        : CRM/LoyaltyPrograms/Memberships/editMembership.jsp
 * file type		        : JSP
* description				: The edit membership page is displayed using this JSP.
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
	src="${pageContext.request.contextPath}/js/crm/loyaltyPrograms/memberships.js"></script>


<script type="text/javascript">
	$(document).ready(
			function() {
				callCalender('startDate');
				callCalender('expiryDate');
				/* callCalender('startDateStr');
				callCalender('expirydateStr'); */
				
				
				print_country("country");
				var date = getCurrentDate();
				$("#country").val("India");
				
				
				

				//	multipleCheckValidation();
				/* $("#state").html(op); */
				debugger
				var selectedLocations = $("#selectedLocation").val().replace(
						'[', '').replace(']', '').replace(/, /g, ',');
				$("#location").val(selectedLocations.split(','));

			});
	 $('input[type="file"]').change(function(e){
		 debugger
            var fileName = e.target.files[0].name;
            alert('The file "' + fileName +  '" has been selected.');
        });
	
	$("#promoName").keydown(function() {
		$("#errPromoName").html("");
		$("#Error").html("");
	});

	var promoCode = $("#promoCode").val();
	$("#promoCode").keydown(function() {
		/* if(promoCode.length<5){
				$("#errpromoCode").html("Enter atleast 5 Characters/Numbers");
				return;
			}
		else{ */
		$("#errpromoCode").html("");
		$("#Error").html("");
		// 	}
	});

	$("#startDate").keydown(function() {
		$("#startDateError").html("");
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

	$("#zones").change(function() {
		$("#errStates").html("");
		$("#Error").html("");
	});

	$("#expiryDate").keydown(function() {
		$("#errExpiryDate").html("");
		$("#Error").html("");
	});

	$("#validityPeriod").keyup(function() {
		$("#errValidityPeriod").html("");
		$("#Error").html("");
	});
	
	
	debugger;
	$('#searchItems').on('input',function(e){
		if($(this).val().trim()==""){
		var	id=$('promoCode').val();
	// viewMembershipDetails('','edit','');
	 viewMembershipDetails(id,'edit','0','');
		}
	});
	
	
</script>
</head>
<body>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box box-primary">
					<div class="box-header" style="text-align: center">
						<h3>
							<spring:message code="membership.edit.label" />
						</h3>
					</div>
					<!-- /.box-header -->
					<!-- form start -->
					<form id="membership" method="GET">
						<div class="box-body">
							<div id="Error"
								style="text-align: center; color: red; font-size: 2; font-weight: bold;">${err}</div>
							<div id="Success" class="Error"
								style="text-align: center; color: blue; font-size: 2; font-weight: bold;">${success}</div>
							<div class="row"
								style="background: #efefef; width: 100%; margin-left: 0px !important;">

								<div class="row">
									<div class="form-group col-lg-2">
										<div class="col-lg-12">
											<label><spring:message code="promo.code.label" /><span
												style="color: red; font-size: 2">*</span> </label> <input
												type="text" class="form-control" id="promoCode"
												name="couponProgramCode"
												value="${membership.membershipProgramCode}"
												readonly="readonly" /> <span
												style="color: red; font-size: 2; white-space: nowrap;"
												id="errpromoCode"></span>
										</div>
									</div>
									<%-- <div class="form-group col-lg-3">
                                            <label><spring:message code="voucher.type.label" /><!--  <span style="color:red; font-size:2">*</span> --></label>
                                             <select class="form-control" name="card_type" id="card_type">
	                                            <option value="Voucher">Voucher</option>
    	                                        <option value="Coupon">Coupon</option>
                                            </select>
										</div> --%>
									<div class="form-group col-lg-2" style="">
										<label><spring:message code="start.date.label" /> <span
											style="color: red; font-size: 2">*</span></label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-calendar"></i>
											</div>
											<input class="form-control" style="background-color: white;"
												name="startDateStr" readonly="readonly" id="startDate"
												size="20" type="text" value="${membership.startDateStr}"
												onfocus="callCalender('startDate')"
												onclick="callCalender('startDate')" placeholder="DD/MM/YYYY" />
											<!-- <input type="text" name="createdOn" id="createdOn" required class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/> -->
										</div>
										<!-- /.input group -->
										<span style="color: red; font-size: 2" id="startDateError"></span>
									</div>
									<input type="hidden" id="createdDateStr"
										value="${membership.createdDateStr}"> <input
										type="hidden" id="updatedDateStr"
										value="${membership.updatedDateStr}"> <input
										type="hidden" id="expiryStatus"
										value="${membership.expiryStatus}">
										
										<input type="hidden" id="upoloadedfileName"
										value=""}> 


									<div class="form-group col-lg-2" style="">
										<label><spring:message code="assigned.label" /> </label> <select
											class="form-control" name="assignedStatus"
											id="assignedStatus">
											<option value="1"
												${membership.assignedStatus==true?'selected':''}>Yes</option>
											<option value="0"
												${membership.assignedStatus==false?'selected':''}>No</option>
										</select>
									</div>
									<div class="form-group col-lg-2" style="">
										<label> <spring:message code="membership.type.label" /></label>
										<select class="form-control" name="membershipType"
											id="membershipType">
											<option value="SILVER"
												${'SILVER' == membership.membershipType ? 'selected' : ''}>MEMBERSHIP SILVER</option>
											<option value="GOLD"
												${'GOLD' == membership.membershipType ? 'selected' : ''}>MEMBERSHIP GOLD</option>
											<option value="PLATINUM"
												${'PLATINUM' == membership.membershipType ? 'selected' : ''}>MEMBERSHIP PLATINUM</option>
										</select>
									</div>
									<div class="form-group col-lg-2" style="">
										<div class="col-lg-12">
											<label>Grace Period</label> <input type="text"
												class="form-control" id="graceperiod" name="graceperiod"
												oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
												value="${membership.gracePeriod}" /> <span
												style="color: red; font-size: 2; white-space: nowrap;"
												id="graceperiodError"></span>
										</div>
									</div>
									<div class="form-group col-lg-2" style="">
										<div class="col-lg-12">
											<label><spring:message code="membership.price.label" /></label>
											<input type="text" class="form-control" id="membershipFee"
												name="membershipFee"
												oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
												value="${membership.membershipFee}" /> <span
												style="color: red; font-size: 2; white-space: nowrap;"
												id="membershipFeeError"></span>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="form-group col-lg-2">
										<div class="col-lg-12 ">
											<label><spring:message code="promo.name.label" /> <span
												style="color: red; font-size: 2">*</span></label> <input type="text"
												class="form-control" id="promoName" name="promoName"
												value="${membership.promoName}" /> <span
												style="color: red; font-size: 2" id="errPromoName"></span>
										</div>
									</div>
									<div class="form-group col-lg-2" style="">
										<label><spring:message code="expiry.date.label" /> <span
											style="color: red; font-size: 2">*</span></label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-calendar"></i>
											</div>
											<input class="form-control" style="background-color: white;"
												readonly="readonly" name="expiryDateStr" id="expiryDate"
												size="20" type="text" value="${membership.expiryDateStr}"
												onfocus="callCalender('expiryDate')"
												onclick="callCalender('expiryDate')"
												placeholder="DD/MM/YYYY" />
											<!-- <input type="text" name="expiryDate" id="expiryDate" required class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/> -->
										</div>
										<!-- /.input group -->
										<span style="color: red; font-size: 2" id="expiryDateError"></span>
									</div>
									<div class="form-group col-lg-2" style="">
										<label><spring:message code="validity.period.label" />
											<span style="color: red; font-size: 2">*</span></label> <input
											type="text" class="form-control" name="validityPeriod"
											id="validityPeriod" value="${membership.validityPeriod}"
											oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
											placeholder="<spring:message code="enter.no.of.days.label" />" />
										<span style="color: red; font-size: 2" id="errValidityPeriod"></span>
									</div>
									<div class="form-group col-lg-2" style="">
										<label><spring:message code="status.label" />
											<!--  <span style="color:red; font-size:2">*</span> --></label> <select
											class="form-control" name="status" id="status">
											<option value="Active"
												${'Active' == membership.status ? 'selected' : ''}>Active</option>
											<option value="Suspend"
												${'Suspend' == membership.status ? 'selected' : ''}>Suspend</option>
										</select>
									</div>

									<div class="from-group col-lg-2" style="margin-top: 22px;">

										<label><spring:message code="crm.otp.required" /></label>
										<div class="col-lg-1">
											<c:if test="${membership.otpRequired==true}">
												<input type="checkbox" id="otpRequired" name="requiredOTP"
													value="true" checked="checked">
											</c:if>
											<c:if test="${membership.otpRequired==false}">
												<input type="checkbox" id="otpRequired" name="requiredOTP"
													value="false">
											</c:if>

										</div>
									</div>
									<div class="col-lg-2">
										<div class="col-lg-12">

											<label>Renewal Price</label> <input type="text"
												class="form-control" id="renewalprice" name="renewalprice"
												oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
												value="${membership.renewalPrice}" /> <span
												style="color: red; font-size: 2; white-space: nowrap;"
												id="renewalpriceError"></span>
										</div>
									</div>
								</div>
								<div class="row">

									<div class="form-group col-lg-2">
										<div class="col-lg-12 ">
											<label>No.Of Memberships<span
												style="color: red; font-size: 2">*</span></label> <input type="text"
												class="form-control" id="quantity" name="quantity"
												value="${membership.quantity}" readonly="readonly" /> <span
												style="color: red; font-size: 2; font-weight: bold"
												id="errQuantity"></span>
										</div>
									</div>

								</div>
							</div>



							<div class="row">
								<div class="from-group col-lg-12">
									<hr style="width: 100%; margin-left: 0%; margin-bottom: 1px" />
								</div>

							</div>

							<div class="row">
								<div class="form-group col-lg-2">
									<%-- <div class="row" style="margin-left: 1%">
										 <label style="text-decoration: underline; font-size: 16px;"><spring:message code="loyalty.locations.label" /></label>
										 </div> --%>
									<div class="col-lg-12">
										<label><spring:message code="loyalty.country.label" /></label>
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
										<label><spring:message code="zones.all" /> <span
											style="color: red; font-size: 2">*</span></label> <select
											onchange="getLocationsBasedonZones();" id="zones"
											multiple="multiple" class="form-control">
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
										</select> <span style="color: red; font-size: 2" id="errStates"></span>
									</div>
								</div>
								<div class="form-group col-lg-2" style="margin-left: 0px;">
									<label><spring:message code="loyalty.locations.label" />
										<span style="color: red; font-size: 2">*</span></label> <select
										id="location" multiple="multiple" class="form-control">
										<c:forEach var="locationDetails" items="${locationsbasedzone}">
											<option value="${locationDetails}">${locationDetails}</option>
										</c:forEach>
									</select> <span style="color: red; font-size: 2" id="errLocation"></span>
								</div>
								<div class="col-lg-8"
									style="margin-left: 0px; margin-top: 1.8%;">
									<div class="col-lg-12"
										style="margin-left: 0px; margin-top: 0% !important; padding: 0px;">



										<div class="form-group col-lg-10"
											style="padding-right: 0px; padding-left: 0px; margin-bottom: 5px;">
											<input type="text" class="form-control searchItems"
												value="${searchCriteria}" id="searchItems"
												placeholder="Search Memberships here.."
												style="height:30PX;text-align:left;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
											<div class="services">
												<div class="items">
													<ul class="matchedStringUl searchMembershipchildItems"
														style=""></ul>
												</div>
											</div>
										</div>




										<div class="col-lg-2"
											style="text-align: center; margin-top: 0px; padding-right: 0px;">
											<input type="button" class="addBtn btn bg-olive btn-inline"
												onclick="saveMembership('edit','true')"
												style="font-size: 16px; margin-top: 0%; margin-bottom: 0px !important;"
												value="<spring:message code="save.label" />" /> <input
												type="hidden" id="DowlnoadUrlId" value="${filePath}">
												<input type="hidden" id="typeop" value="edit">
										</div>
									</div>


									<div id="childsearchMembership">
										<div class="table-responsive" role="grid"
											style="overflow-x: auto; width: 100%; position: relative; white-space: nowrap;">
											<%-- <label><strong><spring:message code="Memberships.Generated.label" /></strong></label> --%>
											<table id="cardsDetails"
												class="table table-striped table-bordered">
												<thead
													style="background-color: #eeee !important; border-left: hidden; border-right: hidden;">
													<tr>
													
													
													<th class="col-sm-1"><spring:message
																	code="slno.label" /></th>
															<th class="col-sm-3"
																style="padding-left: 22px; padding-right: 35px;"><spring:message
																code="Membership.id.label" /></th>
															<th class="col-sm-2"
																style="padding-left: 55px; padding-right: 17px;">Name</th>
																	<th class="col-sm-2"
																style="padding-left: 22px; padding-right: 17px;">Phone No</th>
															<th class="col-sm-1"
																style="padding-left: 21px; padding-right: 15px;"><spring:message
																	code="start.date.label" /></th>
															<th class="col-sm-1"
																style="padding-left: 22px; padding-right: 22px;"><spring:message
																	code="end.date.label" /></th>
															<th class="col-sm-1"
																style="padding-left: 8px; padding-right: 5px;">Renewal Date</th>
															<th class="col-sm-1"
																style="padding-left: 25px; padding-right: 2px;">Assigned</th>
															<th class="col-sm-1"
																style="padding-left: 25px; padding-right: 27px;"><spring:message
																	code="status.label" /></th>
															
													<th class="col-sm-1">Action</th>
													
													
														
													</tr>
												</thead>
												<tbody style="text-align: center;">
												<c:forEach var="MemberList"
													items="${membership.memberships}" varStatus="theCount">
													<tr style="text-align: center;">
														<td id="membershipchild${theCount.count}">${theCount.count+index-1}</td>
														<%-- <td>${theCount.count}</td> --%>
														<td style="text-align: left;"><input type="text"
															id="membershipCode${theCount.count}"
															value="${MemberList.membershipCode}"
															style="background-color: #eee;" disabled="disabled" class="form-control"/></td>
														
                                                       <c:set var="inside" value="0"></c:set> 

														<c:forEach var="CusromerMemberList"
															items="${membership.customerMemberships}">
															
															 <c:set var="inside" value="1"></c:set> 
														
                                                      <c:if test="${MemberList.membershipCode == CusromerMemberList.member_ship_id}">
                                                      <c:set var="inside" value="2"></c:set>
                                                           <td><input type="text" class="form-control name${theCount.count}"
															id="name${theCount.count}" disabled="disabled"
															value="${CusromerMemberList.name}"  /></td>
                           
                                                         <td><input type="text" class="form-control phone_num${theCount.count}"
															id="phone_num${theCount.count}" disabled="disabled"
															value="${CusromerMemberList.phone_num}"  /></td>
															<td><input
																class="form-control startDateStr${theCount.count}"
																type="text" value="${CusromerMemberList.startDateStr}"
																readonly="readonly" id="startDateStr${theCount.count}"  placeholder="DD/MM/YYYY" 
																onfocus="callCalender('startDateStr${theCount.count}')"
												                 onclick="callCalender('startDateStr${theCount.count}')"
																/>


															</td>
															<td><input
																class="form-control expiryateStr${theCount.count}"
																type="text" value="${CusromerMemberList.endDateStr}"
																readonly="readonly" id="expirydateStr${theCount.count}"   placeholder="DD/MM/YYYY" 
																onfocus="callCalender('expirydateStr${theCount.count}')"
												                 onclick="callCalender('expirydateStr${theCount.count}')"
																 />

															</td>
															<td><input type="text" class="form-control renewaldate${theCount.count}"
															id="renewaldate${theCount.count}" disabled="disabled"
															value="${CusromerMemberList.renewalDateStr}"  /></td>
															
															
												<input type="hidden" id="member_ship_id${theCount.count}"
													value="${CusromerMemberList.member_ship_id}">
												<input type="hidden"
													id="membershipProgramCodecus${theCount.count}"
													value="${CusromerMemberList.membershipProgramCode}">
												
												<input type="hidden" id="customer_category${theCount.count}"
													value="${CusromerMemberList.customer_category}">
												<input type="hidden" id="statuscus${theCount.count}"
													value="${CusromerMemberList.status}">
												

												<input type="hidden" id="membershipFeecus${theCount.count}"
													value="${CusromerMemberList.membershipFee}">
												<input type="hidden" id="activationPoints${theCount.count}"
													value="${CusromerMemberList.activationPoints}">
												<input type="hidden" id="creditAmount${theCount.count}"
													value="${CusromerMemberList.creditAmount}">
												<input type="hidden" id="isAutoRenewalcus${theCount.count}"
													value="${CusromerMemberList.isAutoRenewal}">
												<input type="hidden" id="isOnlinecus${theCount.count}"
													value="${CusromerMemberList.isOnline}">
												<input type="hidden" id="saveReportcus${theCount.count}"
													value="${CusromerMemberList.saveReport}">
													
															</c:if>
															
															
														</c:forEach>
														
														<c:if test="${inside == 1}">
														 <td><input type="text" class="form-control name${theCount.count}"
															id="name${theCount.count}" disabled="disabled"
															value=""  /></td>
														
														<td><input type="text" class="form-control phone_num${theCount.count}"
															id="phone_num${theCount.count}" disabled="disabled"
															value=""  /></td>
															
															<td><input
																class="form-control startDateStr${theCount.count}"
																type="text" value=""
																readonly="readonly" id="startDateStr${theCount.count}"  placeholder="DD/MM/YYYY" />


															</td>
															<td><input
																class="form-control expiryateStr${theCount.count}"
																type="text" value=""
																readonly="readonly" id="expiryateStr${theCount.count}"  placeholder="DD/MM/YYYY" />



															</td>
														
														<td><input type="text" class="form-control renewaldate${theCount.count}"
															id="renewaldate${theCount.count}" disabled="disabled"
															value="" /></td>
														</c:if>
														
														 <c:if test="${empty membership.customerMemberships}">
														
														<td><input type="text" class="form-control name${theCount.count}"
															id="name${theCount.count}" disabled="disabled"
															value=""  /></td>
														<td><input type="text"
															id="phone_num${theCount.count}" disabled="disabled"
															value=""  class="form-control phone_num${theCount.count}" /></td>
															
															<td><input
																class="form-control startDateStr${theCount.count}"
																type="text" value=""
																readonly="readonly" id="startDateStr${theCount.count}"  placeholder="DD/MM/YYYY" />


															</td>
															<td><input
																class="form-control expiryateStr${theCount.count}"
																type="text" value=""
																readonly="readonly" id="expiryateStr${theCount.count}"  placeholder="DD/MM/YYYY" />



															</td>
															
															<td><input type="text" class="form-control renewaldate${theCount.count}"
															id="renewaldate${theCount.count}" disabled="disabled"
															value=""  /></td>
														
														</c:if>


<td>

                                                                   <select
																		class="form-control assignrdstatus${theCount.count}"
																		disabled="disabled" id="assignrdstatus${theCount.count}">
																			<option value="Yes"
																				${MemberList.assignedStatus==true ? 'selected' : ''}>YES</option>
																			<option value="No"
																				${MemberList.assignedStatus==false ? 'selected' : ''}>NO</option>
																	</select>
</td>
														
														<td>
														
														
														 <select
																		class="form-control membershipstatus${theCount.count}"
																		disabled="disabled" id="membershipstatus${theCount.count}">
																			<option value="Active"
																				${MemberList.membershipStatus==true ? 'selected' : ''}>Active</option>
																			<option value="InActive"
																				${MemberList.membershipStatus==false ? 'selected' : ''}>InActive</option>
																	</select>
														
														
														
														</td>
														
														
														<td id="Edit${theCount.count}"><a
															style="color: #2e7ea7 !important; cursor: pointer;"
															onclick="return membershipEdit('${theCount.count}')">Update</a></td>
															
															


													</tr>
													<input type="hidden" id="membershipId${theCount.count}"
														value="${MemberList.membershipId}">
													<input type="hidden" id="status${theCount.count}"
														value="${MemberList.status}">
													<input type="hidden" id="isAutoRenewal${theCount.count}"
														value="${MemberList.isAutoRenewal}">
													<input type="hidden" id="isOnline${theCount.count}"
														value="${MemberList.isOnline}">


												</c:forEach>
</tbody>
											</table>
											

										</div>

										<!-- pagination -->
										<div class="col-lg-12"
											style="margin-left: -4%; margin-top: 0px">


											<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
												<div class="form-group col-lg-6" style="text-align: left;">
													<input type="button" class='paginationButton' value="&#60;"
														onclick=""> ${index} - ${totalValue} of
													${totalRecords} <input type="button"
														class='paginationButton' value="&#62;"
														onclick="viewMembershipDetails('${membership.membershipProgramCode}','edit','${totalValue}','true')">
												</div>
											</c:if>

											<c:if test="${totalValue == totalRecords}">
												<c:if test="${totalValue-maxRecords >0}">
													<div class="form-group col-lg-6" style="text-align: left;">
														<input type="button" class='paginationButton'
															value="&#60;"
															onclick="return viewMembershipDetails('${membership.membershipProgramCode}','edit','${index - (maxRecords + 1)}','true');">
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
													<input type="button" class='paginationButton' value="&#60;"
														onclick="return viewMembershipDetails('${membership.membershipProgramCode}','edit','${index - (maxRecords + 1)}','true');">
													${index} - ${totalValue} of ${totalRecords} . <input
														type="button" class='paginationButton' value="&#62;"
														onclick="viewMembershipDetails('${membership.membershipProgramCode}','edit','${totalValue}','true')">
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
														onclick="viewMembershipDetails('${membership.membershipProgramCode}','edit',document.getElementById('pagination').value,'true');"
														class="btn bg-olive btn-inline  addBtn" value="GO">
												</div>

											</div>
										</div>
									</div>

									<!--pagination  -->


								</div>


							</div>
							<%-- 									<input type="hidden" id="selectedStateList"   value="${statesList}">   --%>

							<input type="hidden" id="selectedZone" name="selectdZones"
								value="${zones}"> <input type="hidden"
								id="selectedLocation" name="locations" value="${locationList}">
							<%--  <input type="hidden" id="selectedAllLocation" value="${locationList}"> --%>
						</div>

						<div class="row" style="text-align: center;">
							<input type="button" class="btnCls" style=""
								onclick="validateMemberships('edit')" value="Update" />
							<c:if test="${sessionScope.role == 'super admin'}">
								<input type="button" class="btnCls buttonMargin" style=""
									onclick="viewMemberships('membership','Memberships','0','menu');"
									value="<spring:message code="cancel.label" />" />
							</c:if>
							<c:forEach var="accessControl"
								items="${sessionScope.CustomerLoyality}">
								<c:if
									test="${accessControl.appDocument == 'GiftCoupons' && accessControl.write == true && accessControl.read == true}">
									<input type="button" class="btnCls buttonMargin" style=""
										onclick="viewMemberships('membership','Memberships','0','menu');"
										value="<spring:message code="cancel.label" />" />
								</c:if>
							</c:forEach>
						</div>
						<br />
						<div class="box-footer"></div>
					</form>
				</div>

			</div>
		</div>
	</section>

</body>
</html>