<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : admin/editUser.jsp
 * file type		        : JSP
 * description				: The edit user form is displayed using this jsp
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
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/controller.js"></script>
<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/validation.js"></script>
<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/userAccessControl/user.js"></script>
	<script src="${pageContext.request.contextPath}/js/demo-compiled.js"></script>
<style type="text/css">
	.col-xs-12 {
	 padding: 2% 10%;
	 }
</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#hidePassword").change(function(e){
		if(!$(this).prop("checked")){
			$("#password").attr("type","text");
		}
		else{
			$("#password").attr("type","password");
		}
	});
	var phoneNo = $("#contactOffice").val();
	phoneNo = phoneNo.split('-');
	if(phoneNo.length == 1)
		$("#phoneNumber").val(phoneNo[0]);
	else{
		$("#defaultCountry").val(phoneNo[0]);
		$("#phoneNumber").val(phoneNo[1]);
	}
	phoneNo = $("#contactPersonnel").val();
	phoneNo = phoneNo.split('-');
	if(phoneNo.length == 1)
		$("#phoneNumber1").val(phoneNo[0]);
	else{
		$("#defaultCountry1").val(phoneNo[0]);
		$("#phoneNumber1").val(phoneNo[1]);
	}
	var type = $("#type").val();
    $("#firstNameError").html("");
    $("#lastNameError").html("");
    $("#emailError").html("");
    $("#passError").html("");
    $("#contactOffError").html("");
    $("#contactPersError").html("");
    $("#firstName").focus();
    $("#email").blur(function(){
   	  var email = $("#email").val();
   	  if(email==""){
   		 return false;
   	  }
 	  if(!emailValidation(email)){
 	   	$("#emailError").html("Invalid EmailId (Ex:abc@gmail.com)");
 	   	return false;
 	  }
 	  else{
 		$("#emailError").html("");
	    return true;
 	  }
 	});  
 	   
 	$("#password").blur(function(){
 		var password = $("#password").val();
 		if(password==""){
      		 return false;
      	  }
 	  	if(!passwordValidation(password)){
 	  		$("#passError").html("Invalid Password (Ex:Tech123@)");
 	  		return false;
 	  	}
 	  	else{
	    	$("#passError").html("");
		    return true;
	    }
 	 });  
 	
 	  $("#email").keydown(function(){
 		   $("#emailError").html("");
		   $("#Error").html("");
 	 });
 	 
 	 $("#password").keydown(function(){
 		   $("#passError").html("");
		   $("#Error").html("");
 	 }); 

 	 $("#firstName").keydown(function(){
 		   $("#firstNameError").html("");
		   $("#Error").html("");
	 });
 	 $("#lastName").keydown(function(){
		   $("#lastNameError").html("");
		   $("#Error").html("");
	 });
 
 	$("#phoneNumber1").keydown(function(){
		 $("#error1").html("");
		 $("#Error").html("");
	 });
	 $("#defaultCountry1").keydown(function(){
		 $("#error1").html("");
		$("#Error").html("");
	 });
	$("#phoneNumber1").blur(function(){
		var phoneNumber = $("#phoneNumber1").val().trim();
		if(phoneNumber != ""){
			validatePhoneNumber1() ;
		}
	});
		$("#defaultCountry1").change(function(){
			$("#error1").html("");
			$("#Error").html("");
			var phoneNumber = $("#phoneNumber1").val().trim();
			if(phoneNumber != ""){
				validatePhoneNumber1() ;
			}
		});
		var roles = $("#rolenames").val();
		$("#roles").val(roles.split(','));
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

