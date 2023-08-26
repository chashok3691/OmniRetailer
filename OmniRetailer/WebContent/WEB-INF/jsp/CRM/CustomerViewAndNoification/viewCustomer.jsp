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
</style>
<script type="text/javascript">
	$(document).ready(function(){
		var dob=$("#dob").val();
		dob=dob.split(' ');
		$("#dob").val(dob[0]);
		var marriageDate=$("#marriageDate").val();
		marriageDate=marriageDate.split(' ');
		$("#marriageDate").val(marriageDate[0]);
		//callCalender('marriageDate');
		//callCalender('dob');
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
	         <h3><spring:message code="view.customer.label" /></h3>
        </div>
	      <!-- form start -->
	      <form id="newEmployee" method="post">
	         <div class="box-body">
                 <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;">${err}</div>
                 <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold; margin-top: -20px">${success}</div>
	              <br>
	              
	              <div class="row" style="text-align: right;">
			         <input type="button" class="btnCls" style="margin-right: 20px;" onclick="viewCustomers('customerViews');" value="<spring:message code="cancel.label" />" />
		         </div>
	              
	              
	              <div class="row">
	              	<div class="col-lg-12 col-md-12">
                   	  <div class="form-group col-lg-3 col-md-3">
                           <label><spring:message code="customer.type.label" /> <span style="color:red; font-size:2">*</span></label>
                           <select id="customerType" disabled="disabled" name ="customerType" class="form-control clearError" >
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
								<option value="MEMBERSHIP GOLD" ${customerObj.category == "MEMBERSHIP GOLD" ? 'selected' : ''}>MEMBERSHIP GOLD</option>
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
                           <select style="padding: 2px;" disabled="disabled" name ="title" id="title" class="form-control clearError" >
		                	  	<option value="Mr" ${customerObj.title == 'Mr' ? 'selected' : ''}>Mr</option>
		                	  	<option value="Miss" ${customerObj.title == 'Miss' ? 'selected' : ''}>Miss</option>
		                	  	<option value="Mrs" ${customerObj.title == 'Mrs' ? 'selected' : ''}>Mrs</option>
		                	  	<option value="Ms" ${customerObj.title == 'Ms' ? 'selected' : ''}>Ms</option>
		                	  	<option value="Dr" ${customerObj.title == 'Dr' ? 'selected' : ''}>Dr</option>
							</select>
						</div>
						<div class="form-group col-lg-4 col-md-4" style="padding-left: 0px;">
							<label><spring:message code="customer.first.name.label" /> <span style="color:red; font-size:2">*</span></label>
                            <input type="text" readonly="readonly" class="form-control" name="firstName" value="${customerObj.name}" id="firstName" required placeholder="<spring:message code="enter.customer.first.name.label" />" />
						</div>
						<div class="form-group col-lg-6 col-md-6">
							<label><spring:message code="customer.last.name.label" /></label>
                            <input type="text" readonly="readonly" class="form-control" name="lastName" value="${customerObj.lastName}" id="lastName" required placeholder="<spring:message code="enter.customer.last.name.label" />" />
						</div>
                      </div>
                       <div class="col-lg-6 col-md-6"> </div>
	              </div>
	              <div class="row">
                   	<div class="col-lg-9 col-md-6">
						<div class="form-group col-lg-4 col-md-6" style="margin-right: -6px;">
							<label><spring:message code="customer.company.name" /></label>
                            <input type="text" readonly="readonly" class="form-control" name="companyName" value="${customerObj.companyName}" id="companyName" required placeholder="<spring:message code="enter.employer.name" />" />
						</div>
						<div class="form-group col-lg-4 col-md-6">
							<label><spring:message code="site.url.label" /></label>
                            <input type="text" readonly="readonly" class="form-control" name="siteUrl" value="${customerObj.siteUrl}" id="siteUrl" required placeholder="<spring:message code="enter.site.name" />" />
						</div>
						<div class="form-group col-lg-4 col-md-6">
							<label>Card Code</label>
                            <input type="text" readonly="readonly" class="form-control" name="cardCode" value="${customerObj.cardCode}" id="cardCode" required placeholder="Enter Card Code" />
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
					  	<hr style="margin-top: 10px;margin-bottom:0px;margin-left: -4%;width: 105%;border-top: 1px solid rgb(233,233,233);" />
                      </div>
                     </div>
	              </div>
	              <div class="row">
                   	<div class="col-lg-10 col-md-10">
						<div class="form-group col-lg-3 col-md-2">
							<label><spring:message code="customer.mail.id.label" /></label>
                            <input type="text" readonly="readonly" class="form-control" name="emailId" value="${customerObj.email}" id="emailId" required placeholder="<spring:message code="enter.customer.mail.id.label" />" />
						</div>
						<div class="form-group col-lg-3 col-md-3">
							<label><spring:message code="customer.mobile.number.label" /></label>
			                <div class="row">
			                       <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4" style="padding-right: 5px;">
			                       	<select style="padding: 4px 1px;" disabled="disabled" class="form-control" id="defaultCountry" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
			                       		<option text="India" ${'India' == customerObj.country ? 'selected' : ''}>IN</option>
	                                  	<option text="USA" ${'USA' == customerObj.country ? 'selected' : ''}>US</option>
	                                  	<option text="United Kingdom" ${'United Kingdom' == customerObj.country ? 'selected' : ''}>GB</option>
	                                  	<option text="Australia" ${'Australia' == customerObj.country ? 'selected' : ''}>AU</option>
			                       	</select>
			                       </div>
			                       <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px">
			                       	<input type="text" readonly="readonly" class="form-control" placeholder="<spring:message code="customer.mobile.number.label" />" id="phoneNumber" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
			                       </div>
			                       <input type="hidden" class="form-control" name="mobileNumber" id="mobileNumber"  value="${customerObj.mobileNumber}"/>
			                       <input type="hidden" class="form-control" name="mobileNumber" id="phone"  value="${customerObj.phone}"/>
			                        <input type="hidden" class="form-control" name="password" id="password"  value="${customerObj.password}"/>
			                        <input type="hidden" id="output" />
			                  </div>
			                 <span id="error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						<div class="form-group col-lg-3 col-md-3">
							<label><spring:message code="customer.telephone.number.label" /></label>
							<div class="row">
			                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4" style="padding-right: 5px;">
			                    	<select disabled="disabled" style="padding: 4px 1px;" class="form-control" id="defaultCountry1" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
			                    		<option text="India" ${'India' == customerObj.country ? 'selected' : ''}>IN</option>
	                                  	<option text="USA" ${'USA' == customerObj.country ? 'selected' : ''}>US</option>
	                                  	<option text="United Kingdom" ${'United Kingdom' == customerObj.country ? 'selected' : ''}>GB</option>
	                                  	<option text="Australia" ${'Australia' == customerObj.country ? 'selected' : ''}>AU</option>
			                    	</select>
			                    </div>
			                    <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px">
			                    	<input type="text" readonly="readonly" class="form-control" placeholder="<spring:message code="customer.telephone.number.label" />" id="phoneNumber1" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
			                    </div>
			                    <input type="hidden" class="form-control" name="telephoneNumber" id="telephoneNumber"  value="${customerObj.alternatePhoneNum}"/>
			                     <input type="hidden" id="output1" />
			               </div>
			              <span id="error1" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						<div class="form-group col-lg-3 col-md-3"></div>
                      </div>
                       <div class="col-lg-2 col-md-2"> </div>
	              </div>
	               <input type="hidden" id="maxRecords" value="${maxRecords}">
	              <div class="row">
	              <div class="seven-cols" style="" >
	              <div class="col-lg-12 col-md-12">
                                  
                        <div class="form-group col-lg-1 col-md-1"> 
							<label><spring:message code="customer.house.number.label" /></label>
                            <input type="text" class="form-control clearError" readonly="readonly" name="houseNo" value="${customerObj.houseNo}" id="houseNo" required placeholder="<spring:message code="customer.house.number.label" />" />
						</div>
						<div class="form-group col-lg-1 col-md-1"> 
							<label><spring:message code="street.name.label" /></label>
                            <input type="text" class="form-control street-class clearError" readonly="readonly" name="streetName" value="${customerObj.street}" id="street" required placeholder="<spring:message code="street.name.label" />" />
						</div>
						<div class="form-group col-lg-1 col-md-1">
							<label><spring:message code="customer.locality.label" /></label>
                            <input type="text" class="form-control locality-class clearError" readonly="readonly" name="locality" value="${customerObj.locality}" id="locality" required placeholder="<spring:message code="customer.locality.label" />" />
						</div>
						<div class="form-group col-lg-1 col-md-1">
							<label><spring:message code="customer.city.label" /></label>
                            <input type="text" class="form-control city-class clearError" readonly="readonly" name="city" value="${customerObj.city}" id="city" required placeholder="<spring:message code="customer.city.label" />" />
						</div>
						<div class="form-group col-lg-1 col-md-1">
							<label><spring:message code="customer.zip.code.label" /></label>
                            <input type="text" class="form-control zip-code-class clearError" readonly="readonly" name="zipCode" value="${customerObj.pin_no}" id="zipCode" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" required placeholder="<spring:message code="customer.zip.code.label" />" />
						</div>
						<div class="form-group col-lg-1 col-md-1">
							<label><spring:message code="customer.state.label" /></label>
                            <input type="text" class="form-control state-class clearError" readonly="readonly" name="state" value="${customerObj.state}" id="state"  required placeholder="<spring:message code="customer.state.label" />" />
						</div>
						<div class="form-group col-lg-1 col-md-1">
							<label><spring:message code="customer.country.label" /></label>
                            <input type="text" class="form-control country-class clearError" readonly="readonly" name="country" value="${customerObj.country}" id="country"  required placeholder="<spring:message code="customer.country.label" />" />
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
                            <input type="text" class="form-control clearError" readonly="readonly" name="shipmentName" value="${addressList[0].shipmentName}" id="shipmentName" required placeholder="<spring:message code="enter.customer_name.label" />" />
							 <span id="shipmentNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>						
						</div>
						<div class="form-group col-lg-3 col-md-3">
							<label><spring:message code="customer.mobile.number.label" /></label>
			                <div class="row">
			                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4" style="padding-right: 5px;">
			                  	<select style="padding: 4px 1px;" class="form-control clearError" disabled="disabled" id="defaultCountry" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
			                       	<option text="India" ${'India' == addressList[0].country ? 'selected' : ''}>IN</option>
	                               	<option text="USA" ${'USA' == addressList[0].country ? 'selected' : ''}>US</option>
	                               	<option text="United Kingdom" ${'United Kingdom' == addressList[0].country ? 'selected' : ''}>GB</option>
	                               	<option text="Australia" ${'Australia' == addressList[0].country ? 'selected' : ''}>AU</option>
			                     </select>
			                </div>
			                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px">
			                  <input type="text" class="form-control clearError" readonly="readonly" placeholder="<spring:message code="customer.mobile.number.label" />" value="${addressList[0].shipmentContact}" id="shipmentContact" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
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
			                    	<select style="padding: 4px 1px;" class="form-control clearError" disabled="disabled" id="defaultCountry1" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
			                    		<option text="India" ${'India' == addressList[0].country ? 'selected' : ''}>IN</option>
		                               	<option text="USA" ${'USA' == addressList[0].country ? 'selected' : ''}>US</option>
		                               	<option text="United Kingdom" ${'United Kingdom' == addressList[0].country ? 'selected' : ''}>GB</option>
		                               	<option text="Australia" ${'Australia' == addressList[0].country ? 'selected' : ''}>AU</option>
			                    	</select>
			                    </div>
			                    <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px">
			                    	<input type="text" class="form-control clearError" readonly="readonly" placeholder="<spring:message code="customer.telephone.number.label" />" value="${addressList[0].landLine}" id="landLine" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
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
                            <input type="text" class="form-control clearError" readonly="readonly" name="customerDoorNumber" value="${addressList[0].doorNumber}" id="doorNumber" required placeholder="<spring:message code="customer_doorNumber.label" />" />
							
						</div>
						<div class="form-group col-lg-1 col-md-1"> 
							<label><spring:message code="customer_streetName.label" /></label>
                            <input type="text" class="form-control street-class1 clearError" readonly="readonly" name="street1" value="${addressList[0].streetName}" id="street1" required placeholder="<spring:message code="customer_streetName.label" />" />
							<span id="street1Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						<div class="form-group col-lg-1 col-md-1">
							<label><spring:message code="customer_locality.label" /></label>
                            <input type="text" class="form-control locality-class1 clearError" readonly="readonly" name="locality1" value="${addressList[0].locality}" id="locality1" required placeholder="<spring:message code="customer_locality.label" />" />
							<span id="locality1Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						<div class="form-group col-lg-1 col-md-1">
							<label><spring:message code="customer_city.label" /></label>
                            <input type="text" class="form-control city-class1  clearError"  readonly="readonly" name="city1" value="${addressList[0].city}" id="city1" required placeholder="<spring:message code="customer_city.label" />" />
							
						</div>
						<div class="form-group col-lg-1 col-md-1">
							<label><spring:message code="customer_zipCode.label" /></label>
                            <input type="text" class="form-control zip-code-class1 clearError"  readonly="readonly" name="zipCode1" value="${addressList[0].zipCode}" id="zipCode1" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" required placeholder="<spring:message code="customer_zipCode.label" />" />
							<span id="zipCode1Error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						</div>
						<div class="form-group col-lg-1 col-md-1">
							<label><spring:message code="customer.state.label" /></label>
                            <input type="text" class="form-control state-class1 clearError" name="state1" readonly="readonly" value="${addressList[0].state}" id="state1" required placeholder="<spring:message code="customer.state.label" />" />
						</div>
						<div class="form-group col-lg-1 col-md-1">
							<label><spring:message code="customer.country.label" /></label>
                            <input type="text" class="form-control country-class1 clearError" readonly="readonly" name="country1" value="${addressList[0].country}" id="country1"  required placeholder="<spring:message code="customer.country.label" />" />
                            <input class="latitude-class1" type="hidden" id="latitude1" value="${addressList[0].latitude}" >
         					<input class="longitude-class1" type="hidden" id="longitude1" value="${addressList[0].longitude}" >
         					<input type="hidden" id="custAddressId" value="${addressList[0].custAddressId}" >
         					<input type="hidden" id="addressType" value="${addressList[0].addressType}" >
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
					  	<hr style="margin-top: 10px;margin-bottom:0px;margin-left: -4%;width: 105%;border-top: 1px solid rgb(233,233,233);" />
                      </div>
                     </div>
	              </div>
	              <div class="row">
                   	 <div class="col-lg-10 col-md-10">
						<div class="col-lg-3" style="padding: 0px;">
                   	 		<div class="form-group col-lg-6 col-md-6">
							<label><spring:message code="age.label" /></label>
							<select id="age" disabled="disabled" name ="age" class="form-control clearError" >
								<c:forEach var="number" items="${numbersList}">
									<option value="${number}" ${customerObj.age == number ? 'selected' : ''}>${number}</option>
								</c:forEach>
							 </select>
					</div>
					 <div class="form-group col-lg-6 col-md-6">
							<label><spring:message code="family.size.label" /></label>
								<select id="familySize" disabled="disabled" name ="familySize" class="form-control clearError" >
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
							 <select id="gender" disabled="disabled" name ="gender" class="form-control clearError" >
								<option value="Male" ${customerObj.gender == 'Male' ? 'selected' : ''}>Male</option>
								<option value="Female" ${customerObj.gender == 'Female' ? 'selected' : ''}>Female</option>
							 </select>
						</div>
						<div class="form-group col-lg-2 col-md-3">
							<label><spring:message code="customer.nationality.label" /></label>
                            <input type="text" readonly="readonly" class="form-control" name="nationality" value="${customerObj.nationality}" id="nationality" required placeholder="<spring:message code="customer.nationality.label" />" />
						</div>
						<div class="form-group col-lg-2 col-md-3">
							<label><spring:message code="customer.dob.label" /></label>
                            <input type="text" class="form-control calendar_icon" name="dob" value="${customerObj.dobStr}" id="dob" readonly="readonly" placeholder="DD/MM/YYYY" />
						</div>
						<div class="form-group col-lg-2 col-md-3">
							<label><spring:message code="customer.billLimit.label" /></label>
                            <input type="text" readonly="readonly" class="form-control" name=creditBillLimit value="${customerObj.creditBillLimit}" id="creditBillLimit" required placeholder="<spring:message code="customer.billLimit.label" />" />
						</div>
						
                      </div>
                     <div class="col-lg-2 col-md-2">
                     
                     
                      <label>Customer Tax ID</label>
 								       <input type="text" class="form-control" readonly="readonly"   id="customertaxid" value="${customerObj.customerGstin}"/>	 
                     
                     </div>
	              </div>
	              <div class="row">
                   	  <div class="col-lg-10 col-md-10">
                   	 	<div class="form-group col-lg-3 col-md-3">
							<label><spring:message code="customer.qualification.label" /></label>
                            <input type="text" readonly="readonly" class="form-control" name="qualification" value="${customerObj.qualification}" id="qualification" required placeholder="<spring:message code="customer.qualification.label" />" />
						</div>
						<div class="form-group col-lg-3 col-md-3">
							<label><spring:message code="customer.profession.label" /></label>
                            <input type="text" readonly="readonly" class="form-control" name="profession" value="${customerObj.designation}" id="profession" required placeholder="<spring:message code="customer.profession.label" />" />
						</div>
						<div class="form-group col-lg-2 col-md-3">
							<label><spring:message code="customer.monthly.income.label" /></label>
                            <input type="text" readonly="readonly" class="form-control " name="monthlyIncome" value="${customerObj.monthlyIncome}" id="monthlyIncome" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"  placeholder="<spring:message code="customer.monthly.income.label" />" />
						</div>
						<div class="form-group col-lg-2 col-md-3">
							<label><spring:message code="customer.marriage.date.label" /></label>
                            <input type="text" class="form-control calendar_icon" name="marriageDate" value="${customerObj.marriageDateStr}" id="marriageDate" readonly="readonly" style="" placeholder="DD/MM/YYYY" />
							<%-- <label><spring:message code="family.size.label" /></label>
							<select id="familySize" disabled="disabled" name ="familySize" class="form-control clearError" >
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
							<label style="white-space: nowrap;"><spring:message code="customer.creditRemaining.label" /></label>
                            <input type="text"  class="form-control" readonly="readonly" value="${customerObj.availableCreditLimit}"  id="creditRemaining" required placeholder="<spring:message code="customer.creditRemaining.label" />" />
						</div>
						<div class="form-group col-lg-2 col-md-3"></div>
						<div class="form-group col-lg-4 col-md-4"></div>
                      </div>
                       <div class="col-lg-2 col-md-2"></div>
	              </div>
	              <div class="row">
	              	<div class="col-lg-12 col-md-12">
                   	 <div class="form-group col-lg-2 col-md-2">
                           <label><spring:message code="customer.behaviour.label" /></label>
                      </div>
					  <div class="form-group col-lg-10 col-md-10" style="padding-left: 0px;">
					  	<hr style="margin-top: 10px;margin-bottom:0px;width: 100%;border-top: 1px solid rgb(233,233,233);" />
                      </div>
                     </div>
	              </div>
	              <div class="row">
                   	 <div class="col-lg-9 col-md-9">
                   	 	<div class="form-group col-lg-3 col-md-3">
							<label><spring:message code="customer.yearly.visits.label" /></label>
                            <input type="text" readonly="readonly" class="form-control" name="yearlyVisits" value="" id="yearlyVisits" />
						</div>
						<div class="form-group col-lg-3 col-md-3">
							<label><spring:message code="customer.direct.label" /></label>
                            <input type="text" readonly="readonly" class="form-control" name="direct" value="" id="direct" />
						</div>
						<div class="form-group col-lg-3 col-md-3">
							<label><spring:message code="customer.online.label" /></label>
                            <input type="text" readonly="readonly" class="form-control " name="online" value="" id="online" />
						</div>
						<div class="form-group col-lg-3 col-md-3">
							<label><spring:message code="customer.mobile.label" /></label>
							<input type="text" readonly="readonly" class="form-control " name="mobile" value="" id="mobile" />
						</div>
                   </div>
                   <div class="form-group col-lg-3 col-md-3">
        	 <div class="row" style="text-align:left;">
	        	 <div class="col-lg-12">
	        	<button type="button" class="buttons btn-default btn-lg" style="padding:5px 27px; background-color: rgb(195,195,195); margin-top:17px; font-size:15px"  onclick="getCustomerPurchaseDetails('${customerDetails.phone}','0');"><spring:message code="customer.purchase.list.label" /></button>
	        	 <%-- <div class="modal fade" id="myModal" role="dialog">
    		<div class="modal-dialog" style="width:90%">
    		<div class="modal-content">
       		<div class="modal-header">
          			<button type="button" class="close" data-dismiss="modal">&times;</button>
          		<center><h4 class="modal-title"><spring:message code="purchases.label" /></h4></center>
        	</div>
        	<div class="modal-body">
          		<!-- <p>Some text in the modal.</p> -->
             	<table id="example2" class="table table-bordered table-striped" style="margin-left: 10px; width: 98.2%;">
                 <thead style="background-color: #3c8dbc; color: #ffffff">
                     <tr>
                         <th><spring:message code="billing_id.label" /></th>
                         <th><spring:message code="skuid.label" /></th>
                         <th><spring:message code="item_name.label" /></th>
                         <th><spring:message code="quantity.label" /></th>
                         <th><spring:message code="total_bill.label" /></th>
                     </tr>
                 </thead>
                 <tbody style="text-align:center">
                 </tbody>
              </table>
        </div>
        <div class="modal-footer">
         <center><button type="button" class="btn btn-default" data-dismiss="modal">Close</button></center>
        </div>
      </div>
      	 </div>
      	 </div> --%>
      	 <div class="modal fade" id="myModal" role="dialog">
  <div class="modal-dialog" style="width:81%;margin-top:5%;margin-left: 18%;">
    <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <center><h4 class="modal-title"><spring:message code="purchases.label" /></h4></center>
        </div>
        <div class="modal-body">
        <div id="purchaseDetails">
        
        </div>
        </div>
        <div class="modal-footer">
         <center><button type="button" class="btn btn-default" data-dismiss="modal">Close</button></center>
        </div>
      </div>
  	 </div>
  </div>
      	 </div>
         </div>
         </div>
	              </div>
	              <div class="row">
                   	 <div class="col-lg-9 col-md-9">
                   	 	<div class="form-group col-lg-3 col-md-3">
							<label><spring:message code="customer.yearly.purchases.label" /></label>
                            <input type="text" readonly="readonly" class="form-control" name="yearlyPurchases" value="" id="yearlyPurchases" />
						</div>
						<div class="form-group col-lg-3 col-md-3">
							<label><spring:message code="customer.brand.loyalty.label" /></label>
                            <input type="text" readonly="readonly" class="form-control" name="brandLoyalty" value="" id="brandLoyalty" />
						</div>
						<div class="form-group col-lg-3 col-md-3">
							<label><spring:message code="customer.normal.purchases.label" /></label>
                            <input type="text" readonly="readonly" class="form-control " name="normalPurchases" value="" id="normalPurchases" />
						</div>
						<div class="form-group col-lg-3 col-md-3">
							<label><spring:message code="customer.discount.purchases.label" /></label>
							<input type="text" readonly="readonly" class="form-control " name="discountPurchases" value="" id="discountPurchases" />
						</div>
                      </div>
                      <div class="col-lg-3 col-md-3">
                      </div>
	              </div>
	              <div class="row">
                   	 <div class="col-lg-9 col-md-9">
                   	 	<div class="form-group col-lg-2 col-md-2">
							<label><spring:message code="complaints.label" /></label>
                            <input type="text" readonly="readonly" class="form-control" name="complaints" value="" id="complaints" />
						</div>
						<div class="form-group col-lg-1 col-md-1"></div>
						<div class="form-group col-lg-2 col-md-2">
							<label><spring:message code="resolved.label" /></label>
                            <input type="text" readonly="readonly" class="form-control" name="resolved" value="" id="resolved" />
						</div>
						<div class="form-group col-lg-1 col-md-1"></div>
						<div class="form-group col-lg-3 col-md-3">
							<label><spring:message code="customer.last.visited.date.label" /></label>
                            <input type="text" readonly="readonly" class="form-control calendar_icon" name="lastVisited" value="" id="lastVisited" />
						</div>
						<div class="form-group col-lg-3 col-md-3">
							<label><spring:message code="customer.last.contacted.date.label" /></label>
							<input type="text" readonly="readonly" class="form-control calendar_icon" name="lastContacted" value="" id="lastContacted" />
						</div>
                      </div>
                      <div class="col-lg-3 col-md-3">
                      </div>
	              </div>
	              <div id="triggerEvent"></div>
	              <br>
		<div class="row" style="text-align: right;">
			<input type="button" class="btnCls" style="margin-right: 20px;" onclick="viewCustomers('customerViews');" value="<spring:message code="cancel.label" />" />
		</div>
		
		<!-- <input type="hidden" id="states" value="">
		<input type="hidden" id="fromDate" value="">
		<input type="hidden" id="endDate" value="">
		<input type="hidden" id="priceRange" value="">
		<input type="hidden" id="product" value="">
		<input type="hidden" id="productCategory" value="">
		<input type="hidden" id="purchaseChannel" value=""> -->
<!-- 		var purchaseChannel = $("#purchaseChannel").val(); -->
		
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