<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : admin/genericData/newEmployee.jsp
 * file type		        : JSP
 * description				: The new employee form is displayed using this jsp
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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/controller.js"></script>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/crm/customer.js"></script>
	<script src="${pageContext.request.contextPath}/js/demo-compiled.js"></script>
	
	
<style type="text/css">
@media (min-width: 768px){
  .seven-cols .col-md-1,
  .seven-cols .col-sm-1,
  .seven-cols .col-lg-1  {
    width: 100%;
    *width: 100%;
  }
}
.uiv2-add-button {
    background-color: #6FC143;
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fee67c',endColorstr='#f2cb76',GradientType=0);
    color: #414042;
    float: left;
    padding: 10px 8px 5px 10px;
    border: 1px solid #f1e08e;
    border-radius: 5px;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    width: 97px;
    text-transform: uppercase;
    height: 35px;
    margin-left: 25%;
    margin-top: -7%;
    cursor: pointer;
}
#widgetpage{
/* margin: 1% 0%; */
    height: auto;
    overflow-y: auto;
    overflow-x: hidden;
    min-height: 230px;
    max-height: 500px;}
    .highlightaddress{
         background: #352504 !important;
    color: white !important;
    }
    
    
.w3-btn-floating {
    width: 25px;
    height: 25px;
    line-height: 25px;
}