</script>
</head>
<body>
<!-- Content Header (Page header) -->
<%-- <section class="content-header">
   <h1>
     <spring:message code="users.label" />
     <small><spring:message code="edit.user.header" /></small>
    </h1>
      <ol class="breadcrumb">
      	<li><a style="cursor: pointer;" onclick="return viewDashboard('admin');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><a style="cursor: pointer;" onclick="showUsersFlow();"><spring:message code="users.label" /></a></li>
       </ol>
 </section> --%>

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
<div class="box box-primary" style="padding: ">
                          <div class="box-header" style="text-align: center">
                          <br/>
                          <h3><spring:message code="view.user.header" /></h3>
                          </div><!-- /.box-header -->
                          <!-- form start -->
                          <form>
                              <div class="box-body">
                              <div id="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;">${err}</div>
                         <div class="row">
                          <div class="col-md-8">
                           <div class="row">
                         	 <div class="form-group col-md-6">
                                 <label><spring:message code="user.name.label" /> <span style="color:red; font-size:2">*</span></label>
                                <%--  <input type="text" class="form-control" name="firstName" id="firstName" required placeholder="<spring:message code="search.employee.label" />" /> --%>
                                 <input type="text" class="form-control searchItems" readonly="readonly" id="searchEmployee" value="${userDetails.firstName} ${userDetails.lastName} - ${userDetails.employeeId}" placeholder="<spring:message code="search.employee.label" />" style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
									<div class=services>
								    		<div class="items">
								     			<ul class="matchedStringUl employee" style="width: 89%!important;padding: 0px!important;"></ul>
								   			</div>
										</div>
								
                             	<span id="firstNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                             </div>
                              <div class="form-group col-md-6">
                               <input type="hidden" class="form-control" name="employeeId" id="employeeId" value="${userDetails.employeeId}"/>
                               <input type="hidden" class="form-control" name="firstName" id="firstName" value="${userDetails.firstName}"/>
                               <input type="hidden" class="form-control" name="lastName" id="lastName" value="${userDetails.lastName}"/>
                                <%--  <label><spring:message code="EmployeeForm.lastName" /> <span style="color:red; font-size:2">*</span></label>
                                 <input type="text" class="form-control" name="lastName" id="lastName" required placeholder="<spring:message code="enter.EmployeeForm.lastName" />" />
                            		<span id="lastNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> --%>
                            	<label><spring:message code="EmployeeForm.workLocation" /></label>
                                 <!-- <input type="email" class="form-control" id="workLocation" placeholder="Select"> -->
                                 <select class="form-control" disabled="disabled" name="workLocation" id="workLocation">
                                  	<c:forEach var="location" items="${workLocationsList}">
										<option value="${location}"  ${location == userDetails.workLocation ? 'selected' : ''}>${location}</option>
									</c:forEach>
                                </select>
                             </div>
                             </div>
                             <div class="row">
                             	<div class="form-group col-md-6">
                                 <label><spring:message code="EmployeeForm.contactOffice" /> <span style="color:red; font-size:2">*</span></label>
                                 <div class="row">
                                  <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                  	<select class="form-control" id="defaultCountry" disabled="disabled" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
                                  		<option selected="selected">IN</option>
                                  		<option>US</option>
                                  		<option>GB</option>
                                  		<option>AU</option>
                                  	</select>
                                  </div>
                                  <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px">
                                  	<input type="text" class="form-control" readonly="readonly" placeholder="<spring:message code="enter.EmployeeForm.contactOffice" />" id="phoneNumber" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                  </div>
                                  <input type="hidden" class="form-control" name="contactOffice" id="contactOffice"  value="${userDetails.contactOffice}"/>
                                   <input type="hidden" id="output" />
                             </div>
                            <span id="error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                <%--  <input type="text" class="form-control" name="contactOffice" id="contactOffice" required placeholder="<spring:message code="enter.EmployeeForm.contactOffice" />" />
                             	<span id="contactOffError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> --%>
                             </div>
                             <div class="form-group col-md-6">
                                 <label><spring:message code="EmployeeForm.contactPersonnel" /> <span style="color:red; font-size:2">*</span></label>
                                 <div class="row">
                                  <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                  	<select class="form-control" id="defaultCountry1" disabled="disabled" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
                                  		<option selected="selected">IN</option>
                                  		<option>US</option>
                                  		<option>GB</option>
                                  		<option>AU</option>
                                  	</select>
                                  </div>
                                  <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px">
                                  	<input type="text" class="form-control" readonly="readonly" placeholder="<spring:message code="enter.EmployeeForm.contactPersonnel" />" id="phoneNumber1" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                                  </div>
                                  <input type="hidden" class="form-control" name="contactPersonnel" id="contactPersonnel"  value="${userDetails.contactPersonnel}"/>
                                   <input type="hidden" id="output1" />
                             </div>
                            <span id="error1" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                 <%-- <input type="text" class="form-control" name="contactPersonnel" id="contactPersonnel" required placeholder="<spring:message code="enter.EmployeeForm.contactPersonnel" />" />
                             	<span id="contactPersError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> --%>
                             </div>
                             </div>
                             </div>
                         	<div class="form-group col-md-4">
                                 <label><spring:message code="EmployeeForm.role" /></label>
                                 <select class="form-control" disabled="disabled" name="role" id="roles" multiple="multiple">
                                 	<c:forEach var="role" items="${roleList}">
										<option value="${role.roleName}">${role.roleName}</option>
									</c:forEach>
                                 	<%-- <option value="Admin"><spring:message code="admin.role.label" /></option>
                                 	<option value="Inventory Manager"><spring:message code="inventory.manager.role.label" /></option>
                                 	<option value="Outlet Manager"><spring:message code="outlet.manager.role.label" /></option>
                                 	<option value="Storekeeper"><spring:message code="store.keeper.role.label" /></option>
                                 	<option value="POS Executive"><spring:message code="pos.executive.role.label" /></option>
                                 	<option value="Store Manager"><spring:message code="store.manager.role.label" /></option>
                                 	<option value="Sales Executive"><spring:message code="sales.manager.role.label" /></option> --%>
                                 </select>
                                   <input type="hidden" class="form-control" name="rolenames" id="rolenames" value="${userDetails.role}"/>
                                 <span id="rolesError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                             </div>
                         </div>
                        <div class="row">
                         <div class="form-group col-lg-4">
                            <label><spring:message code="EmployeeForm.email" /> <span style="color:red; font-size:2">*</span></label>
                            <input type="email" class="form-control" readonly="readonly" name="email" id="email" readonly="readonly" required placeholder="<spring:message code="enter.EmployeeForm.email" />"  value="${userDetails.email}" />
                        	<span id="emailError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                        </div>
                        <div class="form-group col-lg-4">
                            <label><spring:message code="EmployeeForm.password" /> <span style="color:red; font-size:2">*</span> <span>&nbsp;&nbsp;&nbsp;<input style="vertical-align: -2px" type="checkbox" id="hidePassword" checked="checked"><spring:message code="hide.password" /></span></label>
                            <input type="password" class="form-control" readonly="readonly" name="password" id="password" required placeholder="<spring:message code="enter.EmployeeForm.password" />" value="${userDetails.password}" />
                       		<span id="passError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                        </div>
                       <div class="form-group col-lg-4">
                            <label><spring:message code="EmployeeForm.memberStatus" /></label>
                            <select class="form-control" id="status" disabled="disabled" name="accountStatus">
                            	<option value="active" ${'active' == userDetails.accountStatus ? 'selected' : ''}><spring:message code="enable.label" /></option>
                            	<option value="suspend" ${'suspend' == userDetails.accountStatus ? 'selected' : ''}><spring:message code="disable.label" /></option>
                            </select>
                        </div>
                        </div>
                    <input type="hidden" id="type" value="${type}" />
                     <input type="hidden" id="maxRecords" value="${maxRecords}" />
                        <input type="hidden" id="SkuMaster" value="" />
                        <input type="hidden" id="location" value="${userLocation}" />
                         <input type="hidden" id="rolesName" value="${roles}" />
                    </div><!-- /.box-body -->
			<div class="row" style="text-align: center;">
				<%-- <input type="button" class="btn bg-olive btn-inline" style="width:65px;" onclick="validateNewUserForm('edit')" value="<spring:message code="save.label" />" /> --%>
				<input type="button" class="btn bg-olive btn-inline" onclick="viewUserDetails('','0');" value="<spring:message code="cancel.label" />" />
			</div>
			<br/>
             <div class="box-footer">
             </div>
         </form>
     </div>

</div>
</div>
</section><!-- /.content -->
</body>
</html>