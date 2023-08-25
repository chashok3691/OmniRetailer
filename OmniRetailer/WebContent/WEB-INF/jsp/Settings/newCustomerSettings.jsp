<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Viswanath
 * file name		        : Inventory Manager/settings/newCustomerSettings.jsp
 * file type		        : JSP
 * description				: The newCustomerSettings form is displayed using this jsp
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script src="${pageContext.request.contextPath}/js/cusomerSettings/customerSettings.js"></script>
	
	
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
		<script src="${pageContext.request.contextPath}/js/demo-compiled.js"></script>
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
<style type="text/css">
	/* .col-xs-12 {
	 padding: 5%; 
	 }*/
	 .form-group {
    margin-bottom: 1px;
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
	font-weight: bold;
	color: black;
    background-color: rgb(195,195,195);
    border-color: black;
}
.browsebutton{
    font-weight: bold;
    height: 28px;
    border-radius: 0px;
    padding: 2px 17px;
    background: grey;
    border: none;
 }	
 
  
 .browsebutton:hover{
    background: grey !important;
 }	
 .browsemargin{
 margin-left:-25px;
     margin-top: -1px;
 }
 
 .companyimage{
    width: 152px;
/*     margin-left: -200%; */
    /* margin-top: -10%; */
    object-fit: contain;
    height: 46px;
    }
 @media (max-width: 1200px){
 .browsemargin{
 margin-left:0px;
 }
 .companyimage{
     width: 152px;
    margin-left: -20% ;
    margin-top: 15% ;
    object-fit: contain;
    position: relative;
    height: 46px;
 }
    }

</style>

<script type="text/javascript">
$(document).ready(function(){
	$('#corporateAddress').on('input',function(e){
		 if($(this).data("lastval") == undefined){
			 $("#billingAddress").val($(this).val());
		 }
		 if($(this).data("lastval")== $("#billingAddress").val()){
			 $("#billingAddress").val($(this).val());
	 	 }
		 $(this).data("lastval",$(this).val());
});
	$('#location').on('input',function(e){
		 if($(this).data("lastval") == undefined){
			 $("#location1").val($(this).val());
		 }
		 if($(this).data("lastval")== $("#location1").val()){
			 $("#location1").val($(this).val());
	 	 }
		 $(this).data("lastval",$(this).val());
});
	$('#city').on('input',function(e){
		 if($(this).data("lastval") == undefined){
			 $("#city1").val($(this).val());
		 }
		 if($(this).data("lastval")== $("#city1").val()){
			 $("#city1").val($(this).val());
	 	 }
		 $(this).data("lastval",$(this).val());
});
	callCalender('expireson');
	callCalender('lastRenewedDate');
/* 	var dateTime = getCurrentDate();
	var date = dateTime.split(' ');
	date = date[0].split('/');
	var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
	$("#expireson").val(formatedDate);
	$("#lastRenewedDate").val(formatedDate); */
	

	$("#mailId").keydown(function(){
	    $(".Error").html("");
	    $("#mailIdError").html("");
	});
	$("#mailId").blur(function(){
	 	  var email = $("#mailId").val();
	 	  if(email==""){
	 		 return false;
	 	  }
		  if(!emailValidation(email)){
		   	$("#mailIdError").html("Invalid EmailId (Ex:abc@gmail.com)");
		   	return false;
		  }
		  else{
			$("#mailIdError").html("");
		    return true;
		  }
		});  
	
	
	/* $("#mailId").blur(function(){
		  var email = $("#mailId").val();
		  if(email==""){
			 return false;
		  }
		  if(!emailValidation(email)){
		   	$("#mailIdError").html("Invalid EmailId (Ex:abc@gmail.com)");
		   	return false;
		  }
		  else{
			$("#mailIdError").html("");
		    return true;
		  }
		});
	 */
	$("#phoneNumber1").keydown(function(){
		 $("#error1").html("");
		 $(".Error").html("");
	 });
	 $("#defaultCountry1").keydown(function(){
		 $("#error1").html("");
		$(".Error").html("");
	 });
	$("#phoneNumber1").blur(function(){
		var phoneNumber = $("#phoneNumber1").val().trim();
		if(phoneNumber != ""){
			validatePhoneNumber1() ;
		}
	});
		$("#defaultCountry1").change(function(){
			$("#error1").html("");
			$(".Error").html("");
			var phoneNumber = $("#phoneNumber1").val().trim();
			if(phoneNumber != ""){
				validatePhoneNumber1() ;
			}
		});
		
		
		
});

