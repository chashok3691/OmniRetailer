
<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * modified By				: Vinay
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
	
	<!-- InputMask -->
       
	<script src="${pageContext.request.contextPath}/js/form_plugin.js"></script> 
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/masterDataManagement/genericMasters/employeeMaster.js"></script>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/controller.js"></script>
	<script src="${pageContext.request.contextPath}/js/demo-compiled.js"></script>	
	
<style type="text/css">
	
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
	.col-xs-12 {
	 padding: 1% 4% 1% 4%;
	 }
	
</style>
<script type="text/javascript">

$(document).ready(function(){
	callCalender("dob");
		callCalender("doj");
		focusDiv("Success");
		focusDiv("Error");
		//$("#employeeCode").focus();
		
		   $("#employeeCode").keydown(function(){
	 		   $("#employeeCodeError").html("");
			   $(".Error").html("");
	 	 }); 
 	  $("#firstName").keydown(function(){
 		   $("#firstNameError").html("");
		   $(".Error").html("");
 	 });
 	 $("#lastName").keydown(function(){
		   $("#lastNameError").html("");
		   $(".Error").html("");
	 });
 	 $("#doj").keydown(function(){
 		   $("#dojError").html("");
		   $(".Error").html("");
 	 }); 
 	 $("#designation").keydown(function(){
		   $("#designationError").html("");
		   $(".Error").html("");
	 });
 	$("#location").change(function(){
		   $("#locationError").html("");
		   $(".Error").html("");
	 });
	 $("#department").change(function(){
		   $("#departmentError").html("");
		   $(".Error").html("");
	 });
 	 $("#middleName").keydown(function(){
		   $(".Error").html("");
	 });
 	 $("#lastName").keydown(function(){
		   $(".Error").html("");
	 });
 	 /*  $("#dob").keydown(function(){
		   $(".Error").html("");
	 }); 
 	 $("#highestQualification").keydown(function(){
 		$("#highestQualificationError").html("");
		$(".Error").html("");
	 }); */
 	/*  $("#yearsOfExp").keyup(function(){
 		  $("#yearsOfExpError").html("");
		  $(".Error").html("");
		 
	 });  */
 	 $("#remarks").keydown(function(){
		   $(".Error").html("");
	 });

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
	 $("#phoneNum").keyup(function(){
		   $(".Error").html("");
	 });
	 
	 var phoneNo = $("#phoneNum").val();
		phoneNo = phoneNo.split('-');
		if(phoneNo.length == 1)
			$("#phoneNumber1").val(phoneNo[0]);
		else{
			$("#defaultCountry1").val(phoneNo[0]);
			$("#phoneNumber1").val(phoneNo[1]);
		}
	 
});

	</script>
	
	<!--  added by        :  koti bomminei
      description     :  to ristrict the user from entering special characters     -->


	
</head>
<body>


