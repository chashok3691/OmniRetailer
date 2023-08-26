<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Vasudeva Reddy.G
 * file name		        : Inventory Manager/master/viewOrganizationDepartment.jsp
 * file type		        : JSP
 * description				: The view Organization form is displayed using this jsp.
 * Reviewed by				: Surya
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
		 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/department.js"></script>
	<script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
	<script src="${pageContext.request.contextPath}/js/controller.js"></script>
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
</style>
</head>
<body>
<section class="content">
<div class="row">
  <div class="col-xs-12">
	<div class="box box-primary">
		<div class="box-header" style="text-align: center">
             <h3><spring:message code="organizationdepartment.master.label" /></h3>
        </div>
		 <form id="viewOrganizationDepartment">
            <div class="box-body">
            	<div class="row">
	              <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
	              
	            </div>
	           <div class="row">
	            	<div class=" col-md-12"> 
	            		 <div class="row">
		                   <div class="form-group col-md-4">
		                   	<label><spring:message code="organizationdepartment.id.label" /> <span style="color:red; font-size:2">*</span></label>
		                    <input type="text" class="form-control"  id="orgdeptId" value="${orgdepartment.deptId}" placeholder="<spring:message code="enter.organizationdepartment.id.label" />" readonly/>
		                    <span id="orgdeptIDError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						   </div>
						   <div class="form-group col-md-4">
		                   	<label><spring:message code="organizationdepartment.name.label" /><span style="color:red; font-size:2">*</span></label>
		                    <input type="text" class="form-control"  id="orgdeptName" value="${orgdepartment.deptName}" placeholder="<spring:message code="enter.organizationdepartment.name.label" />" readonly/>
		                    <span id="orgdeptNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						   </div>
						 </div>
						 <div class="row">
		                   <div class="form-group col-md-4">
		                   	<label><spring:message code="organizationdepartment.description.label" /> <span style="color:red; font-size:2">*</span></label>
		                    <input type="text" class="form-control"  id="orgdeptDescription" value="${orgdepartment.deptDescription}" placeholder="<spring:message code="enter.organizationdepartment.description.label" />"readonly />
		                    <span id="orgdeptDescError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						   </div>
						   <div class="form-group col-md-4">
		                   	<label><spring:message code="organizationdepartment.parentdepartment.label" /></label>
		                    <input type="text" class="form-control"  id="orgdeptParent" value="${orgdepartment.parentDept}" placeholder="<spring:message code="enter.organizationdepartment.parentdepartment.label" />" readonly/>
		                    <span id="orgdeptParentError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						   </div>
						 </div>
						 <div class="row">
		                   <div class="form-group col-md-4">
		                   	<label><spring:message code="organizationdepartment.email.label" /> <span style="color:red; font-size:2">*</span></label>
		                    <input type="email" class="form-control"  id="orgdeptEmail" value="${orgdepartment.deptEmail}" placeholder="<spring:message code="enter.organizationdepartment.email.label" />" readonly/>
		                    <span id="orgdeptEmailError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						   </div>
						   <div class="form-group col-md-4">
		                   	<label><spring:message code="organizationdepartment.phonenumber.label" /><span style="color:red; font-size:2">*</span></label>
		                    <input type="tel" class="form-control"  id="orgdeptPhonenum" value="${orgdepartment.deptPhnNo}" placeholder="<spring:message code="enter.organizationdepartment.phonenumber.label" />" readonly/>
		                    <span id="orgdeptPhnError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
						   </div>
						 </div>
		<div class="row">
       	  <div class="col-lg-12" style="text-align: center;">
           	<div class="buttons">
       		 <%-- <a onclick="validateDepartment('edit');" class="button"><font size="2px">&nbsp;&nbsp;&nbsp;<spring:message code="save.label" />&nbsp;&nbsp;&nbsp;</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --%>
       		 <input type="button" class="btnCls" onclick="viewOrganizationDepartmentMaster('organizationdepartmentMaster','0');" value="<spring:message code="cancel.label" />" />
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
</section>
</body>
</html>