function validatePhoneNumber1(){
	
	 phoneNumberParser1();
	 var output = $("#output1").val();
	 if(output.indexOf(":")<0){
		 $("#error1").html(output);
		 return false;
	 }
	 var result = output.split(",");
	 for(var i=0;i<result.length; i++){
		 var val=result[i].split(":");
		 if(val[1] != "true"){
			 $("#error1").html("Invalid Phone Number");
			 return false;
		 }
	 }
}	
	 
  var phoneNo = $("#pcn").val();
		phoneNo = phoneNo.split('-');
		
		if(phoneNo.length == 1)
			$("#phoneNumber").val(phoneNo[0]);
		else{
			//$("#defaultCountry").val(phoneNo[0]);
			$("#phoneNumber").val(phoneNo[1]);
		}
	 var phoneNo1 = $("#acn").val();
		phoneNo1 = phoneNo1.split('-');
		if(phoneNo1.length == 1)
			$("#phoneNumber1").val(phoneNo1[0]);
		else{
			//$("#defaultCountry1").val(phoneNo1[0]);
			$("#phoneNumber1").val(phoneNo1[1]);
		} 
</script>        
</head>
<body>
<!-- Content Header (Page header) -->


<!-- Main content -->
<section class="content">
<div class="row">

  
  <div class="col-xs-12">
  

				<div class="box box-primary " style="padding: ">
    <div class="box-header" style="text-align: left; height:25px;">
   
    <h3 align="center"><spring:message code="customer.profile.label" /></h3>
    </div><!-- /.box-header -->
    
    <!-- form start -->
    <form>
    <div class="box-body">
        <div class="row" style="text-align: right; margin-top: 0px;">
	        <div id="Error" class="Error" style="text-align: center;margin-top:20px; color: red;font-size: 2;font-weight: bold;">${err}</div>
	        <div id="Success" class="Error" style="text-align: center;margin-top:20px;color: blue;font-size: 2;font-weight: bold;">${success}</div>
        </div>
<br><br>
 
<div class="row">
         <div class="form-group col-lg-2" style="padding-left: 30px;">
        	 	<label><spring:message code="customer.id.label" /> <span style="color:red; font-size:2">*</span></label>
                <input type="text" class="form-control" id="customerId" value="${CID}" readonly="readonly" placeholder="<spring:message code="enter.customer.id" />" />
                <span id="customerIdError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
           </div>
 </div>
 <div class="row">
 <div class="form-group col-lg-8">
 <div class="form-group col-lg-12">
<div class="row">
 
        <div class="form-group col-lg-4 col-md-3">
               	 	<label><spring:message code="business.name.label" /> <span style="color:red; font-size:2">*</span></label>
              <input type="text" class="form-control" id="businessName" value="${customerSettings.name}" placeholder="<spring:message code="enter.business.name" />" />
                <span id="businessNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
         </div>
         
         <div class="form-group col-lg-1 col-md-1"></div>
         <div class="form-group col-lg-3 col-md-2">
        	 	<label><spring:message code="contact.person.label" /> <span style="color:red; font-size:2"></span></label>
                <input type="text" class="form-control" id="contactPerson" value="${customerSettings.contactPerson}"  placeholder="<spring:message code="enter.contact.person" />" />
                <span id="contactPersonError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
         </div>
         
          <div class="form-group col-lg-1 col-md-1"></div>
         <div class="form-group col-lg-3 col-md-3">
         <div class="form-group col-lg-14 col-md-14" style=" nopadding;">
        	 	<label><spring:message code="default.location.label" /> <span style="color:red; font-size:2">*</span></label>
                 <select class="form-control" name="defaultLocation" id="defaultLocation">
					 <c:forEach var="location" items="${locationsList}">
						<option value="${location}" ${location == customerSettings.defaultLocation ? 'selected' : ''} id="${location}" >${location}</option>
					</c:forEach>
	            </select>
                <span id="defaultLocationError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
         </div>
         </div>
