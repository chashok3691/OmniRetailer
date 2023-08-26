<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Viswanath
 * file name		        : Inventory Manager/complaintsAndFeedback/viewCustomerComplaints.jsp
 * file type		        : JSP
 * description				: The viewCustomerComplaints form is displayed using this jsp
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
          <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<%-- <link href="${pageContext.request.contextPath}/css/styleStar.css" rel="stylesheet"> --%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script src="${pageContext.request.contextPath}/js/crm/customerComplaints.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/timepicker/bootstrap-timepicker.min.js" ></script>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/countriesAndStates.js"></script>
	<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
	<script src="${pageContext.request.contextPath}/js/demo-compiled.js"></script> 
<style type="text/css">
.form-group{
	margin-bottom: 5px;	
}
	 .fa-star {
    font-size: 18px;
    display: block;
    color: #FFA500;
    padding: 2px 0px;
}
a:hover
{
	color:#45372D;
	text-decoration: none !important;
}
div.stars {
  width: 270px;
   display: inline-block; 
  display:table-row-group;
}

input.star { display: none; }

label.star {
  float: right;
  padding: 5px;
  font-size: 20px;
  color: #FFA500;
  transition: all .2s;
}

input.star:checked ~ label.star:before {
  content: '\f005';
  color: #FFA500;
  transition: all .25s;
}

input.star-5:checked ~ label.star:before {
  color: #FFA500;
  /* text-shadow: 0 0 20px #952; */
}

