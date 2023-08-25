<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file type		        : JSP
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
 	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
 	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
	 <script src="${pageContext.request.contextPath}/js/demo-compiled.js"></script>
	 
 <style type="text/css">
.form-group {
    margin-bottom: 5px;
}
.fileUpload {
    position: relative;
    overflow: hidden;
   /*  margin: 10px; */
}
.fileUpload input.upload {
    position: absolute;
    top: 0;
    right: 0;
    margin: 0;
    padding: 0;
    font-size: 20px;
    cursor: pointer;
    opacity: 0;
    filter: alpha(opacity=0);
}
.btn-primar {
    font-weight: normal; 
	color: white;
    background-color: rgb(128,128,128);
    /* border-color: black; */
}
</style>
<script type="text/javascript">

$(document).ready(function(){
	callCalender("enquiryDate");
	callCalender("contactDate");
	
	$("#phoneNumber").blur(function(){
	if($("#phoneNumber").val().length!= 10){
		$("#error").html("Invalid  Mobile Number");
		return;
	}
	else{
		$("#error").html("");
	}
		});
	var phoneNo = $("#phone").val();
	phoneNo = phoneNo.split('-');
	if(phoneNo.length == 1)
		$("#phoneNumber").val(phoneNo[0]);
	else{
		$("#defaultCountry").val(phoneNo[0]);
		$("#phoneNumber").val(phoneNo[1]);
	}
	 $("#firstName").blur(function(e){
		if($("#firstName").val().trim()!="")
		   $("#firstNameError").html("");
		   
	}); 

	$("#emailId").blur(function(){
		 var email = $("#emailId").val();
	   	  if(email==""){
	   		 return false;
	   	  }
	 	  if(!emailValidation(email)){
	 	   	$("#emailIdError").html("Invalid EmailId (Ex:abc@gmail.com)");
	 	   	return false;
	 	  }
	 	  else{
	 		$("#emailIdError").html("");
		    return true;
	 	  }
	 		});
	$( "#storeLocation").change(function () {
		 var storelocation=$(this).val();
		 		 if(storelocation!==""){
		 			$("#locationError").html("");
		 			return true;;
		 		 }
		 		
	   })
	   .change();
});