</div>

<div class="row">
        <div class="form-group col-lg-4 col-md-3"> 
        	 	<label><spring:message code="corporate.id.label" /></label>
                <input type="text" class="form-control" id="corporateId" value="${customerSettings.corporateId}"  placeholder="<spring:message code="enter.corporate.id.label" />" />
               <!--  <span id="corporateIdError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> -->
         </div>
          <div class="form-group col-lg-0 col-md-0"></div>
         <div class="form-group col-lg-1 col-md-1"></div>
         <div class="form-group col-lg-3 col-md-2">
        	 	<label><spring:message code="vat.num.label" /> <span style="color:red; font-size:2"></span></label>
                <input type="text" class="form-control" id="vatNum" value="${customerSettings.vat}"  placeholder="<spring:message code="enter.tax.num.label" />" />
                <span id="contactPersonError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
         </div>
         
         <div class="form-group col-lg-1 col-md-1"></div>
         <div class="form-group col-lg-3 col-md-3">
         <div class="form-group col-lg-14 col-md-14" style=" nopadding;" >
        	 	<label><spring:message code="service.tax.num.label" /></label>
                  <input type="text" class="form-control" id="serviceTaxNum" value="${customerSettings.serviceTax}" placeholder="<spring:message code="enter.service.tax.num.label" />" />
               
         </div>
         </div>
</div>










<br>
<br>
<div class="row">
 <div class="form-group col-lg-4 col-md-3">
     	  <label><spring:message code="pcn.label" /> <span style="color:red; font-size:2">*</span></label>
             	 <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                    	
                    	<select class="form-control"  id="defaultCountry" style="padding: 0px;" >
                     <option value="${sessionScope.countryCode}">${sessionScope.countryCode}</option>
                    	<!-- <option>US</option>
                    	<option>GB</option>
                    	<option>AU</option> -->
                    	</select>
                    	<!-- <input type="text" onfocus="displayToolTip();" class="form-control" id="defaultCountry" maxlength="2" oninput="this.value = this.value.replace(/[^A-Za-z]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/> -->
                    </div>
                    <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px">
                    	<input type="text" class="form-control" value="" placeholder="<spring:message code="enter.contact.number" />" id="phoneNumber" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                    </div>
                    <input type="hidden" class="form-control" name="pcn" id="pcn"  value="${customerSettings.primaryContactNumber}"/>
                     <input type="hidden" id="output" />
               </div>
          	<span id="error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
         </div>
        <div class="form-group col-lg-1 col-md-1"></div>
        <div class="form-group col-lg-0 col-md-0"></div>
        
        <div class="form-group col-lg-4 col-md-3">
	        	 <label><spring:message code="acn.label" /> <span style="color:red; font-size:2"></span></label>
             	 <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                    	<select class="form-control" style="padding: 0px" id="defaultCountry1" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU ; ">
	                    	<option selected="selected" value="${sessionScope.countryCode}">${sessionScope.countryCode}</option>
	                    	<!-- <option>US</option>
	                    	<option>GB</option>
	                    	<option>AU</option> -->
                    	</select>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="margin-left: -19px;" >
                    	<input type="text" class="form-control" style="padding: 0px;" value="" placeholder="<spring:message code="enter.contact.number" />" id="phoneNumber1" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                    </div>
                    <input type="hidden" class="form-control" name="acn" id="acn"  value="${customerSettings.alternateContactNum}"/>
                     <input type="hidden" id="output1" />
               </div>
          	<span id="error1" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
         </div>
         
          <div class="form-group col-lg-1 col-md-1"></div>
         
         <div class="form-group col-lg-1 col-md-1"></div>
         <div class="form-group col-lg-0 col-md-0">
         <div class="form-group col-lg-3 col-md-3" style=left: 1px;">
	       	   <label><spring:message code="emailId.label" /> <span style="color:red; font-size:2">*</span></label>
               <input type="text" class="form-control" id="mailId" value="${customerSettings.mailID}" placeholder="<spring:message code="enter.mailId" />" />
               <span id="mailIdError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
         </div>
         </div>
