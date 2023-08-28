<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : admin/genericData/createorganizationmaster.jsp
 * file type		        : JSP
 * description				: The new employee form is displayed using this jsp
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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/controller.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/masterDataManagement/genericMasters/zoneMaster.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/FinantialManagement/orginizationMaster.js"></script>

<%-- 	<script src="${pageContext.request.contextPath}/js/demo-compiled.js"></script> --%>
<%--  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css"> --%>
<style type="text/css">
.calendar_icon {
	background-color: white;
	color: #666;
	padding: 8px 0px 8px 27px !important;
	background: url(http://soe.syr.edu/images/cal_icon_mini.gif) no-repeat
		left center #fff;
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

.col-xs-12 {
	padding: 2% 10%;
}
</style>
<script type="text/javascript">
	$(document).ready(
			function() {
				var phoneNo = $("#phone").val();
				phoneNo = phoneNo.split('-');
				if (phoneNo.length == 1)
					$("#phoneNumber").val(phoneNo[0]);
				else {
					$("#defaultCountry").val(phoneNo[0]);
					$("#phoneNumber").val(phoneNo[1]);
				}
				$("#firstName").keydown(function() {
					$("#firstNameError").html("");
					$("#Error").html("");
				});
				debugger
				var slectedLocations = $("#slectedLocations").val().replace(
						'[', '').replace(']', '').replace(/, /g, ',');
				$("#location").val(slectedLocations.split(','));

				$("#phoneNumber").keydown(function() {
					$("#phoneNumberError").html("");
					$("#Error").html("");
				});

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
						<br />
						<h3>
							<spring:message code="Accounting.configuration.Organisation" />
						</h3>
					</div>
					<!-- /.box-header -->
					<!-- form start -->
					<form id="newEmployee" method="post">
						<div class="box-body">
							<div id="Error" class="Error"
								style="text-align: center; color: red; font-size: 2; font-weight: bold; margin-bottom: 25px; margin-top: -20px">${err}</div>
							<div id="Success" class="Error"
								style="text-align: center; color: blue; font-size: 2; font-weight: bold; margin-bottom: 10px; margin-top: -20px">${resultStr}</div>
							<div class="row">
								<div class="form-group col-lg-6">

									<div class="row">
										<div class="form-group col-lg-12">
											<label><spring:message
													code="Accounting.Organisation.Id" /><span
												style="color: red; font-size: 2">*</span></label> <input type="text"
												class="form-control" style="width: 60%;" id="OrganizationId"
												onchange="DisabelErrors();"
												placeholder="<spring:message code="Accounting.Organisation.Id" />" />
											<span id="errorOrgId"
												style="text-align: left; color: red; font-size: 2; font-weight: bold; display: none;">Please
												enter organization Id</span>
										</div>
									</div>


									<div class="row">
										<div class="form-group col-lg-12">
											<label><spring:message
													code="Accounting.Incorporation" /><span
												style="color: red; font-size: 2">*</span></label> <input type="text"
												class="form-control" style="width: 80%;"
												id="IncorporationName"
												placeholder="<spring:message code="Accounting.Incorporation" />" />
												<span id="errorIncorporationName"
												style="text-align: left; color: red; font-size: 2; font-weight: bold; display: none;">Please
												enter Incorporation Name</span>
										</div>
									</div>


									<div class="row">
										<div class="form-group col-lg-12">
											<label><spring:message code="Accounting.discription" /></label>
											<input type="text" class="form-control" style="width: 80%;"
												id="DiscriptionId"
												placeholder="<spring:message code="Accounting.discription" />" />
										</div>
									</div>


									<div class="row" style="margin-bottom: 10px;">

										<div class=" col-lg-6 ">
											<label><spring:message code="Accounting.gstin" /><span
												style="color: red; font-size: 2">*</span></label> <input type="text"
												class="form-control" value="" id="GstinId"
												onchange="DisabelErrors();"
												placeholder="<spring:message code="Accounting.gstin" />" />
											<span id="errorGstinId"
												style="text-align: left; color: red; font-size: 2; font-weight: bold; display: none;">Please
												enter Gstin</span>
										</div>

										<div class=" col-lg-6">
											<label><spring:message code="status.label" /><span
												style="color: red; font-size: 2">*</span>
											</label> <select
												class="form-control" name="status" id="status"
												style="width: 60% !important;">
												<!-- <option value="" id="" >Select Type</option> -->
												<option value="Active" id="Active">Active</option>
												<option value="In Active" id="In Active">In Active</option>

											</select>
											<span id="errorstatusId"
												style="text-align: left; color: red; font-size: 2; font-weight: bold; display: none;">Please
												Select Status</span>

										</div>

									</div>

									<div class="row" style="margin-bottom: 10px;">

										<div class=" col-lg-6 ">
											<label>PAN No<span
												style="color: red; font-size: 2">*</span> </label> <input type="text" class="form-control"
												value="" id="panNo" onchange="DisabelErrors();"
												placeholder="Pan No" />
												<span id="errorPANno"
												style="text-align: left; color: red; font-size: 2; font-weight: bold; display: none;">Please
												Enter PAN no</span>
												
												

										</div>

										<div class=" col-lg-6 ">
											<label>Bank Account No<span
												style="color: red; font-size: 2">*</span></label> <input type="text"
												class="form-control" value="" id="bankAccNo"
												onchange="DisabelErrors();" placeholder="Bank Account No" />
												<span id="errorbank"
												style="text-align: left; color: red; font-size: 2; font-weight: bold; display: none;">Please
												Enter Bank Account No </span>

										</div>

									</div>

									<div class="row">
										<div class="form-group col-lg-12">
											<label><spring:message code="Accounting.website" /> <span
												style="color: red; font-size: 2">*</span> </label>
											<input type="text" class="form-control" style="width: 80%;"
												id="WebSiteId"
												placeholder="<spring:message code="Accounting.website" />" />
												<span id="errorwebsite"
												style="text-align: left; color: red; font-size: 2; font-weight: bold; display: none;">Please
												Enter Website Details </span>
												
										</div>
									</div>


									<div class="row" style="margin-bottom: 10px;">
										<div class="col-lg-12">
											<label style="margin-top: 5px;"><spring:message
													code="Accounting.mobile.number" /> </label>
											<!-- <span style="color:red; font-size:2">*</span> -->

											<div class="row" style="margin-top: 5px;">
												<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
													<select class="form-control" id="defaultCountry"
														title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
														<option selected="selected">${sessionScope.countryCode}</option>
														<!-- <option>US</option>
						                                  	<option>GB</option>
						                                  	<option>AU</option> -->
													</select>
													<!-- <input type="text" onfocus="displayToolTip();" class="form-control" id="defaultCountry" maxlength="2" oninput="this.value = this.value.replace(/[^A-Za-z]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/> -->
												</div>
												<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8"
													style="padding-left: 0px">
													<input type="text" style="width: 85%;" class="form-control"
														placeholder="<spring:message code="supplier.phone.label" />"
														id="phoneNumber" size="15" maxlength="15"
														onBlur="validateMobileNumber()"
														oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
												</div>
												<input type="hidden" class="form-control" name="phone"
													id="phone" /> <input type="hidden" id="output" />
											</div>
											<span id="phoneNumberError"
												style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											<!-- 						                             <span id="error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> -->
										</div>
									</div>



									<div class="row">
										<div class="form-group col-lg-12">
											<label><spring:message code="Accounting.email.id" /></label>
											<input type="text" class="form-control" style="width: 80%;"
												id="EmailId"
												placeholder="<spring:message code="Accounting.email.id" />" />
										</div>
									</div>

									<%--  <div class="row">
                                         <div class="form-group col-lg-12">
                                            <label><spring:message code="description.label" /></label>
                                            <textarea class="form-control" style="resize:none;" rows="2" name="zoneDescription" id="zoneDescription" required placeholder="<spring:message code="enter.description.label" />" >${zone.zoneDescription}</textarea>
                                        </div>
                                     </div> --%>
								</div>

								<div class="form-group col-lg-6">
									<div class="row">
										<div class="form-group col-lg-12">
											<label><spring:message
													code="Accounting.Incorporation.type" />  <span
												style="color: red; font-size: 2">*</span> <!-- <span style="color:red; font-size:2">*</span> --></label>
											<select class="form-control" name="zoneID"
												id="IncorporationType" style="width: 40% !important;">
												<!-- <option value="" id="" >Select Type</option> -->
												<option value="LLP" id="LLP">LLP</option>
												<option value="Private Limited" id="PrivateLimited">Private
													Limited</option>
												<option value="Public Limited" id="PublicLimited">Public
													Limited</option>
												<option value="Partnership" id="Partnership">Partnership</option>
												<%-- <c:forEach var="locationStr" items="${locationStr}"> 
						                      <option value="" id="locationZone" ></option>
					                     	  </c:forEach> --%>
											</select> 
												<span id="errorIncorporation"
												style="text-align: left; color: red; font-size: 2; font-weight: bold; display: none;">Please
												select Incorporation Details </span>
												
										</div>
									</div>
									
									
									<div class="row">
										<div class="form-group col-lg-12">
											<label><spring:message
													code="Accounting.Franchise.type" />  <span
												style="color: red; font-size: 2">*</span><!-- <span style="color:red; font-size:2">*</span> --></label>
											<select class="form-control" name="businessType"
												id="businessType" style="width: 40% !important;" onchange="getLocations()">
												<option value="Franchise" id="FYes">Yes</option>
												<option value="Main" id="FNo">No</option>
											</select> <span id=""
												style="text-align: left; color: red; font-size: 2; font-weight: bold; display: none;">Please
												select Franchise Details </span>
										</div>
									</div>
									
									
									
									<div class="row">
										<div class="form-group col-lg-12">
											<label><spring:message code="Accounting.addresss" /><span
												style="color: red; font-size: 2">*</span></label> 
												<input type="text"
												class="form-control" id="AddressId1" placeholder="Building/Door No"
												style="margin-bottom: 10px; width: 40%;"
												onchange="DisabelErrors();" /> 
												
											<div class="row">	
													<div class="form-group col-lg-6">
												<input type="text"
												class="form-control" id="AddressId2" placeholder="Street/Road Name"
												style="margin-bottom: 10px; width: 100%;margin-top:-6px" /> 
												
												</div>
												<div class="form-group col-lg-1"></div>
												<div class="form-group col-lg-5">
												<input type="text"
												class="form-control" id="AddressId4" placeholder="Area Name"
												style="margin-bottom: 10px; width: 100%;margin-left:-64px;margin-top:-6px" /> 
												
												</div>
												
											</div>
												
												<div class="row">	
													<div class="form-group col-lg-6">
												<input
												type="text" class="form-control" id="AddressId3"
												placeholder="City" style="width: 100%;margin-top:-21px" /> 
												</div>
												<div class="form-group col-lg-1"></div>
												<div class="form-group col-lg-5">
												
												<input
												type="text" class="form-control" id="AddressId5"
												placeholder="PIN Code" style="width: 100%;margin-left:-64px;margin-top:-21px"
												oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /> 
												</div>
												</div>
												
												<span
												id="errorAddressId"
												style="text-align: left; color: red; font-size: 2; font-weight: bold; display: none;">Please
												enter total address</span>
										</div>
									</div>


									<label><spring:message
											code="Accounting.Business.locations" />   <span
												style="color: red; font-size: 2">*</span><!-- <span style="color:red; font-size:2">*</span> --></label>
									<select class="form-control" multiple="multiple"
										style="height: 205px; width: 80%;" name="location"
										id="location">
										<c:forEach var="locationDetails" items="${locationsList}">
											<option value="${locationDetails.locationId}">${locationDetails.locationId}</option>
										</c:forEach>
									</select> <input type="hidden" id="slectedLocations"
										value="${zone.zones}">
										
										<span id="errorlocation"
												style="text-align: left; color: red; font-size: 2; font-weight: bold; display: none;">Please
												Select location Details </span>
								</div>
							</div>

							<div class="row" style="text-align: center;">
								<input type="button" style="" class="btnCls"
									onclick="CreateOrginization('New','0');"
									value="<spring:message code="submit.label" />" />
								<c:if test="${sessionScope.role == 'super admin'}">
									<input type="button" class="btnCls buttonMargin"
										onclick="viewOrganizationMaster('','data','','');"
										value="<spring:message code="cancel.label" />" />
								</c:if>
								<c:forEach var="accessControl"
									items="${sessionScope.genericBusinessSettings}">
									<c:if
										test="${accessControl.appDocument == 'ZoneMaster' && accessControl.write == true && accessControl.read == true}">
										<input type="button" class="btnCls buttonMargin"
											onclick="viewOrganizationMaster('','data','','');"
											value="<spring:message code="cancel.label" />" />
									</c:if>
								</c:forEach>
							</div>
							<br />
							<div class="box-footer"></div>
						</div>

						<input type="hidden" value="${maxRecords}" id="maxRecords" /> <input
							type="hidden" value="${searchName}" id="searchZone" />

					</form>
				</div>

			</div>
		</div>
	</section>
	<!-- /.content -->
	<!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDHNN78JQSuDoLAZigF4cTbHgyeduFpVn8&libraries=places&callback=initAutocomplete"
         async defer></script> -->
</body>
</html>