input.star-1:checked ~ label.star:before { color: #FFA500; }

/* label.star:hover { transform: rotate(-15deg) scale(1.3); } */

label.star:before {
  content: '\f006';
  font-family: FontAwesome;
}
.close {
    float: right;
    font-size: 20px;
    font-weight: 700;
    line-height: 1;
    color: #45372D !important;
    text-shadow: 0 1px 0 #fff;
    filter: alpha(opacity=20);
    opacity: 1 !important;
}
.framestyle
{
	width: 90%;
    height: 250px;
    border: 1px solid #45372D;
    margin-left: 0%;
}

</style>

<script type="text/javascript">
$(document).ready(function(){
	print_country("country");
	$("#country").val($("#selectedCountry").val());
	
	var phoneNo = $("#mobileNo").val();
	phoneNo = phoneNo.split('-');

	if(phoneNo.length == 1)
		$("#phoneNumber").val(phoneNo[0]);
	else{
		$("#defaultCountry").val(phoneNo[0]);
		$("#phoneNumber").val(phoneNo[1]);
	}
	callCalender('dob');
	callCalender('estimatedClosureDate');
	var number=$("#userRating1").val(); 
	var n=number.split('.');
	var num= n[0];
	
if(num == "1"){	 
	 $(".star-1").trigger("click");
		
}else if(num == "2"){
	$(".star-2").trigger("click");
}else if(num == "3"){
	$(".star-3").trigger("click");
}else if(num == "4"){
	$(".star-4").trigger("click");
}else if(num == "5"){
	$(".star-5").trigger("click");
}

$("input:radio[name='star']").each(function(){
	$(this).attr("disabled","disabled");
});
});
</script>        
</head>
<body>
<!-- Content Header (Page header) -->


<!-- Main content -->
<section class="content">
<div class="row">

  
  <div class="col-xs-12">

				<div class="box box-primary " style="padding-right:10px; padding-left:5px ">
    <div class="box-header" style="text-align: left; height:25px;">
	   <c:set var="today" value="<%=new java.util.Date()%>" /> 
	    <%-- <h3><spring:message code="view.customer.complaints.label" /></h3> 
	    <span style="color:black; text-align:right; padding-left:890px; font-size:115%"><fmt:formatDate pattern="dd/MM/yyyy" value="${today}" /></span> --%>
		<div class="row">
		   	<div class="col-lg-12">
				<div class="col-lg-9">
			    	<h3><spring:message code="view.customer.complaints.label" /></h3> 
			    </div>
			    <div class="col-lg-3" style="color:black; text-align:right;margin-top:10px; font-size:115%">
				    <fmt:formatDate pattern="dd/MM/yyyy" value="${today}" /><br>
				    <label><spring:message code="business.enquiry.status.label" /> : ${customerComplaints.complaintStatus}</label>
			    </div>
			   </div>
	    </div>

    </div><!-- /.box-header -->
    <!-- form start -->
    <form>
    
        <div class="box-body">
        <div class="row" style="text-align: right; margin-top: 0px; padding-left:5px">
        <%-- <div id="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;">${err}</div> --%>
       </div>
<div class="row">
 <div class="form-group col-lg-3">
        	 <div class="row">
	        	 <div class="col-lg-12">
	        	  <label><spring:message code="customer.mobile.no.label" /> <span style="color:red; font-size:2">*</span></label>
                           	 <div class="row">
                                  <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                  	<select class="form-control" style="padding: 2px 5px;" disabled="disabled" id="defaultCountry" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
                                  	<option selected="selected">IN</option>
                                  	<option>US</option>
                                  	<option>GB</option>
                                  	<option>AU</option>
                                  	</select>
                                  	<!-- <input type="text" onfocus="displayToolTip();" class="form-control" id="defaultCountry" maxlength="2" oninput="this.value = this.value.replace(/[^A-Za-z]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/> -->
                                  </div>
                                  <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px">
                                  	<input type="text" class="form-control" readonly="readonly" value="" id="phoneNumber" placeholder="<spring:message code="enter.contact.number" />" id="" size="15" maxlength="15" />
                                  </div>
                                  <input type="hidden" class="form-control" name="mobileNo" id="mobileNo"  value="${customerObj.phone}"/>
                                   <input type="hidden" id="output" />
                             </div>
                        	<span id="error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                     </div>
             </div>
         </div>
        
        <div class="form-group col-lg-3">
        	 <div class="row">
	        	 <div class="col-lg-12">
	        	 	<label><spring:message code="customer.email.label" /> <span style="color:red; font-size:2"></span></label>
	                <input type="text" class="form-control"   id="customerEmail" value="${customerObj.email}" readonly="readonly" placeholder="" />
	                <span id="customerEmailError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	             </div>
             </div>
         </div>
         <div class="form-group col-lg-3">
                      <div class="row">
                             <div class="col-sm-12">
                            <label><spring:message code="customer.rating.label" /> <span style="color:red; font-size:2"></span></label> 
							<input type="hidden" id="userRating1" value="${customerObj.ratingStr}" >
		<div class="stars">
 
    <input class="star star-5" id="star-5"  type="radio" name="star" onclick="userRating('5');"/>
    <label class="star star-5" for="star-5"></label>
    <input class="star star-4" id="star-4"  type="radio" name="star" onclick="userRating('4');"/>
    <label class="star star-4" for="star-4"></label>
    <input class="star star-3" id="star-3"  type="radio" name="star" onclick="userRating('3');"/>
    <label class="star star-3" for="star-3"></label>
    <input class="star star-2" id="star-2"  type="radio" name="star" onclick="userRating('2');"/>
    <label class="star star-2" for="star-2"></label>
    <input class="star star-1" id="star-1"  type="radio" name="star" onclick="userRating('1');"/>
    <label class="star star-1" for="star-1"></label>

</div>
                             </div>
                              </div>
         </div>
</div>
<div class="row">
         <div class="form-group col-lg-3">
        	 <div class="row">
	        	 <div class="col-lg-12">
	        	 	<label><spring:message code="first.name.label" /> <span style="color:red; font-size:2">*</span></label>
	                <input type="text" class="form-control" id="firstName" value="${customerObj.name}" readonly="readonly" placeholder="<spring:message code="enter.first.name" />" />
	                <span id="firstNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	             </div>
             </div>
         </div> 
        
         <div class="form-group col-lg-3">
        	 <div class="row">
	        	 <div class="col-lg-12">
	        	 	<label><spring:message code="last.name.label" /> <span style="color:red; font-size:2">*</span></label>
	                <input type="text" class="form-control" id="lastName" value="${customerObj.lastName}" readonly="readonly" placeholder="<spring:message code="enter.last.name" />" />
	                <span id="lastNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	             </div>
             </div>
         </div> 
         
          <div class="form-group col-lg-3">
        	 <div class="row">
	        	 <div class="col-lg-12">
	      			 <label><spring:message code="dob.label" /> <span style="color:red; font-size:2">*</span></label>
	                <input class="form-control calendar_icon" disabled="disabled" readonly="readonly" style="background-color: ;" name="dob" value="${customerObj.dobStr}" id="dob" size="20" type="text" onfocus="callCalender('dob')" onclick="callCalender('dob')" placeholder="DD/MM/YYYY"/>
                    <span id="dobError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	                </div>
             </div>
         </div>
</div>
<br><br>
<div class="row">
   <div class="form-group col-lg-3">
        	 <div class="row">
        	  <div class="col-lg-12">
	        	 	<label><spring:message code="house.number.label" /> <span style="color:red; font-size:2"></span></label>
	                <input type="text" class="form-control" id="houseNumber" value="${customerObj.houseNo}" readonly="readonly" placeholder="<spring:message code="enter.house.number.label" />" />
	                <span id="houseNumberError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	             </div>
        	 </div>
   </div>
   <div class="form-group col-lg-3">
        	 <div class="row">
        	  <div class="col-lg-12">
	        	 	<label><spring:message code="street.name.label" /> <span style="color:red; font-size:2"></span></label>
	                <input type="text" class="form-control" id="streetName" value="${customerObj.street}" readonly="readonly" placeholder="<spring:message code="enter.street.name.label" />" />
	                <span id="streetNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	             </div>
        	 </div>
   </div>
   <div class="form-group col-lg-3">
        	 <div class="row">
        	  <div class="col-lg-12">
	        	 	<label><spring:message code="locality.label" /> <span style="color:red; font-size:2"></span></label>
	                <input type="text" class="form-control" id="locality" value="${customerObj.locality}" readonly="readonly" placeholder="<spring:message code="enter.locality.label" />" />
	                <span id="localityError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	             </div>
        	 </div>
   </div>
    <div class="form-group col-lg-3">
        	 <div class="row">
        	  <div class="col-lg-12">
	        	 	<label><spring:message code="zipcode.label" /> <span style="color:red; font-size:2"></span></label>
	                <input type="text" class="form-control" id="zipcode" value="${customerObj.pin_no}" readonly="readonly" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.zipcode.label" />" />
	                <span id="zipcodeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	             </div>
        	 </div>
   </div>
</div>
        	 
<div class="row">
         <div class="form-group col-lg-3">
        	 <div class="row">
        	  <div class="col-lg-12">
	        	 	<label><spring:message code="city.label" /> <span style="color:red; font-size:2"></span></label>
	                <input type="text" class="form-control" id="city" value="${customerObj.city}" readonly="readonly" placeholder="<spring:message code="enter.city.label" />" />
	                <span id="cityError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	             </div>
        	 </div>
   </div>
   <div class="form-group col-lg-3">
        	 <div class="row">
	        	 <div class="col-lg-12">
	      			<label><spring:message code="country.label" /></label>
                    <select id="country" name="country" disabled="disabled" class="form-control" >
                    </select>
                    <input type="hidden" id="selectedCountry" value="${customerObj.country}">
                    
									        	 							     </div>
             </div>
         </div>
         <div class="form-group col-lg-3">
        	 <div class="row">
        	  <div class="col-lg-12">
	        	 	<label><spring:message code="landmark.label" /> <span style="color:red; font-size:2"></span></label>
	                <input type="text" class="form-control" id="landmark" value="${customerObj.landMark}" readonly="readonly" placeholder="<spring:message code="enter.landmark.label" />" />
	                <span id="landmarkError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	             </div>
        	 </div>
   </div>
   </div>
   <br><br>
        
<div class="row">
    <div class="form-group col-lg-3">
        	 <div class="row">
	        	 <div class="col-lg-12">
	        	 <label><spring:message code="profession.label" /> <span style="color:red; font-size:2"></span></label>
	        	 <input type="hidden" id="profession1" value="${customerObj.designation}" >
	        	 <select class="form-control" name="profession" id="profession" disabled="disabled">
			            <option value="Teaching" ${'Teaching' == customerObj.designation ? 'selected' : ''}>Teaching</option>
			            <option value="Engineer" ${'Engineer' == customerObj.designation ? 'selected' : ''}>Engineer</option>
			            <option value="Doctor" ${'Doctor' == customerObj.designation ? 'selected' : ''}>Doctor</option>
			            <option value="Lawyer" ${'Lawyer' == customerObj.designation ? 'selected' : ''}>Lawyer</option>
			            <option value="Accountant" ${'Accountant' == customerObj.designation ? 'selected' : ''}>Accountant</option>
			            <option value="Human Resource" ${'Human Resource' == customerObj.designation ? 'selected' : ''}>Human Resource</option>
			            <option value="Self Employed" ${'Self Employed' == customerObj.designation ? 'selected' : ''}>Self Employed</option>
			            <option value="Technician" ${'Technician' == customerObj.designation ? 'selected' : ''}>Technician</option>
			             <option value="Management Consultant" ${'Management Consultant' == customerObj.designation ? 'selected' : ''}>Management Consultant</option>
			            <option value="Other" ${'Other' == customerObj.designation ? 'selected' : ''}>Other</option>
			            </select>
			            <span id="professionError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> 
	        	 	      </div>  
             </div>
</div>
<div class="form-group col-lg-3">
        	 <div class="row">
	        	 <div class="col-lg-12">
	        	 	<label><spring:message code="qualification.label" /></label><span style="color:red; font-size:2"></span>
	        	 	   <input type="hidden" id="qualification1" value="${customerObj.qualification}" > 
			            <select class="form-control" name="qualification" id="qualification" disabled="disabled">
						<option value="School" ${'School' == customerObj.qualification ? 'selected' : ''}>School</option>
			            <option value="College" ${'College' == customerObj.qualification ? 'selected' : ''}>College</option>
			            <option value="Diploma" ${'Diploma' == customerObj.qualification ? 'selected' : ''}>Diploma</option>
			            <option value="Graduation" ${'Graduation' == customerObj.qualification ? 'selected' : ''}>Graduation</option>
			            <option value="Post Graduation" ${'Post Graduation' == customerObj.qualification ? 'selected' : ''}>Post Graduation</option>
			            <option value="Phd" ${'Phd' == customerObj.qualification ? 'selected' : ''}>Phd</option>
			            </select> 
			            <span id="qualificationError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	              </div>
             </div>           
         </div>
         <div class="form-group col-lg-3">
        	 <div class="row">
	        	 <div class="col-lg-12">
	        	 	<label><spring:message code="organization.name.label" /> <span style="color:red; font-size:2"></span></label>
	                <input type="text" class="form-control" readonly="readonly"  id="organizationName" value="${customerObj.companyName}" placeholder="" />
	                <span id="organizationNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	             </div>
             </div>
</div>
<div class="form-group col-lg-3">
        	 <div class="row">
	        	 <div class="col-lg-12">
	        	 	<label><spring:message code="monthly.income.label" /></label><span style="color:red; font-size:2"></span>
	        	 	    <input type="hidden" id="income" value="${customerObj.monthlyIncome}" >
			            <select class="form-control" name="monthlyIncome" id="monthlyIncome" disabled="disabled">
						 <option value="10,000 to 50,000" ${'10,000 to 50,000' == customerObj.monthlyIncome ? 'selected' : ''}>10,000 - 50,000</option>
			            <option value="50,000 to 1,00,000" ${'50,000 to 1,00,000' == customerObj.monthlyIncome ? 'selected' : ''}>50,000 - 1,00,000</option>
			            <option value="1,00,000 to 10,00,000" ${'1,00,000 to 10,00,000' == customerObj.monthlyIncome ? 'selected' : ''}>1,00,000 - 10,00,000</option>
			            <option value="10,00,000 to 1,00,00,000" ${'10,00,000 to 1,00,00,000' == customerObj.monthlyIncome ? 'selected' : ''}>10,00,000 - 1,00,00,000</option>
			            <option value="1,00,00,000 and Above" ${'1,00,00,000 and Above' == customerObj.monthlyIncome ? 'selected' : ''}>1,00,00,000 and Above</option>
			        	</select> 
			            <span id="monthlyIncomeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	              </div>
             </div>
         </div>
</div>
<div class="row">
<div class="form-group col-lg-3">
        	 <div class="row">
	        	 <div class="col-lg-12">
	        	 	<label><spring:message code="gender.label" /></label><span style="color:red; font-size:2"></span>
	        	 	    <input type="hidden" id="gender1" value="${customerObj.gender}" > 
			            <select class="form-control" name="gender" id="gender" disabled="disabled">
						<option value="Male" ${'Male' == customerObj.gender ? 'selected' : ''}>Male</option>
			            <option value="Female" ${'Female' == customerObj.gender ? 'selected' : ''}>Female</option>
			            </select> 
			            <span id="genderError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	              </div>
             </div>
         </div>
         <div class="form-group col-lg-3">
        	 <div class="row">
	        	 <div class="col-lg-12">
	        	 	<label><spring:message code="relationship.status.label" /></label><span style="color:red; font-size:2"></span>
	        	 	    <input type="hidden" id="relation" value="${customerObj.relationShipStatus}" >
			            <select class="form-control" name="relationshipStatus" id="relationshipStatus" disabled="disabled">
					 	<option value="Single" ${'Single' == customerObj.relationShipStatus ? 'selected' : ''}>Single</option>
			            <option value="Married" ${'Married' == customerObj.relationShipStatus ? 'selected' : ''}>Married</option>
			            </select> 
			            <span id="relationshipStatusError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	              </div>
             </div>
         </div>
         <div class="form-group col-lg-3">
        	 <div class="row">
	        	 <div class="col-lg-12">
	        	 	<label><spring:message code="family.size.label" /></label><span style="color:red; font-size:2"></span>
	        	 	    <input type="hidden" id="size" value="${customerObj.familySizeStr}">
			            <select class="form-control" name="familySize" id="familySize" disabled="disabled">
						<option value="1" ${'1' == customerObj.familySizeStr ? 'selected' : ''}>1</option>
			            <option value="2" ${'2' == customerObj.familySizeStr ? 'selected' : ''}>2</option>
			            <option value="3" ${'3' == customerObj.familySizeStr ? 'selected' : ''}>3</option>
			            <option value="4" ${'4' == customerObj.familySizeStr ? 'selected' : ''}>4</option>
			            <option value="5" ${'5' == customerObj.familySizeStr ? 'selected' : ''}>5</option> 
			            <option value="6" ${'6' == customerObj.familySizeStr ? 'selected' : ''}>6</option> 
			            <option value="7" ${'7' == customerObj.familySizeStr ? 'selected' : ''}>7</option> 
			            <option value="8" ${'8' == customerObj.familySizeStr ? 'selected' : ''}>8</option> 
			            <option value="9" ${'9' == customerObj.familySizeStr ? 'selected' : ''}>9</option> 
			            <option value="10" ${'10' == customerObj.familySizeStr ? 'selected' : ''}>10</option> 
			            </select> 
			            <span id="familySizeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	              </div>
             </div>
         </div>
         <div class="form-group col-lg-3">
        	 <div class="row">
	        	 <div class="col-lg-12">
	        	 	<label><spring:message code="habits.label" /></label><span style="color:red; font-size:2"></span>
	        	 	    <input type="hidden" id="habits1" value="${customerObj.hobbies}">
			            <select class="form-control" name="habits" id="habits" disabled="disabled">
						 <option value="Travel" ${'Travel' == customerObj.hobbies ? 'selected' : ''}>Travel</option>
						 <option value="Partying" ${'Partying' == customerObj.hobbies ? 'selected' : ''}>Partying</option>
						 <option value="Shopping" ${'Shopping' == customerObj.hobbies ? 'selected' : ''}>Shopping</option>
						 <option value="Dining" ${'Dining' == customerObj.hobbies ? 'selected' : ''}>Dining</option>
						 <option value="Gardening" ${'Gardening' == customerObj.hobbies ? 'selected' : ''}>Gardening</option>
						 <option value="Games" ${'Games' == customerObj.hobbies ? 'selected' : ''}>Games</option>
						 <option value="Music" ${'Music' == customerObj.hobbies ? 'selected' : ''}>Music</option>
						 <option value="Movies" ${'Movies' == customerObj.hobbies ? 'selected' : ''}>Movies</option>
						 <option value="Reading" ${'Reading' == customerObj.hobbies ? 'selected' : ''}>Reading</option>
						 <option value="Others" ${'Others' == customerObj.hobbies ? 'selected' : ''}>Others</option>
			            </select> 
			            <span id="habitsError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	              </div>
             </div>  
         </div>
</div>
<br><br>
<div class="row">
 <div class="form-group col-lg-3">
        	 <div class="row">
	        	 <div class="col-lg-12">
	        	 	<label><spring:message code="complaint.type.label" /></label><span style="color:red; font-size:2">*</span>
	        	 	    <input type="hidden" id="type" value="${customerComplaints.complaintType}">
			            <select class="form-control" name="complaintType" id="complaintType" disabled="disabled">
						<option value="Product Quality" ${'Product Quality' == customerComplaints.complaintType ? 'selected' : ''}>Product Quality</option>
			            <option value="Poor Service" ${'Poor Service' == customerComplaints.complaintType ? 'selected' : ''}>Poor Service</option>
			            <option value="Delivery" ${'Delivery' == customerComplaints.complaintType ? 'selected' : ''}>Delivery</option>
			            <option value="Technical Support" ${'Technical Support' == customerComplaints.complaintType ? 'selected' : ''}>Technical Support</option>
			            <option value="Sales" ${'Sales' == customerComplaints.complaintType ? 'selected' : ''}>Sales</option>
			            </select> 
			            <span id="complaintTypeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	              </div>
             </div>
         </div>
       <div class="form-group col-lg-3">
        	 <div class="row" style="text-align:center;">
	        	 <div class="col-lg-12">
	        	<button type="button" class="buttons btn-default btn-lg" style="padding:5px 27px;width:100%; background-color: rgb(195,195,195); margin-top:17px; font-size:15px"  onclick="return getCustomerPurchaseDetails('','0');"><spring:message code="customer.complaints.browse.purchases" /></button>
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
                                                <th><div style="width: 100px;"><spring:message code="billing_id.label" /></div></th>
                                                <th><div style="width: 100px;"><spring:message code="skuid.label" /></div></th>
                                                <th><div style="width: 100px;"><spring:message code="item_name.label" /></div></th>
                                                <th><div style="width: 100px;"><spring:message code="quantity.label" /></div></th>
                                                <th><div style="width: 110px;"><spring:message code="total_bill.label" /></div></th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align:center">
                                        </tbody>
                                        </table>
        </div>
        <div class="modal-footer">
         <center><button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="customer.complaints.close.button" /></button></center>
        </div>
      </div>
	        	 </div>
	        	 </div> --%>
	        	 <div class="modal fade" id="myModal" role="dialog">
  <div class="modal-dialog" style="width:90%">
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
         <center><button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="customer.complaints.close.button" /></button></center>
        </div>
      </div>
  	 </div>
  </div>
	        	 </div>
         </div>
         </div>
              <div class="form-group col-lg-3">
        	 <div class="row" style="text-align:center; ">
	        	 <div class="col-lg-12">
	        	<button type="button" class="buttons btn-default btn-lg" style="padding:5px 27px;width:100%; background-color: rgb(195,195,195); margin-top:17px; font-size:15px"  onclick="complaints();"><spring:message code="customer.complaints.browse.complaints" /></button>
	        	<div id="triggerEvent"></div>
	        	 <div class="modal fade" id="myModal1" role="dialog">
    <div class="modal-dialog" style="width:90%">
    <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         <center><h4 class="modal-title"><spring:message code="customer.complaints.complaints.label" /></h4></center>
        </div>
        <div class="modal-body">
          <!-- <p>Some text in the .</p> -->
          <table id="example1" class="table table-bordered table-striped" style="margin-left: 10px; width: 98.2%;">
                                        <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                                <th><div style="width: 100px;"><spring:message code="complaint.id.label" /></div></th>
                                                <th><div style="width: 100px;"><spring:message code="created.by.label" /></div></th>
                                                <th><div style="width: 110px;"><spring:message code="complaint.date.label" /></div></th>
                                                <th><div style="width: 110px;"><spring:message code="complaint.type.label" /></div></th>
                                                <th><div style="width: 130px;"><spring:message code="complaint.status.label" /></div></th>
												<th><div style="width: 130px;"><spring:message code="complaint.details.label" /></div></th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align:center">
                                        
                                        </tbody>
                                        </table>
        </div>
        <div class="modal-footer">
        <center><button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="customer.complaints.close.button" /></button></center>
        </div>
      </div>
	        	 </div>
	        	 </div>
	        	 </div>
         </div>
         </div>
         </div>
          <div class="row">
         <div class="form-group col-lg-3">
        	 <div class="row">
	        	 <div class="col-lg-12">
	        	 	<label><spring:message code="priority.label" /></label><span style="color:red; font-size:2"></span>
	        	 	    <input type="hidden" id="prior" value="${customerComplaints.priority}" >
			            <select class="form-control" name="priority"  id="priority" disabled="disabled">
						<option value="Normal" ${'Normal' == customerComplaints.priority ? 'selected' : ''}>Normal</option>
						<option value="Medium" ${'Medium' == customerComplaints.priority ? 'selected' : ''}>Medium</option>
						<option value="Urgent" ${'Urgent' == customerComplaints.priority ? 'selected' : ''}>Urgent</option>
						<option value="Critical" ${'Critical' == customerComplaints.priority ? 'selected' : ''}>Critical</option>
			            </select> 
			            <span id="priorityError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	              </div>
             </div>
         </div>
          <div class="form-group col-lg-3">
        	 <div class="row">
	        	 <div class="col-lg-12">
	        	 	<label><spring:message code="created.by.label" /> <span style="color:red; font-size:2">*</span></label>
	                <input type="text" class="form-control"  id="createdBy" readonly="readonly" value="${customerComplaints.createdBy}" placeholder="" />
	                <span id="createdByError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	             </div>
             </div>
         </div>
	<div class="form-group col-lg-3">
        	 <div class="row">
	        	 <div class="col-lg-12">
	        	 <label><spring:message code="estimated.closure.date.label" /> <span style="color:red; font-size:2">*</span></label>
	                <input class="form-control calendar_icon" readonly="readonly" disabled="disabled" style="background-color: ;" value="${customerComplaints.estimatedClosureDateStr}" name="estimatedClosureDate"  id="estimatedClosureDate" size="20" type="text" onfocus="callCalender('estimatedClosureDate')" onclick="callCalender('estimatedClosureDate')" placeholder="DD/MM/YYYY"/>
                    <span id="estimatedClosureDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	              </div>
             </div>
         </div>
</div>
<div class="row">
<div class="form-group col-lg-3">
        	 <div class="row">
	        	 <div class="col-lg-12">
	        	 	<label><spring:message code="complaint.mode.label" /></label><span style="color:red; font-size:2"></span>
	        	 	    <input type="hidden" id="mode" value="${customerComplaints.complaintMode}">
			            <select class="form-control" name="complaintMode" id="complaintMode" disabled="disabled">
						<option value="Direct" ${'Direct' == customerComplaints.complaintMode ? 'selected' : ''}>Direct</option>
			            <option value="Telephone" ${'Telephone' == customerComplaints.complaintMode ? 'selected' : ''}>Telephone</option>
			            <option value="Customer Service Agent" ${'Customer Service Agent' == customerComplaints.complaintMode ? 'selected' : ''}>Customer Service Agent</option>  
			            </select> 
			            <span id="complaintModeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	              </div>
             </div>
         </div>
         <div class="form-group col-lg-3">
        	 <div class="row">
	        	 <div class="col-lg-12">
	        	 	<label><spring:message code="assigned.to.label" /></label><span style="color:red; font-size:2"></span>
	        	 	    <input type="hidden" id="eee" >
			            <select class="form-control" name="assignedTo" id="assignedTo" disabled="disabled">
					<%--  <option value="Assigned To" ${'' == customerComplaints.assignedTo ? 'selected' : ''}>Assigned To</option> --%>
			            	<!--<option value="Processing">Processing</option>
			            <option value="Resolved">Resolved</option> -->
			            </select> 
			            <span id="assignedToError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	              </div>
             </div>
         </div>
         <div class="form-group col-lg-3">
        	 <div class="row">
	        	 <div class="col-lg-12">
	        	 <label><spring:message code="EmployeeForm.location" /></label>
	                <select disabled="disabled" class="form-control" name="storeLocation" id="storeLocation">
	                   	<option value="">Select</option>
	                    <c:forEach var="location" items="${workLocationsList}">
							<option value="${location}" ${location == customerComplaints.storeLocation ? 'selected' : ''}>${location}</option>
						</c:forEach>
	                </select>
	                <span id="locationError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	              </div>
             </div>
         </div>
</div>
  <div class="row">
  <div class="col-lg-12">
  <label><spring:message code="complaint.details.label" /></label>
  <textarea class="form-control" id="complaintDetails" style="resize:none;" rows="4" readonly="readonly" placeholder="<spring:message code="enter.complaint.details.label" />" >${customerComplaints.complaintDetails}</textarea> 
 </div>
  </div>

<br>
 <div class="row" style="text-align: center;" >
	<input type="button" class="btn bg-olive btn-inline" style="margin-right: 70px;width: 70px;" onclick="viewCustomerComplaints('customerComplaints','0');" value="<spring:message code="cancel.label" />">	 
 </div>
  <br><div class="box-footer"></div>
</div>
</form>
</div>            	
        <input type="hidden" id="cid" value='${customerComplaints.complaintID}'>      	             
	
                      </div>	</div>

<!--12  -->

</section><!-- /.content -->
 <script>
 
 	
</script>
</body>
</html>