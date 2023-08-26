<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * modified By				: Vinay
 * file name		        : admin/genericData/viewEmployee.jsp
 * file type		        : JSP
 * description				: The edit employee form is displayed using this jsp
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
	<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css"> --%>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script>
	  <script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
	  <script type="text/javascript" src="${pageContext.request.contextPath}/js/masterDataManagement/genericMasters/employeeMaster.js"></script>
	  
	
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

	
	  $("#employeeCode").keydown(function(){
		   $("#employeeCodeError").html("");
		   $(".Error").html("");
	 });
 	  $("#firstName").keydown(function(){
 		   $("#firstNameError").html("");
		   $("#Error").html("");
 	 });
 	 
 	 $("#doj").keydown(function(){
 		   $("#dojError").html("");
		   $("#Error").html("");
 	 }); 
 	 $("#designation").keydown(function(){
		   $("#designationError").html("");
		   $("#Error").html("");
	 });
 	 $("#department").keydown(function(){
 		   $("#departmentError").html("");
		   $("#Error").html("");
	 });
 	 $("#middleName").keydown(function(){
		   $("#Error").html("");
	 });
 	 $("#lastName").keydown(function(){
		   $("#Error").html("");
	 });
 	/*  $("#dob").keydown(function(){
		   $("#Error").html("");
	 }); */
 	 /* $("#highestQualification").keydown(function(){
		   $("#Error").html("");
	 });
 	 $("#yearsOfExp").keyup(function(){
		   $("#Error").html("");
	 }); */
 	 $("#remarks").keydown(function(){
		   $("#Error").html("");
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
	var phoneNo = $("#phonuNum").val();
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
<!-- Content Header (Page header) -->
<%-- <section class="content-header">
   <h1><spring:message code="generic.data.label" />
     <small><spring:message code="employee.master.label" /></small>
    </h1>
      <ol class="breadcrumb">
      	<li><a style="cursor: pointer;" onclick="return viewDashboard('admin');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><spring:message code="generic.data.label" /></li>
       </ol>
 </section> --%>

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
				<div class="box box-primary">
                                <div class="box-header" style="text-align: center">
                                <br/>
                                <h3>${employee.employeeCode} - <spring:message code="edit.employee.header.label" /></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form id="viewEmployee" method="post">
                                    <div class="box-body">
                                    <div id="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;">${err}</div>
									 
                                            <input type="hidden" class="form-control" name="employeeCode" id="employeeCode" readonly="readonly" value="${employee.employeeCode}"/>
                                       <div class="row">
                                   	       <div class="form-group col-lg-3">
                                            <label><spring:message code="enter.EmployeeForm.id" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" name="employeeCode" value="${employee.employeeCode}" readonly="readonly" id="employeeCode" style=" width: 80%"/>
                                          <span id="employeeCodeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                        <div class="form-group col-lg-9"></div>
                                        </div>
                                        <div class="row">
                                   		<div class="form-group col-lg-3">
                                            <label><spring:message code="EmployeeForm.firstName" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" name="firstName" value="${employee.firstName}" readonly="readonly" id="firstName" required placeholder="<spring:message code="enter.EmployeeForm.firstName" />" style=" width: 80%" />
                                       
                                        </div>
                                          <input type="hidden" id="employee_location" value="${selectedLocation}">
                                    	<div class="form-group col-lg-3">
                                            <label><spring:message code="EmployeeForm.serviceType" /></label>
	                                         	<select class="form-control" name="serviceType" id="serviceType" disabled="disabled" style=" width: 80%">
	                                            	<option value="Contract" ${'Contract' == employee.serviceType ? 'selected' : ''}><spring:message code="enter.EmployeeForm.contract" /></option>
	                                            	<option value="Permanent" ${'Permanent' == employee.serviceType ? 'selected' : ''}><spring:message code="enter.EmployeeForm.permanent" /></option>
	                                            </select>
                                        </div>
										<div class="form-group col-lg-3">
                                            <label><spring:message code="EmployeeForm.specializationType.primary" /></label>
                                         	<%-- <select class="form-control" name="primarySpecialization" id="primarySpecialization" disabled="disabled" style=" width: 80%">
                                             <c:forEach var="primarySpecialisation" items="${specialisationList}">
												<option value="${primarySpecialisation}" ${primarySpecialisation == selectedPrimarySpecialiasation ? 'selected' : ''}>${primarySpecialisation}</option>
											</c:forEach>
                                            </select> --%>
                                             <input type="text" class="form-control" name="primarySpecialization" id="primarySpecialization" value="${employee.primarySpecialization }" readonly="readonly" style="width:80%"/>
                                        </div>
                                        <div class="form-group col-lg-3">
                                            <label><spring:message code="EmployeeForm.location" /> <span style="color:red; font-size:2">*</span></label>
                                            <%-- <select class="form-control" name="location" id="location" disabled="disabled" style=" width: 80%">
                                             <c:forEach var="location" items="${workLocationsList}">
												<option value="${location}" ${location == selectedLocation ? 'selected' : ''}>${location}</option>
											</c:forEach>
                                           </select> --%>
                                           <input type="text" class="form-control" name="location" id="location" value="${employee.location }" readonly="readonly" style="width:80%"/>
                                           <span id="locationError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                        </div>
                                    	<div class="row">
                                        <div class="form-group col-lg-3">
                                            <label><spring:message code="EmployeeForm.middleName" /></label>
                                            <input type="text" class="form-control" name="middleName" value="${employee.middleName}" readonly="readonly"  id="middleName" required placeholder="<spring:message code="enter.EmployeeForm.middleName" />"  style=" width: 80%" />
                                        </div>
                                        <div class="form-group col-lg-2">
                                              <label><spring:message code="EmployeeForm.dob" /> </label>
                                            <input type="text" readonly="readonly" id="dob" required class="form-control calendar_icon"  placeholder="DD/MM/YYYY" value="${employee.dob}" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/>
                                            
      										 </div>
                                        <div class="form-group col-lg-1"></div>
                                        
			                                
                                        <div class="form-group col-lg-3">
                                            <label><spring:message code="EmployeeForm.specializationType.secondary" /></label>
                                         	<%-- <select class="form-control" name="secondarySpecialization" id="secondarySpecialization" disabled="disabled" style=" width: 80%">
                                            <c:forEach var="secondarySpecialisation" items="${specialisationList}">
												<option value="${secondarySpecialisation}" ${secondarySpecialisation == selectedSecondaryspecialisation ? 'selected' : ''}>${secondarySpecialisation}</option>
											</c:forEach>
                                            </select> --%>
                                            
                                             <input type="text" class="form-control" name="secondarySpecialization" id="secondarySpecialization" value="${employee.secondarySpecialization }" readonly="readonly" style="width:80%"/>
                                        </div>
                                        <div class="form-group col-lg-3">
                                            <label><spring:message code="EmployeeForm.designation" /> <!-- <span style="color:red; font-size:2">*</span> --></label>
                                            <input type="text" class="form-control" style="width:80%" name="designation" value="${employee.designation}" readonly="readonly"  id="designation" required placeholder="<spring:message code="enter.EmployeeForm.designation" />"  />
                                        	<!-- <span id="designationError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> -->
                                        </div>
      
								</div>
                                    	<div class="row">
                                     	<div class="form-group col-lg-3">
                                            <label><spring:message code="EmployeeForm.lastName" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" name="lastName" value="${employee.lastName}" readonly="readonly" id="lastName" required placeholder="<spring:message code="enter.EmployeeForm.lastName" />" style=" width: 80%"/>
                                            <span id="lastNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                      	<div class="form-group col-lg-2">
                                            <label><spring:message code="EmployeeForm.doj" /> <span style="color:red; font-size:2">*</span></label>
                                            <input class="form-control calendar_icon"  disabled="disabled" value="${employee.dateOfJoin}" id="doj" size="20" type="text" onclick="callCalender('doj')" onfocus="callCalender('doj')" placeholder="DD/MM/YYYY"/>                                          
                                        		<span id="dojError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                        <div class="form-group col-lg-1"></div>
                                       	<div class="form-group col-lg-2">
                                            <label><spring:message code="EmployeeForm.highestQualification" /> <!-- <span style="color:red; font-size:2">*</span> --></label>
                                            <input type="text" class="form-control" name="highestQualification" value="${employee.highestQualification}"  readonly="readonly" id="highestQualification" required placeholder="<spring:message code="enter.EmployeeForm.highestQualification" />" />
                                           <!--  <span id="highestQualificationError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> -->
                                        </div>
                                        <div class="form-group col-lg-1"></div>
                                        <div class="form-group col-lg-3">
                                            <label><spring:message code="EmployeeForm.department" /> <span style="color:red; font-size:2">*</span></label>
                                           
                                           <input type="text" readonly="readonly" class="form-control" name="department" id="department" required value="${employee.department}" placeholder="<spring:message code="enter.EmployeeForm.department" />" style="width:80%"/>
                                         	<span id="departmentError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                                              
								</div>
                                      
                                      	<div class="row">
                                       <div class="col-lg-2">
                        		       	 <label><spring:message code="EmployeeForm.status.label" /></label>
                        		        		<select name=status id="status" class="form-control" disabled="disabled">
			                        		        <option value="true"  ${employee.status == "true" ? 'selected' : ''} ><spring:message code="active.label" /></option>
			                        		        <option value="false" ${employee.status == "false" ? 'selected' : ''}><spring:message code="inActive.label" /></option>
                        		        		</select>
                        		        		
                        		       </div>
                        		       <div class="form-group col-lg-1"></div>
                                       <div class="col-lg-2">
                        		       		 <label><spring:message code="EmployeeForm.rating.label" /></label>
                        		       			 
                        		       			 <%-- <select name=ratig id="ratig" class="form-control"  disabled="disabled" style="width:80%">
                        		        		   <option value="1" ${employee.ratig == "1" ? 'selected' : ''} >1</option>
			                        		        <option value="2"  ${employee.ratig == "2" ? 'selected' : ''}>2</option>
			                        		         <option value="3"  ${employee.ratig == "3" ? 'selected' : ''}>3</option>
			                        		          <option value="4" ${employee.ratig == "4" ? 'selected' : ''} >4</option>
			                        		           <option value="5" ${employee.ratig == "5" ? 'selected' : ''} >5</option>
                        		        		 </select> --%>
                        		        		 <input type="text" class="form-control" name="ratig" id="ratig" value="${employee.ratig}" style="width:80%" readonly="readonly"/>
                        		       </div>
                        		       <div class="form-group col-lg-1"></div>
                                       <div class="form-group col-lg-2">
                                            <label><spring:message code="EmployeeForm.yearsOfExp" /> <!-- <span style="color:red; font-size:2">*</span> --></label>
                                            <input type="text" class="form-control" name="yearsOfExperience" value="${employee.yearsOfExperience}" id="yearsOfExp" readonly="readonly" maxlength="5" required oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.EmployeeForm.yearsOfExp" />" style="width:70%" />
                                           <!--  <span id="yearsOfExpError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> -->
                                       </div>
                                       <div class="form-group col-lg-1"></div>
                                       <div class="form-group col-lg-2">
                                             <label><spring:message code="EmployeeForm.reportingManager" /></label>
			                                  <input type="text" class="form-control searchItems" readonly="readonly" id="searchEmployee" value="${employee.reportingManager}" placeholder="<spring:message code="search.employee.label" />" />
											
											<input type="hidden" class="form-control" name="reportingManager" id="employeeId" value="${employee.reportingManager}"/>
		                             	<span id="repoManagerError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                            
                                        </div>
			                                </div>
			                                 <div class="row">
			                                
			                                <div class="form-group col-lg-2">
			                                 <label><spring:message code="EmployeeForm.overSeasExperience" /> </label>
			                                <input type="text" class="form-control" name="overSeasExperience" id="overSeasExperience" value="${employee.overSeasExperience }" readonly="readonly" placeholder="<spring:message code="enter.EmployeeForm.overSeasExperience" />" style="width:70%" />
			                                
			                                </div>
			                                <div class="form-group col-lg-1"></div>
			                                <div class="form-group col-lg-3">
			                                 <label><spring:message code="EmployeeForm.consultantType" /> </label>
			                                <input type="text" class="form-control" name="consultantType" id="consultantType" value="${employee.consultantType }" readonly="readonly"  style="width:80%"/>
			                                <!-- <select  class="form-control" name="consultantType" id="consultantType"  disabled="disabled"  style="width:80%">
			                                </select> -->
			                                </div>
			                                
			                                       </div>
                                
                                       <div class="row"><div class="form-group col-lg-12"></div></div>
                                <div class="row">
                                        <div class="form-group col-lg-3">
                                         	<div class="row" style="width: 100%">
                                         		<div class="form-group col-lg-12">
			                                 			<label><spring:message code="EmployeeForm.email" /> <span style="color:red; font-size:2">*</span></label>
			                                 			<input type="email" class="form-control" name="email" readonly="readonly" id="emailId" value="${employee.email}" required placeholder="<spring:message code="enter.EmployeeForm.email" />"/>
			                             				<span id="emailError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
			                             		</div>
                                        	</div>
                                         <div class="row" style="width: 85%">
                                  			<div class="col-lg-5 col-md-4 col-sm-4 col-xs-4">
                                  	<select style="padding: 6px 8px;" class="form-control" disabled="disabled" id="defaultCountry1" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
                                  		<option selected="selected">IN</option>
                                  		<option>US</option>
                                  		<option>GB</option>
                                  		<option>AU</option>
                                  	</select>
                                  </div>
                                  <div class="col-lg-7 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px">
                                  	<input type="text" class="form-control" placeholder="<spring:message code="supplier.enter.mobile.label" />"  readonly="readonly" id="phoneNumber1" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                  </div>
                                  <input type="hidden" class="form-control" name="phonuNum" id="phonuNum"  value="${employee.phonuNum }"/>
                                   <input type="hidden" id="output1" />
                             			</div>
                             			<div class="row" style="width: 100%">  	
                                         	<div class="form-group col-lg-12" >
				                                 <label><spring:message code="EmployeeForm.address" /> </label>
				                                 <div class="row" >
				                                 	<div class="col-lg-6 col-md-4 col-sm-4 col-xs-4">
				                                 		<input type="text" class="form-control"  readonly="readonly" name="doorNum" id="doorNum" value="${employee.doorNum}" required placeholder="<spring:message code="EmployeeForm.address.door" />" />
			                             		 	</div>
			                             			<div class="col-lg-6 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px">
			                                 			<input type="text" class="form-control"  readonly="readonly" name="streetName" id="streetName" value="${employee.streetName}" required placeholder="<spring:message code="EmployeeForm.address.street" />" />
			                             			</div>
			                             		 </div>
			                             	</div>
                                      
                                   		</div>
                              <div class="row" style="width: 100%">  
                             			<div class="form-group col-lg-12">
			                                
			                                 <input type="text" class="form-control" readonly="readonly" name="jobLocation" id="jobLocation" value="${employee.jobLocation }"  required placeholder="<spring:message code="EmployeeForm.address.area" />" />
			 
			                            </div>
                              </div> 
                              <div class="row" style="width: 100%">  
                             			 <div class="form-group col-lg-12">
			                                
			                                 <input type="text" class="form-control"  readonly="readonly"  required placeholder="<spring:message code="EmployeeForm.address.landmark" />" />
			 
			                             </div>
                              </div> 
                              
                              <div class="row" style="width: 100%">  
                             
                            
                                         <div class="form-group col-lg-12">
			                                 
			                                 <div class="row">
			                                 <div class="form-group col-lg-8">
			                                 <input type="text" class="form-control" readonly="readonly" name="city" id="city" value="${employee.city}" required placeholder="<spring:message code="EmployeeForm.address.city" />" />
			                             </div>
			                             <div class="form-group col-lg-4" style="padding-left: 0px">
			                                 <input type="text" class="form-control" readonly="readonly" name="zipCode" id="zipCode" value="${employee.zipCode}" required placeholder="<spring:message code="EmployeeForm.address.pin" />" />
			                             </div>
			                             </div>
			                             </div>
                                      
                                </div>
                              
                               <input type="hidden"   id="employeelocation"/>
                                         </div>
                                         <div class="form-group col-lg-9" style="width: 71%">
                                            <label><spring:message code="EmployeeForm.details" /></label>
                                            <textarea class="form-control"  readonly="readonly" style="resize:auto;" rows="12" name="remarks" id="remarks"  >${employee.remarks}</textarea>
                                        </div>
                                     </div>
                                     
                                    </div><!-- /.box-body -->
								
						<div class="row" style="text-align: center;">
						 <%-- <input type="button" class="btn bg-olive btn-inline" onclick="validateEmployeeForm('edit')" value="<spring:message code="save.label" />" /> --%>
						 <input type="button" class="btnCls"  onclick="viewEmployeeMaster('employeeMaster','0','<c:out value="${location}"/>');" value="<spring:message code="cancel.label" />" />
						</div>		
								
									        <input type="hidden" value="${searchName}" name="searchCriteria" id="searchEmployeeMaster"/>
                                    <input type="hidden" value="${maxRecords}" name="maxRecords" id="maxRecords"/>
						
									<br/>
                                    <div class="box-footer">
                                     
                                    </div>
                                </form> <!-- /.form end -->
                            </div>
                    
</div>
</div>
</section><!-- /.content -->
		<script type="text/javascript">
            $(function() {
                //Datemask dd/mm/yyyy
                $("#dob").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"}); 
                $("#doj").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
            });
            </script>

</body>
</html>