<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12" >
				<div class="box box-primary">
                                <div class="box-header" style="text-align: center">
                                <br/>
                                <h3><spring:message code="new.employee.header.label" /></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form id="newEmployee" method="post">
                                    <div class="box-body">
                                    <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 20px; margin-top: -20px">${err}</div>
                                    <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 20px; margin-top: -20px">${success}</div>
                                   	<div class="row">
                                   	       <div class="form-group col-lg-3">
                                            <label><spring:message code="enter.EmployeeForm.id" /><span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" onblur="criteriaSlashes(this)" name="employeeCode" value="${employee.employeeCode}" id="employeeCode" required placeholder="<spring:message code="enter.EmployeeForm.id" />" style=" width: 80%"/>
                                          <span id="employeeCodeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                        <div class="form-group col-lg-9"></div>
                                        
                                        
                                        </div>
                                   	<div class="row">
                                   		<div class="form-group col-lg-3">
                                            <label><spring:message code="EmployeeForm.firstName" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" onblur="criteria(this)" class="form-control" name="firstName" value="${employee.firstName}" id="firstName" required placeholder="<spring:message code="enter.EmployeeForm.firstName" />" style=" width: 80%" />
                                         <span id="firstNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                    	<div class="form-group col-lg-3">
                                            <label><spring:message code="EmployeeForm.serviceType" /></label>
	                                         	<select class="form-control" name="serviceType" id="serviceType" style=" width: 80%">
	                                            	<option value="Contract" ${'Contract' == employee.serviceType ? 'selected' : ''}><spring:message code="enter.EmployeeForm.contract" /></option>
	                                            	<option value="Permanent" ${'Permanent' == employee.serviceType ? 'selected' : ''}><spring:message code="enter.EmployeeForm.permanent" /></option>
	                                            </select>
                                        </div>
										<div class="form-group col-lg-3">
                                            <label><spring:message code="EmployeeForm.specializationType.primary" /></label>
                                         	<select class="form-control" name="primarySpecialization" id="primarySpecialization" style=" width: 80%">
                                         
                                              <c:forEach var="primarySpecialization" items="${specialisationList}">
												<option value="${primarySpecialization}" ${primarySpecialization == selectedPrimarySpecialiazation ? 'selected' : ''}>${primarySpecialization}</option>
											</c:forEach>
                                           
                                            </select>
                                        </div>
                                        <div class="form-group col-lg-3">
                                            <label><spring:message code="EmployeeForm.location" /> <span style="color:red; font-size:2">*</span></label>
                                            <select class="form-control"  name="location" id="location" style=" width: 80%">
                                             <c:forEach var="location" items="${workLocationsList}">
												<option value="${location}" ${location == selectedLocation ? 'selected' : ''}>${location}</option>
											</c:forEach>
                                           </select>
                                           <span id="locationError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                        </div>
								<div class="row">
                                        <div class="form-group col-lg-3">
                                            <label><spring:message code="EmployeeForm.middleName" /></label>
                                            <input type="text" onblur="criteria(this)" class="form-control" name="middleName" value="${employee.middleName}" id="middleName" required placeholder="<spring:message code="enter.EmployeeForm.middleName" />" style=" width: 80%" />
                                        </div>
                                        <div class="form-group col-lg-2">
                                             <label><spring:message code="EmployeeForm.dob" /><!--  <span style="color:red; font-size:2">*</span> --></label>
                                             <input class="form-control calendar_icon" readonly="readonly" value="${employee.dateOfBirth}" style="background-color: white;" name="dateOfBirth" id="dob" size="20" type="text" onfocus="callCalender('dob')" onclick="callCalender('dob')" placeholder="DD/MM/YYYY"/>
                                          	<!--  <span id="dobError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> -->
                                        </div>
                                        <div class="form-group col-lg-1"></div>
                                         
                                        <div class="form-group col-lg-3">
                                            <label><spring:message code="EmployeeForm.specializationType.secondary" /></label>
                                         	<select class="form-control" name="secondarySpecialization" id="secondarySpecialization" style=" width: 80%">
                                             <c:forEach var="secondarySpecialization" items="${specialisationList}">
												<option value="${secondarySpecialization}" ${secondarySpecialization == selectedSecondarySpecialization ? 'selected' : ''}>${secondarySpecialization}</option>
											</c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group col-lg-3">
                                            <label><spring:message code="EmployeeForm.designation" /> <!-- <span style="color:red; font-size:2">*</span> --></label>
                                            <input type="text" onblur="criteria(this)" class="form-control" style="width:80%" name="designation" value="${employee.designation}" id="designation" required placeholder="<spring:message code="enter.EmployeeForm.designation" />"  />
                                        	<!-- <span id="designationError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> -->
                                        </div>
      
								</div>
                                         
                                <div class="row">
                                     	<div class="form-group col-lg-3">
                                            <label><spring:message code="EmployeeForm.lastName" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" onblur="criteria(this)" class="form-control" name="lastName" value="${employee.lastName}" id="lastName" required placeholder="<spring:message code="enter.EmployeeForm.lastName" />" style=" width: 80%"/>
                                            <span id="lastNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                      	<div class="form-group col-lg-2">
                                            <label><spring:message code="EmployeeForm.doj" /> <span style="color:red; font-size:2">*</span></label>
                                            <input class="form-control calendar_icon" value="${employee.dateOfJoining}" readonly="readonly" style="background-color: white;" name="dateOfJoining" id="doj" size="20" type="text" onclick="callCalender('doj')" onfocus="callCalender('doj')" placeholder="DD/MM/YYYY"/>                                          
                                        		<span id="dojError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                        <div class="form-group col-lg-1"></div>
                                       	<div class="form-group col-lg-2">
                                            <label><spring:message code="EmployeeForm.highestQualification" /> <!-- <span style="color:red; font-size:2">*</span> --></label>
                                            <input type="text" onblur="criteriaSlashes(this)" class="form-control" name="highestQualification" value="${employee.highestQualification}" id="highestQualification" required placeholder="<spring:message code="enter.EmployeeForm.highestQualification" />" />
                                           <!--  <span id="highestQualificationError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> -->
                                        </div>
                                        <div class="form-group col-lg-1"></div>
                                        <div class="form-group col-lg-3">
                                            <label><spring:message code="EmployeeForm.department" /> <span style="color:red; font-size:2">*</span></label>
                                            <%-- <input type="text" class="form-control" name="department" id="department" required placeholder="<spring:message code="enter.EmployeeForm.department" />" /> --%>
                                            <%-- <select class="form-control" name="department" id="department">
                                             <c:forEach var="department" items="${departmentList}">
												<option value="${department}" ${department == employee.department ? 'selected' : ''}>${department}</option>
											</c:forEach>
                                           </select> --%>
                                           <input type="text" class="form-control searchItems" id="searchDepartmentNames" value="${employee.department}" placeholder="<spring:message code="search.department.name.label" />" style="height:30PX;width: 80%;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
												<div class=services>
											    		<div class="items">
											     			<ul class="matchedStringUl searchOrganizationDepartmentNames" style="width: 89%!important;padding: 0px!important;"></ul>
											   			</div>
													</div>
			                                <input type="hidden" class="form-control" name="department" id="department" value="${employee.department}" />
                                         	<span id="departmentError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                                              
								</div>
                                <div class="row">
                                       <div class="col-lg-2">
                        		       	 <label><spring:message code="EmployeeForm.status.label" /></label>
                        		        		<select name=status id="status" class="form-control">
			                        		        <option value="true"  ${employee.status == "true" ? 'selected' : ''} ><spring:message code="active.label" /></option>
			                        		        <option value="false" ${employee.status == "false" ? 'selected' : ''}><spring:message code="inActive.label" /></option>
                        		        		</select>
                        		        		
                        		       </div>
                        		       <div class="form-group col-lg-1"></div>
                                       <div class="col-lg-2">
                        		       		 <label><spring:message code="EmployeeForm.rating.label" /></label>
                        		       			 <select name=ratig id="ratig" class="form-control" style="width:80%">
                        		       			 <option value="1" ${'1' == employee.ratig ? 'selected' : ''}>1</option>
                        		        		 <option value="2" ${'2' == employee.ratig ? 'selected' : ''}>2</option> 
			                        		     <option value="3" ${'3' == employee.ratig ? 'selected' : ''}>3</option>
			                        		     <option value="4" ${'4' == employee.ratig ? 'selected' : ''}>4</option>
			                        		     <option value="5" ${'5' == employee.ratig ? 'selected' : ''}>5</option>   
                        		        		 </select>
                        		       </div>
                        		       <div class="form-group col-lg-1"></div>
                                       <div class="form-group col-lg-2">
                                            <label><spring:message code="EmployeeForm.yearsOfExp" /><!--  <span style="color:red; font-size:2">*</span> --></label>
                                            <input type="text" class="form-control" name="yearsOfExperience" value="${employee.yearsOfExperience}" id="yearsOfExp" maxlength="5" required oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.EmployeeForm.yearsOfExp" />" style="width:70%" />
                                           <!--  <span id="yearsOfExpError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> -->
                                       </div>
                                       <div class="form-group col-lg-1"></div>
                                       <div class="form-group col-lg-2">
                                             <label><spring:message code="EmployeeForm.reportingManager" /></label>
			                                
			                             	<input type="text" onblur="criteria(this)" class="form-control searchItems" id="searchEmployee"  value="${employee.reportingManager}"  placeholder="<spring:message code="search.employee.label" />" style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
												<div class=services>
											    		<div class="items">
											     			<ul class="matchedStringUl employee" style="width: 89%!important;padding: 0px!important;"></ul>
											   			</div>
													</div>
			                                <input type="hidden" class="form-control" name="reportingManager" id="employeeId" value="${employee.reportingManager}" />
			                             	<span id="repoManagerError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                            <%-- <select class="form-control" name="reportingManager" id="reportingManager">
                                            <c:forEach var="employee" items="${employeeList}">
												<option value="${employee.employeeCode}">${employee.firstName}</option>
											</c:forEach>
                                         </select> --%>
                                        </div>
                                </div>
                                <div class="row">
                                
                                <div class="form-group col-lg-2">
                                 <label><spring:message code="EmployeeForm.overSeasExperience" /> </label>
                                <input type="text" onblur="criteria(this)" class="form-control" name="overSeasExperience" id="overSeasExperience" value="${employee.overSeasExperience }" placeholder="<spring:message code="enter.EmployeeForm.overSeasExperience" />" style="width:70%" />
                                
                                </div>
                                <div class="form-group col-lg-1"></div>
                                <div class="form-group col-lg-3">
                                 <label><spring:message code="EmployeeForm.consultantType" /> </label>
                                <select class="form-control" name="consultantType" id="consultantType" style="width:80%">
                               
                               <option value="specialist" ${'specialist' == employee.consultantType ? 'selected' : ''}><spring:message code="enter.EmployeeForm.specialist" /></option>
	                           <option value="operator" ${'operator' == employee.consultantType ? 'selected' : ''}><spring:message code="enter.EmployeeForm.operator" /></option>
                                </select>
                                </div>
                                
                                       </div>
                                <div class="row"><div class="form-group col-lg-12"></div></div>
                                <div class="row">
                                        <div class="form-group col-lg-3">
                                         	<div class="row" style="width: 100%">
                                         		<div class="form-group col-lg-12">
			                                 			<label><spring:message code="EmployeeForm.email" /> <span style="color:red; font-size:2">*</span></label>
			                                 			<input type="email" class="form-control" name="email" id="emailId" value="${employee.email}" required placeholder="<spring:message code="enter.EmployeeForm.email" />"/>
			                             				<span id="emailError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
			                             		</div>
                                        	</div>
                                         <div class="row" style="width: 85%">
                                  			<div class="col-lg-5 col-md-4 col-sm-4 col-xs-4">
                                  	<select style="padding: 6px 8px;" class="form-control" id="defaultCountry1" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
                                  		<option selected="selected">IN</option>
                                  		<option>US</option>
                                  		<option>GB</option>
                                  		<option>AU</option>
                                  	</select>
                                  </div>
                                  <div class="col-lg-7 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px">
                                  	<input type="text" class="form-control" placeholder="<spring:message code="supplier.enter.mobile.label" />" id="phoneNumber1"  size="10" maxlength="10" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                  </div>
                                  <input type="hidden" class="form-control" name="phonuNum" id="phoneNum"  value="${employee.phonuNum}"/>
                                  <span id="phoneError" style="text-align:right;color: red;font-size: 2;font-weight: bold;margin-left: 20px;white-space: nowrap;"></span>
                                
                                   <input type="hidden" id="output1" />
                             			</div>
                             			 <span id="error1" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                             			<div class="row" style="width: 100%">  	
                                         	<div class="form-group col-lg-12" >
				                                 <label><spring:message code="EmployeeForm.address" /> </label>
				                                 
				                                 
				                                 <div class="row" >
				                                 	<div class="col-lg-6 col-md-4 col-sm-4 col-xs-4">
				                                 		<input type="text" class="form-control" name="doorNum" id="doorNum" value="${employee.doorNum}" required placeholder="<spring:message code="EmployeeForm.address.door" />" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
			                             		 	</div>
			                             			<div class="col-lg-6 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px">
			                                 			<input type="text" class="form-control" name="streetName" id="streetName" value="${employee.streetName}" required placeholder="<spring:message code="EmployeeForm.address.street" />" />
			                             			</div>
			                             		 </div>
			                             	</div>
                                      
                                   		</div>
                              <div class="row" style="width: 100%">  
                             			<div class="form-group col-lg-12">
			                                
			                                 <input type="text" onblur="criteriaSlashes(this)" class="form-control" name="jobLocation" id="jobLocation" value="${employee.jobLocation }" required placeholder="<spring:message code="EmployeeForm.address.area" />" />
			 
			                            </div>
                              </div> 
                              <div class="row" style="width: 100%">  
                             			 <div class="form-group col-lg-12">
			                                
			                                 <input type="text" class="form-control" onblur="criteriaSlashes(this)" required placeholder="<spring:message code="EmployeeForm.address.landmark" />" />
			 
			                             </div>
                              </div> 
                              
                              <div class="row" style="width: 100%">  
                             
                            
                                  <div class="form-group col-lg-12">
			                                 
			                                 <div class="row">
			                                 <div class="form-group col-lg-8">
			                                 <input type="text" onblur="criteria(this)" class="form-control" name="city" id="city" value="${employee.city}" required placeholder="<spring:message code="EmployeeForm.address.city" />" />
			                             </div>
			                             <div class="form-group col-lg-4" style="padding-left: 0px">
			                                 <input type="text" class="form-control" name="zipCode" id="zipCode" value="${employee.zipCode}" required placeholder="<spring:message code="EmployeeForm.address.pin" />" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" />
			                             </div>
			                             </div>
			                             </div>
                                      
                                </div>
                              
                              
                                         </div>
                                         <div class="form-group col-lg-9" style="width: 71%">
                                            <label><spring:message code="EmployeeForm.details" /></label>
                                            <textarea class="form-control" onblur="criteriaSlashes(this)" style="resize:auto;" rows="12" name="remarks" id="remarks"  >${employee.remarks}</textarea>
                                        </div>
                                     </div>
                                     
                                                 <input type="hidden" value="${searchName}" id="searchEmployeeMaster"/>
                                   <input type="hidden" name="searchCriteria" value="${searchName}"/>
                                    <input type="hidden"  value="${maxRecords}" id="maxRecords"/>
                                      <input type="hidden" name="maxRecords" value="${maxRecords}" /> 
                                     
                                     </div><!-- /.box-body -->
						<div class="row" style="text-align: center;">
						 <input type="button" style="" class="btnCls" onclick="validateEmployeeForm('new')" value="<spring:message code="submit.label" />" />
						  <c:if test="${sessionScope.role == 'super admin'}"> 
						  	<input type="button" class="btnCls buttonMargin"  onclick="viewEmployeeMaster('employeeMaster','0','');" value="<spring:message code="cancel.label" />" />
						  </c:if>
						 <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                             <c:if test="${accessControl.appDocument == 'EmployeeMaster' && accessControl.write == true && accessControl.read == true}">
								<input type="button" class="btnCls buttonMargin"  onclick="viewEmployeeMaster('employeeMaster','0','');" value="<spring:message code="cancel.label" />" />
							</c:if>
						</c:forEach>
						</div>
									<br/>
                                    <div class="box-footer"></div>
                                   
                       
                                </form>
                            </div>

</div>
</div>
</section>
</body>
</html>