</script>
</head>
<body>
<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
				<div class="box box-primary">
                           <div class="box-header" style="text-align: ">
                                <div class="col-lg-9">
	                                <c:if test="${type == 'new'}">
		                                <h3><spring:message code="business.enquiry.label" /></h3>
	                                </c:if>
	                                <c:if test="${type == 'edit'}">
		                                <h3><spring:message code="business.enquiry.label" /> - ${businessEnquiry.enquiryId}</h3>
	                                </c:if>
                                </div>
                                <c:if test="${type == 'edit'}">
	                                <div class="col-lg-3" style="margin-top: 20px;">
	                                	<label><spring:message code="business.enquiry.status.label" /> : ${businessEnquiry.status}</label>
	                                </div>
	                            </c:if>
                           </div><!-- /.box-header -->
                                <!-- form start -->
                                <form id="newGiftVouchers" method="post" >
                                    <div class="box-body">
                                    <input type="hidden" id="type">
                                    <input type="hidden" id="enquiryId" value="${businessEnquiry.enquiryId}">
                                   	 <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 20px; margin-top: -20px">${err}</div>
	        						<div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
                                   	<div class="row">
                                   		<div class="col-lg-6 col-md-6">
                                   			<div class="row">
                                   			<div class="col-lg-2 col-md-2"></div>
                                   			<div class="form-group col-lg-8 col-md-8" style=""> 
                                   				<label><spring:message code="business.enquiry.name.label" /> <span style="color:red; font-size:2">*</span></label>
                                   			</div>
                                   			</div>
                                   		<div class="row">
                                   		<div class="col-lg-2 col-md-2"></div>
                                   		<div class="form-group col-lg-4 col-md-4" style=""> 
                                            <input type="text" class="form-control" id="firstName" name="firstName" value="${businessEnquiry.fromFirstName}" placeholder="<spring:message code="business.enquiry.first.name.label" />"/>
                                             <span style="color:red; font-size:2" id="firstNameError"></span>
										</div>
										<div class="form-group col-lg-4 col-md-4" style=""> 
                                            <input type="text" class="form-control" id="lastName" name="lastName" value="${businessEnquiry.fromLastName}" placeholder="<spring:message code="business.enquiry.last.name.label" />"/>
                                             <span style="color:red; font-size:2" id="lastNameError"></span>
										</div> 
										</div>                                       
                                     	</div>
                                     	
                                     	<div class="col-lg-6 col-md-6">
                                     	<div class="row">
                                     	<div class="form-group col-lg-4 col-md-4" style=""> 
                                         <label><spring:message code="business.enquiry.contact.info.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="emailId" name="emailId" value="" placeholder="E-Mail ID">
                                             <span style="color:red; font-size:2" id="emailIdError"></span>
										</div>
										<div class="form-group col-lg-4 col-md-4"> 
											<div class="row">
				                                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <label><spring:message code="business.enquiry.phoneNo.label" /><span style="color:red; font-size:2">*</span></label>
                                    <div class="row">
                                   <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4" style="padding-right: 2px;">
  
				                                  	<select  style="padding: 2px;" class="form-control" id="defaultCountry" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
				                                  	<option selected="selected">IN</option>
				                                  	<option>US</option>
				                                  	<option>GB</option>
				                                  	<option>AU</option>
				                                  	</select>
				                                  </div>
				                                  <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px;">
  
				                                  	<input type="text" class="form-control" placeholder="Phone No" id="phoneNumber" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');">
				                                  </div>
                                       </div>
                                                    </div>
				                                  <input type="hidden" class="form-control" name="phone" id="phone" value="">
				                                   <input type="hidden" id="output">
				                             </div>
				                        	<span id="error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div>
                                     	</div>
                                     	</div>
                                     	
										<%-- <div class="col-lg-2 col-md-2">
                                   			<div class="row">
                                   				<div class="form-group col-lg-12 col-md-10" style=""> 
                                   					<label><spring:message code="business.enquiry.contact.info.label" /> <span style="color:red; font-size:2">*</span></label>
                                   				</div>
                                   			</div>
                                   		<div class="row">
                                   		<div class="form-group col-lg-12 col-md-12" style=""> 
                                            <input type="text"  class="form-control" id="emailId" name="emailId" value="${businessEnquiry.emailId}" placeholder="<spring:message code="business.enquiry.email.id.label" />"/>
                                             <span style="color:red; font-size:2" id="emailIdError"></span>
										</div>
										 
										</div>                                       
                                     	</div>
 --%>                                     	<div class="form-group col-lg-3 col-md-3" > 
                                     	<%-- <div class="row">
                                   				<div class="form-group col-lg-8 col-md-10" style=""> 
                                   					<label><spring:message code="business.enquiry.phoneNo.label" /><span style="color:red; font-size:2">*</span></label>
                                   				</div>
                                                 
											<div class="row">
											<div class="form-group col-lg-8 col-md-8">
				                                  <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4" style="padding-right: 2px;">
				                                  	<select  style="padding: 2px;" class="form-control" id="defaultCountry" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
				                                  	<option selected="selected">IN</option>
				                                  	<option>US</option>
				                                  	<option>GB</option>
				                                  	<option>AU</option>
				                                  	</select>
				                                  </div>
				                                  <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px;">
				                                  	<input type="text" value="" class="form-control" placeholder="<spring:message code="business.enquiry.phone.no.label" />" id="phoneNumber" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
				                                  </div>
				                                  <input type="hidden" class="form-control" name="phone" id="phone"  value="${businessEnquiry.phoneNumber}"/>
				                                   <input type="hidden" id="output" />
				                             </div>
				                        	<span id="error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
										</div>
										</div>
 --%>                                    </div>

                                     	</div>
                                     	<br>
                                     	<div class="row">
                                   		<div class="col-lg-6 col-md-6">
                                   			<div class="row">
                                   			<div class="col-lg-2 col-md-2"></div>
                                   			<div class="form-group col-lg-10 col-md-10" style=""> 
                                   				<label><spring:message code="business.enquiry.when.label" /></label>
                                   			  <span style="color:red; font-size:2">*</span>
                                   			</div>
                                   			</div>
                                   		<div class="row">
                                   		<div class="col-lg-2 col-md-2"></div>
                                   		<div class="form-group col-lg-4 col-md-4" style=""> 
                                   			<input class="form-control calendar_icon" readonly="readonly" value="${businessEnquiry.enquiryDateStr}" style="background-color: white;" name="enquiryDate" id="enquiryDate" size="20" type="text" onfocus="callCalender('enquiryDate')" onclick="callCalender('enquiryDate')" placeholder="DD/MM/YYYY"/>
                                             <span style="color:red; font-size:2" id="enquiryDateError"></span>
										</div>
										<div class="form-group col-lg-4 col-md-4" style=""> 
										<div class="bootstrap-timepicker">
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="enquiryTime" id="enquiryTime" value="${businessEnquiry.enquiryTimeStr}" />
                                                <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
                                            </div><!-- /.input group -->
                                        </div>
                                         <span style="color:red; font-size:2" id="enquiryTimeError"></span>
										</div> 
										</div>                                       
                                     	</div>
										<div class="col-lg-6 col-md-6">
                                   			<div class="row">
	                                   			<div class="form-group col-lg-12 col-md-12" style=""> 
	                                   				<label><spring:message code="business.enquiry.when.want.contact" /></label>
	                                   			</div>
                                   			</div>
                                   		<div class="row">
                                   		<div class="form-group col-lg-4 col-md-4" style="">
                                   			<input class="form-control calendar_icon" readonly="readonly" value="${businessEnquiry.contactDateStr}" style="background-color: white;" name="contactDate" id="contactDate" size="20" type="text" onfocus="callCalender('contactDate')" onclick="callCalender('contactDate')" placeholder="DD/MM/YYYY"/> 
                                             <span style="color:red; font-size:2" id="contactDateError"></span>
										</div>
										<div class="form-group col-lg-4 col-md-4" style=""> 
											<div class="bootstrap-timepicker">
	                                            <div class="input-group">                                            
	                                                <input type="text" class="form-control timepicker" name="contactTime" id="contactTime" value="${businessEnquiry.contactTimeStr}" />
	                                                <div class="input-group-addon">
	                                                    <i class="fa fa-clock-o"></i>
	                                                </div>
	                                            </div><!-- /.input group -->
	                                        </div>
                                             <span style="color:red; font-size:2" id="contactTimeError"></span>
										</div> 
										</div>                                       
                                     	</div>
                                     	</div>
                                     	<br>
                                     	<div class="row">
                                     	<div class="col-lg-1 col-md-1"></div>
										<div class="col-lg-10 col-md-10">
                                   			<label><spring:message code="business.enquiry.address.label" /></label>
                                   		<div class="row">
                                   		<div class="form-group col-lg-2 col-md-2" style=""> 
                                            <input type="text" class="form-control" id="houseNo" name="houseNo" value="${businessEnquiry.houseNo}" placeholder="<spring:message code="business.enquiry.house.number.label" />"/>
                                             <span style="color:red; font-size:2" id="houseNoError"></span>
										</div>
										<div class="form-group col-lg-2 col-md-2" style=""> 
                                            <input type="text" class="form-control" id="streetName" name="streetName" value="${businessEnquiry.streetName}" placeholder="<spring:message code="business.enquiry.street.label" />"/>
                                             <span style="color:red; font-size:2" id="streetNameError"></span>
										</div>
										<div class="form-group col-lg-2 col-md-2" style=""> 
                                            <input type="text" class="form-control" id="location" name="location" value="${businessEnquiry.location}" placeholder="<spring:message code="business.enquiry.locality.label" />"/>
                                             <span style="color:red; font-size:2" id="locationError"></span>
										</div>
										<div class="form-group col-lg-2 col-md-2" style=""> 
                                            <input type="text" class="form-control" id="city" name="city" value="${businessEnquiry.city}" placeholder="<spring:message code="business.enquiry.city.label" />"/>
                                             <span style="color:red; font-size:2" id="cityError"></span>
										</div>
										<div class="form-group col-lg-2 col-md-2" style=""> 
                                            <input type="text" class="form-control" id="state" name="state" value="${businessEnquiry.state}" placeholder="<spring:message code="business.enquiry.state.label" />"/>
                                             <span style="color:red; font-size:2" id="stateError"></span>
										</div>
										<div class="form-group col-lg-2 col-md-2" style=""> 
                                            <input type="text" class="form-control" id="zipCode" name="zipCode" value="${businessEnquiry.zipCode}" placeholder="<spring:message code="business.enquiry.zip.code.label" />"/>
                                             <span style="color:red; font-size:2" id="zipCodeError"></span>
										</div> 
										</div>                                       
                                     	</div>
                                     	</div>
                                     	<br>
                                     	<div class="row">
                                     		<div class="col-lg-1 col-md-1"></div>
												<div class="col-lg-10 col-md-10" >
												<div class="row">
			                                   		<div class="form-group col-lg-2 col-md-3" style="">
			                                   			<label><spring:message code="business.enquiry.category.label" /></label>
			                                            <select id="enquiryType" class="form-control" >
															<option value="Sales" ${'Sales' == businessEnquiry.enquiryType ? 'selected' : ''}>Sales</option>
															<option value="Products" ${'Products' == businessEnquiry.enquiryType ? 'selected' : ''}>Products</option>
															<option value="Support" ${'Support' == businessEnquiry.enquiryType ? 'selected' : ''}>Support</option>
															<option value="Delivery" ${'Delivery' == businessEnquiry.enquiryType ? 'selected' : ''}>Delivery</option>
															<option value="Partnership" ${'Partnership' == businessEnquiry.enquiryType ? 'selected' : ''}>Partnership</option>
															<option value="Franchise" ${'Franchise' == businessEnquiry.enquiryType ? 'selected' : ''}>Franchise</option>
														  </select>
													 </div>
													 <div class="form-group col-lg-2 col-md-3" style="">
			                                   			<label><spring:message code="business.enquiry.channel" /></label>
			                                            <select id="enquiryChannel" class="form-control" >
															<option value="Online" ${'Online' == businessEnquiry.enquiryChannel ? 'selected' : ''}>Online</option>
				                                            <option value="Phone" ${'Phone' == businessEnquiry.enquiryChannel ? 'selected' : ''}>Phone</option>
				                                            <option value="Sales Executive" ${'Sales Executive' == businessEnquiry.enquiryChannel ? 'selected' : ''}>Sales Executive</option>
				                                            <option value="Direct" ${'Direct' == businessEnquiry.enquiryChannel ? 'selected' : ''}>Direct</option>
														  </select>
													 </div>
													  <div class="form-group col-lg-2 col-md-3">
			                                            <label><spring:message code="EmployeeForm.location" /> <span style="color:red; font-size:2">*</span></label>
			                                            <select class="form-control" name="storeLocation" id="storeLocation">
			                                            	<option value="">Select</option>
			                                             <c:forEach var="location" items="${workLocationsList}">
															<option value="${location}" ${location == businessEnquiry.storeLocation ? 'selected' : ''}>${location}</option>
														</c:forEach>
			                                           </select>
			                                           <span id="locationError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
			                                        </div>
													<div class="form-group col-lg-4 col-md-3"  style="">
			                                   			<label><spring:message code="business.enquiry.subject.label" /></label>
			                                            <input type="text" class="form-control" value="${businessEnquiry.enquirySubject}" id="enquirySubject" name="enquirySubject" />
			                                             <span style="color:red; font-size:2" id="enquirySubjectError"></span>
													</div>  
													<div class="form-group col-lg-2 col-md-3" style="">
			                                   			<label><spring:message code="business.enquiry.status.label" /></label>
			                                            <select id="statusType" class="form-control">
															<option value="Opened" >Opened</option>
															<option value="pending" >pending </option>
															<option value="closed">closed</option>
														
														  </select>
													 </div>
													
												</div>
												</div>
											</div>                                     
                                     	<div class="row">
	                                     	<div class="col-lg-1 col-md-1"></div>
	                                     	<div class="col-lg-10 col-md-10" >
		                                     	<textarea  rows="5" class="form-control" style="resize:none;" id="enquiryDesc" name="enquiryDesc" placeholder="<spring:message code="enter.enquiry.description.label" />" >${businessEnquiry.enquiryDesc}</textarea>
			                                	<span style="color:red; font-size:2" id="enquiryDescError"></span>
			                                </div>
                                     	</div>
                                     	<br>
                                     	<div class="row" style="text-align: center;">
                                     	 <c:if test="${type == 'new'}">
			                                <input type="button" style="" class="btnCls" onclick="validateBusinessEnquiry('new');" value="<spring:message code="submit.label" />" />
		                                </c:if>
		                                <c:if test="${type == 'edit'}">
			                                <c:forEach var="activity" items="${businessEnquiry.nextActivities}">
			                                	<c:forEach var="accessControl" items="${sessionScope.businessEnquiryActivity}">
											 		<c:if test="${activity == accessControl.appDocumentActivity}">
													 	<input type="button" style="margin-left:1%;position: relative;" class="btnCls" onclick="validateBusinessEnquiry('edit','${activity}');" value="${activity}" />
											 		</c:if>
							     				</c:forEach> 
			                                	
											 	<%-- <input type="button" style="margin-left:1%;width: 80px;position: relative;" class="btn bg-olive btn-inline" onclick="validateBusinessEnquiry('edit','${activity}');" value="${activity}" /> --%>
											 </c:forEach>
		                                </c:if>
											  <c:if test="${sessionScope.role == 'super admin'}"> 
											  	<input type="button" class="btnCls buttonMargin" style="margin-left:1%;" onclick="return viewBusinessEnquiry('businessEnquiry','0');" value="<spring:message code="cancel.label" />" />
											  </c:if>
											<c:forEach var="accessControl" items="${sessionScope.crm}">
					                            <c:if test="${accessControl.appDocument == 'BusinessEnquiry' && accessControl.write == true && accessControl.read == true}">
											 		<input type="button" class="btnCls buttonMargin" style="" onclick="return viewBusinessEnquiry('businessEnquiry','0');" value="<spring:message code="cancel.label" />" />
											 	</c:if>
											 </c:forEach>
										</div>
									</div>
										<br>
	                                    <div class="box-footer"></div>
                                    	</form>
                                    </div><!-- /.box-body -->
                            		</div>
                            
</div>
</section><!-- /.content -->
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/timepicker/bootstrap-timepicker.min.js" ></script>
 <script>
  //Timepicker
  $(".timepicker").timepicker({
	  showInputs: false,
      showMeridian:false,
      showSeconds:true,
  });
  </script>
</body>
</html>