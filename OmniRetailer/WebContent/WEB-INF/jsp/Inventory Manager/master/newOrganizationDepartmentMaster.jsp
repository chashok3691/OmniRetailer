<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Vasudeva Reddy.G
 * file name		        : Inventory Manager/master/newOrganizationDepartment.jsp
 * file type		        : JSP
 * description				: The new Organization form is displayed using this jsp.
 * Reviewed by				: Surya.
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/masterDataManagement/genericMasters/organizationdepartmentMaster.js"></script>
	<%-- <script type= "text/javascript" src = "${pageContext.request.contextPath}/js/countries.js"></script> --%>
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
<style type="text/css">
	.col-xs-12 {
	 padding: 2% 25%;
	 }
	 .btnCls {
	 margin-left: -264px;
	 }
	 .row {
    margin-right: -125px;
    margin-left: -15px;
	}
	.form-control {
	width: 75%;
	margin-left: 50px;
	}
	label{
	margin-left: 50px;
	}
	input[type=reset], input[type=submit] {
	margin-top: 10px;
	}
	#orgdeptNameError,#orgdeptIDError,#orgdeptDescError,#orgdeptParentError,#orgdeptPhnError{
	margin-left: 50px;
	}
	#orgdeptEmailError{
	margin-left: 27px;
	}
</style>

<!--  added by        :  koti bomminei
      description     :  to ristrict the user from entering special characters     -->

	
	 


</head>
<body>
<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
	<div class="box box-primary">
		<div class="box-header" style="text-align: center">
             <h3><spring:message code="new.organizationdepartment.master.label" /></h3>
        </div>
		 <form id="newOrganizationDepartment">
            <div class="box-body">
            	<div class="row">
	              <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px;margin-left: -120px;">${err}</div>
	        	  <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px;margin-left: -120px;">${success}</div>
	            </div>
	            <div class="row">
	            	<div class=" col-md-12"> 
	            		 <div class="row">
		                   <div class="form-group col-md-4">
		                   	<label><spring:message code="organizationdepartment.id.label" /> <span style="color:red; font-size:2">*</span></label>
		                    <input type="text" onblur="criteria(this)" class="form-control"  id="orgdeptId" value="${orgdeptDetails.deptId}" placeholder="<spring:message code="enter.organizationdepartment.id.label" />" />
		                    <span id="orgdeptIDError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						   </div>
						   <div class="form-group col-md-4">
		                   	<label><spring:message code="organizationdepartment.name.label" /><span style="color:red; font-size:2">*</span></label>
		                    <input type="text" onblur="criteria(this)" class="form-control"  id="orgdeptName" value="${orgdeptDetails.deptName}" placeholder="<spring:message code="enter.organizationdepartment.name.label" />" />
		                    <span id="orgdeptNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						   </div>
						 </div>
						 <div class="row">
		                   <div class="form-group col-md-4">
		                   	<label><spring:message code="organizationdepartment.description.label" /> <span style="color:red; font-size:2">*</span></label>
		                    <input type="text" class="form-control" onblur="criteria(this)"  id="orgdeptDescription" value="${orgdeptDetails.deptDescription}" placeholder="<spring:message code="enter.organizationdepartment.description.label" />" />
		                    <span id="orgdeptDescError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						   </div>
						   <div class="form-group col-md-4">
		                   	<label><spring:message code="organizationdepartment.parentdepartment.label" /></label>
		                    <input type="text" onblur="criteria(this)" class="form-control"  id="orgdeptParent" value="${orgdeptDetails.parentDept}" placeholder="<spring:message code="enter.organizationdepartment.parentdepartment.label" />" />
		                    <span id="orgdeptParentError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						   </div>
						 </div>
						 <div class="row">
		                   <div class="form-group col-md-4">
		                   	<label><spring:message code="organizationdepartment.email.label" /> <span style="color:red; font-size:2">*</span></label>
		                    <input type="email" class="form-control"  id="orgdeptEmail" value="${orgdeptDetails.deptEmail}" placeholder="<spring:message code="enter.organizationdepartment.email.label" />" />
		                    <span id="orgdeptEmailError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						   </div>
						   <div class="form-group col-md-4">
		                   	<label><spring:message code="organizationdepartment.phonenumber.label" /> <span style="color:red; font-size:2">*</span></label>
		                    <input type="text" class="form-control"  id="orgdeptPhonenum" value="${orgdepartment.deptPhnNo}" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"  placeholder="<spring:message code="enter.organizationdepartment.phonenumber.label" />" />
		                    <span id="orgdeptPhnError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						   </div>
						 </div>
						
		<div class="row">
       	  <div class="col-lg-12" style="text-align: center;">
           	<div class="buttons">
       		 	  <input type="button" class="btnCls buttonMargin" onclick="return viewOrganizationDepartmentMaster('organizationdepartmentMaster','0');" value="<spring:message code="cancel.label" />" />
       		 		<%-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="viewDepartmentMaster('departmentMaster','0');" class="button"><font size="2px">&nbsp;&nbsp;<spring:message code="cancel.label" />&nbsp;&nbsp;</font></a> --%>
       		 		<input type="button" style="" class="btnCls" onclick="validateOrganizationDepartment('new');" value="<spring:message code="submit.label" />" />       		  
         	</div>
        </div>
      </div>
      </div>
      </div>		
      <br>
      </div>
      
      
      <input type="hidden" value="${maxRecords}" id="maxRecords"/>
         <input type="hidden" value="${searchName}" id="searchDepartment"/>

   </form>
	</div>
  </div>
 </div>
</section><!-- /.content -->
<script>

$(document).ready(function(){
$("#orgdeptId").keydown(function(){
	   $("#orgdeptIDError").html("");
	   $(".Error").html("");
});
$("#orgdeptName").keydown(function(){
	   $("#orgdeptNameError").html("");
	   $(".Error").html("");
});
$("#orgdeptDescription").keydown(function(){
	   $("#orgdeptDescError").html("");
	   $(".Error").html("");
});
$("#orgdeptParent").keydown(function(){
	   $("#orgdeptParentError").html("");
	   $(".Error").html("");
});
$("#orgdeptEmail").keydown(function(){
	   $("#orgdeptEmailError").html("");
	   $(".Error").html("");
});
$("#orgdeptPhonenum").keydown(function(){
	   $("#orgdeptPhnError").html("");
	   $(".Error").html("");
});
});

</script>

</body>
</html>