</div>
<div class="row">
 <div class="form-group col-lg-4 col-md-3">
	        	 	<label><spring:message code="site.url.label" /> <span style="color:red; font-size:2"></span></label>
	                <input type="text" class="form-control" id="siteUrl" value="${customerSettings.siteURL}" placeholder="<spring:message code="enter.siteUrl.label" />" />
	                <span id="siteUrlError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
         </div>
         <div class="form-group col-lg-1 col-md-1"></div>
          <div class="form-group col-lg-0 col-md-0"></div>
        
        
        <div class="form-group col-lg-3 col-md-2">
	        	<label><spring:message code="billing.cycle.label" /> <span style="color:red; font-size:2"></span></label>
       	 	    <input type="hidden" id="eee" value="${customerSettings.billingCycle}">
	            <select class="form-control" name="bilingCycle" id="bilingCycle">
					<option value="Quarterly" ${'Quarterly' == customerSettings.billingCycle ? 'selected' : ''}>Quarterly</option>
		            <option value="Half-Yearly" ${'Half-Yearly' == customerSettings.billingCycle ? 'selected' : ''}>Half-Yearly</option>
		            <option value="Annually" ${'Annually' == customerSettings.billingCycle ? 'selected' : ''}>Annually</option>
		            <option value="Life Time" ${'Life Time' == customerSettings.billingCycle ? 'selected' : ''}>Life Time</option>
	            </select> 
	     		<span id="billingCycleError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
         </div>
         
         <div class="form-group col-lg-1 col-md-1"></div>
          <div class="form-group col-lg-0 col-md-0" style="left: -57px;"></div>
         <div class="form-group col-lg-2 col-md-2">
     			<label><spring:message code="saas.plan.label" /></label><span style="color:red; font-size:2">*</span>
       	 	    <input type="hidden" id="eee" value="${customerSettings.saasPlan}">
	            <select class="form-control" name="saasPlan" id="saasPlan" style="padding: 0px;">
					<option value="Individual" ${'Individual' == customerSettings.saasPlan ? 'selected' : ''}>Individual</option>
		            <option value="Standard" ${'Standard' == customerSettings.saasPlan ? 'selected' : ''}>Standard</option>
		            <option value="Enterprise" ${'Enterprise' == customerSettings.saasPlan ? 'selected' : ''}>Enterprise</option>
	            </select> 
	            <span id="saasPlanError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
         </div>