.w3-btn-floating, .w3-btn-floating-large {
    display: inline-block;
    text-align: center;
   
  
    position: relative;
    overflow: hidden;
    z-index: 1;
    padding: 0;
   
    cursor: pointer;
    font-size: 15px;
}
.w3-teal, .w3-hover-teal:hover {
 
    background-color: #FFFFFF;
    border: 1px solid #352504;
}
@media (min-width: 992px) {
  .seven-cols .col-md-1,
  .seven-cols .col-sm-1,
  .seven-cols .col-lg-1 {
    width: 14.285714285714285714285714285714%;
    *width: 14.285714285714285714285714285714%;
  }
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
  .pac-container {
          width: 30% !important;;
      }
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$(this).scrollTop(0);
		callCalender('dob');
		callCalender('marriageDate');
		var phoneNo = $("#mobileNumber").val();
		phoneNo = phoneNo.split('-');
		if(phoneNo.length == 1)
			$("#phoneNumber").val(phoneNo[0]);
		else{
			$("#defaultCountry").val(phoneNo[0]);
			$("#phoneNumber").val(phoneNo[1]);
		}
		phoneNo = $("#telephoneNumber").val();
		phoneNo = phoneNo.split('-');
		if(phoneNo.length == 1)
			$("#phoneNumber1").val(phoneNo[0]);
		else{
			$("#defaultCountry1").val(phoneNo[0]);
			$("#phoneNumber1").val(phoneNo[1]);
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
	         <h3><spring:message code="new.customer.label" /></h3>
        </div>
	      <!-- form start -->
	      <form id="newEmployee" method="post">
	         <div class="box-body">
                 <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;">${err}</div>
                 <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-top: -20px">${success}</div>
	              <br>
	              
	              <div class="row" style="text-align: right;margin-bottom: -21px;">
				 <input type="button" style="margin-right: 14px;" class="btnCls" onclick="validateCustomerForm('new')" value="<spring:message code="submit.label" />" />
				  <c:if test="${sessionScope.role == 'super admin'}"> 
				  	<input type="button" class="btnCls " style="margin-right: 14px;" onclick="viewCustomers('customerViews');" value="<spring:message code="cancel.label" />" />
				  </c:if>
				 <c:forEach var="accessControl" items="${sessionScope.crm}">
		            <c:if test="${accessControl.appDocument == 'CustomerView' && accessControl.write == true && accessControl.read == true}">
						<input type="button" class="btnCls" style="margin-right: 14px;" onclick="viewCustomers('customerViews');" value="<spring:message code="cancel.label" />" />
					</c:if>
				</c:forEach>
				</div>
	              
	              <div class="row">
	              	<div class="col-lg-12 col-md-12">
                   	 <div class="form-group col-lg-3 col-md-3">
                           <label><spring:message code="customer.type.label" /> <span style="color:red; font-size:2">*</span></label>
                           <select id="customerType" name ="customerType" class="form-control clearError" >
                           		<option value="NORMAL" ${customerObj.category == 'NORMAL' ? 'selected' : ''}>NORMAL</option>
		                	  	<option value="BASIC" ${customerObj.category == 'BASIC' ? 'selected' : ''}>BASIC</option>
		                	  	<option value="GENERIC" ${customerObj.category == 'GENERIC' ? 'selected' : ''}>GENERIC</option>
		                	  	<option value="PLUS" ${customerObj.category == 'PLUS' ? 'selected' : ''}>PLUS</option>
		                	  	<option value="PREMIUM" ${customerObj.category == 'PREMIUM' ? 'selected' : ''}>PREMIUM</option>
							    <option value="SILVER" ${customerObj.category == "SILVER" ? 'selected' : ''}>SILVER</option>
								<option value="GOLD" ${customerObj.category == "GOLD" ? 'selected' : ''}>GOLD</option>
							    <option value="PLATINUM" ${customerObj.category == "PLATINUM" ? 'selected' : ''}>PLATINUM</option>
							    <option value="EMPLOYEE PREMIUM" ${customerObj.category == "EMPLOYEE PREMIUM" ? 'selected' : ''}>EMPLOYEE PREMIUM</option>
							   <option value="EMPLOYEE GENERIC" ${customerObj.category == "EMPLOYEE GENERIC" ? 'selected' : ''}>EMPLOYEE GENERIC</option>
							</select>
                      </div>
					  <div class="form-group col-lg-9 col-md-9" style="padding-left: 0px;">
					  	<hr style="margin-top: 31px;width: 100%;border-top: 1px solid rgb(233,233,233);" />
                      </div>
                     </div>
	              </div>
	              <div class="row">
                   	 <div class="col-lg-6 col-md-6">
                   	 	<div class="form-group col-lg-2 col-md-2">
                           <label><spring:message code="customer.title.label" /></label>
                           <select style="padding: 2px;" name ="title" id="title" class="form-control clearError" >
		                	  	<option value="Mr" ${customerObj.title == 'Mr' ? 'selected' : ''}>Mr</option>
		                	  	<option value="Miss" ${customerObj.title == 'Miss' ? 'selected' : ''}>Miss</option>
		                	  	<option value="Mrs" ${customerObj.title == 'Mrs' ? 'selected' : ''}>Mrs</option>
		                	  	<option value="Ms" ${customerObj.title == 'Ms' ? 'selected' : ''}>Ms</option>
		                	  	<option value="Dr" ${customerObj.title == 'Dr' ? 'selected' : ''}>Dr</option>
							</select>
						</div>
						<div class="form-group col-lg-4 col-md-4" style="padding-left: 0px;">
							<label><spring:message code="customer.first.name.label" /> <span style="color:red; font-size:2">*</span></label>
                            <input type="text" class="form-control clearError" name="firstName" value="${customerObj.name}" id="firstName" required placeholder="<spring:message code="enter.customer.first.name.label" />" />
                            <span id="firstNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						<div class="form-group col-lg-6 col-md-6">
							<label><spring:message code="customer.last.name.label" /></label>
                            <input type="text" class="form-control clearError" name="lastName" value="${customerObj.lastName}" id="lastName" required placeholder="<spring:message code="enter.customer.last.name.label" />" />
						    <span id="lastNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
                      </div>
                      <div class="col-lg-6 col-md-6"> </div>
	              </div>
	             <div class="row">
                   	 <div class="col-lg-9 col-md-6">
						<div class="form-group col-lg-4 col-md-6" style="margin-right: -6px;">
							<label><spring:message code="customer.company.name" /></label>
                            <input type="text" class="form-control clearError" name="companyName" value="${customerObj.companyName}" id="companyName" required placeholder="<spring:message code="enter.employer.name" />" />
						    <span id="companyNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						<div class="form-group col-lg-4 col-md-6">
							<label><spring:message code="site.url.label" /></label>
                            <input type="text" class="form-control clearError" name="siteUrl" value="${customerObj.siteUrl}" id="siteUrl" required placeholder="<spring:message code="enter.site.name" />" />
						</div>
						<div class="form-group col-lg-4 col-md-6">
							<label>Card Code</label>
                            <input type="text"  class="form-control" name="cardCode" value="${customerObj.cardCode}" id="cardCode" required placeholder="Enter Card Code" />
						    <span id="cardCodeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
                      </div>
                      <div class="col-lg-6 col-md-6"> </div>
	              </div>
	              <br>
	              <div class="row">
	              	<div class="col-lg-12 col-md-12">
                   	 <div class="form-group col-lg-2 col-md-2">
                           <label><spring:message code="customer.address.label" /></label>
                      </div>
					  <div class="form-group col-lg-10 col-md-10" style="padding-left: 0px;">
				<!--   <hr style="margin-top: 10px;margin-bottom:0px;width: 100%;border-top: 1px solid rgb(233,233,233);" />  -->
					  	<hr style="margin-top: 10px;margin-bottom:0px;margin-left: -4%;width: 105%;border-top: 1px solid rgb(233,233,233);" />
                      </div>
                     </div>
	              </div>
	              <div class="row">
                   	 <div class="col-lg-10 col-md-10">
						<div class="form-group col-lg-3 col-md-2">
							<label><spring:message code="customer.mail.id.label" /><span style="color:red; font-size:2">*</span></label>
                            <input type="text" class="form-control clearError" name="emailId" value="${customerObj.email}" id="emailId" required placeholder="<spring:message code="enter.customer.mail.id.label" />" />
						</div>
						<div class="form-group col-lg-3 col-md-3">
							<label><spring:message code="customer.mobile.number.label" /><span style="color:red; font-size:2">*</span></label>
			                <div class="row">
			                       <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4" style="padding-right: 5px;">
			                       	<select style="padding: 4px 1px;" class="form-control clearError" id="defaultCountry" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
			                       		<option text="India" ${'India' == customerObj.country ? 'selected' : ''}>IN</option>
	                                  	<option text="USA" ${'USA' == customerObj.country ? 'selected' : ''}>US</option>
	                                  	<option text="United Kingdom" ${'United Kingdom' == customerObj.country ? 'selected' : ''}>GB</option>
	                                  	<option text="Australia" ${'Australia' == customerObj.country ? 'selected' : ''}>AU</option>
			                       	</select>
			                       </div>
			                       <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px">
			                       	<input type="text" class="form-control clearError" placeholder="<spring:message code="customer.mobile.number.label" />" id="phoneNumber" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
			                        <span id="phoneNumberError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
			                       </div>
			                       <input type="hidden" class="form-control" name="mobileNumber" id="mobileNumber"  value="${customerObj.phone}"/>
			                        <input type="hidden" id="output" />
			                  </div>
			                 <span id="error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						<div class="form-group col-lg-3 col-md-3">
							<label><spring:message code="customer.telephone.number.label" /></label>
							<div class="row">
			                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4" style="padding-right: 5px;">
			                    	<select style="padding: 4px 1px;" class="form-control clearError" id="defaultCountry1" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
			                    		<option text="India" ${'India' == customerObj.country ? 'selected' : ''}>IN</option>
	                                  	<option text="USA" ${'USA' == customerObj.country ? 'selected' : ''}>US</option>
	                                  	<option text="United Kingdom" ${'United Kingdom' == customerObj.country ? 'selected' : ''}>GB</option>
	                                  	<option text="Australia" ${'Australia' == customerObj.country ? 'selected' : ''}>AU</option>
			                    	</select>
			                    </div>
			                    <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px">
			                    	<input type="text" class="form-control clearError" placeholder="<spring:message code="customer.telephone.number.label" />" id="phoneNumber1" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
			                        <span id="phoneNumber1Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
			                    </div>
			                    <input type="hidden" class="form-control clearError" name="telephoneNumber" id="telephoneNumber"  value="${customerObj.alternatePhoneNum}"/>
			                     <input type="hidden" id="output1" />
			               </div>
			              <span id="error1" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						<div class="form-group col-lg-3 col-md-3"></div>
                      </div>
                      <div class="col-lg-2 col-md-2"> </div>
	              </div>
	              <div class="row">
	              <div class="seven-cols" style="" >
	              <div class="col-lg-12 col-md-12">
                                  
                        <div class="form-group col-lg-1 col-md-1"> 
							<label><spring:message code="customer.house.number.label" /></label>
                            <input type="text" class="form-control clearError" name="houseNo" value="${customerObj.houseNo}" id="houseNo" required placeholder="<spring:message code="customer.house.number.label" />" />
						    <span id="houseNoError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						<div class="form-group col-lg-1 col-md-1"> 
							<label><spring:message code="street.name.label" /></label>
                            <input type="text" class="form-control street-class clearError" name="streetName" value="${customerObj.street}" id="street" required placeholder="<spring:message code="street.name.label" />" />
							<span id="streetError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						<div class="form-group col-lg-1 col-md-1">
							<label><spring:message code="customer.locality.label" /></label>
                            <input type="text" class="form-control locality-class clearError" name="locality" value="${customerObj.locality}" id="locality" required placeholder="<spring:message code="customer.locality.label" />" />
						<span id="localitysError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						<div class="form-group col-lg-1 col-md-1">
							<label><spring:message code="customer.city.label" /></label>
                            <input type="text" class="form-control city-class clearError" name="city" value="${customerObj.city}" id="city" required placeholder="<spring:message code="customer.city.label" />" />
						<span id="cityError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						<div class="form-group col-lg-1 col-md-1">
							<label><spring:message code="customer.zip.code.label" /></label>
                            <input type="text" class="form-control zip-code-class clearError" name="zipCode" value="${customerObj.pin_no}" id="zipCode" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" required placeholder="<spring:message code="customer.zip.code.label" />" />
						 <span id="zipCodeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						<div class="form-group col-lg-1 col-md-1">
							<label><spring:message code="customer.state.label" /></label>
                            <input type="text" class="form-control state-class clearError" name="state" value="${customerObj.state}" id="state"  required placeholder="<spring:message code="customer.state.label" />" />
						     <span id="stateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						<div class="form-group col-lg-1 col-md-1">
							<label><spring:message code="customer.country.label" /></label>
                            <input type="text" class="form-control country-class clearError" name="country" value="${customerObj.country}" id="country"  required placeholder="<spring:message code="customer.country.label" />" />
						     <span id="countryError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
                      
                      </div>
                      </div>
                      </div>
                      <br>
                      <div class="row">
	              	<div class="col-lg-12 col-md-12" style="margin-bottom: -13px;">
                   	 <div class="form-group col-lg-2 col-md-2">
                           <label><spring:message code="customer_shipment.address.label" /></label>
                      </div>
					  <div class="form-group col-lg-10 col-md-10" style="padding-left: 0px;">
					  	<hr style="margin-top: 10px;margin-bottom:0px;margin-left: -4%;width: 105%;border-top: 1px solid rgb(233,233,233);" />
                      </div>
                     </div>
	              </div>
	              <div class="row">
	              <div class="col-lg-10 col-md-10"></div>
	              <div class="col-lg-2 col-md-2">
					<c:forEach var="addr" items="${addressList}" varStatus="theCount">
						<input type="hidden" value="${addr.shipmentName}" id="shipmentNameaddress${theCount.count}">
						<input type="hidden" value="${addr.shipmentContact}" id="shipmentContactaddress${theCount.count}">
						<input type="hidden" value="${addr.landLine}" id="landLineaddress${theCount.count}">
						<input type="hidden" value="${addr.doorNumber}" id="doorNumberaddress${theCount.count}">     
						<input type="hidden" value="${addr.streetName}" id="street1address${theCount.count}">
						<input type="hidden" value="${addr.locality}" id="locality1address${theCount.count}">
						<input type="hidden" value="${addr.city}" id="city1address${theCount.count}">
						<input type="hidden" value="${addr.zipCode}" id="zipCode1address${theCount.count}">
						<input type="hidden" value="${addr.state}" id="state1address${theCount.count}">
						<input type="hidden" value="${addr.country}" id="country1address${theCount.count}">  
						<input type="hidden" value="${addr.longitude}" id="longitude1address${theCount.count}">   
						<input type="hidden" value="${addr.latitude}" id="latitude1address${theCount.count}"> 
						<input type="hidden" value="${addr.addressType}" id="addressTypeaddress${theCount.count}">
						<input type="hidden" value="${addr.custAddressId}" id="custAddressIdaddress${theCount.count}">
						<input type="hidden" value="${addr.shipmentContactCode}" id="shipmentContactCodeaddress${theCount.count}">
						<input type="hidden" value="${addr.landLineCode}" id="landLineCodeaddress${theCount.count}">
						<input type="hidden" value="${addr.country}" id="landLineCountryNameaddress${theCount.count}">
						<input type="hidden" value="${addr.country}" id="shipmentCountryNameaddress${theCount.count}">
					</c:forEach>
	              
					<span><a id="address1" onclick="shipmentAddress(this)" style="margin-right: 5px;padding: 0px 5px 25px 5px;; border:solid 1px gray" class="w3-btn-floating w3-teal highlightaddress"><font size="+1">1</font></a></span>     
					<span><a id="address2" onclick="shipmentAddress(this)" style="margin-right: 5px;padding: 0px 5px 25px 5px;; border:solid 1px gray" class="w3-btn-floating w3-teal"><font size="+1">2</font></a></span>   
					<span><a id="address3" onclick="shipmentAddress(this)" style="margin-right: 5px;padding: 0px 5px 25px 5px;; border:solid 1px gray" class="w3-btn-floating w3-teal"><font size="+1">3</font></a></span>    
					<span><a id="address4" onclick="shipmentAddress(this)" style="margin-right: 5px;padding: 0px 5px 25px 5px;; border:solid 1px gray" class="w3-btn-floating w3-teal"><font size="+1">4</font></a></span>    
					     
				</div>
	            </div>
	              
	              <div class="row">
                   	 <div class="col-lg-10 col-md-10">
						<div class="form-group col-lg-3 col-md-3">
							<label><spring:message code="customer_name.label" /><span style="color:red; font-size:2">*</span></label>
                            <input type="text" class="form-control clearError" name="shipmentName" value="${addressList[0].shipmentName}" id="shipmentName" required placeholder="<spring:message code="enter.customer_name.label" />" />
							 <span id="shipmentNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>						
						</div>
						<div class="form-group col-lg-3 col-md-3">
							<label><spring:message code="customer.mobile.number.label" /></label>
			                <div class="row">
			                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4" style="padding-right: 5px;">
			                  	<select style="padding: 4px 1px;" class="form-control clearError" id="defaultCountry2" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
			                       	<option text="India" ${'India' == addressList[0].country ? 'selected' : ''}>IN</option>
	                               	<option text="USA" ${'USA' == addressList[0].country ? 'selected' : ''}>US</option>
	                               	<option text="United Kingdom" ${'United Kingdom' == addressList[0].country ? 'selected' : ''}>GB</option>
	                               	<option text="Australia" ${'Australia' == addressList[0].country ? 'selected' : ''}>AU</option>
			                     </select>
			                </div>
			                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px">
			                  <input type="text" class="form-control clearError" placeholder="<spring:message code="customer.mobile.number.label" />" value="${addressList[0].shipmentContact}" id="shipmentContact" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
			                 </div>
			               		<%-- <input type="hidden" class="form-control" name="mobileNumber" id="mobileNumber"  value="${customerObj.phone}"/> --%>
			                    <input type="hidden" id="output2" />
			                  </div>
			                 <span id="error2" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						
						<div class="form-group col-lg-3 col-md-3">
							<label><spring:message code="customer.telephone.number.label" /></label>
							<div class="row">
			                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4" style="padding-right: 5px;">
			                    	<select style="padding: 4px 1px;" class="form-control clearError" id="defaultCountry3" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
			                    		<option text="India" ${'India' == addressList[0].country ? 'selected' : ''}>IN</option>
		                               	<option text="USA" ${'USA' == addressList[0].country ? 'selected' : ''}>US</option>
		                               	<option text="United Kingdom" ${'United Kingdom' == addressList[0].country ? 'selected' : ''}>GB</option>
		                               	<option text="Australia" ${'Australia' == addressList[0].country ? 'selected' : ''}>AU</option>
			                    	</select>
			                    </div>
			                    <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px">
			                    	<input type="text" class="form-control clearError" placeholder="<spring:message code="customer.telephone.number.label" />" value="${addressList[0].landLine}" id="landLine" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
			                    </div>
			                    <%-- <input type="hidden" class="form-control clearError" name="landLine" id="landLine"  value="${addressList[0].landLine}"/> --%>
			                    <input type="hidden" id="output3" />
			                  </div>
			                 <span id="error3" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
                      </div>
                      <div class="col-lg-2 col-md-2"> </div>
	              </div>
	              <div class="row">
	              <div class="seven-cols" style="" >
	              <div class="col-lg-12 col-md-12">
                        <div class="form-group col-lg-1 col-md-1"> 
							<label><spring:message code="customer_doorNumber.label" /></label>
                            <input type="text" class="form-control clearError" name="customerDoorNumber" value="${addressList[0].doorNumber}" id="doorNumber" required placeholder="<spring:message code="customer_doorNumber.label" />" />
							<span id="doorNumberError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						<div class="form-group col-lg-1 col-md-1"> 
							<label><spring:message code="customer_streetName.label" /></label>
                            <input type="text" class="form-control street-class1 clearError" name="street1" value="${addressList[0].streetName}" id="street1" required placeholder="<spring:message code="customer_streetName.label" />" />
							<span id="street1Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						<div class="form-group col-lg-1 col-md-1">
							<label><spring:message code="customer_locality.label" /></label>
                            <input type="text" class="form-control locality-class1 clearError" name="locality1" value="${addressList[0].locality}" id="locality1" required placeholder="<spring:message code="customer_locality.label" />" />
							<span id="locality1Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						<div class="form-group col-lg-1 col-md-1">
							<label><spring:message code="customer_city.label" /></label>
                            <input type="text" class="form-control city-class1  clearError" name="city1" value="${addressList[0].city}" id="city1" required placeholder="<spring:message code="customer_city.label" />" />
							<span id="city1Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						<div class="form-group col-lg-1 col-md-1">
							<label><spring:message code="customer_zipCode.label" /></label>
                            <input type="text" class="form-control zip-code-class1 clearError" name="zipCode1" value="${addressList[0].zipCode}" id="zipCode1" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" required placeholder="<spring:message code="customer_zipCode.label" />" />
						    <span id="zipCode1Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						<div class="form-group col-lg-1 col-md-1">
							<label><spring:message code="customer.state.label" /></label>
                            <input type="text" class="form-control state-class1 clearError" name="state1" value="${addressList[0].state}" id="state1" required placeholder="<spring:message code="customer.state.label" />" />
						    <span id="state1Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						<div class="form-group col-lg-1 col-md-1">
							<label><spring:message code="customer.country.label" /></label>
                            <input type="text" class="form-control country-class1 clearError" name="country1" value="${addressList[0].country}" id="country1"  required placeholder="<spring:message code="customer.country.label" />" />
                            <input class="latitude-class1" type="hidden" id="latitude1">
         					<input class="longitude-class1" type="hidden" id="longitude1">
         					<input type="hidden" id="custAddressId">
         					<input type="hidden" id="addressType">
						    <span id="country1Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
					   </div>
                  </div>
                  </div>
                  </div>
				  <br>
	              <div class="row">
	              	<div class="col-lg-12 col-md-12">
                   	 <div class="form-group col-lg-2 col-md-2">
                           <label><spring:message code="customer.personnel.details.label" /></label>
                      </div>
					  <div class="form-group col-lg-10 col-md-10" style="padding-left: 0px;">
					  <!-- <hr style="margin-top: 10px;margin-bottom:0px; width: 100%;border-top: 1px solid rgb(233,233,233);" /> -->
					  	<hr style="margin-top: 10px;margin-bottom:0px;margin-left: -4%;width: 105%;border-top: 1px solid rgb(233,233,233);" />
                      </div>
                     </div>
	              </div>
	              <div class="row">
                   	 <div class="col-lg-10 col-md-10">
                   	 	<div class="col-lg-3" style="padding: 0px;">
                   	 		<div class="form-group col-lg-6 col-md-6">
								<label><spring:message code="age.label" /></label>
								<select id="age" name ="age" class="form-control clearError" >
									<c:forEach var="number" items="${numbersList}">
										<option value="${number}" ${customerObj.age == number ? 'selected' : ''}>${number}</option>
									</c:forEach>
								 </select>
							</div>
							<div class="form-group col-lg-6 col-md-6">
								<label><spring:message code="family.size.label" /></label>
								<select id="familySize" name ="familySize" class="form-control clearError" >
									<option value="1" ${customerObj.familySize == '1' ? 'selected' : ''}>1</option>
									<option value="2" ${customerObj.familySize == '2' ? 'selected' : ''}>2</option>
									<option value="3" ${customerObj.familySize == '3' ? 'selected' : ''}>3</option>
									<option value="4" ${customerObj.familySize == '4' ? 'selected' : ''}>4</option>
									<option value="5" ${customerObj.familySize == '5' ? 'selected' : ''}>5</option>
									<option value="6" ${customerObj.familySize == '6' ? 'selected' : ''}>6</option>
									<option value="7" ${customerObj.familySize == '7' ? 'selected' : ''}>7</option>
									<option value="8" ${customerObj.familySize == '8' ? 'selected' : ''}>8</option>
									<option value="9" ${customerObj.familySize == '9' ? 'selected' : ''}>9</option>
									<option value="10" ${customerObj.familySize == '10' ? 'selected' : ''}>10</option>
								 </select>
							</div>
                   	 	</div>
						<div class="form-group col-lg-3 col-md-3">
							<label><spring:message code="gender.label" /></label>
							 <select id="gender" name ="gender" class="form-control clearError" >
								<option value="Male" ${customerObj.gender == 'Male' ? 'selected' : ''}>Male</option>
								<option value="Female" ${customerObj.gender == 'Female' ? 'selected' : ''}>Female</option>
							 </select>
						</div>
						<div class="form-group col-lg-2 col-md-3">
							<label><spring:message code="customer.nationality.label" /></label>
                            <input type="text" class="form-control clearError" name="nationality" value="${customerObj.nationality}" id="nationality" required placeholder="<spring:message code="customer.nationality.label" />" />
						 <span id="nationalityError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						<div class="form-group col-lg-2 col-md-3">
							<label><spring:message code="customer.dob.label" /></label>
                            <input type="text" class="form-control calendar_icon" name="dob" value="${customerObj.dobStr}" id="dob" readonly="readonly" style="background-color: white;" onfocus="callCalender('dob')" onclick="callCalender('dob')" placeholder="DD/MM/YYYY" />
						</div>
						<div class="form-group col-lg-2 col-md-3">
							<label><spring:message code="customer.billLimit.label" /></label>
                            <input type="text" class="form-control clearError" name="creditBillLimit" value="${customerObj.monthlyIncome}" id="creditBillLimit" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" required placeholder="<spring:message code="customer.billLimit.label" />" />
						</div>
                      </div>
                      <div class="col-lg-2 col-md-2"></div>
	              </div>
	              <div class="row">
                   	 <div class="col-lg-10 col-md-10">
                   	 	<div class="form-group col-lg-3 col-md-3">
							<label><spring:message code="customer.qualification.label" /></label>
                            <input type="text" class="form-control clearError" name="qualification" value="${customerObj.qualification}" id="qualification" required placeholder="<spring:message code="customer.qualification.label" />" />
						<span id="qualificationError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						<div class="form-group col-lg-3 col-md-3">
							<label><spring:message code="customer.profession.label" /></label>
                            <input type="text" class="form-control clearError" name="profession" value="${customerObj.designation}" id="profession" required placeholder="<spring:message code="customer.profession.label" />" />
						     <span id="professionError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						<div class="form-group col-lg-2 col-md-3">
							<label><spring:message code="customer.monthly.income.label" /></label>
                            <input type="text" class="form-control clearError" name="monthlyIncome" value="${customerObj.creditBillLimit}" id="monthlyIncome" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"  placeholder="<spring:message code="customer.monthly.income.label" />" />
						</div>
						<div class="form-group col-lg-2 col-md-3">
							<label><spring:message code="customer.marriage.date.label" /></label>
                            <input type="text" class="form-control calendar_icon" name="marriageDate" value="${customerObj.marriageDateStr}" id="marriageDate" readonly="readonly" style="background-color: white;" onfocus="callCalender('marriageDate')" onclick="callCalender('marriageDate')" placeholder="DD/MM/YYYY" />
							<%-- <label><spring:message code="family.size.label" /></label>
							<select id="familySize" name ="familySize" class="form-control clearError" >
								<option value="1" ${customerObj.familySize == '1' ? 'selected' : ''}>1</option>
								<option value="2" ${customerObj.familySize == '2' ? 'selected' : ''}>2</option>
								<option value="3" ${customerObj.familySize == '3' ? 'selected' : ''}>3</option>
								<option value="4" ${customerObj.familySize == '4' ? 'selected' : ''}>4</option>
								<option value="5" ${customerObj.familySize == '5' ? 'selected' : ''}>5</option>
								<option value="6" ${customerObj.familySize == '6' ? 'selected' : ''}>6</option>
								<option value="7" ${customerObj.familySize == '7' ? 'selected' : ''}>7</option>
								<option value="8" ${customerObj.familySize == '8' ? 'selected' : ''}>8</option>
								<option value="9" ${customerObj.familySize == '9' ? 'selected' : ''}>9</option>
								<option value="10" ${customerObj.familySize == '10' ? 'selected' : ''}>10</option>
							 </select> --%>
						</div>
						<div class="form-group col-lg-2 col-md-3">
						    <label>Customer Tax ID</label>
 							<input type="text" class="form-control" id="customertaxid" value="${customerObj.customerGstin}"/>	                                        	                                                                            
 						    <span id="customertaxidError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						<div class="form-group col-lg-4 col-md-4"></div>
                      </div>
                      <div class="col-lg-2 col-md-2"></div>
	              </div>
	              
	              <br>
				<div class="row" style="text-align: right;">
				 <input type="button" style="margin-right: 14px;" class="btnCls" onclick="validateCustomerForm('new')" value="<spring:message code="submit.label" />" />
				  <c:if test="${sessionScope.role == 'super admin'}"> 
				  	<input type="button" class="btnCls " style="margin-right: 14px;" onclick="viewCustomers('customerViews');" value="<spring:message code="cancel.label" />" />
				  </c:if>
				 <c:forEach var="accessControl" items="${sessionScope.crm}">
		            <c:if test="${accessControl.appDocument == 'CustomerView' && accessControl.write == true && accessControl.read == true}">
						<input type="button" class="btnCls" style="margin-right: 14px;" onclick="viewCustomers('customerViews');" value="<spring:message code="cancel.label" />" />
					</c:if>
				</c:forEach>
				</div>
		<br/>
        <div class="box-footer"></div>
    </div>
    </form>
</div>
</div>
</div>
	<%-- <script src="${pageContext.request.contextPath}/js/googleMap.js"></script> --%>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDHNN78JQSuDoLAZigF4cTbHgyeduFpVn8&libraries=places&callback=initAutocomplete"
         async defer></script>
         <input class="street-class" type="hidden" id="street_name">
         <input class="locality-class" type="hidden" id="landmark_name">
         <input class="city-class" type="hidden" id="city_name">
         <input class="state-class" type="hidden" id="state_name">
         <input class="zip-code-class" type="hidden" id="zip_code">
         <input class="country-class" type="hidden" id="country_name">
         <input class="latitude-class" type="hidden" id="latitude">
         <input class="longitude-class" type="hidden" id="longitude">
<div id="mapid" style="    display: none;"></div>
<div id="mapid1" style="    display: none;"></div>
</section><!-- /.content -->

</body>
</html>