</div>
<div class="row">
		<div class="form-group col-lg-3 col-md-2">
        	 	<label><spring:message code="expireson.label" /> <span style="color:red; font-size:2">*</span></label>
                <input class="form-control calendar_icon"  style="background-color: white;" name="expireson" readonly="readonly" value="${customerSettings.expiresOn}" id="expireson" size="20" type="text" onfocus="callCalender('expireson')" onclick="callCalender('expireson')" placeholder="DD/MM/YYYY"/>
                <span id="expiresonError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
         </div>
         <div class="form-group col-lg-0 col-md-0"></div>
         <div class="form-group col-lg-2 col-md-1"></div>
         <div class="form-group col-lg-3 col-md-2">
        	 	<label><spring:message code="last.renewed.date.label" /> <span style="color:red; font-size:2"></span></label>
                <input class="form-control calendar_icon"  style="background-color: white;" name="lastRenewedDate" readonly="readonly" value="${customerSettings.lastRenewedDate}"  id="lastRenewedDate" size="20" type="text" onfocus="callCalender('lastRenewedDate')" onclick="callCalender('lastRenewedDate')" placeholder="DD/MM/YYYY"/>
                <span id="lastRenewedDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
         </div>
         <div class="form-group col-lg-0 col-md-0"></div>
         <div class="form-group col-lg-1 col-md-1"></div>
          <div class="form-group col-lg-3 col-md-2">
        	 	<label><spring:message code="monthly.license.price.label" /> <span style="color:red; font-size:2"></span></label>
                <input type="text" class="form-control" id="monthlyLicensePrice" value="${customerSettings.monthlyLicensePrice}" placeholder="<spring:message code="enter.monthly.license.price.label" />" />
                <span id="monthlyLicensePriceError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
         </div>
</div>
<br>
<br>
<div class="row">
		<div class="form-group col-lg-4 col-md-3">
        	 	<label><spring:message code="corporate.address.label" /><span style="color:red; font-size:2">*</span></label>
				<textarea class="form-control" id="corporateAddress" style="resize:none;" rows="1" placeholder="" >${customerSettings.corporateAddress}</textarea>
	 			<span id="corporateAddressError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> 
         </div>
         
          <div class="form-group col-lg-0 col-md-0"></div>
          <div class="form-group col-lg-1 col-md-1"></div>
    	<div class="form-group col-lg-3 col-md-2">
       	 		<label><spring:message code="location.label" /> <span style="color:red; font-size:2"></span></label>
                <input type="text" class="form-control" id="location" value="${customerSettings.corporateLocation}"  placeholder="<spring:message code="enter.location.label" />" />
                <span id="locationError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
  	 	</div>
  	 	 <div class="form-group col-lg-0 col-md-0"></div>
  	 	 <div class="form-group col-lg-1 col-md-1"></div>
         <div class="form-group col-lg-3 col-md-2">
        	 	<label><spring:message code="city.label" /> <span style="color:red; font-size:2"></span></label>
                <input type="text" class="form-control" id="city" value="${customerSettings.corporateCity}"  placeholder="<spring:message code="enter.city.label" />" />
                <span id="cityError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
   		</div>
</div>
<div class="row">
	       <div class="form-group col-lg-4 col-md-3">
        	 	<label><spring:message code="billing.address.label" /><span style="color:red; font-size:2">*</span></label>
 				<textarea class="form-control" id="billingAddress" style="resize:none;" rows="1" placeholder="" >${customerSettings.billingAddress}</textarea> 
        	 	<span id="billingAddressError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
          </div>
           <div class="form-group col-lg-0 col-md-0"></div>
          <div class="form-group col-lg-1 col-md-1"></div>
    	<div class="form-group col-lg-3 col-md-2">
        	 	<label><spring:message code="location.label" /> <span style="color:red; font-size:2"></span></label>
                <input type="text" class="form-control" id="location1" value="${customerSettings.billingLocation}"  placeholder="<spring:message code="enter.location.label" />" />
                <span id="locationError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
  		</div>
  		 <div class="form-group col-lg-0 col-md-0"></div>
  		<div class="form-group col-lg-1 col-md-1"></div>
         <div class="form-group col-lg-3 col-md-2" >
        	 	<label><spring:message code="city.label" /> <span style="color:red; font-size:2"></span></label>
                <input type="text" class="form-control" id="city1" value="${customerSettings.billingCity}"  placeholder="<spring:message code="enter.city.label" />" />
                <span id="cityError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
   		</div>



<br> 
<br>
<div class="row">
	<div class="col-lg-12" style="padding: 30px;">
  		<label><spring:message code="bussines.description.label" /></label>
  		<textarea class="form-control" id="businessDescription" style="resize:none;" rows="3" placeholder="" >${customerSettings.businessDescription}</textarea> 
 </div>
</div>
<br>
<br>
<div class="row">

             	 <div class="col-lg-12 col-sm-12 col-xs-12">
             	    <div class="form-group col-lg-10 col-sm-10 col-xs-10">
             	 <div class="row" >
             	<!--  <div class="col-lg-1"style="left: -121px;"></div> -->
             		<div class="form-group col-lg-3" style="font-size: 16px;padding-left: 20px;padding-right: 0px" >
             			<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'logo1');" id="logo1"/> -->&nbsp;&nbsp;&nbsp;<spring:message code="company.logo.label" />
             			<input type="hidden" id="logo1_refId">
             		</div>
             	<div class="form-group col-lg-6 col-sm-12 col-xs-12" >
             		<div class="form-group col-lg-7 col-sm-7 col-xs-7" style="padding-left: 0px">
  						<input id="logo1File" class="form-control" value="${customerSettings.logoName}"  placeholder="Choose File"  disabled="disabled"/>
  					</div>
  					<div class="form-group col-lg-5 col-sm-5 col-xs-5 browsemargin">
						<div class="fileUpload btn btn-primary browsebutton" style="font-weight: bold;">
			    			<span style="font-size: 15px;">Browse..</span>
			    			<input id="logo1Btn"  type="file" accept=".jpg, .png, .PNG, .gif" onchange="addNameToTextBox('logo1',this);" class="upload" />
						</div>
					  	<%-- <a href="${pageContext.request.contextPath}/templatesForDownload/product_master.xls"><img title="Data Format" alt="" style="width: 35px;" src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
					  	&nbsp;&nbsp;&nbsp;&nbsp; --%>
					  	<span style="visibility:hidden;">
							<img style="width: 30px" id="logo1Img" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span>
					</div>

				</div>
				</div>
				<!-- <div class="form-group col-lg-7 col-sm-7 col-xs-7">
				<div class="icon-remove blue delete" title="Deal Banner" id="logo1_image" style="text-align: center;">
											<label class="myFile" id="logo1_label"></label>
											</div>
            </div> -->
             	
             	 <div class="row">
             	<!-- <div class="col-lg-1 col-sm-1 col-xs-1"></div> -->
             		<div class="form-group col-lg-3 col-sm-12 col-xs-12" style="font-size: 16px;    padding-left: 20px;padding-right: 0px">
             			<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'proof');" id="proof"/> -->&nbsp;&nbsp;&nbsp;<spring:message code="proof.documents.label" />
             			<input type="hidden" id="proof_refId">
             		</div>
             	<div class="form-group col-lg-6 col-sm-12 col-xs-12" >
             		<div class="form-group col-lg-7 col-sm-7 col-xs-7" style="padding-left: 0px">
  						<input id="proofFile" class="form-control" value="${customerSettings.proofDocName}" placeholder="Choose File"  disabled="disabled"/>
  					</div>
  					<div class="form-group col-lg-5 col-sm-5 col-xs-5 browsemargin">
						<div class="fileUpload btn btn-primary browsebutton" style="font-weight: bold;">
			    			<span style="font-size: 15px;">Browse..</span>
			    			<input id="proofBtn" type="file" accept="" onchange="addNameToTextBox('proof',this);" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  	<%-- <a href="${pageContext.request.contextPath}/templatesForDownload/product_master.xls"><img title="Data Format" alt="" style="width: 35px;" src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
					  	&nbsp;&nbsp;&nbsp;&nbsp; --%>
					  	<span style="visibility:hidden;">
							<img style="width: 30px" id="proofImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span>
					</div>

				</div>
            </div>
            </div>
            
              <div class="form-group col-lg-2 col-sm-2 col-xs-2">
            <div class="" title="Deal Banner" id="logo1_image" style="text-align: center;height:100px;  ">
            <img class="thumbnail companyimage" id="dealBanner_thumbnail" alt="No Image" src="data:image/jpeg;base64,${customerSettings.imageStr}"/>
											<label class="myFile" id="logo1_label"></label>
											</div>
            </div>
            </div>
          
            </div>
            </div><br>
	 <div class="row" style="text-align: right; margin-top: 0px;">
                 <div class="row">  
 </div>
 </div>
</div>
</div>


<div class="form-group col-lg-4" style="margin-top: -15px;">
        	 	<span style="font-size:20px; font-size: x-large;"><b>Help</b></span>
              
<div class="form-group col-lg-12" style="border: 2px solid #ccc;border-radius: 0px; height: 533px;">
<p>
1.	Profile Setting To configure address, GSTIN/Service Tax No, and other business details of the Customer.
<br>
<br>
When the customer is registered, the organization details captured. For Registration please do visit <a href="https://www.retailclouds.com/"><b style="text-decoration:underline;color:blue;">  retailclouds.com</a></b> Each customer is given access to Retail Cloud so that customer can manage his/her retail services. 

<br>
You need to provide correct information so that automatic invoicing can happen without any errors.
<br>
Depends on the billing cycle you opted, you get the electronic invoice to your mail ID.
<br>
The same details can be viewed if you register yourself with Retail Cloud Visit<a href="https://www.retailclouds.com/"><b style="text-decoration:underline;color:blue;"> retailclouds.com</b></a>

</p>
</div>
</div>
<div class="row" style="text-align: center;margin-top:-40px">
<br><br><br><br><br>
 <div class="col-lg-12 col-sm-12 col-xs-12" >
 <c:forEach var="accessControl" items="${sessionScope.settings}">
      <c:if test="${accessControl.appDocument == 'ProfileSettings' && accessControl.write == true}">
	<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-right: 0px;">
	<div class="col-lg-6 col-sm-3 col-xs-3" style="padding-right: 0px;"></div>
	<div class="col-lg-3 col-sm-3 col-xs-3" style="padding-right: 0px;">
 		
		 <input type="button" id="submit" style="margin-right: 2%;" class="btnCls" data-toggle="modal" data-target="#myModal" value="<spring:message code="submit.label" />">
		</div>
		</div>
		
	</c:if>
</c:forEach>
  
	<div class="col-lg-6 col-sm-3 col-xs-3" style="padding-right: 0px;">
	<div class="col-lg-3 col-sm-3 col-xs-3" style="padding-right: 0px;"> </div>
	<div class="col-lg-3 col-sm-3 col-xs-3" style="padding-right: 0px;">
		 <input type="button" class="btnCls" style="" onclick="showCustomerSettingsFlow();" value="<spring:message code="cancel.label" />"> 
     </div>
 <div class="col-lg-6 col-sm-3 col-xs-3" style="padding-right: 0px;"></div>
	</div>
	 </div>
	</div>
	</div>
                      </div>
                      <br>
                      
                      
                      
                      
                      
                     

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Customer Profile</h4>
      </div>
      <div class="modal-body">
        <p>Requested to make changes in Customer Profile Settings, do you want to continue and apply?</p>
      </div>
      <div class="modal-footer">
      <div class = "col-lg-6" >
<!--               <button type="button" class="btnCls"  onclick=""  data-dismiss="modal">Cancel</button> -->
      </div>
      <div class = "col-lg-6">
      		<c:if test="${status == 'new'}">
      
        <button type="button" class="btnCls"  onclick="validateCustomerSettingsForm('new')"  data-dismiss="modal">Ok</button>
      </c:if>
      <c:if test="${status == 'edit'}">
      
        <button type="button" class="btnCls"  onclick="validateCustomerSettingsForm('edit')"  data-dismiss="modal">Ok</button>
      </c:if>
      </div>
      </div>
    </div>

  </div>
</div>
                      
                      
                      
                      
                      <div class="box-footer">
                                    
                    </div>
                     </form>
	</div>

</div><!--12  -->
</div>
</section><!-- /.content -->

</body>
</html>