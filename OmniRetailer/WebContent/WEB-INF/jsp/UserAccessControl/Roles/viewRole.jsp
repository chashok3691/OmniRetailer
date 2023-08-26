<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : admin/viewRole.jsp
 * file type		        : JSP
 * description				: The new role form is displayed using this jsp
 * modificationsBy			: Vijay
 * modiFicationDescriptions	: Vijay : added 'ccto' access permissions  
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<%-- <script src="${pageContext.request.contextPath}/js/form_plugin.js"></script> --%>
<%-- 	<script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script> --%>
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
	<script src="${pageContext.request.contextPath}/js/userAccessControl/role.js"></script>
	<style type="text/css">
	.activeDiv{
	  font-weight: bold;
	  color: #666;
	}
	.activeSubDiv{
	  font-weight: bold;
	   color: #666;
	}
	.activeSubChildDiv{
	  font-weight: bold;
	   color: #666;
	}
	.activeSubChildActivitiesDiv{
	  font-weight: bold;
	   color: #666;
	}
	.activBlock{
	  display: block!important;
	}
	.inactiveBlock{
	  display: none;
	}
	.activSubBlock{
	  display: block!important;
	}
	.inactiveSubBlock{
	  display: none;
	}
	.activSubChildBlock{
	  display: block!important;
	}
	.inactiveSubChildBlock{
	  display: none;
	}
	.activSubChildActivities{
	  display: block!important;
	}
	.inactiveSubChildActivities{
	  display: none;
	}
	
	.divbg{
		padding-top: 2px;
		padding-bottom: 4px;
		background-color: rgb(240,240,240);
		margin-left: 2px;
		margin-right: 2px;
	/* 	border: 1px solid #CCC; */
	}
	
	.divsubbg{
      padding-top: 0px;
    padding-bottom: 0px;
    margin-left: 2px;
    margin-right: 2px;
    margin-top: -5px;
	/* 	border: 1px solid #CCC; */
	
	}
	.divsubchildbg{
		padding-top: 2px;
		padding-bottom: 2px;
		//background-color: rgb(240,240,240);
		margin-left: 2px;
		margin-right: 2px;
	/* 	border: 1px solid #CCC; */
	}
	.divsubchildactivitiesbg{
		padding-top: 2px;
		padding-bottom: 2px;
		//background-color: rgb(240,240,240);
		margin-left: 2px;
		margin-right: 2px;
	/* 	border: 1px solid #CCC; */
	}
	
	</style>
	<script type="text/javascript">
	$(document).ready(function(){
		$("#storeAppFlow").hide();
		$("#consoleFlow").hide();
		$("#warehouseAppFlow").hide();
		var accessControlList = $("#accessControl").val();
		checkSelected(accessControlList);
		var activitiesStr = $("#activitiesStr").val();
		selectActivities(activitiesStr);
	
		
		
 		var consoleLocations = $("#consoleLocations").val().replace('[','').replace(']','').replace(/, /g,',').replace(/ ,/g,',');
 		consoleLocations= consoleLocations.replace(/['"]+/g, '')
 		
 		var wareHouseLocations = $("#wareHouseLocations").val().replace('[','').replace(']','').replace(/, /g,',').replace(/ ,/g,',');
 		wareHouseLocations = wareHouseLocations.replace(/['"]+/g, '')
 		
 		var outletLocations = $("#outletLocations").val().replace('[','').replace(']','').replace(/, /g,',').replace(/ ,/g,',');
		outletLocations = outletLocations.replace(/['"]+/g, '')
		
 		$("#storeLocation").val(outletLocations.split(','));
		$("#warehouseLocation").val(wareHouseLocations.split(',')); 
		$("#consoleLocation").val(consoleLocations.split(',')); 
		
		$('input[type="checkbox"]').prop("disabled", true);
		$('select[multiple]').attr("disabled", "disabled");
	/* 	var result = $("#right-side").height();
		$("#main-menu").css("height",result+"px"); */
	});
		
	</script>
	<script type="text/javascript">
    /*   $(function() {
          //Datemask dd/mm/yyyy
          $("#validDate").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
      }); */
      </script>
	<!-- <script type="text/javascript">
      $(function() {
          //Datemask dd/mm/yyyy
          $("#validDate").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
      });
      </script> -->
</head>
<body>
<!-- Content Header (Page header) -->
<%-- <section class="content-header">
   <h1><spring:message code="roles.label" />
     <small><spring:message code="edit.role.label" /></small>
    </h1>
      <ol class="breadcrumb">
      	<li><a style="cursor: pointer;" onclick="return viewDashboard('admin');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><spring:message code="roles.label" /></li>
       </ol>
 </section> --%>

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
		<div class="box box-primary">
           <div class="box-header" style="text-align: center;padding: 0px;margin-top: -20px;">
           <br/>
           <h3>${role.roleName} - <spring:message code="po.details.label" /> </h3>
           </div><!-- /.box-header -->
           <!-- form start -->
           <form id="newUser" method="post">
               <div class="box-body">
              	<div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -10px">${err}</div>
	        	<div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -10px">${success}</div>
               	 <div class="row">
                   	 <div class="form-group col-lg-3">
                           <label><spring:message code="role.name.label" /> <span style="color:red; font-size:2">*</span></label>
                           <input type="text" class="form-control" name="roleName" readonly="readonly" id="roleName" value="${role.roleName}" required />
                       	   <span id="roleNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                       </div>
                       <div class="form-group col-lg-3">
                           <label><spring:message code="created.by.label" /> <span style="color:red; font-size:2">*</span></label>
                           <input type="text" class="form-control" name="createdBy" id="createdBy" value="${role.createdBy}" required readonly="readonly"/>
                       </div>
                       <div class="form-group col-lg-3">
                           <label><spring:message code="valid.date.label" /></label>
                          <!--  <div class="input-group">
                               <div class="input-group-addon">
                                   <i class="fa fa-calendar"></i>
                               </div> -->
                                <input class="form-control calendar_icon" readonly="readonly" value="${role.validDate}" style="background-color: white;" name="validDate" id="validDate" size="20" type="text"  placeholder="DD/MM/YYYY"/>
                               <%-- <input type="text" name="validDate" id="validDate" value="${role.validDate}" required class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/> --%>
                           <!-- </div> --><!-- /.input group -->
                       	   <span id="validDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                       </div>
                       <div class="form-group col-lg-3">
                           <label><spring:message code="status.label" /> <span style="color:red; font-size:2">*</span></label>
                      	   <select class="form-control" name="roleStatus" id="roleStatus" disabled>
	                           	<option value="Active" ${'Active' == role.roleStatus ? 'selected' : ''}><spring:message code="active.label" /></option>
	                           	<option value="Disabled" ${'Disabled' == role.roleStatus ? 'selected' : ''}><spring:message code="disabled.label" /></option>
	                       </select>
	                       <input type="hidden" id="accessControl" value='${accessControlList}'/>
	                       <input type="hidden" id="activitiesStr" value='${role.activitiesStr}'/>
                       </div>
                       </div>
                       <div class="row">
                        <div class="form-group col-lg-12">
                           <label><spring:message code="role.description" /></label>
                           <textarea rows="1" cols="" class="form-control" style="resize:none" readonly="readonly" name="roleDescription" id="roleDescription" required placeholder="<spring:message code="enter.roleDescription.label" />" >${role.roleDescription}</textarea>
                      	   <span id="roleDescriptionError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                       </div>
                   </div>
                   <br>
                   <div class="row" >
                    <div class="form-group col-lg-12"  >
                    <div class="form-group col-lg-2" style="padding-left: 1px;padding-right: 1px;margin-top: 8px;cursor: pointer;margin-bottom: 0px;" onclick="activateHeader('console');" ><label style="font-weight: bold;font-size: 16px;color:#666;cursor: pointer;"><spring:message code="cloud.permissions.label" /> </label></div>
                    <div class="form-group col-lg-10" style="background-color: rgb(195,195,195);margin-bottom: 4px;">
                    	<span>It helps you to delegate administration and other business operations to executives. Please note CLOUD CONSOLE is the single point of access by using which you can control your entire retail business
                    	<img style="float: right;height: 60px;cursor: pointer;margin-right: -34px;margin-top: -24px;margin-bottom: -26px" onclick="activateHeader('console');" id="consoleImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIcon.png">
                    	</span></div>
                    <hr style="margin-top: 44px;width: 100%;border-top: 1px solid rgb(181,230,29);" />
                    <hr style="margin-top: -18px;width: 100%;border-top: 1px solid rgb(181,230,29);" />
                    </div>
                   </div>
				
				<div class="row" id="consoleFlow" >
                 <div class="col-lg-6" style="padding:0px;">
                   	<div class="form-group col-lg-12" id="consoleAdminFlow" >
                   		<div style = "margin-top: -20px !important;"><label style="font-size: 17px;color: #666"><spring:message code="admin.operations.label"/></label></div>
                   		  <hr style="margin-top: 4px;width: 99%;border-top: 1px solid rgb(181,230,29);" />
                   		  <div id="UserAccessControlId" class="row divbg" style="margin-top: 10px;">
                            <span  onclick="activate('UserAccessControl');" class="col-lg-6" style="cursor: pointer;font-size: 15px;">
                            	<spring:message code="user.access.control.label" />
                            </span>
                            <span id="UserAccessControlCheck" class="col-lg-2" style="padding: 0px">
                            	<input type="checkbox" style="vertical-align: -2px" name="consoleRead" value="UserAccessControl" onclick="selectAll('UserAccessControlRead')" id="UserAccessControlRead"/>Read
                            </span>
                            <span class="col-lg-2" style="padding: 0px">
                            	<input type="checkbox" style="vertical-align: -2px" name="consoleWrite" onclick="selectAll('UserAccessControlWrite')" id="UserAccessControlWrite"/>Write
<%--                             	<img style="float: right;height: 20px;cursor: pointer;" id="UserAccessControlImg" onclick="activate('UserAccessControl');" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                            </span>
                            <span class="col-lg-2" style="padding: 0px">
                            	<input type="checkbox" style="vertical-align: -2px" name="consoleCCTo" onclick="selectAll('UserAccessControlCCTo')" id="UserAccessControlCCTo"/>CC To
                            	<img style="float: right;height: 20px;cursor: pointer;" id="UserAccessControlImg" onclick="activate('UserAccessControl');" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                            </span>
                            
                        </div>
                         <div id="UserAccessControlFlow" style="color:#666;background-color:rgb(240,240,240);margin-left: 2px;margin-right: 2px; " class="inactiveBlock">
                            	   <br>
                            	   <div class="row divsubbg" style="border: none">
	                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                                  	<spring:message code="roles.management.label" />
	                                  </span>
	                                  <span id="RolesManagementCheck" class="col-lg-2" style="padding: 0px">
	                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="Counter Master" name="UserAccessControlRead" id="RolesManagementRead"/>Read
	                                  </span>
	                                  <span class="col-lg-2" style="padding: 0px">
	                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="UserAccessControlWrite"  id="RolesManagementWrite"/>Write
	                                  </span>
	                                  <span class="col-lg-2" style="padding: 0px">
	                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="UserAccessControlCCTo"  id="RolesManagementCCTo"/>CC To
	                                  </span>
	                               </div> 
	                              <br>
	                               <div class="row divsubbg" style="border: none">
	                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                                  	<spring:message code="user.management.label" />
	                                  </span>
	                                  <span id="UserManagementCheck" class="col-lg-2" style="padding: 0px">
	                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="Currency Master" name="UserAccessControlRead" id="UserManagementRead"/>Read
	                                  </span>
	                                  <span class="col-lg-2" style="padding: 0px">
	                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="UserAccessControlWrite"  id="UserManagementWrite"/>Write
	                                  </span>
	                                  <span class="col-lg-2" style="padding: 0px">
	                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="UserAccessControlCCTo"  id="UserManagementCCTo"/>CC To
	                                  </span>
	                               </div>
	                       </div>
	                                    <br>
	                   	<div id="DataManagementId" class="row divbg">
                            <span  onclick="activate('DataManagement');" class="col-lg-6" style="cursor: pointer;font-size: 15px;">
                            	<spring:message code="data.management.label" />
                            </span>
                            <span id="DataManagementCheck" class="col-lg-2" style="padding: 0px">
                            	<input type="checkbox" style="vertical-align: -2px" name="consoleRead" value="DataManagement" onclick="selectAll('DataManagementRead')" id="DataManagementRead"/>Read
                            </span>
                            <span class="col-lg-2" style="padding: 0px">
                            	<input type="checkbox" style="vertical-align: -2px" name="consoleWrite" onclick="selectAll('DataManagementWrite')" id="DataManagementWrite"/>Write
<%--                             	<img style="float: right;height: 20px;cursor: pointer;" id="DataManagementImg" onclick="activate('DataManagement');" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                            </span>
                               <span class="col-lg-2" style="padding: 0px">
                            	<input type="checkbox" style="vertical-align: -2px" name="consoleCCTo" onclick="selectAll('DataManagementCCTo')" id="DataManagementCCTo"/>CC To
                            	<img style="float: right;height: 20px;cursor: pointer;" id="DataManagementImg" onclick="activate('DataManagement');" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                            </span>
                        </div>
                       
                            <div id="DataManagementFlow" style="color:#666;background-color:rgb(240,240,240);margin-left: 2px;margin-right: 2px; " class="inactiveBlock">
                            <br>
                              <div class="row divsubbg" style="border: none">
	                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                                  	<spring:message code="batchOperations.label" />
	                                  </span>
	                                  <span id="BatchOperationsCheck" class="col-lg-2" style="padding: 0px">
	                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="BatchOperations" name="DataManagementRead" id="BatchOperationsRead"/>Read
	                                  </span>
	                                  <span class="col-lg-2" style="padding: 0px">
	                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="DataManagementWrite"  id="BatchOperationsWrite"/>Write
	                                  </span>
	                                  <span class="col-lg-2" style="padding: 0px">
	                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="DataManagementCCTo"  id="BatchOperationsCCTo"/>CC To
	                                  </span>
	                               </div> 
                            	<br>
                            	    <div id="ImportId" class="row divsubbg" style="border: none">
	                                  <span onclick="activateSubFlow('Import');"  class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                                  	<spring:message code="import.label" />
	                                  </span>
	                                  <span id="ImportCheck" class="col-lg-2" style="padding: 0px">
	                                  	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('ImportRead')"  name="DataManagementRead" id="ImportRead"/>Read
	                                  </span>
	                                  <span class="col-lg-2" style="padding: 0px">
	                                  	<input type="checkbox" style="vertical-align: -2px"  onclick="selectAll('ImportWrite')" name="DataManagementWrite"  id="ImportWrite"/>Write
	                                  
	                                  </span>
	                                <span class="col-lg-2" style="padding: 0px">
	                                  	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('ImportCCTo')" name="DataManagementCCTo"  id="ImportCCTo"/>CC To
	                                  	<img style="float: right;height: 20px;cursor: pointer;"  onclick="activateSubFlow('Import');" id="ImportImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
	                                  </span>
	                               
	                               </div> 
	                              <br>
	                               <div style="margin-left: 0%">
		                            <div id="ImportFlow" style="font-size: 12px" class="inactiveSubBlock">
			                             
			                               <div class="row divsubbg" style="border: none">
			                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
			                                  	<spring:message code="generics.data.label" />
			                                  </span>
			                                  <span id="GenricMaster" class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="GenricMaster" name="ImportRead" id="GenricImportsRead"/>Read 
			                                  </span>
			                                  <span class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="ImportWrite"  id="GenricImportsWrite"/>Write
			                                  </span>
			                                   <span class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="ImportCCTo"  id="GenricImportsCCTo"/>CC To
			                                  </span>
			                               </div>
			                               <br>
			                                <div class="row divsubbg" style="border: none">
			                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
			                                  	<spring:message code="outlet.imports.label" />
			                                  </span>
			                                  <span id="OuletImports" class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="OuletImports" name="ImportRead" id="OuletImportsRead"/>Read
			                                  </span>
			                                  <span class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="ImportWrite"  id="OuletImportsWrite"/>Write
			                                  </span>
			                                    <span class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="ImportCCTo"  id="OuletImportsCCTo"/>CC To
			                                  </span>
			                               </div>
			                               <br>
			                                <div class="row divsubbg" style="border: none">
			                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
			                                  	<spring:message code="warehouse.imports.label" />
			                                  </span>
			                                  <span id="WarehouseImports" class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="WarehouseImports" name="ImportRead" id="WarehouseImportsRead"/>Read
			                                  </span>
			                                  <span class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="ImportWrite"  id="WarehouseImportsWrite"/>Write
			                                  </span>
			                                       <span class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="ImportCCTo"  id="WarehouseImportsCCTo"/>CC To
			                                  </span>
			                               </div>
			                            <br>
			                               </div>
			                               </div>
	                              
	                          
	                            
	                              
	                                <div id="ExportId" class="row divsubbg" style="border: none">
	                                  <span onclick="activateSubFlow('Export');"  class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                                  	<spring:message code="export.label" />
	                                  </span>
	                                  <span id="ExportCheck" class="col-lg-2" style="padding: 0px">
	                                  	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('ExportRead')"  value="Export" name="DataManagementRead" id="ExportRead"/>Read
	                                  </span>
	                                  <span class="col-lg-2" style="padding: 0px">
	                                  	
	                                  </span>
	                                  
	                                     <span class="col-lg-2" style="padding: 0px">
	                                  	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('ExportCCTo')"  name="DataManagementCCTo" id="ExportCCTo"/>CC To
	                                  	 <img style="float: right;height: 20px;cursor: pointer;"  onclick="activateSubFlow('Export');" id="ExportImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
	                                  </span>
	                               </div>
	                               <br>
			                       <div style="margin-left: 0%">
		                            <div id="ExportFlow" style="font-size: 12px" class="inactiveSubBlock">
			                               <div class="row divsubbg" style="border: none">
			                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
			                                  	<spring:message code="generics.data.label" />
			                                  </span>
			                                  <span id="GenricMaster" class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="GenricMaster" name="ExportRead" id="GenricMasterRead"/>Read
			                                  </span>
			                                    <span  class="col-lg-2" style="padding: 0px">   </span>
			                                   <span class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)"  name="ExportCCTo" id="GenricMasterCCTo"/>CC To
			                                  </span>
			                                
			                               </div>
			                               <br>
			                                <div class="row divsubbg" style="border: none">
			                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
			                                  	<spring:message code="outlet.exports.label" />
			                                  </span>
			                                  <span id="OuletExports" class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="OuletExports" name="ExportRead" id="OuletExportsRead"/>Read
			                                  </span>
			                                  <span  class="col-lg-2" style="padding: 0px">   </span>
			                                  <span id="" class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)"  name="ExportCCTo" id="OuletExportsCCTo"/>CC To
			                                  </span>
			                               </div>
			                               <br>
			                                <div class="row divsubbg" style="border: none">
			                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
			                                  	<spring:message code="warehouse.exports.label" />
			                                  </span>
			                                  <span id="WarehouseExports" class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="WarehouseExports" name="ExportRead" id="WarehouseExportsRead"/>Read
			                                  </span>
			                               	<span  class="col-lg-2" style="padding: 0px">   </span>
			                                 <span id="" class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="" name="ExportCCTo" id="WarehouseExportsCCTo"/>CC To
			                                  </span>
			                               </div>
			                              <br>
			                               </div>
			                               </div>
	                              
	                               
	                               <div class="row divsubbg" style="border: none">  
	                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                                  	<spring:message code="backup.operations.label" />
	                                  </span>
	                                  <span id="BackupOperationsCheck" class="col-lg-2" style="padding: 0px">
	                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="BackupOperations" name="DataManagementRead" id="BackupOperationsRead"/>Read
	                                  </span>
	                                 <span class="col-lg-2" style="padding: 0px">
<!-- 	                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="DataManagementWrite"  id="BackupOperationsWrite"/>Write -->
	                                  </span>
	                                   <span  class="col-lg-2" style="padding: 0px">
	                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="BackupOperations" name="DataManagementCCTo" id="BackupOperationsCCTo"/>CC To
	                                  </span>
	                               </div>
	                              <br>
	                              <div class="row divsubbg" style="border: none">
			                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
			                                  	Integration Monitoring
			                                  </span>
			                                  <span id="IntegrationMonitoringCheck" class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="IntegrationMonitoring" name="DataManagementRead" id="IntegrationMonitoringRead"/>Read
			                                  </span>
			                                  <span class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="IntegrationMonitoring" name="DataManagementWrite"  id="IntegrationMonitoringWrite"/>Write
			                                  </span>
			                                       <span class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="IntegrationMonitoring" name="DataManagementCCTo"  id="IntegrationMonitoringCCTo"/>CC To
			                                  </span>
			                               </div>
			                            <br>
	                                <div class="row divsubbg" style="border: none">
	                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                                  	<spring:message code="recovery.operations.label" />
	                                  </span>
	                                  <span id="RecoveryOperationsCheck" class="col-lg-2" style="padding: 0px">
	                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="RecoveryOperations" name="DataManagementRead" id="RecoveryOperationsRead"/>Read
	                                  </span>
	                                  <span class="col-lg-2" style="padding: 0px">
	                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="DataManagementWrite"  id="RecoveryOperationsWrite"/>Write
	                                  </span>
	                                    <span class="col-lg-2" style="padding: 0px">
	                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="DataManagementCCTo"  id="RecoveryOperationsCCTo"/>CC To
	                                  </span>
	                               </div>
	                           </div>
                         <br>
                         
                         
                          <div id="MasterDataManagementId" class="row divbg">
                             <span class="col-lg-6"  onclick="activate('MasterDataManagement');" style="font-size: 15px;cursor: pointer;">
                             	<spring:message code="master.data.management.label" />
                             </span>
                             <span id="MasterDataManagementCheck" class="col-lg-2" style="padding: 0px">
                              	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('MasterDataManagementRead')" name="consoleRead" id="MasterDataManagementRead"/>Read
                             </span>
                             <span  class="col-lg-2" style="padding: 0px">
                              	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('MasterDataManagementWrite')" name="consoleWrite" id="MasterDataManagementWrite"/>Write
<%--                               	<img style="float: right;height: 20px;cursor: pointer;"  onclick="activate('MasterDataManagement');" id="MasterDataManagementImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                             </span>
                               <span  class="col-lg-2" style="padding: 0px">
                              	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('MasterDataManagementCCTo')" name="consoleCCTo" id="MasterDataManagementCCTo"/>CC To
                              	<img style="float: right;height: 20px;cursor: pointer;"  onclick="activate('MasterDataManagement');" id="MasterDataManagementImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                             </span>
                         </div>
                         <div id="MasterDataManagementFlow" style="margin-left: 0%;color:#666;background-color: rgb(240,240,240);margin-left: 2px;margin-right: 2px;" class="inactiveBlock">
	                   		 <br>
			                   	<div id="GenericBusinessSettingsId" class="row divsubbg" style="border: none;">
		                            <span  onclick="activateSubFlow('GenericBusinessSettings');" class="col-lg-6" style="cursor: pointer;padding-left: 40px;">
		                            	<spring:message code="generic.data.label" />
		                            </span>
		                            <span id="GenericBusinessSettingsCheck" class="col-lg-2" style="padding: 0px">
		                            	<input type="checkbox" style="vertical-align: -2px" name="MasterDataManagementRead" value="Generic Business Settings" onclick="selectAll('GenericBusinessSettingsRead')" id="GenericBusinessSettingsRead"/>Read
		                            </span>
		                            <span class="col-lg-2" style="padding: 0px">
		                            	<input type="checkbox" style="vertical-align: -2px" name="MasterDataManagementWrite" onclick="selectAll('GenericBusinessSettingsWrite')" id="GenericBusinessSettingsWrite"/>Write
<%-- 		                            	<img style="float: right;height: 20px;cursor: pointer;" id="GenericBusinessSettingsImg" onclick="activateSubFlow('GenericBusinessSettings');" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
		                            </span>
		                             <span class="col-lg-2" style="padding: 0px">
		                            	<input type="checkbox" style="vertical-align: -2px" name="MasterDataManagementCCTo" onclick="selectAll('GenericBusinessSettingsCCTo')" id="GenericBusinessSettingsCCTo"/>CC To
		                            	<img style="float: right;height: 20px;cursor: pointer;" id="GenericBusinessSettingsImg" onclick="activateSubFlow('GenericBusinessSettings');" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                            </span>
		                        </div>
		                        <div style="margin-left: 0%">
		                            <div id="GenericBusinessSettingsFlow" style="font-size: 12px" class="inactiveSubBlock">
			                              <br>
			                               <div class="row divsubbg" style="border: none">
			                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
			                                  	<spring:message code="currency.master.label" />
			                                  </span>
			                                  <span id="CurrencyMasterCheck" class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="Currency Master" name="GenericBusinessSettingsRead" id="CurrencyMasterRead"/>Read
			                                  </span>
			                                  <span class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="GenericBusinessSettingsWrite"  id="CurrencyMasterWrite"/>Write
			                                  </span>
			                                   <span class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="GenericBusinessSettingsCCTo"  id="CurrencyMasterCCTo"/>CC To
			                                  </span>
			                               </div>
			                                <br>
			                                   <div class="row divsubbg" style="border: none">
			                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
			                                  	<spring:message code="denomination.master.label" />
			                                  </span>
			                                  <span id="DenominationMasterCheck" class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="Currency Master" name="GenericBusinessSettingsRead" id="DenominationMasterRead"/>Read
			                                  </span>
			                                  <span class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="GenericBusinessSettingsWrite"  id="DenominationMasterWrite"/>Write
			                                  </span>
			                                   <span class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="GenericBusinessSettingsCCTo"  id="DenominationMasterCCTo"/>CC To
			                                  </span>
			                               </div>
			                               <br>
			                               
			                               <div class="row divsubbg" style="border: none">
                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
                                  	<spring:message code="department.master.label" />
                                  </span>
                                  <span id="DepartmentsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="Counter Master" name="GenericBusinessSettingsRead" id="DepartmentsRead"/>Read
                                  </span>
                                  
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="GenericBusinessSettingsWrite"  id="DepartmentsWrite"/>Write
                                  </span>
                                  
                                     <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="GenericBusinessSettingsCCTo"  id="DepartmentsCCTo"/>CC To
                                  </span>
                               </div> 
			                               <br>
			                               
			                               <div class="row divsubbg" style="border: none">  
			                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
			                                  	<spring:message code="employee.master.label" />
			                                  </span>
			                                  <span id="EmployeeMasterCheck" class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="Employee Master" name="GenericBusinessSettingsRead" id="EmployeeMasterRead"/>Read
			                                  </span>
			                                  <span class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="GenericBusinessSettingsWrite"  id="EmployeeMasterWrite"/>Write
			                                  </span>
			                                    <span class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="GenericBusinessSettingsCCTo"  id="EmployeeMasterCCTo"/>CC To
			                                  </span>
			                               </div>
			                              <br>
			                               
			                               <div class="row divsubbg" style="border: none">  
			                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
			                                  	Hsn Master
			                                  </span>
			                                  <span id="HSNMasterCheck" class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="HSN Master" name="GenericBusinessSettingsRead" id="HSNMasterRead"/>Read
			                                  </span>
			                                  <span class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="GenericBusinessSettingsWrite"  id="HSNMasterWrite"/>Write
			                                  </span>
			                                    <span class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="GenericBusinessSettingsCCTo"  id="HSNMasterCCTo"/>CC To
			                                  </span>
			                               </div>
			                               </br>
			                               
			                                <div class="row divsubbg" style="border: none">  
			                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
			                                  	B2B Partners
			                                  </span>
			                                  <span id="B2BPartnersCheck" class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="B2B Partners" name="GenericBusinessSettingsRead" id="B2BPartnersRead"/>Read
			                                  </span>
			                                  <span class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="GenericBusinessSettingsWrite"  id="B2BPartnersWrite"/>Write
			                                  </span>
			                                    <span class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="GenericBusinessSettingsCCTo"  id="B2BPartnersCCTo"/>CC To
			                                  </span>
			                               </div>
			                               
			                               </br>
			                               
			                               <div class="row divsubbg" style="border: none">  
			                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
			                                  State Master
			                                  </span>
			                                  <span id="StateMasterCheck" class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="State Master" name="GenericBusinessSettingsRead" id="StateMasterRead"/>Read
			                                  </span>
			                                  <span class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="GenericBusinessSettingsWrite"  id="StateMasterWrite"/>Write
			                                  </span>
			                                    <span class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="GenericBusinessSettingsCCTo"  id="StateMasterCCTo"/>CC To
			                                  </span>
			                               </div>
			                               </br>
			                               
			                                <div class="row divsubbg" style="border: none">
			                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
			                                  	<spring:message code="location.master.label" />
			                                  </span>
			                                  <span id="LocationMasterCheck" class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="Location Master" name="GenericBusinessSettingsRead" id="LocationMasterRead"/>Read
			                                  </span>
			                                  <span class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="GenericBusinessSettingsWrite"  id="LocationMasterWrite"/>Write
			                                  </span>
			                                    <span class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="GenericBusinessSettingsCCTo"  id="LocationMasterCCTo"/>CC To
			                                  </span>
			                               </div>
			                              <br>
			                                <div class="row divsubbg" style="border: none">
			                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
			                                  	<spring:message code="tax.master.label" />
			                                  </span>
			                                  <span id="TaxMasterCheck" class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="Tax Master" name="GenericBusinessSettingsRead" id="TaxMasterRead"/>Read
			                                  </span>
			                                  <span class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="GenericBusinessSettingsWrite"  id="TaxMasterWrite"/>Write
			                                  </span>
			                                  <span class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="GenericBusinessSettingsCCTo"  id="TaxMasterCCTo"/>CC To
			                                  </span>
			                                </div>
			                                <br>
			                               <div class="row divsubbg" style="border: none">  
			                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
			                                  	<spring:message code="zone.master.label" />
			                                  </span>
			                                  <span id="ZoneMasterCheck" class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="Zone Master" name="GenericBusinessSettingsRead" id="ZoneMasterRead"/>Read
			                                  </span>
			                                  <span class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="GenericBusinessSettingsWrite"  id="ZoneMasterWrite"/>Write
			                                  </span>
			                                  <span class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="GenericBusinessSettingsCCTo"  id="ZoneMasterCCTo"/>CC To
			                                  </span>
			                               </div>
			                              <br>
			                                <div class="row divsubbg" style="border: none">
			                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
			                                  	<spring:message code="brand.master.label" />
			                                  </span>
			                                  <span id="BrandMasterCheck" class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="Brand Master" name="GenericBusinessSettingsRead" id="BrandMasterRead"/>Read
			                                  </span>
			                                  <span class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="GenericBusinessSettingsWrite"  id="BrandMasterWrite"/>Write
			                                  </span>
			                                        <span class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="GenericBusinessSettingsCCTo"  id="BrandMasterCCTo"/>CC To
			                                  </span>
			                               </div>
			                              <br>
			                                <div class="row divsubbg" style="border: none">
			                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
			                                  	<spring:message code="asset.master.label" />
			                                  </span>
			                                  <span id="AssetMasterCheck" class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="Asset Master" name="GenericBusinessSettingsRead" id="AssetMasterRead"/>Read
			                                  </span>
			                                  <span class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="GenericBusinessSettingsWrite"  id="AssetMasterWrite"/>Write
			                                  </span>
			                                  <span class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="GenericBusinessSettingsCCTo"  id="AssetMasterCCTo"/>CC To
			                                  </span>
			                                </div>
			                                 <br>
			                                  <div class="row divsubbg" style="border: none">
		                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                                  	<spring:message code="product.master.label" />
		                                  </span>
		                                  <span id="ProductMasterCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="GenericBusinessSettingsRead" style="vertical-align: -2px" id="ProductMasterRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="GenericBusinessSettingsWrite" style="vertical-align: -2px" id="ProductMasterWrite"/>Write
		                                  </span>
		                                    <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="GenericBusinessSettingsCCTo" style="vertical-align: -2px" id="ProductMasterCCTo"/>CC To
		                                  </span>
		                               </div>
		                               <br>
		                               <div class="row divsubbg" style="border: none">
		                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                                  	<spring:message code="supplier.master.label" />
		                                  </span>
		                                  <span id="SupplierMasterCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="GenericBusinessSettingsRead" style="vertical-align: -2px" id="SupplierMasterRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="GenericBusinessSettingsWrite" style="vertical-align: -2px" id="SupplierMasterWrite"/>Write
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="GenericBusinessSettingsCCTo" style="vertical-align: -2px" id="SupplierMasterCCTo"/>CC To
		                                  </span>
		                               </div>
		                                <br>
		                  		 	 <div class="row divsubbg" style="border: none">
		                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                                  	<spring:message code="category.master.label" />
		                                  </span>
		                                  <span id="CategoryMasterCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="GenericBusinessSettingsRead" style="vertical-align: -2px" id="CategoryMasterRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="GenericBusinessSettingsWrite" style="vertical-align: -2px" id="CategoryMasterWrite"/>Write
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="GenericBusinessSettingsCCTo" style="vertical-align: -2px" id="CategoryMasterCCTo"/>CC To
		                                  </span>
		                               </div>
		                               <br>
		                  		 	<div class="row divsubbg" style="border: none">
		                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                                  	<spring:message code="sub.category.master.label" />
		                                  </span>
		                                  <span id="SubcategoryMasterCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="GenericBusinessSettingsRead" style="vertical-align: -2px" id="SubcategoryMasterRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="GenericBusinessSettingsWrite" style="vertical-align: -2px" id="SubcategoryMasterWrite"/>Write
		                                  </span>
		                                    <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="GenericBusinessSettingsCCTo" style="vertical-align: -2px" id="SubcategoryMasterCCTo"/>CC To
		                                  </span>
		                             </div>
		                               <br>
		                                <div class="row divsubbg" style="border: none">
		                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                                  	<spring:message code="shipment.rate.master.label" />
		                                  </span>
		                                  <span id="ShipmentRateMasterCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="GenericBusinessSettingsRead" style="vertical-align: -2px" id="ShipmentRateMasterRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="GenericBusinessSettingsWrite" style="vertical-align: -2px" id="ShipmentRateMasterWrite"/>Write
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="GenericBusinessSettingsCCTo" style="vertical-align: -2px" id="ShipmentRateMasterCCTo"/>CC To
		                                  </span>
		                               </div>
		                               
		                               
		                               <br>
			                               <div class="row divsubbg" style="border: none">  
			                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
			                                  	<spring:message code="service.area.master.label" />
			                                  </span>
			                                  <span id="ServiceAreaMasterCheck" class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="Zone Master" name="GenericBusinessSettingsRead" id="ServiceAreaMasterRead"/>Read
			                                  </span>
			                                  <span class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="GenericBusinessSettingsWrite"  id="ServiceAreaMasterWrite"/>Write
			                                  </span>
			                                  <span class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="GenericBusinessSettingsCCTo"  id="ServiceAreaMasterCCTo"/>CC To
			                                  </span>
			                               </div>
		                               
		                               
		                               <br>
			                   		</div>
		                   		</div>
	                   		  <br>
	                   		 	<div id="OutletMasterSettingsId" class="row divsubbg" style="border: none;">
		                            <span  onclick="activateSubFlow('OutletMasterSettings');" class="col-lg-6" style="cursor: pointer;padding-left: 40px;">
		                            	<spring:message code="masters.label" />
		                            </span>
		                            <span id="OutletMasterSettingsCheck" class="col-lg-2" style="padding: 0px">
		                            	<input type="checkbox" style="vertical-align: -2px" name="MasterDataManagementRead" value="Outlet Master Settings" onclick="selectAll('OutletMasterSettingsRead')" id="OutletMasterSettingsRead"/>Read
		                            </span>
		                            <span class="col-lg-2" style="padding: 0px">
		                            	<input type="checkbox" style="vertical-align: -2px" name="MasterDataManagementWrite" onclick="selectAll('OutletMasterSettingsWrite')" id="OutletMasterSettingsWrite"/>Write
<%-- 		                            	<img style="float: right;height: 20px;cursor: pointer;" id="OutletMasterSettingsImg" onclick="activateSubFlow('OutletMasterSettings');" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
		                            </span>
		                              <span class="col-lg-2" style="padding: 0px">
		                            	<input type="checkbox" style="vertical-align: -2px" name="MasterDataManagementCCTo" onclick="selectAll('OutletMasterSettingsCCTo')" id="OutletMasterSettingsCCTo"/>CC To
		                            	<img style="float: right;height: 20px;cursor: pointer;" id="OutletMasterSettingsImg" onclick="activateSubFlow('OutletMasterSettings');" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                            </span>
		                        </div>
		                        <div style="margin-left: 0%">
		                            <div id="OutletMasterSettingsFlow" style="font-size: 12px;" class="inactiveSubBlock">
			                        <br>
			                   		  
		                  		 		 <div class="row divsubbg" style="border: none">
		                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                                  	<spring:message code="sku.master.label" />
		                                  </span>
		                                  <span id="SkuMasterCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletMasterSettingsRead" style="vertical-align: -2px" id="SkuMasterRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletMasterSettingsWrite" style="vertical-align: -2px" id="SkuMasterWrite"/>Write
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletMasterSettingsCCTo" style="vertical-align: -2px" id="SkuMasterCCTo"/>CC To
		                                  </span>
		                               </div>
		                               <br>
		                  		 	
		                  		 		 <div class="row divsubbg" style="border: none; ">
		                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                                  	<spring:message code="product.group.master.label" />
		                                  </span>
		                                  <span id="ProductGroupMasterCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletMasterSettingsRead" style="vertical-align: -2px" id="ProductGroupMasterRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletMasterSettingsWrite" style="vertical-align: -2px" id="ProductGroupMasterWrite"/>Write
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletMasterSettingsCCTo" style="vertical-align: -2px" id="ProductGroupMasterCCTo"/>CC To
		                                  </span>
		                                  
		                               </div>
		                               <br>
		                  		 	
		                                 <div class="row divsubbg" style="border: none">
		                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                                  	<spring:message code="price.range.master.label" />
		                                  </span>
		                                  <span id="PriceRangeMasterCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletMasterSettingsRead" style="vertical-align: -2px" id="PriceRangeMasterRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletMasterSettingsWrite" style="vertical-align: -2px" id="PriceRangeMasterWrite"/>Write
		                                  </span>
		                                     <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletMasterSettingsCCTo" style="vertical-align: -2px" id="PriceRangeMasterCCTo"/>CC To
		                                  </span>
		                               </div>
		                                <br>
		                  		 	
		                                <div class="row divsubbg" style="border: none">
		                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                                  	<spring:message code="bom.master.label" />
		                                  </span>
		                                  <span id="BOMMasterCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletMasterSettingsRead" style="vertical-align: -2px" id="BOMMasterRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletMasterSettingsWrite" style="vertical-align: -2px" id="BOMMasterWrite"/>Write
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletMasterSettingsCCTo" style="vertical-align: -2px" id="BOMMasterCCTo"/>CC To
		                                  </span>
		                               </div>
		                               <br>
		                                <div id="PriceManagementId" class="row divsubbg" style="border: none;">
	                              <span  class="col-lg-6"  onclick="activateSubChildFlow('PriceManagement');" style="cursor: pointer;padding-left: 60px;">
	                              	<spring:message code="price.management.label" />
	                              </span>
	                              <span id="PriceManagementCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('PriceManagementRead');" name="OutletMasterSettingsRead" id="PriceManagementRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="OutletMasterSettingsWrite" style="vertical-align: -2px" onclick="selectAll('PriceManagementWrite')" id="PriceManagementWrite"/>Write
<%--                                   	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('RestaurentManagement');" id="RestaurentManagementImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                    <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="OutletMasterSettingsCCTo" style="vertical-align: -2px" onclick="selectAll('PriceManagementCCTo')" id="PriceManagementCCTo"/>CC To
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('PriceManagement');" id="PriceManagementImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                                  </div> 
                                  
                                  <div style="margin-left: 0%;">
	                            <div id="PriceManagementFlow" class="inactiveSubChildBlock" style="font-size: 12px;background-color: rgb(240,240,240)">
	                            	<br>
                               		<div class="row divsubchildbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              			<spring:message code="price.updating.label" />
	                              		  </span>
	                              		  <span id="PriceUpdateCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="PriceManagementRead" style="vertical-align: -2px" id="PriceUpdateRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                	<input type="checkbox" onclick="toggleCheckBox(this)" name="PriceManagementWrite" style="vertical-align: -2px" id="PriceUpdateWrite"/>Write
		                                  </span>
		                                    <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="PriceManagementCCTo" style="vertical-align: -2px" id="PriceUpdateCCTo"/>CC To
		                                  </span>
		                           </div>
		                    	  <br>
                               		<div class="row divsubchildbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="bulkPrice.update.label" />
	                              		  </span>
	                              		  <span id="BulkPriceUpdateCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="PriceManagementRead" style="vertical-align: -2px" id="BulkPriceUpdateRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="PriceManagementWrite" style="vertical-align: -2px" id="BulkPriceUpdateWrite"/>Write
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="PriceManagementCCTo" style="vertical-align: -2px" id="BulkPriceUpdateCCTo"/>CC To
		                                  </span>
		                           </div>
		                           <br>
                               		
		                      </div>
		                    </div>
		                    
		                      
		                           <br>
		                  		 		 <div class="row divsubbg" style="border: none">
		                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                                  	<spring:message code="stock.update.label" />
		                                  </span>
		                                  <span id="OutletStockUpdateCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletMasterSettingsRead" style="vertical-align: -2px" id="OutletStockUpdateRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletMasterSettingsWrite" style="vertical-align: -2px" id="OutletStockUpdateWrite"/>Write
		                                  </span>
		                                    <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletMasterSettingsCCTo" style="vertical-align: -2px" id="OutletStockUpdateCCTo"/>CC To
		                                  </span>
		                               </div>
		                           
		                           
		                              <%--   <div class="row divsubbg" style="border: none">
		                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                                  	<spring:message code="price.updating.label" />
		                                  </span>
		                                  <span id="PriceUpdateCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletMasterSettingsRead" style="vertical-align: -2px" id="PriceUpdateRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletMasterSettingsWrite" style="vertical-align: -2px" id="PriceUpdateWrite"/>Write
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletMasterSettingsCCTo" style="vertical-align: -2px" id="PriceUpdateCCTo"/>CC To
		                                  </span>
		                               </div> --%>
                        		</div>
                        	</div>
                        	<br>
                        	<div id="WarehouseMasterSettingsId" class="row divsubbg" style="border: none;">
		                            <span  onclick="activateSubFlow('WarehouseMasterSettings');" class="col-lg-6" style="cursor: pointer;padding-left: 40px;">
		                            	<spring:message code="warehouse.master.label" />
		                            </span>
		                            <span id="WarehouseMasterSettingsCheck" class="col-lg-2" style="padding: 0px">
		                            	<input type="checkbox" style="vertical-align: -2px" name="MasterDataManagementRead" value="Warehouse Master Settings" onclick="selectAll('WarehouseMasterSettingsRead')" id="WarehouseMasterSettingsRead"/>Read
		                            </span>
		                            <span class="col-lg-2" style="padding: 0px">
		                            	<input type="checkbox" style="vertical-align: -2px" name="MasterDataManagementWrite" onclick="selectAll('WarehouseMasterSettingsWrite')" id="WarehouseMasterSettingsWrite"/>Write
<%-- 		                            	<img style="float: right;height: 20px;cursor: pointer;" id="WarehouseMasterSettingsImg" onclick="activateSubFlow('WarehouseMasterSettings');" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
		                            </span>
		                             <span class="col-lg-2" style="padding: 0px">
		                            	<input type="checkbox" style="vertical-align: -2px" name="MasterDataManagementCCTo" onclick="selectAll('WarehouseMasterSettingsCCTo')" id="WarehouseMasterSettingsCCTo"/>CC To
		                            	<img style="float: right;height: 20px;cursor: pointer;" id="WarehouseMasterSettingsImg" onclick="activateSubFlow('WarehouseMasterSettings');" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                            </span>
		                        </div>
		                        <div style="margin-left: 0%">
		                            <div id="WarehouseMasterSettingsFlow" style="font-size: 12px;" class="inactiveSubBlock">
			                        <br>
			                   		
		                  		 		 <div class="row divsubbg" style="border: none">
		                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                                  	<spring:message code="sku.master.label" />
		                                  </span>
		                                  <span id="WarehouseSkuMasterCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseMasterSettingsRead" style="vertical-align: -2px" id="WarehouseSkuMasterRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseMasterSettingsWrite" style="vertical-align: -2px" id="WarehouseSkuMasterWrite"/>Write
		                                  </span>
		                                    <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseMasterSettingsCCTo" style="vertical-align: -2px" id="WarehouseSkuMasterCCTo"/>CC To
		                                  </span>
		                               </div>
		                               <br>
		                                  <div class="row divsubbg" style="border: none">
		                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                                  	<spring:message code="storagesystemsmaster.label" />
		                                  </span>
		                                  <span id="WarehouseStorageSystemsMasterCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseMasterSettingsRead" style="vertical-align: -2px" id="WarehouseStorageSystemsMasterRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseMasterSettingsWrite" style="vertical-align: -2px" id="WarehouseStorageSystemsMasterWrite"/>Write
		                                  </span>
		                                    <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseMasterSettingsCCTo" style="vertical-align: -2px" id="WarehouseStorageSystemsMasterCCTo"/>CC To
		                                  </span>
		                               </div>
		                               <br>
		                               <div class="row divsubbg" style="border: none">
		                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                                  	<spring:message code="fleetmaster.label" />
		                                  </span>
		                                  <span id="WarehouseFleetMasterCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseMasterSettingsRead" style="vertical-align: -2px" id="WarehouseFleetMasterRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseMasterSettingsWrite" style="vertical-align: -2px" id="WarehouseFleetMasterWrite"/>Write
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseMasterSettingsCCTo" style="vertical-align: -2px" id="WarehouseFleetMasterCCTo"/>CC To
		                                  </span>
		                               </div>
		                               <br>
		                               
		                               <div class="row divsubbg" style="border: none">
		                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                                  	BOM Master
		                                  </span>
		                                  <span id="WarehouseBomMasterCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseMasterSettingsRead" style="vertical-align: -2px" id="WarehouseBomMasterRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseMasterSettingsWrite" style="vertical-align: -2px" id="WarehouseBomMasterWrite"/>Write
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseMasterSettingsCCTo" style="vertical-align: -2px" id="WarehouseBomMasterCCTo"/>CC To
		                                  </span>
		                               </div>
		                               <br>
		                               
		                               
		                  		 	 <div class="row divsubbg" style="border: none">
		                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                                  	<spring:message code="logisticspartner.label" />
		                                  </span>
		                                  <span id="WarehouseLogisticsPartnersCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseMasterSettingsRead" style="vertical-align: -2px" id="WarehouseLogisticsPartnersRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseMasterSettingsWrite" style="vertical-align: -2px" id="WarehouseLogisticsPartnersWrite"/>Write
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseMasterSettingsCCTo" style="vertical-align: -2px" id="WarehouseLogisticsPartnersCCTo"/>CCTo
		                                  </span>
		                               </div>
		                               <br>
		                  		 		 <div class="row divsubbg" style="border: none">
		                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                                  	<spring:message code="product.group.master.label" />
		                                  </span>
		                                  <span id="WarehouseProductGroupMasterCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseMasterSettingsRead" style="vertical-align: -2px" id="WarehouseProductGroupMasterRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseMasterSettingsWrite" style="vertical-align: -2px" id="WarehouseProductGroupMasterWrite"/>Write
		                                  </span>
		                                    <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseMasterSettingsCCTo" style="vertical-align: -2px" id="WarehouseProductGroupMasterCCTo"/>CC To
		                                  </span>
		                               </div>
		                               
		                               
		                                  <br>
		                  		 		 <div class="row divsubbg" style="border: none">
		                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                                  	<spring:message code="stock.update.label" />
		                                  </span>
		                                  <span id="WarehouseStockUpdateCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseMasterSettingsRead" style="vertical-align: -2px" id="WarehouseStockUpdateRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseMasterSettingsWrite" style="vertical-align: -2px" id="WarehouseStockUpdateWrite"/>Write
		                                  </span>
		                                    <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseMasterSettingsCCTo" style="vertical-align: -2px" id="WarehouseStockUpdateCCTo"/>CC To
		                                  </span>
		                               </div>
		                            
                        		</div>
                        	</div>
                        </div>
                        <br>
                         <div id="SettingsId" class="row divbg">
                            <span  onclick="activate('Settings');" class="col-lg-6" style="cursor: pointer;font-size: 15px;">
                            	<spring:message code="customer.settings.label" />
                            </span>
                            <span id="SettingsCheck" class="col-lg-2" style="padding: 0px">
                            	<input type="checkbox" style="vertical-align: -2px" name="consoleRead" value="Settings" onclick="selectAll('SettingsRead')" id="SettingsRead"/>Read
                            </span>
                            <span class="col-lg-2" style="padding: 0px">
                            	<input type="checkbox" style="vertical-align: -2px" name="consoleWrite" onclick="selectAll('SettingsWrite')" id="SettingsWrite"/>Write
<%--                             	<img style="float: right;height: 20px;cursor: pointer;" id="SettingsImg" onclick="activate('Settings');" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                            </span>
                              <span class="col-lg-2" style="padding: 0px">
                            	<input type="checkbox" style="vertical-align: -2px" name="consoleCCTo" onclick="selectAll('SettingsCCTo')" id="SettingsCCTo"/>CC To
                            	<img style="float: right;height: 20px;cursor: pointer;" id="SettingsImg" onclick="activate('Settings');" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                            </span>
                        </div>
                       
                           <div id="SettingsFlow" style="color:#666;background-color:rgb(240,240,240);margin-left: 2px;margin-right: 2px; " class="inactiveBlock">
                              <br>
                               <div class="row divsubbg" style="border: none">
                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="profile.settings.label" />
                                  </span>
                                  <span id="ProfileSettingsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="ProfileSettings" name="SettingsRead" id="ProfileSettingsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="SettingsWrite"  id="ProfileSettingsWrite"/>Write
                                  </span>
                                     <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="SettingsCCTo"  id="ProfileSettingsCCTo"/>CC To
                                  </span>
                               </div>
                               <br>
                               <div class="row divsubbg" style="border: none">  
                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="email.settings.label" />
                                  </span>
                                  <span id="EmailSettingsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="EmailSettings" name="SettingsRead" id="EmailSettingsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="SettingsWrite"  id="EmailSettingsWrite"/>Write
                                  </span>
                                   <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="SettingsCCTo"  id="EmailSettingsCCTo"/>CC To
                                  </span>
                               </div>
                               <br>
                               <div class="row divsubbg" style="border: none">
                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="sms.settings.label" />
                                  </span>
                                  <span id="SmsSettingsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="SmsSettings" name="SettingsRead" id="SmsSettingsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="SettingsWrite"  id="SmsSettingsWrite"/>Write
                                  </span>
                                   <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="SettingsCCTo"  id="SmsSettingsCCTo"/>CC To
                                  </span>
                               </div>
                               <br>
                               <div class="row divsubbg" style="border: none">
                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="whatsapp.settings.label" />
                                  </span>
                                  <span id="WhatsAppSettingsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="WhatsAppSettings" name="SettingsRead" id="WhatsAppSettingsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="SettingsWrite"  id="WhatsAppSettingsWrite"/>Write
                                  </span>
                                   <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="SettingsCCTo"  id="WhatsAppSettingsCCTo"/>CC To
                                  </span>
                               </div>
                               <br>
                               <div class="row divsubbg" style="border: none">  
                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="header.and.footer.label" />
                                  </span>
                                  <span id="PrintSettingsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="PrintSettings" name="SettingsRead" id="PrintSettingsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="SettingsWrite"  id="PrintSettingsWrite"/>Write
                                  </span>
                                   <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="SettingsCCTo"  id="PrintSettingsCCTo"/>CC To
                                  </span>
                               </div>
                               
                               <br>
                               <div class="row divsubbg" style="border: none">
                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="system.and.security.label" />
                                  </span>
                                  <span id="UserSecuritySettingsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="UserSecuritySettings" name="SettingsRead" id="UserSecuritySettingsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="SettingsWrite"  id="UserSecuritySettingsWrite"/>Write
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="SettingsCCTo"  id="UserSecuritySettingsCCTo"/>CC To
                                  </span>
                               </div>
                               <br>
                               <div class="row divsubbg" style="border: none">  
                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="regional.settings.label" />
                                  </span>
                                  <span id="RegionalSettingsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="RegionalSettings" name="SettingsRead" id="RegionalSettingsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="SettingsWrite"  id="RegionalSettingsWrite"/>Write
                                  </span>
                                    <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="SettingsCCTo"  id="RegionalSettingsCCTo"/>CC To
                                  </span>
                               </div>
                                <br>
                               <div class="row divsubbg" style="border: none">  
                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="integration.settings.label" />
                                  </span>
                                  <span id="IntegrationSettingsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="IntegrationSettings" name="SettingsRead" id="IntegrationSettingsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="SettingsWrite"  id="IntegrationSettingsWrite"/>Write
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="SettingsCCTo"  id="IntegrationSettingsCCTo"/>CC To
                                  </span>
                               </div>
                               <br>
                               <div class="row divsubbg" style="border: none">  
                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="ftp.settings.label" />
                                  </span>
                                  <span id="FtpSettingsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="FtpSettings" name="SettingsRead" id="FtpSettingsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="SettingsWrite"  id="FtpSettingsWrite"/>Write
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="SettingsCCTo"  id="FtpSettingsCCTo"/>CC To
                                  </span>
                               </div>
                               </div>
                   		 <br>
                   		 
                   		 <div id="EventLogId" class="row divbg">
                                <span  class="col-lg-6" style="cursor: pointer;font-size: 15px;" onclick="activate('EventLog');">
                                	<spring:message code="systemlog.label" />
                                </span>
                                <span id="EventLogCheck" class="col-lg-2" style="padding: 0px">
                                	<input type="checkbox" style="vertical-align: -2px" value="Event log" onclick="selectAll('EventLogRead')" name="consoleRead" id="EventLogRead"/>Read
                                </span>
                                <span  class="col-lg-2" style="padding: 0px">
                                	<!-- <input type="checkbox" style="vertical-align: -2px" name="consoleWrite" id="EventLogWrite"/>Write -->
<%--                                 	<img style="float: right;height: 20px;cursor: pointer;" id="EventLogImg" onclick="activate('EventLog');" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                </span>
                                 <span  class="col-lg-2" style="padding: 0px">
                                	<input type="checkbox" style="vertical-align: -2px" value="Event log" onclick="selectAll('EventLogCCTo')" name="consoleCCTo" id="EventLogCCTo"/>CC To
                                	<img style="float: right;height: 20px;cursor: pointer;" id="EventLogImg" onclick="activate('EventLog');" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                </span>
                   		 </div>
                   		 
                   		 <div id="EventLogFlow" style="color:#666;background-color:rgb(240,240,240);margin-left: 2px;margin-right: 2px; " class="inactiveBlock">
                              <br>
                               <div class="row divsubbg" style="border: none">
                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="application.log.label" />
                                  </span>
                                  <span id="ApplicationLogCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="ApplicationLog" name="EventLogRead" id="ApplicationLogRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<!-- <input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="EventLogWrite"  id="ProfileSettingsWrite"/>Write -->
                                  </span>
                                    <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="ApplicationLog" name="EventLogCCTo" id="ApplicationLogCCTo"/>CC To</span>
                               </div>
                               <br>
                               
                                <div class="row divsubbg" style="border: none">
                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	Export Log
                                  </span>
                                  <span id="ExportLogCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="ExportLog" name="EventLogRead" id="ExportLogRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<!-- <input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="EventLogWrite"  id="ProfileSettingsWrite"/>Write -->
                                  </span>
                                    <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="ExportLog" name="EventLogCCTo" id="ExportLogCCTo"/>CC To</span>
                               </div>
                               <br>
                               
                               
                               
                               <div class="row divsubbg" style="border: none">  
                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="security.log.label" />
                                  </span>
                                  <span id="SystemLogCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="SystemLog" name="EventLogRead" id="SystemLogRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<!-- <input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="SettingsWrite"  id="EmailSettingsWrite"/>Write -->
                                  </span>
                                   <span id="SystemLogCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="SystemLog" name="EventLogCCTo" id="SystemLogCCTo"/>CC To
                                  </span>
                               </div>
                               <br>
                               <div class="row divsubbg" style="border: none">
                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="user.log.label" />
                                  </span>
                                  <span id="UserLogCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="UserLog" name="EventLogRead" id="UserLogRead"/>Read
                                  </span>
                                  
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<!-- <input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="SettingsWrite"  id="SmsSettingsWrite"/>Write -->
                                  </span>
                                  <span id="UserLogCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="UserLog" name="EventLogCCTo" id="UserLogCCTo"/>CC To
                                  </span>
                               </div>
                               <br>
                               <div class="row divsubbg" style="border: none">  
                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="administration.log.label" />
                                  </span>
                                  <span id="AdministrationLogCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="AdministrationLog" name="EventLogRead" id="AdministrationLogRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<!-- <input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="SettingsWrite"  id="PrintSettingsWrite"/>Write -->
                                  </span>
                                     <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="EventLogCCTo"  id="AdministrationLogCCTo"/>CC To
                                  </span>
                               </div>
                            </div>
                   		 
                   		 <br>
                   		<%--  <div id="DashboardId"  class="row divbg" >
                                <span class="col-lg-6" style="cursor: pointer;font-size: 15px;" onclick="activate('Dashboard');">
                                	<spring:message code="dashboard.label" />
                                </span>
                                <span id="DashboardCheck" class="col-lg-3" style="padding: 0px">
                                	<input type="checkbox" style="vertical-align: -2px" value="Dashboard"  onclick="selectAll('DashboardRead')" name="consoleRead" id="DashboardRead"/>Read
                                </span>
                                <span  class="col-lg-3" style="padding: 0px">
                                	<!-- <input type="checkbox" style="vertical-align: -2px" name="consoleWrite" id="DashboardWrite"/>Write -->
                                	<img style="float: right;height: 20px;cursor: pointer;" id="DashboardImg" onclick="activate('Dashboard');" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                </span>
                   		 </div>
                   		 <div id="DashboardFlow" style="color:#666;background-color:rgb(240,240,240);margin-left: 2px;margin-right: 2px; " class="inactiveBlock">
                              <br>
                               <div class="row divsubbg" style="border: none">
                                  <span class="col-lg-6" style="cursor: pointer;" >
                                  	<spring:message code="outlet.management.label" />
                                  </span>
                                  <span id="outletDashboardCheck" class="col-lg-3" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="outletDashboard" name="DashboardRead" id="outletDashboardRead"/>Read
                                  </span>
                                  <span class="col-lg-3" style="padding: 0px">
                                  	<!-- <input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="EventLogWrite"  id="ProfileSettingsWrite"/>Write -->
                                  </span>
                               </div>
                               <c:if test="${sessionScope.warehouseLicense == true}">
	                               <br>
	                               <div class="row divsubbg" style="border: none">  
	                                  <span class="col-lg-6" style="cursor: pointer;" >
	                                  	<spring:message code="warehouse.management.label" />
	                                  </span>
	                                  <span id="warehouseDashboardCheck" class="col-lg-3" style="padding: 0px">
	                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="warehouseDashboard" name="DashboardRead" id="warehouseDashboardRead"/>Read
	                                  </span>
	                                  <span class="col-lg-3" style="padding: 0px">
	                                  	<!-- <input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="SettingsWrite"  id="EmailSettingsWrite"/>Write -->
	                                  </span>
	                               </div>
                               </c:if>
                            </div>
                            <br>
                            <div id="ReportsId" class="row divbg" >
                             <span onclick="activate('Reports');" class="col-lg-6" style="font-size: 15px;cursor: pointer;">
                             	<spring:message code="warehouse_reports.label" />
                             </span>
                             <span id="ReportsCheck" class="col-lg-3" style="padding: 0px">
                              	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('ReportsRead')" name="consoleRead" id="ReportsRead"/>Read
                             </span>
                             <span  class="col-lg-3" style="padding: 0px">
                              	<!-- <input type="checkbox" style="vertical-align: -2px" onclick="selectAll('ReportsWrite')" name="consoleWrite" id="ReportsWrite"/>Write -->
                              	<img style="float: right;height: 20px;cursor: pointer;" onclick="activate('Reports');" id="ReportsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                             </span>
                             </div>
                             <div id="ReportsFlow" style="margin-left: 0%;color:#666;background-color: rgb(240,240,240);margin-left: 2px;margin-right: 2px;" class="inactiveBlock">
	                   		<br>
                               <div id="OutletReportsId"  class="row divbg" style="border: none">
	                               	  <span class="col-lg-6"  onclick="activateSubFlow('OutletReports');" style="cursor: pointer;">
		                              	<spring:message code="outlet_management.reports.label" />
		                              </span>
		                              <span id="OutletReportsCheck" class="col-lg-3" style="padding: 0px">
	                                  	<input type="checkbox" name="ReportsRead" style="vertical-align: -2px" onclick="selectAll('OutletReportsRead')" id="OutletReportsRead"/>Read
	                                  </span>
	                                  <span class="col-lg-3" style="padding: 0px">
	                                  	<!-- <input type="checkbox" name="ReportsWrite" style="vertical-align: -2px" onclick="selectAll('OutletReportsWrite')" id="OutletReportsWrite"/>Write -->
	                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('OutletReports');" id="OutletReportsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
	                                  </span>
                                </div>
                                 <div style="margin-left: 0%;">
	                              <div id="OutletReportsFlow" class="inactiveSubBlock" style="font-size: 12px;background-color: rgb(240,240,240)">
	                                	<br>
		                                <div id="OutletSalesReportsId"  class="row divsubbg" style="border: none">
		                               	  <span class="col-lg-6"  onclick="activateSubChildFlow('OutletSalesReports');" style="cursor: pointer;">
			                              		<spring:message code="sales.reports.label" />
			                              </span>
			                              <span id="OutletSalesReportsCheck" class="col-lg-3" style="padding: 0px">
		                                  		<input type="checkbox" name="OutletReportsRead" style="vertical-align: -2px" onclick="selectAll('OutletSalesReportsRead')" id="OutletSalesReportsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-3" style="padding: 0px">
		                                  		<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('OutletSalesReports');" id="OutletSalesReportsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                                  </span>
	                                  </div>
	                                  <div style="margin-left: 0%;">
			                              <div id="OutletSalesReportsFlow" class="inactiveSubChildBlock" style="font-size: 10px;background-color: rgb(240,240,240)">
				                                <br>
			                               		<div class="row divsubchildbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;" >
				                              		  	<spring:message code="xreading.reports.label" />
				                              		  </span>
				                              		  <span id="OutletSalesXCheck" class="col-lg-3" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="OutletSalesXRead"/>Read
					                                  </span>
					                                  <span class="col-lg-3" style="padding: 0px">
					                                  </span>
					                           </div>
					                            <br>
			                               		<div class="row divsubchildbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;" >
				                              		  	<spring:message code="zreading.reports.label" />
				                              		  </span>
				                              		  <span id="OutletSalesZCheck" class="col-lg-3" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="OutletSalesZRead"/>Read
					                                  </span>
					                                  <span class="col-lg-3" style="padding: 0px">
					                                  </span>
					                           </div>
					                           <br>
			                               		<div class="row divsubchildbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;" >
				                              		  	<spring:message code="xzreading.reports.label" />
				                              		  </span>
				                              		  <span id="OutletSalesXZCheck" class="col-lg-3" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="OutletSalesXZRead"/>Read
					                                  </span>
					                                  <span class="col-lg-3" style="padding: 0px">
					                                  </span>
					                           </div>
					                           <br>
			                               		<div class="row divsubchildbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;" >
				                              		  	<spring:message code="date.wise.sales.label" />
				                              		  </span>
				                              		  <span id="OutletSalesDateWiseCheck" class="col-lg-3" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="OutletSalesDateWiseRead"/>Read
					                                  </span>
					                                  <span class="col-lg-3" style="padding: 0px">
					                                  </span>
					                           </div>
					                            <br>
			                               		<div class="row divsubchildbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;" >
				                              		  	<spring:message code="counter.wise.label" />
				                              		  </span>
				                              		  <span id="OutletSalesCounterWiseCheck" class="col-lg-3" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="OutletSalesCounterWiseRead"/>Read
					                                  </span>
					                                  <span class="col-lg-3" style="padding: 0px">
					                                  </span>
					                           </div>
					                           <br>
			                               		<div class="row divsubchildbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;" >
				                              		  	<spring:message code="category.wise.label" />
				                              		  </span>
				                              		  <span id="OutletSalesCategoryWiseCheck" class="col-lg-3" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="OutletSalesCategoryWiseRead"/>Read
					                                  </span>
					                                  <span class="col-lg-3" style="padding: 0px">
					                                  </span>
					                           </div>
					                           <br>
					                                       	<div class="row divsubchildbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;" >
				                              		  	<spring:message code="department.wise" />
				                              		  </span>
				                              		  <span id="OutletSalesDepartmentWiseCheck" class="col-lg-3" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="OutletSalesDepartmentWiseRead"/>Read
					                                  </span>
					                                  <span class="col-lg-3" style="padding: 0px">
					                                  </span>
					                           </div>
					                           <br>
					                           	<div class="row divsubchildbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;" >
				                              		  	<spring:message code="sku.wise.label" />
				                              		  </span>
				                              		  <span id="OutletSalesSkuWiseCheck" class="col-lg-3" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="OutletSalesSkuWiseRead"/>Read
					                                  </span>
					                                  <span class="col-lg-3" style="padding: 0px">
					                                  </span>
					                           </div>
					                           <br>
					                           	<div class="row divsubchildbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;" >
				                              		  	<spring:message code="hour.wise.sales.label" />
				                              		  </span>
				                              		  <span id="OutletSalesHourWiseCheck" class="col-lg-3" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="OutletSalesHourWiseRead"/>Read
					                                  </span>
					                                  <span class="col-lg-3" style="padding: 0px">
					                                  </span>
					                           </div>
					                           <br>
					                           	<div class="row divsubchildbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;" >
				                              		  	<spring:message code="brandwise.reports.label" />
				                              		  </span>
				                              		  <span id="OutletSalesBrandWiseCheck" class="col-lg-3" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="OutletSalesBrandWiseRead"/>Read
					                                  </span>
					                                  <span class="col-lg-3" style="padding: 0px">
					                                  </span>
					                           </div>
					                           <br>
					                           	<div class="row divsubchildbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;" >
				                              		  	<spring:message code="sectionwise.reports.label" />
				                              		  </span>
				                              		  <span id="OutletSalesSectionWiseCheck" class="col-lg-3" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="OutletSalesSectionWiseRead"/>Read
					                                  </span>
					                                  <span class="col-lg-3" style="padding: 0px">
					                                  </span>
					                           </div>
					                           <br>
			                               		<div class="row divsubchildbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;" >
				                              		  	<spring:message code="supplier.wise.label" />
				                              		  </span>
				                              		  <span id="OutletSalesSupplierWiseCheck" class="col-lg-3" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="OutletSalesSupplierWiseRead"/>Read
					                                  </span>
					                                  <span class="col-lg-3" style="padding: 0px">
					                                  </span>
					                           </div>
					                            <br>
			                               		<div class="row divsubchildbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;" >
				                              		  	<spring:message code="tax.label" />
				                              		  </span>
				                              		  <span id="OutletSalesTaxCheck" class="col-lg-3" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="OutletSalesTaxRead"/>Read
					                                  </span>
					                                  <span class="col-lg-3" style="padding: 0px">
					                                  </span>
					                           </div>
					                           <br>
			                               		<div class="row divsubchildbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;" >
				                              		  	<spring:message code="due.collection.label" />
				                              		  </span>
				                              		  <span id="OutletSalesDueCollectionCheck" class="col-lg-3" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="OutletSalesDueCollectionRead"/>Read
					                                  </span>
					                                  <span class="col-lg-3" style="padding: 0px">
					                                  </span>
					                           </div>
					                            <br>
			                               		<div class="row divsubchildbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;" >
				                              		  	<spring:message code="credit.sales.label" />
				                              		  </span>
				                              		  <span id="OutletSalesCreditSalesCheck" class="col-lg-3" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="OutletSalesCreditSalesRead"/>Read
					                                  </span>
					                                  <span class="col-lg-3" style="padding: 0px">
					                                  </span>
					                           </div>
				                         </div>
			                        </div>
		                             <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;" >
	                              		  	<spring:message code="orders.reports.label" />
	                              		  </span>
	                              		  <span id="OutletOrdersReportsCheck" class="col-lg-3" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsRead" style="vertical-align: -2px" id="OutletOrdersReportsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-3" style="padding: 0px">
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsWrite" style="vertical-align: -2px" id="OutletOrdersReportsWrite"/>Write -->
		                                  </span>
		                           </div>
		                           <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;" >
	                              		  	<spring:message code="stock.reports.label" />
	                              		  </span>
	                              		  <span id="OutletStockReportsCheck" class="col-lg-3" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsRead" style="vertical-align: -2px" id="OutletStockReportsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-3" style="padding: 0px">
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsWrite" style="vertical-align: -2px" id="OutletStockReportsWrite"/>Write -->
		                                  </span>
		                           </div>
		                           <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;" >
	                              		  	<spring:message code="purchases.reports.label" />
	                              		  </span>
	                              		  <span id="OutletPurchaseReportsCheck" class="col-lg-3" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsRead" style="vertical-align: -2px" id="OutletPurchaseReportsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-3" style="padding: 0px">
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsWrite" style="vertical-align: -2px" id="OutletPurchaseReportsWrite"/>Write -->
		                                  </span>
		                           </div>
		                            <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;" >
	                              		  	<spring:message code="shipments.reports.label" />
	                              		  </span>
	                              		  <span id="OutletShipmentReportsCheck" class="col-lg-3" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsRead" style="vertical-align: -2px" id="OutletShipmentReportsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-3" style="padding: 0px">
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsWrite" style="vertical-align: -2px" id="OutletShipmentReportsWrite"/>Write -->
		                                  </span>
		                           </div>
		                            <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;" >
	                              		  	<spring:message code="waste_management.reports.label" />
	                              		  </span>
	                              		  <span id="OutletWasteReportsCheck" class="col-lg-3" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsRead" style="vertical-align: -2px" id="OutletWasteReportsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-3" style="padding: 0px">
		                                  <!-- 	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsWrite" style="vertical-align: -2px" id="OutletWasteReportsWrite"/>Write -->
		                                  </span>
		                           </div>
		                            <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;" >
	                              		  	<spring:message code="expiry_management.reports.label" />
	                              		  </span>
	                              		  <span id="OutletExpiryReportsCheck" class="col-lg-3" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsRead" style="vertical-align: -2px" id="OutletExpiryReportsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-3" style="padding: 0px">
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsWrite" style="vertical-align: -2px" id="OutletExpiryReportsWrite"/>Write -->
		                                  </span>
		                           </div>
		                           <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;" >
	                              		  	<spring:message code="financial.reports.label" />
	                              		  </span>
	                              		  <span id="OutletFinancialReportsCheck" class="col-lg-3" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsRead" style="vertical-align: -2px" id="OutletFinancialReportsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-3" style="padding: 0px">
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsWrite" style="vertical-align: -2px" id="OutletFinancialReportsWrite"/>Write -->
		                                  </span>
		                           </div>
		                           
		                           <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;" >
	                              		  	<spring:message code="warehouse_stockverification.label" />
	                              		  </span>
	                              		  <span id="OutletStockVerificationReportsCheck" class="col-lg-3" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsRead" style="vertical-align: -2px" id="OutletStockVerificationReportsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-3" style="padding: 0px">
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsWrite" style="vertical-align: -2px" id="OutletFinancialReportsWrite"/>Write -->
		                                  </span>
		                           </div>
		                           
		                           <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;" >
	                              		  	<spring:message code="campaignmanagment.label" />
	                              		  </span>
	                              		  <span id="OutletDealsAndOffersReportsCheck" class="col-lg-3" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsRead" style="vertical-align: -2px" id="OutletDealsAndOffersReportsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-3" style="padding: 0px">
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsWrite" style="vertical-align: -2px" id="OutletFinancialReportsWrite"/>Write -->
		                                  </span>
		                           </div>
		                           
		                           <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;" >
	                              		  	<spring:message code="loyaltyprogram.label" />
	                              		  </span>
	                              		  <span id="OutletCRMReportsCheck" class="col-lg-3" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsRead" style="vertical-align: -2px" id="OutletCRMReportsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-3" style="padding: 0px">
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsWrite" style="vertical-align: -2px" id="OutletFinancialReportsWrite"/>Write -->
		                                  </span>
		                           </div>
		                           
		                         </div>
		                       </div>
		                   <c:if test="${sessionScope.warehouseLicense == true}">
                  			<br>
                               <div id="WarehouseReportsId"  class="row divbg" style="border: none">
                               	  <!-- <span class="col-lg-6"  onclick="activateSubFlow('WarehouseReports');" style="cursor: pointer;"> -->
                               	  <span class="col-lg-6"  style="cursor: pointer;">
	                              	<spring:message code="warehouse_management.reports.label" />
	                              </span>
	                              <span id="WarehouseReportsCheck" class="col-lg-3" style="padding: 0px">
                                  	<input type="checkbox" name="ReportsRead" style="vertical-align: -2px" onclick="selectAll('WarehouseReportsRead')" id="WarehouseReportsRead"/>Read
                                  </span>
                                  <span class="col-lg-3" style="padding: 0px">
                                  	<!-- <input type="checkbox" name="ReportsWrite" style="vertical-align: -2px" onclick="selectAll('WarehouseReportsWrite')" id="WarehouseReportsWrite"/>Write -->
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('WarehouseReports');" id="WarehouseReportsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                             </div>
                           </c:if>
                       </div>
                    --%>	
                    </div>
                   
                   <br><br>
                   <div class="form-group col-lg-12">
                   		 <div style="margin-top: -20px !important;"><label style="font-size: 17px;color: #666"><spring:message code="business.operations.label"/></label></div>
                   		  <hr style="margin-top: 4px;width: 99%;border-top: 1px solid rgb(181,230,29);" />
                   		  <div id="OutletManagementId"  class="row divbg" style="margin-top: 10px;">
                             <span class="col-lg-6" onclick="activate('OutletManagement');" style="font-size: 15px;cursor: pointer;">
                             	<spring:message code="outlet.management.label" />
                             </span>
                             <span id="OutletManagementCheck" class="col-lg-2" style="padding: 0px">
                              	<input type="checkbox" onclick="selectAll('OutletManagementRead')" style="vertical-align: -2px" value="Outlet Management" name="consoleRead" id="OutletManagementRead"/>Read
                             </span>
                             <span  class="col-lg-2" style="padding: 0px">
                              	<input type="checkbox" onclick="selectAll('OutletManagementWrite')" style="vertical-align: -2px" name="consoleWrite" id="OutletManagementWrite"/>Write
<%--                               	<img style="float: right;height: 20px;cursor: pointer;" onclick="activate('OutletManagement');" id="OutletManagementImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                             </span>
                               <span  class="col-lg-2" style="padding: 0px">
                              	<input type="checkbox" onclick="selectAll('OutletManagementCCTo')" style="vertical-align: -2px" name="consoleCCTo" id="OutletManagementCCTo"/>CC To
                              	<img style="float: right;height: 20px;cursor: pointer;" onclick="activate('OutletManagement');" id="OutletManagementImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                             </span>
                             </div>
	                   		 <div id="OutletManagementFlow" style="color:#666;background-color:rgb(240,240,240);margin-left: 2px;margin-right: 2px" class="inactiveBlock">
	                   		 <br>
	                   		   <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="configurations.label" />
                                  </span>
                                  <span id="ConfigurationCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px;" onclick="toggleCheckBox(this)" name="OutletManagementRead"  value="Configuration" id="ConfigurationRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="OutletManagementWrite"  id="ConfigurationWrite"/>Write
                                  </span>
                                    <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="OutletManagementCCTo"  id="ConfigurationCCTo"/>CC To
                                  </span>
                               </div>
                               <br>
                               
                               
                                     <div id="EventId" class="row divsubbg" style="border: none">
	                   			   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" onclick="activateSubFlow('outletCustomerOrders');">
                                  	 Event Management
                                  </span>
                                  <span id="EventCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="Event" name="OutletManagementRead" id="EventRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="OutletManagementWrite"  id="EventWrite"/>Write
<%--                                   	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('outletCustomerOrders');" id="outletCustomerOrdersImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                   <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="OutletManagementCCTo"  id="EventCCTo"/>CCTo
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('Event');" id="EventImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                                </div>
                                	<div style="margin-left:0%;">
		                              <div id="EventFlow" class="inactiveSubBlock" style="font-size: 12px">
		                              
		                              
		                                <br>
		                                     <div id="EventConfigureId"  class="row divsubbg" style="border: none">
		                               	  <span class="col-lg-6"  onclick="activateSubChildFlow('EventConfigure');" style="cursor: pointer;padding-left: 60px;">
			                              		Configure
			                              </span>
			                              <span id="EventConfigureCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="EventRead" style="vertical-align: -2px" id="EventConfigureRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="EventWrite" style="vertical-align: -2px" id="EventConfigureWrite"/>Write
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="EventCCTo" style="vertical-align: -2px" id="EventConfigureCCTo"/>CC To
		                                <img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('EventConfigure');" id="EventConfigureImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                                  </span>
		                                  
	                                  </div>
	                                  
		                                 <div style="margin-left:0%;">
		                              <div id="EventConfigureFlow" class="inactiveSubChildActivities" style="font-size: 12px">
		                                <br>
	                               		<div class="row divbg" style="border: none">
		                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                              		  	<spring:message code="activities.label" />
		                              		  </span>
		                              		  <span id="" class="col-lg-6" style="padding: 0px">
		                              		  	<select class="form-control activities" name="EventConfigure" multiple="multiple" id="EventConfigureActivities">
			                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
			                              		  	 <c:if test="${workflow.businessFlow == 'EventConfigure'}">
							                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
	                                 				</c:if>
	                                 				</c:forEach>
		                              		  	</select>
			                                  </span>
			                           </div>
			                           </div>
			                           </div>
			                           <br>
			                           <div id="EventMenuId"  class="row divsubbg" style="border: none">
		                               	  <span class="col-lg-6"  onclick="activateSubChildFlow('EventMenu');" style="cursor: pointer;padding-left: 60px;">
			                              		Menu
			                              </span>
			                              <span id="EventMenuCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="EventRead" style="vertical-align: -2px" id="EventMenuRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="EventWrite" style="vertical-align: -2px" id="EventMenuWrite"/>Write
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="EventCCTo" style="vertical-align: -2px" id="EventMenuCCTo"/>CC To
		                                <img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('EventMenu');" id="EventMenuImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                                  </span>
		                                  
	                                  </div>
	                                 
	                                  
	                                  <div style="margin-left:0%;">
		                              <div id="EventMenuFlow" class="inactiveSubChildActivities" style="font-size: 12px">
		                                <br>
	                               		<div class="row divbg" style="border: none">
		                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                              		  	<spring:message code="activities.label" />
		                              		  </span>
		                              		  <span id="" class="col-lg-6" style="padding: 0px">
		                              		  	<select class="form-control activities" name="EventMenu" multiple="multiple" id="EventMenuActivities">
			                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
			                              		  	 <c:if test="${workflow.businessFlow == 'EventMenu'}">
							                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
	                                 				</c:if>
	                                 				</c:forEach>
		                              		  	</select>
			                                  </span>
			                           </div>
			                           </div>
			                           </div>
			                           
			                           
			                                 <br>
			                           <div id="EventInventoryId"  class="row divsubbg" style="border: none">
		                               	  <span class="col-lg-6"  onclick="activateSubChildFlow('EventInventory');" style="cursor: pointer;padding-left: 60px;">
			                              		Inventory
			                              </span>
			                              <span id="EventInventoryCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="EventRead" style="vertical-align: -2px" id="EventInventoryRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="EventWrite" style="vertical-align: -2px" id="EventInventoryWrite"/>Write
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="EventCCTo" style="vertical-align: -2px" id="EventInventoryCCTo"/>CC To
		                                <img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('EventInventory');" id="EventInventoryImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                                  </span>
		                                  
	                                  </div>
	                                 
	                                  
	                                  <div style="margin-left:0%;">
		                              <div id="EventInventoryFlow" class="inactiveSubChildActivities" style="font-size: 12px">
		                                <br>
	                               		<div class="row divbg" style="border: none">
		                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                              		  	<spring:message code="activities.label" />
		                              		  </span>
		                              		  <span id="" class="col-lg-6" style="padding: 0px">
		                              		  	<select class="form-control activities" name="EventInventory" multiple="multiple" id="EventInventoryActivities">
			                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
			                              		  	 <c:if test="${workflow.businessFlow == 'EventInventory'}">
							                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
	                                 				</c:if>
	                                 				</c:forEach>
		                              		  	</select>
			                                  </span>
			                           </div>
			                           </div>
			                           </div>
			                           
			                                 <br>
			                           <div id="EventEquipmentId"  class="row divsubbg" style="border: none">
		                               	  <span class="col-lg-6"  onclick="activateSubChildFlow('EventEquipment');" style="cursor: pointer;padding-left: 60px;">
			                              		Equipment
			                              </span>
			                              <span id="EventEquipmentCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="EventRead" style="vertical-align: -2px" id="EventEquipmentRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="EventWrite" style="vertical-align: -2px" id="EventEquipmentWrite"/>Write
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="EventCCTo" style="vertical-align: -2px" id="EventEquipmentCCTo"/>CC To
		                                <img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('EventEquipment');" id="EventEquipmentImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                                  </span>
		                                  
	                                  </div>
	                                 
	                                  
	                                  <div style="margin-left:0%;">
		                              <div id="EventEquipmentFlow" class="inactiveSubChildActivities" style="font-size: 12px">
		                                <br>
	                               		<div class="row divbg" style="border: none">
		                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                              		  	<spring:message code="activities.label" />
		                              		  </span>
		                              		  <span id="" class="col-lg-6" style="padding: 0px">
		                              		  	<select class="form-control activities" name="EventEquipment" multiple="multiple" id="EventEquipmentActivities">
			                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
			                              		  	 <c:if test="${workflow.businessFlow == 'EventEquipment'}">
							                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
	                                 				</c:if>
	                                 				</c:forEach>
		                              		  	</select>
			                                  </span>
			                           </div>
			                           </div>
			                           </div>
			                           
			                                 <br>
			                           <div id="EventManpowerId"  class="row divsubbg" style="border: none">
		                               	  <span class="col-lg-6"  onclick="activateSubChildFlow('EventManpower');" style="cursor: pointer;padding-left: 60px;">
			                              		Man Power
			                              </span>
			                              <span id="EventManpowerCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="EventRead" style="vertical-align: -2px" id="EventManpowerRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="EventWrite" style="vertical-align: -2px" id="EventManpowerWrite"/>Write
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="EventCCTo" style="vertical-align: -2px" id="EventManpowerCCTo"/>CC To
		                                <img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('EventManpower');" id="EventManpowerImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                                  </span>
		                                  
	                                  </div>
	                                 
	                                  
	                                  <div style="margin-left:0%;">
		                              <div id="EventManpowerFlow" class="inactiveSubChildActivities" style="font-size: 12px">
		                                <br>
	                               		<div class="row divbg" style="border: none">
		                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                              		  	<spring:message code="activities.label" />
		                              		  </span>
		                              		  <span id="" class="col-lg-6" style="padding: 0px">
		                              		  	<select class="form-control activities" name="EventManpower" multiple="multiple" id="EventManpowerActivities">
			                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
			                              		  	 <c:if test="${workflow.businessFlow == 'EventManpower'}">
							                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
	                                 				</c:if>
	                                 				</c:forEach>
		                              		  	</select>
			                                  </span>
			                           </div>
			                           </div>
			                           </div>
			                           
			                            
		                              </div>
	                          		</div>
                               
                               
                                <!--  <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	 Event Management
                                  </span>
                                  <span id="OutletEventManagementCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px;" onclick="toggleCheckBox(this)" name="OutletManagementRead"  value="OutletEventManagement" id="OutletEventManagementRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="OutletManagementWrite"  id="OutletEventManagementWrite"/>Write
                                  </span>
                                    <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="OutletManagementCCTo"  id="OutletEventManagementCCTo"/>CC To
                                  </span>
                               </div> -->
                               <br>
                                <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="menu.label" />
                                  </span>
                                  <span id="MenuConfigurationsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px;" onclick="toggleCheckBox(this)" name="OutletManagementRead"  value="MenuConfigurations" id="MenuConfigurationsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="OutletManagementWrite"  id="MenuConfigurationsWrite"/>Write
                                  </span>
                                    <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="OutletManagementCCTo"  id="MenuConfigurationsCCTo"/>CC To
                                  </span>
                               </div>
                               
                               
                               <br>
                           	   <div class="row divsubbg" style="border: none">
                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="counter_master.label" />
                                  </span>
                                  <span id="CounterMasterCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="Counter Master" name="OutletManagementRead" id="CounterMasterRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="OutletManagementWrite"  id="CounterMasterWrite"/>Write
                                  </span>
                                   <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="OutletManagementCCTo"  id="CounterMasterCCTo"/>CC To
                                  </span>
                               </div> 
                               <br>
                               <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="taxation.label" />
                                  </span>
                                  <span id="TaxationCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px;" onclick="toggleCheckBox(this)" name="OutletManagementRead"  value="Taxation" id="TaxationRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="OutletManagementWrite"  id="TaxationWrite"/>Write
                                  </span>
                                         <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="OutletManagementCCTo"  id="TaxationCCTo"/>CC To
                                  </span>
                               </div>
                               <br>
                           	   <div class="row divsubbg" style="border: none">
                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="department.master.label" />
                                  </span>
                                  <span id="DepartmentsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="Counter Master" name="OutletManagementRead" id="DepartmentsOutletManagementRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="OutletManagementWrite"  id="DepartmentsOutletManagementWrite"/>Write
                                  </span>
                                   <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="OutletManagementCCTo"  id="DepartmentsOutletManagementCCTo"/>CC To
                                  </span>
                               </div> 
                               <br>
                               
                                <c:if test="${sessionScope.restaruntLicense == true}"> 
                               
                                <div id="RestaurentManagementId" class="row divsubbg" style="border: none;">
	                              <span  class="col-lg-6"  onclick="activateSubFlow('RestaurentManagement');" style="cursor: pointer;padding-left: 40px;">
	                              	<spring:message code="restaurentManagement.label" />
	                              </span>
	                              <span id="RestaurentManagementCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('RestaurentManagementRead');" value="Inventory Management" name="OutletManagementRead" id="RestaurentManagementRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="OutletManagementWrite" style="vertical-align: -2px" onclick="selectAll('RestaurentManagementWrite')" id="RestaurentManagementWrite"/>Write
<%--                                   	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('RestaurentManagement');" id="RestaurentManagementImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                    <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="OutletManagementCCTo" style="vertical-align: -2px" onclick="selectAll('RestaurentManagementCCTo')" id="RestaurentManagementCCTo"/>CC To
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('RestaurentManagement');" id="RestaurentManagementImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                                  </div>
                                  <div style="margin-left: 0%;">
	                               <div id="RestaurentManagementFlow" class="inactiveSubBlock" style="font-size: 12px;background-color: rgb(240,240,240)">
	                            	<br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="bookings.label" />
	                              		  </span>
	                              		  <span id="RestaurentManagementBookingsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="RestaurentManagementRead" style="vertical-align: -2px" id="RestaurentManagementBookingsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="RestaurentManagementWrite" style="vertical-align: -2px" id="RestaurentManagementBookingsWrite"/>Write
		                                  </span>
		                                    <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="RestaurentManagementCCTo" style="vertical-align: -2px" id="RestaurentManagementBookingsCCTo"/>CC To
		                                  </span>
		                           </div>
		                    	  <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="restaurant.takeaway.label" />
	                              		  </span>
	                              		  <span id="RestaurentManagementTakeawayCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="RestaurentManagementRead" style="vertical-align: -2px" id="RestaurentManagementTakeawayRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="RestaurentManagementWrite" style="vertical-align: -2px" id="RestaurentManagementTakeawayWrite"/>Write
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="RestaurentManagementCCTo" style="vertical-align: -2px" id="RestaurentManagementTakeawayCCTo"/>CC To
		                                  </span>
		                           </div>
		                           <br>
                               		
		                      </div>
	                          </div>
                               
                               <br>
                               
                               </c:if>
                               
                               	<div id="ShiftManagementId" class="row divsubbg" style="border: none;">
	                              <span  class="col-lg-6"  onclick="activateSubFlow('ShiftManagement');" style="cursor: pointer;padding-left: 40px;">
	                              	<spring:message code="shift.management.label" />
	                              </span>
	                              <span id="ShiftManagementCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('ShiftManagementRead');" value="Inventory Management" name="OutletManagementRead" id="ShiftManagementRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="OutletManagementWrite" style="vertical-align: -2px" onclick="selectAll('ShiftManagementWrite')" id="ShiftManagementWrite"/>Write
<%--                                   	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('ShiftManagement');" id="ShiftManagementImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                      <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="OutletManagementCCTo" style="vertical-align: -2px" onclick="selectAll('ShiftManagementCCTo')" id="ShiftManagementCCTo"/>CC To
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('ShiftManagement');" id="ShiftManagementImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                                  </div>
                                  <div style="margin-left: 0%;">
	                              <div id="ShiftManagementFlow" class="inactiveSubBlock" style="font-size: 12px">
	                                <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="shift.master.label" />
	                              		  </span>
	                              		  <span id="ShiftMasterCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="ShiftManagementRead" value="Stocks" style="vertical-align: -2px" id="ShiftMasterRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="ShiftManagementWrite" style="vertical-align: -2px"  id="ShiftMasterWrite"/>Write
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="ShiftManagementCCTo" style="vertical-align: -2px"  id="ShiftMasterCCTo"/>CC To
		                                  </span>
		                           </div>
		                           <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="shift.configuration.label" />
	                              		  </span>
	                              		  <span id="ShiftConfigurationCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="ShiftManagementRead" value="Stocks" style="vertical-align: -2px" id="ShiftConfigurationRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="ShiftManagementWrite" style="vertical-align: -2px"  id="ShiftConfigurationWrite"/>Write
		                                  </span>
		                                      <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="ShiftManagementCCTo" style="vertical-align: -2px"  id="ShiftConfigurationCCTo"/>CC To
		                                  </span>
		                           </div>
                                </div>
	                          </div>
	                          <br>
	                           
	                             <div id="OutletMonitoringId" class="row divsubbg" style="border: none;">
	                              <span  class="col-lg-6"  onclick="activateSubFlow('OutletMonitoring');" style="cursor: pointer;padding-left: 40px;">
	                              	<spring:message code="outletmonitoring.label" />
	                              </span>
	                              <span id="OutletMonitoringCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('OutletMonitoringRead');" value="Inventory Management" name="OutletManagementRead" id="OutletMonitoringRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="OutletManagementWrite" style="vertical-align: -2px" onclick="selectAll('OutletMonitoringWrite')" id="OutletMonitoringWrite"/>Write
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('OutletMonitoring');" id="ShiftManagementImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                                      <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="OutletManagementCCTo" style="vertical-align: -2px" onclick="selectAll('OutletMonitoringCCTo')" id="OutletMonitoringCCTo"/>CC To
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('OutletMonitoring');" id="OutletMonitoringImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                                  </div>
                                  <div style="margin-left: 0%;">
	                              <div id="OutletMonitoringFlow" class="inactiveSubBlock" style="font-size: 12px">
	                                <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  <spring:message code="outletsVedio.label" />
	                              		  </span>
	                              		  <span id="OutletVedioStatusCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletMonitoringRead" value="Stocks" style="vertical-align: -2px" id="OutletVedioStatusRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletMonitoringWrite" style="vertical-align: -2px"  id="OutletVedioStatusWrite"/>Write
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletMonitoringCCTo" style="vertical-align: -2px"  id="OutletVedioStatusCCTo"/>CC To
		                                  </span>
		                           </div>
		                           
		                           
		                           <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  <spring:message code="outlet.tracking.label" />
	                              		  </span>
	                              		  <span id="OutletTrackingCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletMonitoringRead" value="Stocks" style="vertical-align: -2px" id="OutletTrackingRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletMonitoringWrite" style="vertical-align: -2px"  id="OutletTrackingWrite"/>Write
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletMonitoringCCTo" style="vertical-align: -2px"  id="OutletTrackingCCTo"/>CC To
		                                  </span>
		                           </div>
		                           
		                           <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="outletSynchStatus.label" />
	                              		  </span>
	                              		  <span id="OutletSynchStatusMonitoringCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletMonitoringRead"  style="vertical-align: -2px" id="OutletSynchStatusMonitoringRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletMonitoringWrite" style="vertical-align: -2px"  id="OutletSynchStatusMonitoringWrite"/>Write
		                                  </span>
		                                      <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletMonitoringCCTo" style="vertical-align: -2px"  id="OutletSynchStatusMonitoringCCTo"/>CC To
		                                  </span>
		                           </div>
		                           
		                           <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="outlet.log.label" />
	                              		  </span>
	                              		  <span id="OutletSynchStatusCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletMonitoringRead" value="Stocks" style="vertical-align: -2px" id="OutletSynchStatusRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletMonitoringWrite" style="vertical-align: -2px"  id="OutletSynchStatusWrite"/>Write
		                                  </span>
		                                      <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletMonitoringCCTo" style="vertical-align: -2px"  id="OutletSynchStatusCCTo"/>CC To
		                                  </span>
		                           </div>
		                           
		                           
		                            <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="user.log.label" />
	                              		  </span>
	                              		  <span id="OutletMonitoringUserLogCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletMonitoringRead"  style="vertical-align: -2px" id="OutletMonitoringUserLogRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletMonitoringWrite" style="vertical-align: -2px"  id="OutletMonitoringUserLogWrite"/>Write
		                                  </span>
		                                      <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletMonitoringCCTo" style="vertical-align: -2px"  id="OutletMonitoringUserLogCCTo"/>CC To
		                                  </span>
		                           </div>
		                           
                                </div>
	                          </div>
	                          
	                            <%--  <br>
                           	   <div class="row divsubbg" style="border: none">
                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="outletmonitoring.label" />
                                  </span>
                                  <span id="OutletMonitoringCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="OutletMonitoring" name="OutletManagementRead" id="OutletMonitoringRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="OutletManagementWrite"  id="OutletMonitoringWrite"/>Write
                                  </span>
                                     <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="OutletManagementCCTo"  id="OutletMonitoringCCTo"/>CC To
                                  </span>
                               </div> --%>
                             <br>
                              <div class="row divsubbg" style="border: none">
                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="day.open.label" />
                                  </span>
                                  <span id="DaysOpenCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="DaysOpen" name="OutletManagementRead" id="DaysOpenRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="OutletManagementWrite"  id="DaysOpenWrite"/>Write
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="OutletManagementCCTo"  id="DaysOpenCCTo"/>CCTo
                                  </span>
                               </div>
                                <br>
                              <div class="row divsubbg" style="border: none">
                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="day.close.label" />
                                  </span>
                                  <span id="DaysCloseCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="DaysClose" name="OutletManagementRead" id="DaysCloseRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="OutletManagementWrite"  id="DaysCloseWrite"/>Write
                                  </span>
                                   <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="OutletManagementCCTo"  id="DaysCloseCCTo"/>CC To
                                  </span>
                               </div>
                               <br>
                               <div class="row divsubbg" style="border: none">
	                   			  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="billing.payment.label" />
                                  </span>
                                  <span id="BillingAndPaymentsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="Billing And Payments" name="OutletManagementRead" id="BillingAndPaymentsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="OutletManagementWrite"  id="BillingAndPaymentsWrite"/>Write
                                  </span>
                                       <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="OutletManagementCCTo"  id="BillingAndPaymentsCCTo"/>CC To
                                  </span>
                                </div>
                                <br>
                                <div id="outletCustomerOrdersId" class="row divsubbg" style="border: none">
	                   			   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" onclick="activateSubFlow('outletCustomerOrders');">
                                  	<spring:message code="customer.label" /> <spring:message code="orders.label" />
                                  </span>
                                  <span id="outletCustomerOrdersCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="outletCustomerOrders" name="OutletManagementRead" id="outletCustomerOrdersRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="OutletManagementWrite"  id="outletCustomerOrdersWrite"/>Write
<%--                                   	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('outletCustomerOrders');" id="outletCustomerOrdersImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                   <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="OutletManagementCCTo"  id="outletCustomerOrdersCCTo"/>CCTo
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('outletCustomerOrders');" id="outletCustomerOrdersImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                                </div>
                                	<div style="margin-left:0%;">
		                              <div id="outletCustomerOrdersFlow" class="inactiveSubBlock" style="font-size: 12px">
		                                <br>
	                               		<div class="row divbg" style="border: none">
		                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                              		  	<spring:message code="activities.label" />
		                              		  </span>
		                              		  <span id="" class="col-lg-6" style="padding: 0px">
		                              		  	<select class="form-control activities" name="outletCustomerOrders" multiple="multiple" id="outletCustomerOrdersActivities">
			                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
							                            <c:if test="${workflow.businessFlow == 'Order'}">
							                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
							                            </c:if>
	                                 				</c:forEach>
		                              		  	</select>
			                                  </span>
			                           </div>
		                              </div>
	                          		</div>
                               <%--  <br>
                                <div class="row divsubbg" style="border: none">
	                              <span class="col-lg-6" style="cursor: pointer;" onclick="activateSubFlow('OutletShipments');">
                                  	<spring:message code="deliveries.label" />
                                  </span>
                                  <span id="OutletShipmentsCheck" class="col-lg-3" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('OutletShipmentsRead')" value="OutletShipments" name="OutletManagementRead" id="OutletShipmentsRead"/>Read
                                  </span>
                                  <span class="col-lg-3" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('OutletShipmentsWrite')" name="OutletManagementWrite"  id="OutletShipmentsWrite"/>Write
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('OutletShipments');" id="OutletShipmentsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                                </div>
                                <div style="margin-left:0%;">
		                            <div id="OutletShipmentsFlow" class="inactiveSubBlock" style="font-size: 12px">
		                            	<br>
	                               		<div class="row divbg" style="border: none">
		                              		  <span class="col-lg-6" style="cursor: pointer;" >
		                              		  	<spring:message code="activities.label" />
		                              		  </span>
		                              		  <span id="" class="col-lg-6" style="padding: 0px">
		                              		  	<select class="form-control activities" name="OutletShipments" multiple="multiple" id="OutletShipmentsActivities">
			                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
							                            <c:if test="${workflow.businessFlow == 'Shipment'}">
							                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
							                            </c:if>
	                                 				</c:forEach>
		                              		  	</select>
			                                  </span>
			                           </div>
		                         </div>
	                          </div> --%>
                                <br>
                               	<div id="InventoryManagementId" class="row divsubbg" style="border: none;">
	                              <span  class="col-lg-6"  onclick="activateSubFlow('InventoryManagement');" style="cursor: pointer;padding-left: 40px;">
	                              	<spring:message code="inventory.management.label" />
	                              </span>
	                              <span id="InventoryManagementCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('InventoryManagementRead');" value="Inventory Management" name="OutletManagementRead" id="InventoryManagementRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="OutletManagementWrite" style="vertical-align: -2px" onclick="selectAll('InventoryManagementWrite')" id="InventoryManagementWrite"/>Write
<%--                                   	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('InventoryManagement');" id="InventoryManagementImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="OutletManagementCCTo" style="vertical-align: -2px" onclick="selectAll('InventoryManagementCCTo')" id="InventoryManagementCCTo"/>CC To
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('InventoryManagement');" id="InventoryManagementImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                               </div>
                               <div style="margin-left: 0%;">
	                             <div id="InventoryManagementFlow" class="inactiveSubBlock" style="font-size: 12px">
	                                <%-- <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;" >
	                              		  	<spring:message code="stocks.label" />
	                              		  </span>
	                              		  <span id="OutletStocksCheck" class="col-lg-3" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="InventoryManagementRead" value="Stocks" style="vertical-align: -2px" id="OutletStocksRead"/>Read
		                                  </span>
		                                  <span class="col-lg-3" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="InventoryManagementWrite" style="vertical-align: -2px"  id="OutletStocksWrite"/>Write
		                                  </span>
		                           </div> --%>
		                           <br>
		                                <div id="OutletStocksId"  class="row divsubbg" style="border: none">
		                               	  <span class="col-lg-6"  onclick="activateSubChildFlow('OutletStocks');" style="cursor: pointer;padding-left: 60px;">
			                              		<spring:message code="stocks.label" />
			                              </span>
			                              <span id="OutletStocksCheck" class="col-lg-2" style="padding: 0px">
		                                  		<input type="checkbox" name="InventoryManagementRead" style="vertical-align: -2px" onclick="selectAll('OutletStocksRead')" id="OutletStocksRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
<%-- 		                                  		<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('OutletStocks');" id="OutletStocksImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  		<input type="checkbox" name="InventoryManagementCCTo" style="vertical-align: -2px" onclick="selectAll('OutletStocksCCTo')" id="OutletStocksCCTo"/>CC To
		                                  				                                  		<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('OutletStocks');" id="OutletStocksImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                                  		
		                                  </span>
	                                  </div>
	                                  <div style="margin-left: 0%;">
			                              <div id="OutletStocksFlow" class="inactiveSubChildBlock" style="font-size: 10px;background-color: rgb(240,240,240)">
				                                <br>
			                               		<div class="row divsubchildbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="availablestock.label" />
				                              		  </span>
				                              		  <span id="OutletAvailableStockCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletStocksRead" style="vertical-align: -2px" id="OutletAvailableStockRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                   <span id="" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletStocksCCTo" style="vertical-align: -2px" id="OutletAvailableStockCCTo"/>CC To
					                                  </span>
					                           </div>
					                           
					                           <br>
					                           
					                           <div class="row divsubchildbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="day.wise.stock.label" />
				                              		  </span>
				                              		  <span id="OutletDayWiseStockCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletStocksRead" style="vertical-align: -2px" id="OutletDayWiseStockRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                   <span id="" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletStocksCCTo" style="vertical-align: -2px" id="OutletDayWiseStockCCTo"/>CC To
					                                  </span>
					                           </div>
					                           <br>
					                           
					                            <div class="row divsubchildbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="day.wise.stock.history.label" />
				                              		  </span>
				                              		  <span id="OutletDayWiseStockHistoryCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletStocksRead" style="vertical-align: -2px" id="OutletDayWiseStockHistoryRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                   <span id="" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletStocksCCTo" style="vertical-align: -2px" id="OutletDayWiseStockHistoryCCTo"/>CC To
					                                  </span>
					                           </div>
					                           <br>
					                           
					                           
		                           				<div class="row divsubchildbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="orderedstock.label" />
				                              		  </span>
				                              		  <span id="OutletOrderedStockCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletStocksRead" style="vertical-align: -2px" id="OutletOrderedStockRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                   <span id="" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletStocksCCTo" style="vertical-align: -2px" id="OutletOrderedStockCCTo"/>CC To
					                                  </span>
					                           </div>
					                           <br>
		                           				<div class="row divsubchildbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="criticalstock.label" />
				                              		  </span>
				                              		  <span id="OutletCriticalStockCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletStocksRead" style="vertical-align: -2px" id="OutletCriticalStockRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                  <span id="" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletStocksCCTo" style="vertical-align: -2px" id="OutletCriticalStockCCTo"/>CC To
					                                  </span>
					                           </div>
					                           <br>
		                           				<div class="row divsubchildbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="blockedstock.label" />
				                              		  </span>
				                              		  <span id="OutletBlockedStockCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletStocksRead" style="vertical-align: -2px" id="OutletBlockedStockRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletStocksCCTo" style="vertical-align: -2px" id="OutletBlockedStockCCTo"/>CC To
					                                  </span>
					                           </div>
					                           <br>
		                           				<div class="row divsubchildbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="returnedstock.label" />
				                              		  </span>
				                              		  <span id="OutletReturnedStockCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletStocksRead" style="vertical-align: -2px" id="OutletReturnedStockRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletStocksCCTo" style="vertical-align: -2px" id="OutletReturnedStockCCTo"/>CC To
					                                  </span>
					                           </div>
					                           <br>
		                           				<div class="row divsubchildbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="boneyard.label" />
				                              		  </span>
				                              		  <span id="OutletBoneyardStockCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletStocksRead" style="vertical-align: -2px" id="OutletBoneyardStockRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletStocksCCTo" style="vertical-align: -2px" id="OutletBoneyardStockCCTo"/>CC To
					                                  </span>
					                           </div>
		                           		</div>
		                           	</div>
		                           <br>
		                                <div id="OutletGoodsTransferId"  class="row divsubbg" style="border: none">
		                               	  <span class="col-lg-6"  onclick="activateSubChildFlow('OutletGoodsTransfer');" style="cursor: pointer;padding-left: 60px;">
			                              		<spring:message code="goods.transfer.label" />
			                              </span>
			                              <span id="OutletGoodsTransferCheck" class="col-lg-2" style="padding: 0px">
		                                  		<input type="checkbox" name="InventoryManagementRead" style="vertical-align: -2px" onclick="selectAll('OutletGoodsTransferRead')" id="OutletGoodsTransferRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  		<input type="checkbox" name="InventoryManagementWrite" style="vertical-align: -2px" onclick="selectAll('OutletGoodsTransferWrite')" id="OutletGoodsTransferWrite"/>Write
<%-- 		                                  		<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('OutletGoodsTransfer');" id="OutletGoodsTransferImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  		<input type="checkbox" name="InventoryManagementCCTo" style="vertical-align: -2px" onclick="selectAll('OutletGoodsTransferCCTo')" id="OutletGoodsTransferCCTo"/>CC To
		                                  		<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('OutletGoodsTransfer');" id="OutletGoodsTransferImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                                  </span>
	                                  </div>
	                                  <div style="margin-left: 0%;">
			                              <div id="OutletGoodsTransferFlow" class="inactiveSubChildBlock" style="font-size: 10px;background-color: rgb(240,240,240)">
		                           			  <br>
				                             <div id="StockReceiptId" class="row divsubchildactivitiesbg" style="border: none">
			                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" onclick="activateSubChildActivities('StockReceipt');" >
			                              		  	<spring:message code="goodsreceipts.label" />
			                              		  </span>
			                              		  <span id="StockReceiptCheck" class="col-lg-2" style="padding: 0px">
				                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletGoodsTransferRead" style="vertical-align: -2px" id="StockReceiptRead"/>Read
				                                  </span>
				                                  <span class="col-lg-2" style="padding: 0px">
				                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletGoodsTransferWrite" style="vertical-align: -2px" id="StockReceiptWrite"/>Write
<%-- 				                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('OutletStockReceipt');" id="OutletStockReceiptImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
				                                  </span>
				                                     <span class="col-lg-2" style="padding: 0px">
				                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletGoodsTransferCCTo" style="vertical-align: -2px" id="StockReceiptCCTo"/>CC To
				                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('StockReceipt');" id="StockReceiptImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
				                                  </span>
				                             </div>
						                       <div style="margin-left: 0%">
						                       		<div id="StockReceiptFlow" class="inactiveSubChildActivities" style="font-size: 10px;background-color: rgb(240,240,240)">
						                       			<br>
						                       			<div class="row divbg" style="border: none">
						                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 100px;" >
						                              		  	<spring:message code="activities.label" />
						                              		  </span>
						                              		  <span id="" class="col-lg-6" style="padding: 0px">
						                              		  	<select class="form-control activities" name="StockReceipt" multiple="multiple" id="StockReceiptActivities">
							                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
											                            <c:if test="${workflow.businessFlow == 'Stock Receipt'}">
											                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
											                            </c:if>
					                                 				</c:forEach>
						                              		  	</select>
							                                  </span>
							                           </div>
						                       		</div>
						                       </div>
	                               		
		                           		<br>	
		                           		
		                           		
		                           		 <div id="OutletGRNId" class="row divsubchildactivitiesbg" style="border: none">
			                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" onclick="activateSubChildActivities('OutletGRN');" >
			                              		  	<spring:message code="outlet.grn.label" />
			                              		  </span>
			                              		  <span id="OutletGRNCheck" class="col-lg-2" style="padding: 0px">
				                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletGoodsTransferRead" style="vertical-align: -2px" id="OutletGRNRead"/>Read
				                                  </span>
				                                  <span class="col-lg-2" style="padding: 0px">
				                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletGoodsTransferWrite" style="vertical-align: -2px" id="OutletGRNWrite"/>Write
<%-- 				                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('OutletGRN');" id="OutletGRNImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
				                                  </span>
				                                    <span class="col-lg-2" style="padding: 0px">
				                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletGoodsTransferCCTo" style="vertical-align: -2px" id="OutletGRNCCTo"/>CC To
				                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('OutletGRN');" id="OutletGRNImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
				                                  </span>
				                             </div>
						                       <div style="margin-left: 0%">
						                       		<div id="OutletGRNFlow" class="inactiveSubChildActivities" style="font-size: 10px;">
						                       			<br>
						                       			<div class="row divbg" style="border: none">
						                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 100px;" >
						                              		  	<spring:message code="activities.label" />
						                              		  </span>
						                              		  <span id="" class="col-lg-6" style="padding: 0px">
						                              		  	<select class="form-control activities" name="OutletGRN" multiple="multiple" id="OutletGRNActivities">
							                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
											                            <c:if test="${workflow.businessFlow == 'Outlet GRN'}">
											                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
											                            </c:if>
					                                 				</c:forEach>
						                              		  	</select>
							                                  </span>
							                           </div>
						                       		</div>
						                       </div>
	                               		
		                           		<br>	
			                             <div id="OutletStockIssueId" class="row divsubchildactivitiesbg" style="border: none">
		                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;"  onclick="activateSubChildActivities('OutletStockIssue');">
		                              		  	<spring:message code="goodsindent.label" />
		                              		  </span>
		                              		  <span id="OutletStockIssueCheck" class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletGoodsTransferRead" style="vertical-align: -2px" id="OutletStockIssueRead"/>Read
			                                  </span>
			                                  <span class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletGoodsTransferWrite" style="vertical-align: -2px" id="OutletStockIssueWrite"/>Write
<%-- 			                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('OutletStockIssue');" id="OutletStockIssueImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
			                                  </span>
			                                     <span class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletGoodsTransferCCTo" style="vertical-align: -2px" id="OutletStockIssueCCTo"/>CC To
			                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('OutletStockIssue');" id="OutletStockIssueImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
			                                  </span>
			                             </div>
			                             <div style="margin-left: 0%">
						                      <div id="OutletStockIssueFlow" class="inactiveSubChildActivities" style="font-size: 10px;background-color: rgb(240,240,240)">
						                       		<br>
						                             <div class="row divbg" style="border: none">
					                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 100px;" >
					                              		  	<spring:message code="activities.label" />
					                              		  </span>
					                              		  <span id="" class="col-lg-6" style="padding: 0px">
					                              		  	<select class="form-control activities" name="OutletStockIssue" multiple="multiple" id="OutletStockIssueActivities">
						                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
										                            <c:if test="${workflow.businessFlow == 'Stock Issue'}">
										                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
										                            </c:if>
				                                 				</c:forEach>
					                              		  	</select>
						                                  </span>
						                           </div>
						                       </div>
						                  </div>
			                           
			                             <br>
	                               		<div id="OutletStockRequestId" class="row divsubchildactivitiesbg" style="border: none">
		                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" onclick="activateSubChildActivities('OutletStockRequest');">
		                              		  	<spring:message code="outlet.stock.request.label" />
		                              		  </span>
		                              		  <span id="OutletStockRequestCheck" class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletGoodsTransferRead" style="vertical-align: -2px" id="OutletStockRequestRead"/>Read
			                                  </span>
			                                  <span class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletGoodsTransferWrite" style="vertical-align: -2px"  id="OutletStockRequestWrite"/>Write
<%-- 			                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('OutletStockRequest');" id="OutletStockRequestImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
			                                  </span>
			                                  <span class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletGoodsTransferCCTo" style="vertical-align: -2px"  id="OutletStockRequestCCTo"/>CC To
			                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('OutletStockRequest');" id="OutletStockRequestImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
			                                  </span>
			                           </div>
			                           <div style="margin-left: 0%">
						                      <div id="OutletStockRequestFlow" class="inactiveSubChildActivities" style="font-size: 10px;background-color: rgb(240,240,240)">
						                       		<br>
						                           <div class="row divbg" style="border: none">
					                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 100px;" >
					                              		  	<spring:message code="activities.label" />
					                              		  </span>
					                              		  <span id="" class="col-lg-6" style="padding: 0px">
					                              		  	<select class="form-control activities" name="OutletStockRequest" multiple="multiple" id="OutletStockRequestActivities">
						                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
										                            <c:if test="${workflow.businessFlow == 'Stock Request'}">
										                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
										                            </c:if>
				                                 				</c:forEach>
					                              		  	</select>
						                                  </span>
						                           </div>
						                        </div>
						                 </div>
						                 
						                  <div style="margin-left: 0%">
						                      <div id="OutletStockRequestFlow" class="inactiveSubChildActivities" style="font-size: 10px;background-color: rgb(248,248,248)">
						                       		<br>
						                           <div class="row divbg" style="border: none">
					                              		  <span class="col-lg-6" style="cursor: pointer;" >
					                              		  	<spring:message code="activities.label" />
					                              		  </span>
					                              		  <span id="" class="col-lg-6" style="padding: 0px">
					                              		  	<select class="form-control activities" name="OutletStockRequest" multiple="multiple" id="OutletStockRequestActivities">
						                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
										                            <c:if test="${workflow.businessFlow == 'Stock Request'}">
										                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
										                            </c:if>
				                                 				</c:forEach>
					                              		  	</select>
						                                  </span>
						                           </div>
						                        </div>
						                 </div>
		                           	 <br>
		                           	 
		                           	   <div id="OutletStockRequestoutId" class="row divsubchildactivitiesbg" style="border: none">
		                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" onclick="activateSubChildActivities('OutletStockRequestout');">
		                              		  	<spring:message code="outlet.stock.request.label" /> -Out
		                              		  </span>
		                              		  <span id="OutletStockRequestoutCheck" class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletGoodsTransferRead" style="vertical-align: -2px" id="OutletStockRequestoutRead"/>Read
			                                  </span>
			                                  <span class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletGoodsTransferWrite" style="vertical-align: -2px"  id="OutletStockRequestoutWrite"/>Write
<%-- 			                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('OutletStockRequest');" id="OutletStockRequestImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
			                                  </span>
			                                  <span class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletGoodsTransferCCTo" style="vertical-align: -2px"  id="OutletStockRequestoutCCTo"/>CC To
			                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('OutletStockRequestout');" id="OutletStockRequestoutImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
			                                  </span>
			                           </div>
			                           <div style="margin-left: 0%">
						                      <div id="OutletStockRequestoutFlow" class="inactiveSubChildActivities" style="font-size: 10px;background-color: rgb(240,240,240)">
						                       		<br>
						                           <div class="row divbg" style="border: none">
					                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 100px;" >
					                              		  	<spring:message code="activities.label" />
					                              		  </span>
					                              		  <span id="" class="col-lg-6" style="padding: 0px">
					                              		  	<select class="form-control activities" name="OutletStockRequestout" multiple="multiple" id="OutletStockRequestoutActivities">
						                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
										                            <c:if test="${workflow.businessFlow == 'Stock Request'}">
										                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
										                            </c:if>
				                                 				</c:forEach>
					                              		  	</select>
						                                  </span>
						                           </div>
						                        </div>
						                 </div>
						                 
						                  <div style="margin-left: 0%">
						                      <div id="OutletStockRequestoutFlow" class="inactiveSubChildActivities" style="font-size: 10px;background-color: rgb(248,248,248)">
						                       		<br>
						                           <div class="row divbg" style="border: none">
					                              		  <span class="col-lg-6" style="cursor: pointer;" >
					                              		  	<spring:message code="activities.label" />
					                              		  </span>
					                              		  <span id="" class="col-lg-6" style="padding: 0px">
					                              		  	<select class="form-control activities" name="OutletStockRequestout" multiple="multiple" id="OutletStockRequestoutActivities">
						                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
										                            <c:if test="${workflow.businessFlow == 'Stock Request'}">
										                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
										                            </c:if>
				                                 				</c:forEach>
					                              		  	</select>
						                                  </span>
						                           </div>
						                        </div>
						                 </div>
						                 
						                 <br>
	                                <div id="OutletStockReturnId" class="row divsubchildactivitiesbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;"  onclick="activateSubChildActivities('OutletStockReturn');">
	                              		  	<spring:message code="stock.return.label" />
	                              		  </span>
	                              		  <span id="OutletStockReturnCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletGoodsTransferRead" style="vertical-align: -2px" id="OutletStockReturnRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletGoodsTransferWrite" style="vertical-align: -2px" id="OutletStockReturnWrite"/>Write
<%-- 		                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('OutletStockReturn');" id="OutletStockReturnImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletGoodsTransferCCTo" style="vertical-align: -2px" id="OutletStockReturnCCTo"/>CC To
		                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('OutletStockReturn');" id="OutletStockReturnImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                                  </span>
		                             </div>
		                             <div style="margin-left: 0%">
						                 <div id="OutletStockReturnFlow" class="inactiveSubChildActivities" style="font-size: 10px;background-color: rgb(240,240,240)">
						                	<br>
				                             <div class="row divbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 100px;" >
				                              		  	<spring:message code="activities.label" />
				                              		  </span>
				                              		  <span id="" class="col-lg-6" style="padding: 0px">
				                              		  	<select class="form-control activities" name="OutletStockReturn" multiple="multiple" id="OutletStockReturnActivities">
					                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
									                            <c:if test="${workflow.businessFlow == 'Stock Return'}">
									                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
									                            </c:if>
			                                 				</c:forEach>
				                              		  	</select>
					                                  </span>
					                           </div>
					                        </div>
					                  </div>
		                           </div>
		                         </div>
		                           <br>
		                             <div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px" >
	                              		  	<spring:message code="material.consumption.label" />
	                              		  </span>
	                              		  <span id="OutletMaterialConsumptionCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="InventoryManagementRead" style="vertical-align: -2px" id="OutletMaterialConsumptionRead"/>Read
		                                  </span>
		                                  <span id="" class="col-lg-2" style="padding: 0px">
		                                  </span>
		                                   <span id="" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="InventoryManagementCCTo" style="vertical-align: -2px" id="OutletMaterialConsumptionCCTo"/>CC To
		                                  </span>
		                                
		                           </div>
		                          <br>
		                            <div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px" >
	                              		  	<spring:message code="stockmovement.label" />
	                              		  </span>
	                              		  <span id="OutletStockMovementCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="InventoryManagementRead" style="vertical-align: -2px" id="OutletStockMovementRead"/>Read
		                                  </span>
		                                       <span id="" class="col-lg-2" style="padding: 0px">
		                                  </span>
		                                   <span id="" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="InventoryManagementCCTo" style="vertical-align: -2px" id="OutletStockMovementCCTo"/>CC To
		                                  </span>
		                                
		                           </div>
		                          <br>
		                            <div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px" >
	                              		  	<spring:message code="suppliers.movements.label" />
	                              		  </span>
	                              		  <span id="OutletSuppliersMovementsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="InventoryManagementRead" style="vertical-align: -2px" id="OutletSuppliersMovementsRead"/>Read
		                                  </span>
		                                  
		                                       <span id="" class="col-lg-2" style="padding: 0px">
		                                  </span>
		                                   <span id="" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="InventoryManagementCCTo" style="vertical-align: -2px" id="OutletSuppliersMovementsCCTo"/>CC To
		                                  </span>
		                                  
		                                
		                           </div>
		                          <br>
		                          
		                                <div id="OutletStockVerificationsId" class="row divsubbg" style="border: none;">
	                              <span  class="col-lg-6"  onclick="activateSubChildFlow('OutletStockVerifications');" style="cursor: pointer;padding-left: 60px;">
	                              	<spring:message code="stock.verification.label" />
	                              </span>
	                              <span id="OutletStockVerificationsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('OutletStockVerificationsRead');" name="InventoryManagementRead" id="OutletStockVerificationsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="InventoryManagementWrite" style="vertical-align: -2px" onclick="selectAll('OutletStockVerificationsWrite')" id="OutletStockVerificationsWrite"/>Write
<%--                                   	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('RestaurentManagement');" id="RestaurentManagementImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                    <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="InventoryManagementCCTo" style="vertical-align: -2px" onclick="selectAll('OutletStockVerificationsCCTo')" id="OutletStockVerificationsCCTo"/>CC To
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('OutletStockVerifications');" id="OutletStockVerificationsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                                  </div>
                                  
                                  <div style="margin-left: 0%;">
	                            <div id="OutletStockVerificationsFlow" class="inactiveSubChildBlock" style="font-size: 12px;background-color: rgb(240,240,240)">
		                          <br>
	                                <div class="row divsubchildbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 60px" >
	                              		  	<spring:message code="stock.verification.master" />
	                              		  </span>
	                              		  <span id="OutletStockVerificationCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletStockVerificationsRead" style="vertical-align: -2px" id="OutletStockVerificationRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletStockVerificationsWrite" style="vertical-align: -2px" id="OutletStockVerificationWrite"/>Write
		                                  </span>
		                               
		                                   <span id="" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletStockVerificationsCCTo" style="vertical-align: -2px" id="OutletStockVerificationCCTo"/>CC To
		                                  </span>
		                             </div>  
		                             
		                             
		                             <br>
	                            <%--     <div class="row divsubchildbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 60px" >
	                              		  	<spring:message code="stock.verification.label" />
	                              		  </span>
	                              		  <span id="OutletVerficationStocksCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletStockVerificationsRead" style="vertical-align: -2px" id="OutletVerficationStocksRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletStockVerificationsWrite" style="vertical-align: -2px"id="OutletVerficationStocksWrite"/>Write
		                                  </span>
		                               
		                                   <span id="" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletStockVerificationsCCTo" style="vertical-align: -2px" id="OutletVerficationStocksCCTo"/>CC To
		                                   <img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('OutletVerficationStocks');" id="OutletVerficationStocksImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                                  
		                                  </span>
		                             </div>  
		                             
		                             
		                             <div style="margin-left:0%;">
		                              <div id="OutletVerficationStocksFlow" class="inactiveSubChildActivities" style="font-size: 12px">
		                                <br>
	                               		<div class="row divbg" style="border: none">
		                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                              		  	<spring:message code="activities.label" />
		                              		  </span>
		                              		  <span id="" class="col-lg-6" style="padding: 0px">
		                              		  	<select class="form-control activities" name="OutletVerficationStocks" multiple="multiple" id="OutletVerficationStocksActivities">
			                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
			                              		  	 <c:if test="${workflow.businessFlow == 'Store Stock Verification'}">
							                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
	                                 				</c:if>
	                                 				</c:forEach>
		                              		  	</select>
			                                  </span>
			                           </div>
			                           </div>
			                           </div> --%>
			                           
			                           
			                                  
		                                     <div id="StoreStockVerification" class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 60px" >
	                              		  	<spring:message code="stock.verification.label" />
	                              		  </span>
	                              		  <span id="StoreStockVerificationCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletStockVerificationsRead" style="vertical-align: -2px" id="StoreStockVerificationRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletStockVerificationsWrite" style="vertical-align: -2px" id="StoreStockVerificationWrite"/>Write
		                                  </span>
		                               
		                                     
		                                   <span id="" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletStockVerificationsCCTo" style="vertical-align: -2px" id="StoreStockVerificationCCTo"/>CC To
		                                <img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('StoreStockVerification');" id="StoreStockVerificationImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                                  </span>
		                             </div>  
		                              <div style="margin-left: 0%">
			                       		<div id="StoreStockVerificationFlow" class="inactiveSubBlock" style="font-size: 10px;background-color: rgb(240,240,240)">
			                       			<br>
			                       			<div class="row divsubbg" style="border: none">
			                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
			                              		  	<spring:message code="activities.label" />
			                              		  </span>
			                              		  <span id="" class="col-lg-6" style="padding: 0px">
			                              		  	<select class="form-control activities" name="StoreStockVerification" multiple="multiple" id="StoreStockVerificationActivities">
				                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
								                            <c:if test="${workflow.businessFlow == 'Store Stock Verification'}">
								                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
								                          </c:if>
		                                 				</c:forEach>
			                              		  	</select>
				                                  </span>
				                           </div>
			                       		</div>
			                       </div> 
		                                  <br>
			                           
			                              <!-- outlet stock upload start --> 
		                             <div id="StoreStockVerificationPosting" class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 60px" >
	                              		  	Stock Posting
	                              		  </span>
	                              		  <span id="StoreStockVerificationPostingCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletStockVerificationsRead" style="vertical-align: -2px" id="StoreStockVerificationPostingRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletStockVerificationsWrite" style="vertical-align: -2px" id="StoreStockVerificationPostingWrite"/>Write
		                                  </span>
		                               
		                                     
		                                   <span id="" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletStockVerificationsCCTo" style="vertical-align: -2px" id="StoreStockVerificationPostingCCTo"/>CC To
		                                <img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('StoreStockVerificationPosting');" id="StoreStockVerificationPostingImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                                  </span>
		                             </div>  
		                             <div style="margin-left: 0%">
			                       		<div id="StoreStockVerificationPostingFlow" class="inactiveSubBlock" style="font-size: 10px;background-color: rgb(240,240,240)">
			                       			<br>
			                       			<div class="row divsubbg" style="border: none">
			                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
			                              		  	<spring:message code="activities.label" />
			                              		  </span>
			                              		  <span id="" class="col-lg-6" style="padding: 0px">
			                              		  	<select class="form-control activities" name="StoreStockVerificationPosting" multiple="multiple" id="StoreStockVerificationPostingActivities">
				                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
								                            <c:if test="${workflow.businessFlow == 'Store Stock Posting'}">
								                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
								                          </c:if>
		                                 				</c:forEach>
			                              		  	</select>
				                                  </span>
				                           </div>
			                       		</div>
			                       </div> 
			                       <!-- outlet stock upload end --> 
			                           
			                           
			                           
		                             
		                         </div>
		                         </div>  
	                          <%--       <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 60px" >
	                              		  	<spring:message code="stock.verification.label" />
	                              		  </span>
	                              		  <span id="OutletStockVerificationCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="InventoryManagementRead" style="vertical-align: -2px" id="OutletStockVerificationRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="InventoryManagementWrite" style="vertical-align: -2px" id="OutletStockVerificationWrite"/>Write
		                                  </span>
		                               
		                                     
		                                   <span id="" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="InventoryManagementCCTo" style="vertical-align: -2px" id="OutletStockVerificationCCTo"/>CC To
		                                  </span>
		                             </div>  
		                             
		                             <br>
		                              <div id="OutletStockVerification" class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 60px" >
	                              		  	<spring:message code="warehouse_stockverificationreports.label" />
	                              		  </span>
	                              		  <span id="OutletStockVerificationCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="InventoryManagementRead" style="vertical-align: -2px" id="OutletStockVerificationRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="InventoryManagementWrite" style="vertical-align: -2px" id="OutletStockVerificationWrite"/>Write
		                                  </span>
		                               
		                                     
		                                   <span id="" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="InventoryManagementCCTo" style="vertical-align: -2px" id="OutletStockVerificationCCTo"/>CC To
		                                <img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('OutletStockVerification');" id="OutletStockVerificationImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                                  </span>
		                             </div>  
		                              <div style="margin-left: 0%">
			                       		<div id="OutletStockVerificationFlow" class="inactiveSubBlock" style="font-size: 10px;background-color: rgb(240,240,240)">
			                       			<br>
			                       			<div class="row divsubbg" style="border: none">
			                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
			                              		  	<spring:message code="activities.label" />
			                              		  </span>
			                              		  <span id="" class="col-lg-6" style="padding: 0px">
			                              		  	<select class="form-control activities" name="OutletStockVerification" multiple="multiple" id="OutletStockVerificationActivities">
				                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
								                            <c:if test="${workflow.businessFlow == 'Store Stock Verification'}">
								                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
								                          </c:if>
		                                 				</c:forEach>
			                              		  	</select>
				                                  </span>
				                           </div>
			                       		</div>
			                       </div> --%>
		                             
		                             
		                             
		                             
		                             
		                             
		                             
	                              </div>
	                          </div>
	                          <br>
	                          <div id="OutletHealthId" class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px" onclick="activateSubFlow('OutletHealth');">
                                  	<spring:message code="outlet.health.label" />
                                  </span>
                                  <span id="OutletHealthCheck" class="col-lg-2" style="padding: 0px" >
                                  	<input type="checkbox" style="vertical-align: -2px;" onclick="selectAll('OutletHealthRead')" name="OutletManagementRead"  value="OutletHealth" id="OutletHealthRead"/>Read
                                  </span>
                                     
		                                   <span id="" class="col-lg-2" style="padding: 0px"></span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  <input type="checkbox" style="vertical-align: -2px;" onclick="selectAll('OutletHealthCCTo')" name="OutletManagementCCTo"  value="OutletHealth" id="OutletHealthCCTo"/>CC To
                                  
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('OutletHealth');" id="OutletHealthImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                               </div>
                               <div style="margin-left: 0%;">
	                              <div id="OutletHealthFlow" class="inactiveSubBlock" style="font-size: 12px">
	                                <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px" >
	                              		  	<spring:message code="avg.inventory.label" />
	                              		  </span>
	                              		  <span id="AverageInventoryCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletHealthRead" value="Stocks" style="vertical-align: -2px" id="AverageInventoryRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="ShiftManagementWrite" style="vertical-align: -2px"  id="ShiftMasterWrite"/>Write -->
		                                  </span>
		                                     <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletHealthCCTo"  style="vertical-align: -2px" id="AverageInventoryCCTo"/>CC To
		                                  </span>
		                           </div>
		                              <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="customer.walkins.label" />
	                              		  </span>
	                              		  <span id="CustomerWalkInsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletHealthRead" value="Stocks" style="vertical-align: -2px" id="CustomerWalkInsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="ShiftManagementWrite" style="vertical-align: -2px"  id="ShiftMasterWrite"/>Write -->
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletHealthCCTo"  style="vertical-align: -2px" id="CustomerWalkInsCCTo"/>CCTo
		                                  </span>
		                           </div>
		                            <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="customer.conversion.label" />
	                              		  </span>
	                              		  <span id="CustomerConversionCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletHealthRead" value="Stocks" style="vertical-align: -2px" id="CustomerConversionRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="ShiftManagementWrite" style="vertical-align: -2px"  id="ShiftMasterWrite"/>Write -->
		                                  </span>
		                                    <span id="" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletHealthCCTo"  style="vertical-align: -2px" id="CustomerConversionCCTo"/>CC To
		                                  </span>
		                           </div>
		                            <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="billing.avg.label" />
	                              		  </span>
	                              		  <span id="BillingAveragesCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletHealthRead" value="Stocks" style="vertical-align: -2px" id="BillingAveragesRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="ShiftManagementWrite" style="vertical-align: -2px"  id="ShiftMasterWrite"/>Write -->
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletHealthCCTo" style="vertical-align: -2px" id="BillingAveragesCCTo"/>CC To
		                                  </span>
		                           </div>
		                            <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="health.sales.label" />
	                              		  </span>
	                              		  <span id="HealthSalesCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletHealthRead" value="Stocks" style="vertical-align: -2px" id="HealthSalesRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="ShiftManagementWrite" style="vertical-align: -2px"  id="ShiftMasterWrite"/>Write -->
		                                  </span>
		                                   <span id="" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletHealthCCTo"  style="vertical-align: -2px" id="HealthSalesCCTo"/>CC To
		                                  </span>
		                           </div>
                                </div>
	                          </div>
                               <br>
                           	   <div class="row divsubbg" style="border: none">
                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="notifications.label" />
                                  </span>
                                  <span id="OutletNotificationsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="OutletNotifications" name="OutletManagementRead" id="OutletNotificationsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="OutletManagementWrite"  id="OutletNotificationsWrite"/>Write
                                  </span>
                                    <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="OutletManagementCCTo"  id="OutletNotificationsCCTo"/>CC To
                                  </span>
                               </div> 
                               <br>
                   		</div>
                   		<c:if test="${sessionScope.warehouseLicense == true}">
                        <br>
                   		 <div id="WarehouseManagementId" class="row divbg" >
                             <span onclick="activate('WarehouseManagement');" class="col-lg-6" style="font-size: 15px;cursor: pointer;">
                             	<spring:message code="warehouse.management.label" />
                             </span>
                             <span id="WarehouseManagementCheck" class="col-lg-2" style="padding: 0px">
                              	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('WarehouseManagementRead')" name="consoleRead" id="WarehouseManagementRead"/>Read
                             </span>
                             <span  class="col-lg-2" style="padding: 0px">
                              	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('WarehouseManagementWrite')" name="consoleWrite" id="WarehouseManagementWrite"/>Write
<%--                               	<img style="float: right;height: 20px;cursor: pointer;" onclick="activate('WarehouseManagement');" id="WarehouseManagementImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                             </span>
                              <span  class="col-lg-2" style="padding: 0px">
                              	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('WarehouseManagementCCTo')" name="consoleCCTo" id="WarehouseManagementCCTo"/>CC To
                              	<img style="float: right;height: 20px;cursor: pointer;" onclick="activate('WarehouseManagement');" id="WarehouseManagementImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                             </span>
                         </div>
                         <div id="WarehouseManagementFlow" style="margin-left: 0%;color:#666;background-color: rgb(240,240,240);margin-left: 2px;margin-right: 2px;" class="inactiveBlock">
	                   		 <br>
	                   		   <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="configurations.label" />
                                  </span>
                                  <span id="WarehouseConfigurationsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseManagementRead" style="vertical-align: -2px" id="WarehouseConfigurationsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseManagementWrite" style="vertical-align: -2px" id="WarehouseConfigurationsWrite"/>Write
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseManagementCCTo" style="vertical-align: -2px" id="WarehouseConfigurationsCCTo"/>CC To
                                  </span>
                               </div>
                               <br>
                               <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	Warehouse POS
                                  </span>
                                  <span id="WarehousePOSCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseManagementRead" style="vertical-align: -2px" id="WarehousePOSRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseManagementWrite" style="vertical-align: -2px" id="WarehousePOSWrite"/>Write
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseManagementCCTo" style="vertical-align: -2px" id="WarehousePOSCCTo"/>CC To
                                  </span>
                               </div>
                               <br>
                               <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	Menu
                                  </span>
                                  <span id="WarehouseMenuCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseManagementRead" style="vertical-align: -2px" id="WarehouseMenuRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseManagementWrite" style="vertical-align: -2px" id="WarehouseMenuWrite"/>Write
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseManagementCCTo" style="vertical-align: -2px" id="WarehouseMenuCCTo"/>CC To
                                  </span>
                               </div>
                               <br>
                              
                                  <div class="row divsubbg" style="border: none">
                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="counter_master.label" />
                                  </span>
                                  <span id="WhCounterMasterCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="WhCounter Master" name="WarehouseManagementRead" id="WhCounterMasterRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="WarehouseManagementWrite"  id="WhCounterMasterWrite"/>Write
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="WarehouseManagementCCTo"  id="WhCounterMasterCCTo"/>CC To
                                  </span>
                               </div> 
                               <br>
                               <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="taxation.label" />
                                  </span>
                                  <span id="WhTaxationCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px;" onclick="toggleCheckBox(this)" name="WarehouseManagementRead"  value="WhTaxation" id="WhTaxationRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="WarehouseManagementWrite"  id="WhTaxationWrite"/>Write
                                  </span>
                                         <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="WarehouseManagementCCTo"  id="WhTaxationCCTo"/>CC To
                                  </span>
                               </div>
                               
                               <br>
                                <div id="WarehouseStockmanagementId" class="row divsubbg" style="border: none">
                               	  <span  class="col-lg-6"  onclick="activateSubFlow('WarehouseStockmanagement');" style="padding-left: 40px;cursor: pointer;">
	                              	<spring:message code="stockmanagement.label" />
	                              </span>
	                              <span id="WarehouseStockmanagementCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="WarehouseManagementRead" style="vertical-align: -2px" onclick="selectAll('WarehouseStockmanagementRead')" id="WarehouseStockmanagementRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="WarehouseManagementWrite" style="vertical-align: -2px" onclick="selectAll('WarehouseStockmanagementWrite')" id="WarehouseStockmanagementWrite"/>Write
<%--                                   	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('WarehouseStockmanagement');" id="WarehouseStockmanagementImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="WarehouseManagementCCTo" style="vertical-align: -2px" onclick="selectAll('WarehouseStockmanagementCCTo')" id="WarehouseStockmanagementCCTo"/>CCTo
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('WarehouseStockmanagement');" id="WarehouseStockmanagementImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                                  </div>
                                  <div style="margin-left: 0%;">
	                              <div id="WarehouseStockmanagementFlow" class="inactiveSubBlock" style="font-size: 12px;background-color: rgb(240,240,240)">
		                              <br>
		                              <div id="WarehouseStorageStocksId"  class="row divsubbg" style="border: none">
		                               	  <span class="col-lg-6"  onclick="activateSubChildFlow('WarehouseStorageStocks');" style="cursor: pointer;padding-left: 60px;">
			                              		Storage
			                              </span>
			                              <span id="WarehouseStorageStocksCheck" class="col-lg-2" style="padding: 0px">
		                                  		<input type="checkbox" name="WarehouseStockmanagementRead" style="vertical-align: -2px" onclick="selectAll('WarehouseStorageStocksRead')" id="WarehouseStorageStocksRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
<%-- 		                                  		<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('WarehouseStocks');" id="WarehouseStocksImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  		<input type="checkbox" name="WarehouseStockmanagementCCTo" style="vertical-align: -2px" onclick="selectAll('WarehouseStorageStocksCCTo')" id="WarehouseStorageStocksCCTo"/>CC To
		                                 		                                  		<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('WarehouseStorageStocks');" id="WarehouseStorageStocksImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                                 
		                                  </span>
	                                  </div>
		                            
		                             <div style="margin-left: 0%;">
			                              <div id="WarehouseStorageStocksFlow" class="inactiveSubChildBlock" style="font-size: 10px;background-color: rgb(240,240,240)">
				                                <br>
			                               		<div class="row divsubchildbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="availablestock.label" />
				                              		  </span>
				                              		  <span id="WarehouseStorageAvailableStockCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseStorageStocksRead" style="vertical-align: -2px" id="WarehouseStorageAvailableStockRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                  <span id="WarehouseStorageAvailableStockCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseStorageStocksCCTo" style="vertical-align: -2px" id="WarehouseStorageAvailableStockCCTo"/>CC To
					                                  </span>
					                           </div>
					                           <br>
			                               		<div class="row divsubchildbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	Unprocessed
				                              		  </span>
				                              		  <span id="WarehouseStorageUnprocessedCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseStorageStocksRead" style="vertical-align: -2px" id="WarehouseStorageUnprocessedRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                  <span id="WarehouseStorageUnprocessedCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseStorageStocksCCTo" style="vertical-align: -2px" id="WarehouseStorageUnprocessedCCTo"/>CC To
					                                  </span>
					                           </div>
					                           <br>
			                               		<div class="row divsubchildbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	Pick List
				                              		  </span>
				                              		  <span id="WarehouseStoragePickListCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseStorageStocksRead" style="vertical-align: -2px" id="WarehouseStoragePickListRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                  <span id="WarehouseStoragePickListCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseStorageStocksCCTo" style="vertical-align: -2px" id="WarehouseStoragePickListCCTo"/>CC To
					                                  </span>
					                           </div>
					                           <br>
			                               		<div class="row divsubchildbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	Boneyard
				                              		  </span>
				                              		  <span id="WarehouseStorageBoneyardCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseStorageStocksRead" style="vertical-align: -2px" id="WarehouseStorageBoneyardRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                  <span id="WarehouseStorageBoneyardCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseStorageStocksCCTo" style="vertical-align: -2px" id="WarehouseStorageBoneyardCCTo"/>CC To
					                                  </span>
					                           </div>
					                           </div>
					                           </div>
		                            
		                             <br>
		                              <div id="WarehouseStocksId"  class="row divsubbg" style="border: none">
		                               	  <span class="col-lg-6"  onclick="activateSubChildFlow('WarehouseStocks');" style="cursor: pointer;padding-left: 60px;">
			                              		<spring:message code="stocks.label" />
			                              </span>
			                              <span id="WarehouseStocksCheck" class="col-lg-2" style="padding: 0px">
		                                  		<input type="checkbox" name="WarehouseStockmanagementRead" style="vertical-align: -2px" onclick="selectAll('WarehouseStocksRead')" id="WarehouseStocksRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
<%-- 		                                  		<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('WarehouseStocks');" id="WarehouseStocksImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  		<input type="checkbox" name="WarehouseStockmanagementCCTo" style="vertical-align: -2px" onclick="selectAll('WarehouseStocksCCTo')" id="WarehouseStocksCCTo"/>CC To
		                                 		                                  		<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('WarehouseStocks');" id="WarehouseStocksImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                                 
		                                  </span>
	                                  </div>
	                                  <div style="margin-left: 0%;">
			                              <div id="WarehouseStocksFlow" class="inactiveSubChildBlock" style="font-size: 10px;background-color: rgb(240,240,240)">
				                                <br>
			                               		<div class="row divsubchildbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="demandforecast.label" />
				                              		  </span>
				                              		  <span id="WarehouseDemandForecastCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseStocksRead" style="vertical-align: -2px" id="WarehouseDemandForecastRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                   <span class="col-lg-2" style="padding: 0px">
					                                   <input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseStocksCCTo" style="vertical-align: -2px" id="WarehouseDemandForecastCCTo"/>CC To
					                                   </span>
					                           </div>
				                                <br>
			                               		<div class="row divsubchildbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="availablestock.label" />
				                              		  </span>
				                              		  <span id="WarehouseAvailableStockCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseStocksRead" style="vertical-align: -2px" id="WarehouseAvailableStockRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                  <span id="WarehouseOrderedStockCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseStocksCCTo" style="vertical-align: -2px" id="WarehouseAvailableStockCCTo"/>CC To
					                                  </span>
					                           </div>
					                            <br>
		                           				<div class="row divsubchildbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="orderedstock.label" />
				                              		  </span>
				                              		  <span id="WarehouseOrderedStockCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseStocksRead" style="vertical-align: -2px" id="WarehouseOrderedStockRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                   <span id="" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseStocksCCTo" style="vertical-align: -2px" id="WarehouseOrderedStockCCTo"/>CC To
					                                  </span>
					                           </div>
					                           <br>
					                           
					                           <div class="row divsubchildbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              			<spring:message code="day.wise.stock.label" />
				                              		  </span>
				                              		  <span id="WarehouseDayWiseStockCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseStocksRead" style="vertical-align: -2px" id="WarehouseDayWiseStockRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                   <span id="" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseStocksCCTo" style="vertical-align: -2px" id="WarehouseDayWiseStockCCTo"/>CC To
					                                  </span>
					                           </div>
					                           <br>
					                           
		                           				<div class="row divsubchildbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="criticalstock.label" />
				                              		  </span>
				                              		  <span id="WarehouseCriticalStockCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseStocksRead" style="vertical-align: -2px" id="WarehouseCriticalStockRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                   <span class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseStocksCCTo" style="vertical-align: -2px" id="WarehouseCriticalStockCCTo"/>CC To
					                                  </span>
					                           </div>
					                           <br>
		                           				<div class="row divsubchildbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="blockedstock.label" />
				                              		  </span>
				                              		  <span id="WarehouseBlockedStockCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseStocksRead" style="vertical-align: -2px" id="WarehouseBlockedStockRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                   <span class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseStocksCCTo" style="vertical-align: -2px" id="WarehouseBlockedStockCCTo"/>CC To
					                                  </span>
					                           </div>
					                           <br>
		                           				<div class="row divsubchildbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="returnedstock.label" />
				                              		  </span>
				                              		  <span id="WarehouseReturnedStockCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseStocksRead" style="vertical-align: -2px" id="WarehouseReturnedStockRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                   <span  class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseStocksCCTo" style="vertical-align: -2px" id="WarehouseReturnedStockCCTo"/>CC To
					                                  </span>
					                           </div>
					                           <br>
		                           				<div class="row divsubchildbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="boneyard.label" />
				                              		  </span>
				                              		  <span id="WarehouseBoneyardStockCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseStocksRead" style="vertical-align: -2px" id="WarehouseBoneyardStockRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseStocksCCTo" style="vertical-align: -2px" id="WarehouseBoneyardStockCCTo"/>CC To
					                                  </span>
					                           </div>
		                           		</div>
		                           	</div>
		                           <br>
	                                  <div id="WarehouseStockVerificationsId" class="row divsubbg" style="border: none;">
	                              <span  class="col-lg-6"  onclick="activateSubChildFlow('WarehouseStockVerifications');" style="cursor: pointer;padding-left: 60px;">
	                              	<spring:message code="stock.verification.label" />
	                              </span>
	                              <span id="WarehouseStockVerificationsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('WarehouseStockVerificationsRead');" name="WarehouseStockmanagementRead" id="WarehouseStockVerificationsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="WarehouseStockmanagementWrite" style="vertical-align: -2px" onclick="selectAll('WarehouseStockVerificationsWrite')" id="WarehouseStockVerificationsWrite"/>Write
<%--                                   	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('RestaurentManagement');" id="RestaurentManagementImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                    <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="WarehouseStockmanagementCCTo" style="vertical-align: -2px" onclick="selectAll('WarehouseStockVerificationsCCTo')" id="WarehouseStockVerificationsCCTo"/>CC To
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('WarehouseStockVerifications');" id="WarehouseStockVerificationsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                                  </div>
                                  
                                  <div style="margin-left: 0%;">
	                            <div id="WarehouseStockVerificationsFlow" class="inactiveSubChildBlock" style="font-size: 10px;background-color: rgb(240,240,240)">
		                          <br>
	                                <div class="row divsubchildbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 80px" >
	                              		  	<spring:message code="stock.verification.master" />
	                              		  </span>
	                              		  <span id="WarehouseStockVerificationCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseStockVerificationsRead" style="vertical-align: -2px" id="WarehouseStockVerificationRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseStockVerificationsWrite" style="vertical-align: -2px" id="WarehouseStockVerificationWrite"/>Write
		                                  </span>
		                               
		                                   <span id="" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseStockVerificationsCCTo" style="vertical-align: -2px" id="WarehouseStockVerificationCCTo"/>CC To
		                                  
		                                  </span>
		                             </div>  
		                            
		                             <br>
	                                <div class="row divsubchildbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 80px" >
	                              		  	<spring:message code="stock.verification.label" />
	                              		  </span>
	                              		  <span id="WarehouseVerficationStocksCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseStockVerificationsRead" style="vertical-align: -2px" id="WarehouseVerficationStocksRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseStockVerificationsWrite" style="vertical-align: -2px"id="WarehouseVerficationStocksWrite"/>Write
		                                  </span>
		                               
		                                   <span id="" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseStockVerificationsCCTo" style="vertical-align: -2px" id="WarehouseVerficationStocksCCTo"/>CC To
		                                  		<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('WarehouseVerficationStocks');" id="WarehouseVerficationStocksImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                                  </span>
		                             </div>  
		                              <div style="margin-left: 0%">
			                       		<div id="WarehouseVerficationStocksFlow" class="inactiveSubBlock" style="font-size: 10px;background-color: rgb(240,240,240)">
			                       			<br>
			                       			<div class="row divsubbg" style="border: none">
			                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
			                              		  	<spring:message code="activities.label" />
			                              		  </span>
			                              		  <span id="" class="col-lg-6" style="padding: 0px">
			                              		  	<select class="form-control activities" name="WarehouseVerficationStocks" multiple="multiple" id="WarehouseVerficationStocksActivities">
				                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
								                            <c:if test="${workflow.businessFlow == 'Warehouse Stock Verification'}">
								                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
								                          </c:if>
		                                 				</c:forEach>
			                              		  	</select>
				                                  </span>
				                           </div>
			                       		</div>
			                       </div> 
		                             <br>
		                              <div class="row divsubchildbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 80px" >
	                              		  	Stock Uploading
	                              		  </span>
	                              		  <span id="WarehouseStocksUploadCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseStockVerificationsRead" style="vertical-align: -2px" id="WarehouseStocksUploadRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseStockVerificationsWrite" style="vertical-align: -2px"id="WarehouseStocksUploadWrite"/>Write
		                                  </span>
		                               
		                                   <span id="" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseStockVerificationsCCTo" style="vertical-align: -2px" id="WarehouseStocksUploadCCTo"/>CC To
		                                  </span>
		                             </div>  
		                             
		                             
		                         </div>
		                         </div> 
		                             
		                             
		                            

	                       <br>
	                       
	                  <div id="WarehouseProcurementShipmentId"  class="row divsubbg" style="border: none">
                               	  <span class="col-lg-6"  onclick="activateSubChildFlow('WarehouseProcurementShipment');" style="cursor: pointer;padding-left: 60px;">
	                              	<spring:message code="warehouse_procurement.label" />
	                              </span>
	                              <span id="WarehouseProcurementShipmentCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="WarehouseStockmanagementRead" style="vertical-align: -2px" onclick="selectAll('WarehouseProcurementShipmentRead')" id="WarehouseProcurementShipmentRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="WarehouseStockmanagementWrite" style="vertical-align: -2px" onclick="selectAll('WarehouseProcurementShipmentWrite')" id="WarehouseProcurementShipmentWrite"/>Write
<%--                                   	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('WarehouseProcurementShipment');" id="WarehouseProcurementShipmentImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                   <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="WarehouseStockmanagementCCTo" style="vertical-align: -2px" onclick="selectAll('WarehouseProcurementShipmentCCTo')" id="WarehouseProcurementShipmentCCTo"/>CCTo
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('WarehouseProcurementShipment');" id="WarehouseProcurementShipmentImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                                  </div>
                              <div style="margin-left: 0%;">
	                              <div id="WarehouseProcurementShipmentFlow" class="inactiveSubChildBlock" style="font-size: 12px;">
	                                <br>
		                           <div id="WarehouseRequestForQuotationId" class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" onclick="activateSubChildActivities('WarehouseRequestForQuotation');" >
                                  	<spring:message code="rqst.for.quotation.label" />
                                  </span>
                                  <span id="WarehouseRequestForQuotationCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementShipmentRead" style="vertical-align: -2px" id="WarehouseRequestForQuotationRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementShipmentWrite" style="vertical-align: -2px" id="WarehouseRequestForQuotationWrite"/>Write
<%--                                   	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('WarehouseRequestForQuotation');" id="WarehouseRequestForQuotationImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementShipmentCCTo" style="vertical-align: -2px" id="WarehouseRequestForQuotationCCTo"/>CC To
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('WarehouseRequestForQuotation');" id="WarehouseRequestForQuotationImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                            </div>
                            <div style="margin-left: 0%;">
	                            <div id="WarehouseRequestForQuotationFlow" class="inactiveSubChildActivities" style="font-size: 12px;">
	                                 <br>
	                               		<div class="row divsubbg" style="border: none">
		                              		 
		                              		    <span class="col-lg-6" style="cursor: pointer;padding-left: 100px;" >
			                              		  	<spring:message code="activities.label" />
			                              		  </span>
			                              		  <span id="" class="col-lg-6" style="padding: 0px">
		                              		  	<select class="form-control activities" name="RequestForQuotation" multiple="multiple" id="RequestForQuotationActivities">
			                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
							                            <c:if test="${workflow.businessFlow == 'Request For Quotation'}">
							                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
							                            </c:if>
	                                 				</c:forEach>
		                              		  	</select>
			                                  </span>
			                           </div>
		                           </div>
		                        </div>
                            <br>
		                         
                                  <div id="WarehouseQuotationId" class="row divsubchildactivitiesbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" onclick="activateSubChildActivities('WarehouseQuotation');" >
	                              		  <spring:message code="qutation.label" /> 
	                              		  </span>
	                              		  <span id="WarehouseQuotationCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementShipmentRead" style="vertical-align: -2px" id="WarehouseQuotationRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementShipmentWrite" style="vertical-align: -2px" id="WarehouseQuotationWrite"/>Write
<%-- 		                              	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('WarehouseQuotation');" id="WarehouseQuotationImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">  --%>
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementShipmentCCTo" style="vertical-align: -2px" id="WarehouseQuotationCCTo"/>CC To
		                              	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('WarehouseQuotation');" id="WarehouseQuotationImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> 
		                                  </span>
		                           </div>
		                           <div style="margin-left: 0%">
			                       		<div id="WarehouseQuotationFlow" class="inactiveSubChildActivities" style="font-size: 10px;">
			                       			<br>
			                       			 <div class="row divsubchildbg" style="border: none">
			                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 100px;" >
			                              		  	<spring:message code="activities.label" />
			                              		  </span>
			                              		  <span id="" class="col-lg-6" style="padding: 0px">
			                              		  	<select class="form-control activities" name="WarehouseQuotation" multiple="multiple" id="WarehouseQuotationActivities">
				                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
								                            <c:if test="${workflow.businessFlow == 'Stock Issue'}">
								                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
								                            </c:if>
		                                 				</c:forEach>
			                              		  	</select>
				                                  </span>
				                           </div>
			                       		</div>
			                       </div>
		                           <br>
                                  <div id="WarehousePurchaseOrdersId" class="row divsubchildactivitiesbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" onclick="activateSubChildActivities('WarehousePurchasesOrder');" >
	                              		  <spring:message code="purchase.order.label" />  
	                              		  </span>
	                              		  <span id="WarehousePurchaseOrdersCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementShipmentRead" style="vertical-align: -2px" id="WarehousePurchaseOrdersRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementShipmentWrite" style="vertical-align: -2px" id="WarehousePurchaseOrdersWrite"/>Write
<%-- 		                           	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('WarehousePurchaseOrders');" id="WarehousePurchaseOrdersImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">  --%>
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementShipmentCCTo" style="vertical-align: -2px" id="WarehousePurchaseOrdersCCTo"/>CC To
		                           	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('WarehousePurchaseOrders');" id="WarehousePurchaseOrdersImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> 
		                                  </span>
		                           </div>
		                           <div style="margin-left: 0%">
			                       		<div id="WarehousePurchaseOrdersFlow" class="inactiveSubChildActivities" style="font-size: 10px;  ">
			                       			<br>
			                       			 <div class="row divsubchildbg" style="border: none">
			                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 100px;" >
			                              		  	<spring:message code="activities.label" />
			                              		  </span>
			                              		  <span id="" class="col-lg-6" style="padding: 0px">
			                              		  	<select class="form-control activities" name="WarehousePurchaseOrders" multiple="multiple" id="WarehousePurchaseOrdersActivities">
				                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
								                            <c:if test="${workflow.businessFlow == 'Warehouse Purchase Orders'}">
								                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
								                            </c:if>
		                                 				</c:forEach>
			                              		  	</select>
				                                  </span>
				                           </div>
			                       		</div>
			                       </div>
                               </div>
                               </div>
                               
                               
		                        
		                        
		                        
		                        <br>
		                        
	                       
	                        	 <div id="WarehouseProcurementId"  class="row divsubbg" style="border: none">
                               	  <span class="col-lg-6" onclick="activateSubChildFlow('WarehouseProcurement');" style="cursor: pointer;padding-left: 60px;">
	                              	<spring:message code="warehouse.shipments.label" />
	                              </span>
	                              <span id="WarehouseProcurementCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="WarehouseStockmanagementRead" style="vertical-align: -2px" onclick="selectAll('WarehouseProcurementRead')" id="WarehouseProcurementRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="WarehouseStockmanagementWrite" style="vertical-align: -2px" onclick="selectAll('WarehouseProcurementWrite')" id="WarehouseProcurementWrite"/>Write
<%--                                   	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('WarehouseProcurement');" id="WarehouseProcurementImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                   <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="WarehouseStockmanagementCCTo" style="vertical-align: -2px" onclick="selectAll('WarehouseProcurementCCTo')" id="WarehouseProcurementCCTo"/>CC To
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('WarehouseProcurement');" id="WarehouseProcurementImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                                </div>
		                         	
		                         <div style="margin-left: 0%;">
	                             <div id="WarehouseProcurementFlow" class="inactiveSubChildBlock" style="font-size: 12px;">
	                                <br>
	                              <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
	                              		  	<spring:message code="shipment.notes.label" />
	                              		  </span>
	                              		  <span id="WarehouseShipmentNotesCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementRead" style="vertical-align: -2px" id="WarehouseShipmentNotesRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementWrite" style="vertical-align: -2px" id="WarehouseShipmentNotesWrite"/>Write
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementCCTo" style="vertical-align: -2px" id="WarehouseShipmentNotesCCTo"/>CC To
		                                  </span>
		                             </div>
		                               <br>
                               		   <div id="WarehouseGRNId" class="row divsubchildactivitiesbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" onclick="activateSubChildActivities('WarehouseGRN');" >
	                              		  <spring:message code="goods.receipts.label" />  
	                              		  </span>
	                              		  <span id="WarehouseGRNCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementRead" style="vertical-align: -2px" id="WarehouseGRNRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementWrite" style="vertical-align: -2px" id="WarehouseGRNWrite"/>Write
<%-- 		                           	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('WarehouseGRN');" id="WarehouseGRNImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">  --%>
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementCCTo" style="vertical-align: -2px" id="WarehouseGRNCCTo"/>CC To
		                           	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('WarehouseGRN');" id="WarehouseGRNImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> 
		                                  </span>
		                           </div>
		                       
		                           <div style="margin-left: 0%">
			                       		<div id="WarehouseGRNFlow" class="inactiveSubChildActivities" style="font-size: 10px;">
			                       			<br>
			                       			 <div class="row divsubbg" style="border: none">
			                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 100px;" >
			                              		  	<spring:message code="activities.label" />
			                              		  </span>
			                              		  <span id="" class="col-lg-6" style="padding: 0px">
			                              		  	<select class="form-control activities" name="WarehouseGRN" multiple="multiple" id="WarehouseGRNActivities">
				                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
								                            <c:if test="${workflow.businessFlow == 'Warehouse GRN'}">
								                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
								                            </c:if>
		                                 				</c:forEach>
			                              		  	</select>
				                                  </span>
				                           </div>
			                       		</div>
			                       </div>
			                           <br>
	                              <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
	                              		  	<spring:message code="inspection.receipts.label" />
	                              		  </span>
	                              		  <span id="WarehouseInspectionReceiptCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementRead" style="vertical-align: -2px" id="WarehouseInspectionReceiptRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementWrite" style="vertical-align: -2px" id="WarehouseInspectionReceiptWrite"/>Write
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementCCTo" style="vertical-align: -2px" id="WarehouseInspectionReceiptCCTo"/>CC To
		                                  </span>
		                             </div>   	
		                           	
	                       <br>
	                     <%--    <div class="row divsubchildbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;" >
	                              		  	<spring:message code="goods.receipts.label" />
	                              		  </span>
	                              		  <span id="WarehouseShipmentReceiptCheck" class="col-lg-3" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementRead" style="vertical-align: -2px" id="WarehouseShipmentReceiptRead"/>Read
		                                  </span>
		                                  <span class="col-lg-3" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementWrite" style="vertical-align: -2px" id="WarehouseShipmentReceiptWrite"/>Write
		                                  </span>
		                           </div>
		                                <br> --%>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style=";cursor: pointer;padding-left: 80px;" >
	                              		  	<spring:message code="warehouse.shipmentrejection.label" />
	                              		  </span>
	                              		  <span id="WarehouseShipmentRejectionCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementRead" style="vertical-align: -2px" id="WarehouseShipmentRejectionRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementWrite" style="vertical-align: -2px" id="WarehouseShipmentRejectionWrite"/>Write
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementCCTo" style="vertical-align: -2px" id="WarehouseShipmentRejectionCCTo"/>CC To
		                                  </span>
		                           </div>
		                             <br>
	                               <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
	                              		  	<spring:message code="shipment.return.label" />
	                              		  </span>
	                              		  <span id="WarehouseShipmentReturnCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementRead" style="vertical-align: -2px" id="WarehouseShipmentReturnRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementWrite" style="vertical-align: -2px" id="WarehouseShipmentReturnWrite"/>Write
<%-- 		                                 <img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('ShipmentReturn');" id="ShipmentReturnImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementCCTo" style="vertical-align: -2px" id="WarehouseShipmentReturnCCTo"/>CC To
		                                 <img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('ShipmentReturn');" id="ShipmentReturnImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                                  </span>
		                             </div>
		                            
		                              <div style="margin-left: 0%">
			                       		<div id="ShipmentReturnFlow" class="inactiveSubChildActivities" style="font-size: 10px;">
			                       			<br>
			                       			 <div class="row divsubchildbg" style="border: none">
			                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 100px;" >
			                              		  	<spring:message code="activities.label" />
			                              		  </span>
			                              		  <span id="" class="col-lg-6" style="padding: 0px">
			                              		  	<select class="form-control activities" name="ShipmentReturn" multiple="multiple" id="ShipmentReturnActivities">
				                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
								                            <c:if test="${workflow.businessFlow == 'Warehouse Shipment Return'}">
								                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
								                            </c:if>
		                                 				</c:forEach>
			                              		  	</select>
				                                  </span>
				                           </div>
			                       		</div>
			                       </div>
		                             
		                                    <br>
	                        <div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style=";cursor: pointer;padding-left: 80px;" >
	                              		  	<spring:message code="warehouse.invoices.label"/>
	                              		  </span>
	                              		  <span id="WarehouseShipmentInvoiceCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementRead" style="vertical-align: -2px" id="WarehouseShipmentInvoiceRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementWrite" style="vertical-align: -2px" id="WarehouseShipmentInvoiceWrite"/>Write
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementCCTo" style="vertical-align: -2px" id="WarehouseShipmentInvoiceCCTo"/>CC To
		                                  <img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('WarehouseShipmentInvoice');" id="WarehouseShipmentInvoiceImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                                  </span>
		                           </div>
		                        	<div style="margin-left: 0%">
			                       		<div id="WarehouseShipmentInvoiceFlow" class="inactiveSubChildActivities" style="font-size: 10px;">
			                       			<br>
			                       			 <div class="row divsubbg" style="border: none">
			                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 100px;" >
			                              		  	<spring:message code="activities.label" />
			                              		  </span>
			                              		  <span id="" class="col-lg-6" style="padding: 0px">
			                              		  	<select class="form-control activities" name="WarehouseShipmentInvoice" multiple="multiple" id="WarehouseShipmentInvoiceActivities">
				                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
								                            <c:if test="${workflow.businessFlow == 'Purchase Invoice'}">
								                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
								                            </c:if>
		                                 				</c:forEach>
			                              		  	</select>
				                                  </span>
				                           </div>
			                       		</div>
			                       </div>
			                           <br>
		                             
		                             
		                             
	                              </div>
	                          </div> 
                               <br>
	                   
	                       
	                       
	                       
                               <div id="WarehouseGoodsTransferId"  class="row divsubbg" style="border: none">
                               	  <span class="col-lg-6"  onclick="activateSubChildFlow('WarehouseGoodsTransfer');" style="cursor: pointer;padding-left: 60px;">
	                              	<spring:message code="warehouse.stocktransfer.label" />
	                              </span>
	                              <span id="WarehouseGoodsTransferCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="WarehouseStockmanagementRead" style="vertical-align: -2px" onclick="selectAll('WarehouseGoodsTransferRead')" id="WarehouseGoodsTransferRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="WarehouseStockmanagementWrite" style="vertical-align: -2px" onclick="selectAll('WarehouseGoodsTransferWrite')" id="WarehouseGoodsTransferWrite"/>Write
<%--                                   	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('WarehouseGoodsTransfer');" id="WarehouseGoodsTransferImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                     <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="WarehouseStockmanagementCCTo" style="vertical-align: -2px" onclick="selectAll('WarehouseGoodsTransferCCTo')" id="WarehouseGoodsTransferCCTo"/>CC To
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('WarehouseGoodsTransfer');" id="WarehouseGoodsTransferImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                                  </div>
                                  <div style="margin-left: 0%;">
	                              <div id="WarehouseGoodsTransferFlow" class="inactiveSubChildBlock" style="font-size: 12px;">
	                                <br>
		                           <div id="WarehouseStockRequestId" class="row divsubchildactivitiesbg" style="border: none">
                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" onclick="activateSubChildActivities('WarehouseStockRequest');" >
                              		  	<spring:message code="warehouse.stockrequests.label" />
                              		  </span>
                              		  <span id="WarehouseStockRequestCheck" class="col-lg-2" style="padding: 0px">
	                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseGoodsTransferRead" style="vertical-align: -2px" id="StockRequestRead"/>Read
	                                  </span>
	                                  <span class="col-lg-2" style="padding: 0px">
	                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseGoodsTransferWrite" style="vertical-align: -2px" id="StockRequestWrite"/>Write
<%-- 	                     	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('WarehouseStockRequest');" id="WarehouseStockRequestImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">  --%>
	                                  </span>
	                                    <span class="col-lg-2" style="padding: 0px">
	                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseGoodsTransferCCTo" style="vertical-align: -2px" id="StockRequestCCTo"/>CC To
	                     	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('WarehouseStockRequest');" id="WarehouseStockRequestImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> 
	                                  </span>
	                                  
	                             </div>
			                       <div style="margin-left: 0%">
			                       		<div id="WarehouseStockRequestFlow" class="inactiveSubChildActivities" style="font-size: 10px;  ">
			                       			<br>
			                       			 <div class="row divsubchildbg" style="border: none">
			                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 100px;" >
			                              		  	<spring:message code="activities.label" />
			                              		  </span>
			                              		  <span id="" class="col-lg-6" style="padding: 0px">
			                              		  	<select class="form-control activities" name="StockRequest" multiple="multiple" id="StockRequestActivities">
				                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
								                            <c:if test="${workflow.businessFlow == 'Stock Request'}">
								                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
								                            </c:if>
		                                 				</c:forEach>
			                              		  	</select>
				                                  </span>
				                           </div>
			                       		</div>
			                       </div>
		                             <br>
		                             
		                               <div id="WarehouseStockRequestOutId" class="row divsubchildactivitiesbg" style="border: none">
                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" onclick="activateSubChildActivities('WarehouseStockRequestOut');" >
                              		  	<spring:message code="warehouse.stockrequests.label" /> - Out
                              		  </span>
                              		  <span id="WarehouseStockRequestOutCheck" class="col-lg-2" style="padding: 0px">
	                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseGoodsTransferRead" style="vertical-align: -2px" id="StockRequestOutRead"/>Read
	                                  </span>
	                                  <span class="col-lg-2" style="padding: 0px">
	                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseGoodsTransferWrite" style="vertical-align: -2px" id="StockRequestOutWrite"/>Write
<%-- 	                     	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('WarehouseStockRequest');" id="WarehouseStockRequestImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">  --%>
	                                  </span>
	                                    <span class="col-lg-2" style="padding: 0px">
	                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseGoodsTransferCCTo" style="vertical-align: -2px" id="StockRequestOutCCTo"/>CC To
	                     	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('WarehouseStockRequestOut');" id="WarehouseStockRequestOutImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> 
	                                  </span>
	                                  
	                             </div>
			                       <div style="margin-left: 0%">
			                       		<div id="WarehouseStockRequestOutFlow" class="inactiveSubChildActivities" style="font-size: 10px;  ">
			                       			<br>
			                       			 <div class="row divsubchildbg" style="border: none">
			                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 100px;" >
			                              		  	<spring:message code="activities.label" />
			                              		  </span>
			                              		  <span id="" class="col-lg-6" style="padding: 0px">
			                              		  	<select class="form-control activities" name="StockRequestOut" multiple="multiple" id="StockRequestOutActivities">
				                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
								                            <c:if test="${workflow.businessFlow == 'Stock Request'}">
								                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
								                            </c:if>
		                                 				</c:forEach>
			                              		  	</select>
				                                  </span>
				                           </div>
			                       		</div>
			                       </div>
		                             <br>
		                             
                                  <div id="WarehouseStockIssuesId" class="row divsubchildactivitiesbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" onclick="activateSubChildActivities('WarehouseStockIssues');" >
	                              		  	<spring:message code="warehouse.stockissue.label" />
	                              		  </span>
	                              		  <span id="WarehouseStockIssuesCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseGoodsTransferRead" style="vertical-align: -2px" id="WarehouseStockIssuesRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseGoodsTransferWrite" style="vertical-align: -2px" id="WarehouseStockIssuesWrite"/>Write
<%-- 		                              	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('WarehouseStockIssues');" id="WarehouseStockIssuesImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">  --%>
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseGoodsTransferCCTo" style="vertical-align: -2px" id="WarehouseStockIssuesCCTo"/>CC To
		                              	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('WarehouseStockIssues');" id="WarehouseStockIssuesImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> 
		                                  </span>
		                           </div>
		                           <div style="margin-left: 0%">
			                       		<div id="WarehouseStockIssuesFlow" class="inactiveSubChildActivities" style="font-size: 10px;  ">
			                       			<br>
			                       			 <div class="row divsubchildbg" style="border: none">
			                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 100px;" >
			                              		  	<spring:message code="activities.label" />
			                              		  </span>
			                              		  <span id="" class="col-lg-6" style="padding: 0px">
			                              		  	<select class="form-control activities" name="WarehouseStockIssues" multiple="multiple" id="WarehouseStockIssuesActivities">
				                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
								                            <c:if test="${workflow.businessFlow == 'Warehouse Stock Issues'}">
								                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
								                            </c:if>
		                                 				</c:forEach>
			                              		  	</select>
				                                  </span>
				                           </div>
			                       		</div>
			                       </div>
		                           <br>
		                                  
		                            <div id="WarehouseStockReceiptsId" class="row divsubchildactivitiesbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" onclick="activateSubChildActivities('WarehouseStockReceipts');" >
	                              		  	Stock Receipts
	                              		  </span>
	                              		  <span id="WarehouseStockReceiptsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseGoodsTransferRead" style="vertical-align: -2px" id="WarehouseStockReceiptsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseGoodsTransferWrite" style="vertical-align: -2px" id="WarehouseStockReceiptsWrite"/>Write
<%-- 		                              	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('WarehouseStockIssues');" id="WarehouseStockIssuesImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">  --%>
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseGoodsTransferCCTo" style="vertical-align: -2px" id="WarehouseStockReceiptsCCTo"/>CC To
		                              	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('WarehouseStockReceipts');" id="WarehouseStockReceiptsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> 
		                                  </span>
		                           </div>
		                           <div style="margin-left: 0%">
			                       		<div id="WarehouseStockReceiptsFlow" class="inactiveSubChildActivities" style="font-size: 10px;  ">
			                       			<br>
			                       			 <div class="row divsubchildbg" style="border: none">
			                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 100px;" >
			                              		  	<spring:message code="activities.label" />
			                              		  </span>
			                              		  <span id="" class="col-lg-6" style="padding: 0px">
			                              		  	<select class="form-control activities" name="WarehouseStockReceipts" multiple="multiple" id="WarehouseStockReceiptsActivities">
				                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
								                            <c:if test="${workflow.businessFlow == 'Warehouse Stock Receipts'}">
								                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
								                            </c:if>
		                                 				</c:forEach>
			                              		  	</select>
				                                  </span>
				                           </div>
			                       		</div>
			                       </div>
		                           <br>
		                           
		                           
		                           
                                  <div id="WarehouseStockReturnId" class="row divsubchildactivitiesbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" onclick="activateSubChildActivities('WarehouseStockReturn');" >
	                              		  	<spring:message code="warehouse.stockreturn.label" />
	                              		  </span>
	                              		  <span id="WarehouseStockReturnCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseGoodsTransferRead" style="vertical-align: -2px" id="WarehouseStockReturnRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseGoodsTransferWrite" style="vertical-align: -2px" id="WarehouseStockReturnWrite"/>Write
<%-- 		                           	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('WarehouseStockReturn');" id="WarehouseStockReturnImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">  --%>
		                                  </span>
		                                    <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseGoodsTransferCCTo" style="vertical-align: -2px" id="WarehouseStockReturnCCTo"/>CC To
		                           	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildActivities('WarehouseStockReturn');" id="WarehouseStockReturnImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> 
		                                  </span>
		                           </div>
		                           <div style="margin-left: 0%">
			                       		<div id="WarehouseStockReturnFlow" class="inactiveSubChildActivities" style="font-size: 10px;  ">
			                       			<br>
			                       			 <div class="row divsubchildbg" style="border: none">
			                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 100px;" >
			                              		  	<spring:message code="activities.label" />
			                              		  </span>
			                              		  <span id="" class="col-lg-6" style="padding: 0px">
			                              		  	<select class="form-control activities" name="WarehouseStockReturn" multiple="multiple" id="WarehouseStockReturnActivities">
				                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
								                            <c:if test="${workflow.businessFlow == 'Stock Return'}">
								                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
								                            </c:if>
		                                 				</c:forEach>
			                              		  	</select>
				                                  </span>
				                           </div>
			                       		</div>
			                       </div>
                               </div>
                               </div></div>
                                </div>
                               
                              
                               
		                             
		                        
                               <br>
                           <%--     <div id="WarehouseProcurementId"  class="row divsubbg" style="border: none">
                               	  <span class="col-lg-6"  onclick="activateSubFlow('WarehouseProcurement');" style="cursor: pointer;padding-left: 40px;">
	                              	<spring:message code="procurement.shipment.label" />
	                              </span>
	                              <span id="WarehouseProcurementCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="WarehouseManagementRead" style="vertical-align: -2px" onclick="selectAll('WarehouseProcurementRead')" id="WarehouseProcurementRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="WarehouseManagementWrite" style="vertical-align: -2px" onclick="selectAll('WarehouseProcurementWrite')" id="WarehouseProcurementWrite"/>Write
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('WarehouseProcurement');" id="WarehouseProcurementImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="WarehouseManagementCCTo" style="vertical-align: -2px" onclick="selectAll('WarehouseProcurementCCTo')" id="WarehouseProcurementCCTo"/>CC To
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('WarehouseProcurement');" id="WarehouseProcurementImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                                </div>
                                <div style="margin-left: 0%;">
	                             <div id="WarehouseProcurementFlow" class="inactiveSubBlock" style="font-size: 12px;background-color: rgb(240,240,240)">
	                                <br>
	                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="shipment.notes.label" />
	                              		  </span>
	                              		  <span id="WarehouseShipmentNotesCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementRead" style="vertical-align: -2px" id="WarehouseShipmentNotesRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementWrite" style="vertical-align: -2px" id="WarehouseShipmentNotesWrite"/>Write
		                                  </span>
		                                    <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementCCTo" style="vertical-align: -2px" id="WarehouseShipmentNotesCCTo"/>CC To
		                                  </span>
		                             </div>
		                               <br>
                               		
	                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="inspection.receipts.label" />
	                              		  </span>
	                              		  <span id="WarehouseInspectionReceiptCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementRead" style="vertical-align: -2px" id="WarehouseInspectionReceiptRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementWrite" style="vertical-align: -2px" id="WarehouseInspectionReceiptWrite"/>Write
		                                  </span>
		                                    <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementCCTo" style="vertical-align: -2px" id="WarehouseInspectionReceiptCCTo"/>CC To
		                                  </span>
		                             </div>
		                              <br>
		                             <div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="goods.receipts.label" />
	                              		  </span>
	                              		  <span id="WarehouseShipmentReceiptCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementRead" style="vertical-align: -2px" id="WarehouseShipmentReceiptRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementWrite" style="vertical-align: -2px" id="WarehouseShipmentReceiptWrite"/>Write
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementCCTo" style="vertical-align: -2px" id="WarehouseShipmentReceiptCCTo"/>CC To
		                                  </span>
		                           </div>
		                                <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style=";cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="warehouse.shipmentrejection.label" />
	                              		  </span>
	                              		  <span id="WarehouseShipmentRejectionCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementRead" style="vertical-align: -2px" id="WarehouseShipmentRejectionRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementWrite" style="vertical-align: -2px" id="WarehouseShipmentRejectionWrite"/>Write
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementCCTo" style="vertical-align: -2px" id="WarehouseShipmentRejectionCCTo"/>CC To
		                                  </span>
		                           </div>
		                             <br>
	                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor:pointer; padding-left: 60px;">
	                              		  	<spring:message code="shipment.return.label" />
	                              		  </span>
	                              		  <span id="WarehouseShipmentReturnCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementRead" style="vertical-align: -2px" id="WarehouseShipmentReturnRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementWrite" style="vertical-align: -2px" id="WarehouseShipmentReturnWrite"/>Write
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseProcurementCCTo" style="vertical-align: -2px" id="WarehouseShipmentReturnCCTo"/>CCTo
		                                  </span>
		                             </div>
	                              </div>
	                          </div>
                               <br>
                               <div id="WarehouseGoodsTransferId"  class="row divsubbg" style="border: none">
                               	  <span class="col-lg-6"  onclick="activateSubFlow('WarehouseGoodsTransfer');" style=" padding-left: 40px;cursor: pointer;">
	                              	<spring:message code="warehouse.stocktransfer.label" />
	                              </span>
	                              <span id="WarehouseGoodsTransferCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="WarehouseManagementRead" style="vertical-align: -2px" onclick="selectAll('WarehouseGoodsTransferRead')" id="WarehouseGoodsTransferRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="WarehouseManagementWrite" style="vertical-align: -2px" onclick="selectAll('WarehouseGoodsTransferWrite')" id="WarehouseGoodsTransferWrite"/>Write
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('WarehouseGoodsTransfer');" id="WarehouseGoodsTransferImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                                   <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="WarehouseManagementCCTo" style="vertical-align: -2px" onclick="selectAll('WarehouseGoodsTransferCCTo')" id="WarehouseGoodsTransferCCTo"/>CC To
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('WarehouseGoodsTransfer');" id="WarehouseGoodsTransferImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                                  </div>
                                  <div style="margin-left: 0%;">
	                              <div id="WarehouseGoodsTransferFlow" class="inactiveSubBlock" style="font-size: 12px;background-color: rgb(240,240,240)">
	                                <br>
		                           <div id="WarehouseStockRequestId" class="row divsubbg" style="border: none">
                              		   <span class="col-lg-6" style="cursor: pointer; padding-left: 60px;" onclick="activateSubChildFlow('WarehouseStockRequest');" >
                              		  	<spring:message code="warehouse.stockrequests.label" />
                              		  </span>
                              		  <span id="WarehouseStockRequestCheck" class="col-lg-2" style="padding: 0px">
	                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseGoodsTransferRead" style="vertical-align: -2px" id="WarehouseStockRequestRead"/>Read
	                                  </span>
	                                  <span class="col-lg-2" style="padding: 0px">
	                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseGoodsTransferWrite" style="vertical-align: -2px" id="WarehouseStockRequestWrite"/>Write
	                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('WarehouseStockRequest');" id="WarehouseStockRequestImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
	                                  </span>
	                                   <span class="col-lg-2" style="padding: 0px">
	                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseGoodsTransferCCTo" style="vertical-align: -2px" id="WarehouseStockRequestCCTo"/>CC To
	                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('WarehouseStockRequest');" id="WarehouseStockRequestImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
	                                  </span>
	                             </div>
			                       <div style="margin-left: 0%">
			                       		<div id="WarehouseStockRequestFlow" class="inactiveSubChildBlock" style="font-size: 10px;background-color: rgb(240,240,240)">
			                       			<br>
			                       			<div class="row divbg" style="border: none">
			                              		  <span class="col-lg-6" style="cursor: pointer; padding-left: 80px;" >
			                              		  	<spring:message code="activities.label" />
			                              		  </span>
			                              		  <span id="" class="col-lg-6" style="padding: 0px">
			                              		  	<select class="form-control activities" name="WarehouseStockRequest" multiple="multiple" id="WarehouseStockRequestActivities">
				                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
								                            <c:if test="${workflow.businessFlow == 'Stock Request'}">
								                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
								                            </c:if>
		                                 				</c:forEach>
			                              		  	</select>
				                                  </span>
				                           </div>
			                       		</div>
			                       </div>
		                             <br>
                                  <div id="WarehouseStockIssueId" class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer; padding-left: 60px;" onclick="activateSubChildFlow('WarehouseStockIssue');" >
	                              		  	<spring:message code="warehouse.stockissue.label" />
	                              		  </span>
	                              		  <span id="WarehouseStockIssueCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseGoodsTransferRead" style="vertical-align: -2px" id="WarehouseStockIssueRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseGoodsTransferWrite" style="vertical-align: -2px" id="WarehouseStockIssueWrite"/>Write
		                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('WarehouseStockIssue');" id="WarehouseStockIssueImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseGoodsTransferCCTo" style="vertical-align: -2px" id="WarehouseStockIssueCCTo"/>CC To
		                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('WarehouseStockIssue');" id="WarehouseStockIssueImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                                  </span>
		                           </div>
		                           <div style="margin-left: 0%">
			                       		<div id="WarehouseStockIssueFlow" class="inactiveSubChildBlock" style="font-size: 10px;background-color: rgb(240,240,240)">
			                       			<br>
			                       			<div class="row divbg" style="border: none">
			                              		  <span class="col-lg-6" style="cursor: pointer; padding-left: 80px;" >
			                              		  	<spring:message code="activities.label" />
			                              		  </span>
			                              		  <span id="" class="col-lg-6" style="padding: 0px">
			                              		  	<select class="form-control activities" name="WarehouseStockIssue" multiple="multiple" id="WarehouseStockIssueActivities">
				                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
								                            <c:if test="${workflow.businessFlow == 'Stock Issue'}">
								                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
								                            </c:if>
		                                 				</c:forEach>
			                              		  	</select>
				                                  </span>
				                           </div>
			                       		</div>
			                       </div>
		                           <br>
                                  <div id="WarehouseStockReturnId" class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer; padding-left: 60px;" onclick="activateSubChildFlow('WarehouseStockReturn');" >
	                              		  	<spring:message code="warehouse.stockreturn.label" />
	                              		  </span>
	                              		  <span id="WarehouseStockReturnCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseGoodsTransferRead" style="vertical-align: -2px" id="WarehouseStockReturnRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseGoodsTransferWrite" style="vertical-align: -2px" id="WarehouseStockReturnWrite"/>Write
		                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('WarehouseStockReturn');" id="WarehouseStockReturnImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseGoodsTransferCCTo" style="vertical-align: -2px" id="WarehouseStockReturnCCTo"/>CC To
		                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('WarehouseStockReturn');" id="WarehouseStockReturnImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                                  </span>
		                           </div>
		                           <div style="margin-left: 0%">
			                       		<div id="WarehouseStockReturnFlow" class="inactiveSubChildBlock" style="font-size: 10px;background-color: rgb(240,240,240)">
			                       			<br>
			                       			<div class="row divbg" style="border: none">
			                              		  <span class="col-lg-6" style="cursor: pointer; padding-left: 80px;">
			                              		  	<spring:message code="activities.label" />
			                              		  </span>
			                              		  <span id="" class="col-lg-6" style="padding: 0px">
			                              		  	<select class="form-control activities" name="WarehouseStockReturn" multiple="multiple" id="WarehouseStockReturnActivities">
				                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
								                            <c:if test="${workflow.businessFlow == 'Stock Return'}">
								                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
								                            </c:if>
		                                 				</c:forEach>
			                              		  	</select>
				                                  </span>
				                           </div>
			                       		</div>
			                       </div>
                               </div>
                               </div>
                               <br> --%>
                                <div id="WarehouseSalesOrderId"  class="row divsubbg" style="border: none">
                               	  <span class="col-lg-6"  onclick="activateSubFlow('WarehouseSalesOrder');" style="cursor: pointer;padding-left: 40px;">
	                              	<spring:message code="order.fulfillment.label" />
	                              </span>
	                              <span id="WarehouseSalesOrderCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="WarehouseManagementRead" style="vertical-align: -2px" onclick="selectAll('WarehouseSalesOrderRead')" id="WarehouseSalesOrderRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="WarehouseManagementWrite" style="vertical-align: -2px" onclick="selectAll('WarehouseSalesOrderWrite')" id="WarehouseSalesOrderWrite"/>Write
<%--                                   	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('WarehouseSalesOrder');" id="WarehouseSalesOrderImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                    <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="WarehouseManagementCCTo" style="vertical-align: -2px" onclick="selectAll('WarehouseSalesOrderCCTo')" id="WarehouseSalesOrderCCTo"/>CC To
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('WarehouseSalesOrder');" id="WarehouseSalesOrderImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                                </div>
                                  <div style="margin-left: 0%;">
	                              <div id="WarehouseSalesOrderFlow" class="inactiveSubBlock" style="font-size: 12px;background-color: rgb(240,240,240)">
	                                <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="warehouse.shipmentirders.label" />
	                              		  </span>
	                              		  <span id="WarehouseShipmentOrdersCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesOrderRead" style="vertical-align: -2px" id="WarehouseShipmentOrdersRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesOrderWrite" style="vertical-align: -2px" id="WarehouseShipmentOrdersWrite"/>Write
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesOrderCCTo" style="vertical-align: -2px" id="WarehouseShipmentOrdersCCTo"/>CC To
		                                  </span>
		                           </div>
		                             <br>
                                  <div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="warehouse.shipmentgatepass.label" />
	                              		  </span>
	                              		  <span id="WarehouseShipmentGatePassCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesOrderRead" style="vertical-align: -2px" id="WarehouseShipmentGatePassRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesOrderWrite" style="vertical-align: -2px" id="WarehouseShipmentGatePassWrite"/>Write
		                                  </span>
		                                    <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesOrderCCTo" style="vertical-align: -2px" id="WarehouseShipmentGatePassCCTo"/>CC TO
		                                  </span>
		                           </div>
		                             <br>
                                  <div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="warehouse.shipments.label" />
	                              		  </span>
	                              		  <span id="WarehouseShipmentsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesOrderRead" style="vertical-align: -2px" id="WarehouseShipmentsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesOrderWrite" style="vertical-align: -2px" id="WarehouseShipmentsWrite"/>Write
		                                  </span>
		                                    <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesOrderCCTo" style="vertical-align: -2px" id="WarehouseShipmentsCCTo"/>CC To
		                                  </span>
		                           </div>
		                            <br>
                                  <div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="warehouse.invoices.label" />
	                              		  </span>
	                              		  <span id="WarehouseInvoicesCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesOrderRead" style="vertical-align: -2px" id="WarehouseInvoicesRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesOrderWrite" style="vertical-align: -2px" id="WarehouseInvoicesWrite"/>Write
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesOrderCCTo" style="vertical-align: -2px" id="WarehouseInvoicesCCTo"/>CC To
		                                  </span>
		                           </div>
		                             <br>
                                  <div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="warehouse.payments.label" />
	                              		  </span>
	                              		  <span id="WarehousePaymentsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesOrderRead" style="vertical-align: -2px" id="WarehousePaymentsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesOrderWrite" style="vertical-align: -2px" id="WarehousePaymentsWrite"/>Write
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesOrderCCTo" style="vertical-align: -2px" id="WarehousePaymentsCCTo"/>CC To
		                                  </span>
		                           </div>
                               </div>
                               </div>
                               <br>
	                   		   <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="warehouse.health.label" />
                                  </span>
                                  <span id="WarehouseHealthCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseManagementRead" style="vertical-align: -2px" id="WarehouseHealthRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseManagementWrite" style="vertical-align: -2px" id="WarehouseHealthWrite"/>Write
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseManagementCCTo" style="vertical-align: -2px" id="WarehouseHealthCCTo"/>CC To
                                  </span>
                               </div>
                               <br>
	                   		   <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="warehouse.notification.label" />
                                  </span>
                                  <span id="WarehouseNotificationsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseManagementRead" style="vertical-align: -2px" id="WarehouseNotificationsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseManagementWrite" style="vertical-align: -2px" id="WarehouseNotificationsWrite"/>Write
                                  </span>
                                    <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseManagementCCTo" style="vertical-align: -2px" id="WarehouseNotificationsCCTo"/>CC To
                                  </span>
                               </div>
                  		 </div>
                        </c:if>    
                   		<br>
                   		<div id="ProcurementId" class="row divbg" >
                             <span onclick="activate('Procurement');" class="col-lg-6" style="font-size: 15px;cursor: pointer;">
                             	<spring:message code="warehouse_procurement.label" />
                             </span>
                             <span id="ProcurementCheck" class="col-lg-2" style="padding: 0px">
                              	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('ProcurementRead')" name="consoleRead" id="ProcurementRead"/>Read
                             </span>
                             <span  class="col-lg-2" style="padding: 0px">
                              	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('ProcurementWrite')" name="consoleWrite" id="ProcurementWrite"/>Write
<%--                               	<img style="float: right;height: 20px;cursor: pointer;" onclick="activate('Procurement');" id="ProcurementImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                             </span>
                             <span  class="col-lg-2" style="padding: 0px">
                              	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('ProcurementCCTo')" name="consoleCCTo" id="ProcurementCCTo"/>CC To
                              	<img style="float: right;height: 20px;cursor: pointer;" onclick="activate('Procurement');" id="ProcurementImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                             </span>
                        </div>
                        <div id="ProcurementFlow" style="margin-left: 0%;color:#666;background-color: rgb(240,240,240);margin-left: 2px;margin-right: 2px;" class="inactiveBlock">
	                   	 <br>
	                   	   <div id="RequestForQuotationId" class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" onclick="activateSubFlow('RequestForQuotation');" >
                                  	<spring:message code="rqst.for.quotation.label" />
                                  </span>
                                  <span id="RequestForQuotationCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="ProcurementRead" style="vertical-align: -2px" id="RequestForQuotationRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="ProcurementWrite" style="vertical-align: -2px" id="RequestForQuotationWrite"/>Write
<%--                                   	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('RequestForQuotation');" id="RequestForQuotationImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="ProcurementCCTo" style="vertical-align: -2px" id="RequestForQuotationCCTo"/>CC To
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('RequestForQuotation');" id="RequestForQuotationImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                            </div>
                            <div style="margin-left: 0%;">
	                            <div id="RequestForQuotationFlow" class="inactiveSubBlock" style="font-size: 12px;background-color: rgb(240,240,240)">
	                                 <br>
	                               		<div class="row divbg" style="border: none">
		                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                              		  	<spring:message code="activities.label" />
		                              		  </span>
		                              		  <span id="" class="col-lg-6" style="padding: 0px">
		                              		  	<select class="form-control activities" name="RequestForQuotation" multiple="multiple" id="RequestForQuotationActivities">
			                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
							                            <c:if test="${workflow.businessFlow == 'Request For Quotation'}">
							                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
							                            </c:if>
	                                 				</c:forEach>
		                              		  	</select>
			                                  </span>
			                           </div>
		                           </div>
		                        </div>
                            <br>
                            <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	Auto PO
                                  </span>
                                  <span id="AutoIndentCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="ProcurementRead" style="vertical-align: -2px" id="AutoIndentRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="ProcurementWrite" style="vertical-align: -2px" id="AutoIndentWrite"/>Write
                                  </span>
                                   <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="ProcurementCCTo" style="vertical-align: -2px" id="AutoIndentCCTo"/>CC To
                                  </span>
                            </div>
                            
                            <br>
	                   	   <div id="PurchaseOrderId" class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" onclick="activateSubFlow('PurchaseOrder');" >
                                  	<spring:message code="purchase.order.label" />
                                  </span>
                                  <span id="PurchaseOrderCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="ProcurementRead" style="vertical-align: -2px" id="PurchaseOrderRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="ProcurementWrite" style="vertical-align: -2px" id="PurchaseOrderWrite"/>Write
<%--                                   	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('PurchaseOrder');" id="PurchaseOrderImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                     <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="ProcurementCCTo" style="vertical-align: -2px" id="PurchaseOrderCCTo"/>CC To
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('PurchaseOrder');" id="PurchaseOrderImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                            </div>
                            <div style="margin-left: 0%;">
	                            <div id="PurchaseOrderFlow" class="inactiveSubBlock" style="font-size: 12px;background-color: rgb(240,240,240)">
	                                 <br>
	                               		<div class="row divbg" style="border: none">
		                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                              		  	<spring:message code="activities.label" />
		                              		  </span>
		                              		  <span id="" class="col-lg-6" style="padding: 0px">
		                              		  	<select class="form-control activities" name="PurchaseOrder" multiple="multiple" id="PurchaseOrderActivities">
			                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
							                            <c:if test="${workflow.businessFlow == 'Purchase Order'}">
							                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
							                            </c:if>
	                                 				</c:forEach>
		                              		  	</select>
			                                  </span>
			                           </div>
		                           </div>
		                        </div>
                            <br>
	                   	   <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="shipment.notes.label" />
                                  </span>
                                  <span id="ShipmentNotesCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="ProcurementRead" style="vertical-align: -2px" id="ShipmentNotesRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="ProcurementWrite" style="vertical-align: -2px" id="ShipmentNotesWrite"/>Write
                                  </span>
                                    <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="ProcurementCCTo" style="vertical-align: -2px" id="ShipmentNotesCCTo"/>CC To
                                  </span>
                            </div>
                            <br>
	                   	   <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="goods.receipts.label" />
                                  </span>
                                  <span id="ShipmentReceiptsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="ProcurementRead" style="vertical-align: -2px" id="ShipmentReceiptsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="ProcurementWrite" style="vertical-align: -2px" id="ShipmentReceiptsWrite"/>Write
                                  </span>
                                   <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="ProcurementCCTo" style="vertical-align: -2px" id="ShipmentReceiptsCCTo"/>CC To
                                  </span>
                            </div>
                            <br>
	                   	   <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="shipment.return.label" />
                                  </span>
                                  <span id="ShipmentReturnCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="ProcurementRead" style="vertical-align: -2px" id="ShipmentReturnRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="ProcurementWrite" style="vertical-align: -2px" id="ShipmentReturnWrite"/>Write
                                  </span>
                                   <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="ProcurementCCTo" style="vertical-align: -2px" id="ShipmentReturnCCTo"/>CC To
                                  </span>
                            </div>
                            <br>
	                   	   <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="warehouse.shipmentinspection.label" />
                                  </span>
                                  <span id="ShipmentInspectionCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="ProcurementRead" style="vertical-align: -2px" id="ShipmentInspectionRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="ProcurementWrite" style="vertical-align: -2px" id="ShipmentInspectionWrite"/>Write
                                  </span>
                                   <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="ProcurementCCTo" style="vertical-align: -2px" id="ShipmentInspectionCCTo"/>CC To
                                  </span>
                            </div>
                            <br>
	                   	   <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="invoicing.label" />
                                  </span>
                                  <span id="InvoicingCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="ProcurementRead" style="vertical-align: -2px" id="InvoicingRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="ProcurementWrite" style="vertical-align: -2px" id="InvoicingWrite"/>Write
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="ProcurementCCTo" style="vertical-align: -2px" id="InvoicingCCTo"/>CC To
                                  </span>
                            </div>
                            <br>
	                   	   <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="payments.label" />
                                  </span>
                                  <span id="PaymentsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="ProcurementRead" style="vertical-align: -2px" id="PaymentsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="ProcurementWrite" style="vertical-align: -2px" id="PaymentsWrite"/>Write
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="ProcurementCCTo" style="vertical-align: -2px" id="PaymentsCCTo"/>CC To
                                  </span>
                            </div>
                         </div>
                   		<br>
                   		<div id="OrderManagementId" class="row divbg" >
                             <span onclick="activate('OrderManagement');" class="col-lg-6" style="font-size: 15px;cursor: pointer;">
                             	<spring:message code="order.management.label" />
                             </span>
                             <span id="OrderManagementCheck" class="col-lg-2" style="padding: 0px">
                              	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('OrderManagementRead')" name="consoleRead" id="OrderManagementRead"/>Read
                             </span>
                             <span  class="col-lg-2" style="padding: 0px">
                              	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('OrderManagementWrite')" name="consoleWrite" id="OrderManagementWrite"/>Write
<%--                               	<img style="float: right;height: 20px;cursor: pointer;" onclick="activate('OrderManagement');" id="OrderManagementImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                             </span>
                               <span  class="col-lg-2" style="padding: 0px">
                              	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('OrderManagementCCTo')" name="consoleCCTo" id="OrderManagementCCTo"/>CC To
                              	<img style="float: right;height: 20px;cursor: pointer;" onclick="activate('OrderManagement');" id="OrderManagementImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                             </span>
                        </div>
                        <div id="OrderManagementFlow" style="margin-left: 0%;color:#666;background-color: rgb(240,240,240);margin-left: 2px;margin-right: 2px;" class="inactiveBlock">
	                   	 <br>
	                   	    <div id="OrderManagementSalesOrderId"  class="row divsubbg" style="border: none">
                               	  <span class="col-lg-6"  onclick="activateSubFlow('OrderManagementSalesOrder');" style="cursor: pointer;padding-left: 40px;">
	                              	<spring:message code="sales.orders.label" />
	                              </span>
	                              <span id="OrderManagementSalesOrderCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="OrderManagementRead" style="vertical-align: -2px" onclick="selectAll('OrderManagementSalesOrderRead')" id="OrderManagementSalesOrderRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="OrderManagementWrite" style="vertical-align: -2px" onclick="selectAll('OrderManagementSalesOrderWrite')" id="OrderManagementSalesOrderWrite"/>Write
<%--                                   	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('OrderManagementSalesOrder');" id="OrderManagementSalesOrderImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="OrderManagementCCTo" style="vertical-align: -2px" onclick="selectAll('OrderManagementSalesOrderCCTo')" id="OrderManagementSalesOrderCCTo"/>CC To
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('OrderManagementSalesOrder');" id="OrderManagementSalesOrderImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                             </div>
                             <div style="margin-left: 0%;">
	                            <div id="OrderManagementSalesOrderFlow" class="inactiveSubBlock" style="font-size: 12px;background-color: rgb(240,240,240)">
	                                 <br>
	                               		<div class="row divsubbg" style="border: none">
		                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                              		  	<spring:message code="activities.label" />
		                              		  </span>
		                              		  <span id="" class="col-lg-6" style="padding: 0px">
		                              		  	<select class="form-control activities" name="OrderManagementSalesOrder" multiple="multiple" id="OrderManagementSalesOrderActivities">
			                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
							                            <c:if test="${workflow.businessFlow == 'Order'}">
							                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
							                            </c:if>
	                                 				</c:forEach>
		                              		  	</select>
			                                  </span>
			                           </div>
		                           </div>
		                        </div>
		                         <br>
		                        
                             
                            <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  	Orders Vs Stock
	                              		  </span>
	                              		  <span id="OrderManagementSalesOrderVsStockCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OrderManagementRead" style="vertical-align: -2px" id="OrderManagementSalesOrderVsStockRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OrderManagementWrite" style="vertical-align: -2px" id="OrderManagementSalesOrderVsStockWrite"/>Write
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OrderManagementCCTo" style="vertical-align: -2px" id="OrderManagementSalesOrderVsStockCCTo"/>CC To
		                                  </span>
		                             </div>
		                      <br>
	                   	    <div id="OrderManagementFulFillmentId"  class="row divsubbg" style="border: none">
                               	  <span class="col-lg-6"  onclick="activateSubFlow('OrderManagementFulFillment');" style="padding-left: 40px;cursor: pointer;">
	                              	<spring:message code="fulfillment.label" />
	                              </span>
	                              <span id="OrderManagementFulFillmentCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="OrderManagementRead" style="vertical-align: -2px" onclick="selectAll('OrderManagementFulFillmentRead')" id="OrderManagementFulFillmentRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="OrderManagementWrite" style="vertical-align: -2px" onclick="selectAll('OrderManagementFulFillmentWrite')" id="OrderManagementFulFillmentWrite"/>Write
<%--                                   	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('OrderManagementFulFillment');" id="OrderManagementFulFillmentImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="OrderManagementCCTo" style="vertical-align: -2px" onclick="selectAll('OrderManagementFulFillmentCCTo')" id="OrderManagementFulFillmentCCTo"/>CC To
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('OrderManagementFulFillment');" id="OrderManagementFulFillmentImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                             </div>
                             <div style="margin-left: 0%;">
	                            <div id="OrderManagementFulFillmentFlow" class="inactiveSubBlock" style="font-size: 12px;background-color: rgb(240,240,240)">
	                            	 <br>
	                               		<%-- <div class="row divbg" style="border: none">
		                              		  <span class="col-lg-6" style="cursor: pointer;" >
		                              		  	<spring:message code="activities.label" />
		                              		  </span>
		                              		  <span id="" class="col-lg-6" style="padding: 0px">
		                              		  	<select class="form-control activities" name="OrderManagementFulFillment" multiple="multiple" id="OrderManagementFulFillmentActivities">
			                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
							                            <c:if test="${workflow.businessFlow == 'Shipment'}">
							                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
							                            </c:if>
	                                 				</c:forEach>
		                              		  	</select>
			                                  </span>
			                           </div>
	                            	  <br> --%>
	                               	  <div class="row divsubbg" style="border: none">
		                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                              		  	<spring:message code="shipment.notes.label" />
		                              		  </span>
		                              		  <span id="OrderManagementShipmentNotesCheck" class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OrderManagementFulFillmentRead" style="vertical-align: -2px" id="OrderManagementShipmentNotesRead"/>Read
			                                  </span>
			                                  <span class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OrderManagementFulFillmentWrite" style="vertical-align: -2px" id="OrderManagementShipmentNotesWrite"/>Write
			                                  </span>
			                                   <span class="col-lg-2" style="padding: 0px">
			                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OrderManagementFulFillmentCCTo" style="vertical-align: -2px" id="OrderManagementShipmentNotesCCTo"/>CC To
			                                  </span>
			                           </div>
			                           <br>
                               		   <div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="bill.of.landing" />
	                              		  </span>
	                              		  <span id="OrderManagementBillOfLadingCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OrderManagementFulFillmentRead" style="vertical-align: -2px" id="OrderManagementBillOfLadingRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OrderManagementFulFillmentWrite" style="vertical-align: -2px" id="OrderManagementBillOfLadingWrite"/>Write
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OrderManagementFulFillmentCCTo" style="vertical-align: -2px" id="OrderManagementBillOfLadingCCTo"/>CC To
		                                  </span>
		                           	  </div>
	                            	
	                            	
	                            	
	                            	<%-- <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;" >
	                              		  	<spring:message code="warehouse.shipments.label" />
	                              		  </span>
	                              		  <span id="OrderManagementShipmentsCheck" class="col-lg-3" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OrderManagementFulFillmentRead" style="vertical-align: -2px" id="OrderManagementShipmentsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-3" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OrderManagementFulFillmentWrite" style="vertical-align: -2px" id="OrderManagementShipmentsWrite"/>Write
		                                  </span>
		                           </div>
		                           <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;" >
	                              		  	<spring:message code="pending.label" />
	                              		  </span>
	                              		  <span id="OrderManagementPendingCheck" class="col-lg-3" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OrderManagementFulFillmentRead" style="vertical-align: -2px" id="OrderManagementPendingRead"/>Read
		                                  </span>
		                                  <span class="col-lg-3" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OrderManagementFulFillmentWrite" style="vertical-align: -2px" id="OrderManagementPendingWrite"/>Write
		                                  </span>
		                           </div>
		                           <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;" >
	                              		  	<spring:message code="shipment.notes.label" />
	                              		  </span>
	                              		  <span id="OrderManagementShipmentNotesCheck" class="col-lg-3" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OrderManagementFulFillmentRead" style="vertical-align: -2px" id="OrderManagementShipmentNotesRead"/>Read
		                                  </span>
		                                  <span class="col-lg-3" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OrderManagementFulFillmentWrite" style="vertical-align: -2px" id="OrderManagementShipmentNotesWrite"/>Write
		                                  </span>
		                           </div>
		                           <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;" >
	                              		  	<spring:message code="returned.bills.label" />
	                              		  </span>
	                              		  <span id="OrderManagementReturnedCheck" class="col-lg-3" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OrderManagementFulFillmentRead" style="vertical-align: -2px" id="OrderManagementReturnedRead"/>Read
		                                  </span>
		                                  <span class="col-lg-3" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OrderManagementFulFillmentWrite" style="vertical-align: -2px" id="OrderManagementReturnedWrite"/>Write
		                                  </span>
		                           </div>
		                           <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;" >
	                              		  	<spring:message code="delivered.order.label" />
	                              		  </span>
	                              		  <span id="OrderManagementDeliveredCheck" class="col-lg-3" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OrderManagementFulFillmentRead" style="vertical-align: -2px" id="OrderManagementDeliveredRead"/>Read
		                                  </span>
		                                  <span class="col-lg-3" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OrderManagementFulFillmentWrite" style="vertical-align: -2px" id="OrderManagementDeliveredWrite"/>Write
		                                  </span>
		                           </div>
		                           <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;" >
	                              		  	<spring:message code="bill.of.landing" />
	                              		  </span>
	                              		  <span id="OrderManagementBillOfLadingCheck" class="col-lg-3" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OrderManagementFulFillmentRead" style="vertical-align: -2px" id="OrderManagementBillOfLadingRead"/>Read
		                                  </span>
		                                  <span class="col-lg-3" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OrderManagementFulFillmentWrite" style="vertical-align: -2px" id="OrderManagementBillOfLadingWrite"/>Write
		                                  </span>
		                           </div> --%>
	                            </div>
	                        </div>
		                    <br>
		                    <div id="OrderManagementPaymentsId"  class="row divsubbg" style="border: none">
                               	  <span class="col-lg-6"  onclick="activateSubFlow('OrderManagementPayments');" style="cursor: pointer;padding-left: 40px;">
	                              	<spring:message code="warehouse.payments.label" />
	                              </span>
	                              <span id="OrderManagementPaymentsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="OrderManagementRead" style="vertical-align: -2px" onclick="selectAll('OrderManagementPaymentsRead')" id="OrderManagementPaymentsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="OrderManagementWrite" style="vertical-align: -2px" onclick="selectAll('OrderManagementPaymentsWrite')" id="OrderManagementPaymentsWrite"/>Write
<%--                                   	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('OrderManagementPayments');" id="OrderManagementPaymentsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                     <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="OrderManagementCCTo" style="vertical-align: -2px" onclick="selectAll('OrderManagementPaymentsCCTo')" id="OrderManagementPaymentsCCTo"/>CC To
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('OrderManagementPayments');" id="OrderManagementPaymentsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                             </div>
                             <div style="margin-left: 0%;">
	                            <div id="OrderManagementPaymentsFlow" class="inactiveSubBlock" style="font-size: 12px;background-color: rgb(240,240,240)">
	                            	<br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="bills.label" />
	                              		  </span>
	                              		  <span id="OrderManagementBillsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OrderManagementPaymentsRead" style="vertical-align: -2px" id="OrderManagementBillsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OrderManagementPaymentsWrite" style="vertical-align: -2px" id="OrderManagementBillsWrite"/>Write
		                                  </span>
		                                    <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OrderManagementPaymentsCCTo" style="vertical-align: -2px" id="OrderManagementBillsCCTo"/>CC To
		                                  </span>
		                           </div>
		                    	  <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="warehouse.payments.label" />
	                              		  </span>
	                              		  <span id="OrderManagementBillsPaymentsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OrderManagementPaymentsRead" style="vertical-align: -2px" id="OrderManagementBillsPaymentsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OrderManagementPaymentsWrite" style="vertical-align: -2px" id="OrderManagementBillsPaymentsWrite"/>Write
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OrderManagementPaymentsCCTo" style="vertical-align: -2px" id="OrderManagementBillsPaymentsCCTo"/>CC To
		                                  </span>
		                           </div>
		                           <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="pending.payments.label" />
	                              		  </span>
	                              		  <span id="OrderManagementPendingPaymentsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OrderManagementPaymentsRead" style="vertical-align: -2px" id="OrderManagementPendingPaymentsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OrderManagementPaymentsWrite" style="vertical-align: -2px" id="OrderManagementPendingPaymentsWrite"/>Write
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OrderManagementPaymentsCCTo" style="vertical-align: -2px" id="OrderManagementPendingPaymentsCCTo"/>CC To
		                                  </span>
		                           </div>
		                      </div>
		                    </div>
		                </div>
                   		<br>
                   		 <div id="DealsAndOffersId"  class="row divbg">
                             <span  onclick="activate('DealsAndOffers');" class="col-lg-6" style="font-size: 15px;cursor: pointer;">
                             	<spring:message code="campaignmanagment.label"/> 
                             </span>
                             <span id="DealsAndOffersCheck" class="col-lg-2" style="padding: 0px">
                              	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('DealsAndOffersRead')" name="consoleRead" id="DealsAndOffersRead"/>Read
                             </span>
                             <span  class="col-lg-2" style="padding: 0px">
                              	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('DealsAndOffersWrite')" name="consoleWrite" id="DealsAndOffersWrite"/>Write
<%--                               	<img style="float: right;height: 20px;cursor: pointer;" onclick="activate('DealsAndOffers');" id="DealsAndOffersImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                             </span>
                              <span  class="col-lg-2" style="padding: 0px">
                              	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('DealsAndOffersCCTo')" name="consoleCCTo" id="DealsAndOffersCCTo"/>CC To
                              	<img style="float: right;height: 20px;cursor: pointer;" onclick="activate('DealsAndOffers');" id="DealsAndOffersImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                             </span>
                             </div>
                              <div id="DealsAndOffersFlow" style="color:#666;background-color: rgb(240,240,240);margin-left: 2px;margin-right: 2px;" class="inactiveBlock">
	                   		 <br>
	                   		   <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="deals.label" />
                                  </span>
                                  <span id="DealsConfigurationCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="DealsAndOffersRead" style="vertical-align: -2px" id="DealsConfigurationRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="DealsAndOffersWrite" style="vertical-align: -2px" id="DealsConfigurationWrite"/>Write
                                  </span>
                                   <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="DealsAndOffersCCTo" style="vertical-align: -2px" id="DealsConfigurationCCTo"/>CC To
                                  </span>
                               </div>
                                <br>
	                   		   <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="offers.label" />
                                  </span>
                                  <span id="OffersConfigurationCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="DealsAndOffersRead" style="vertical-align: -2px" id="OffersConfigurationRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="DealsAndOffersWrite" style="vertical-align: -2px" id="OffersConfigurationWrite"/>Write
                                  </span>
                                    <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="DealsAndOffersCCTo" style="vertical-align: -2px" id="OffersConfigurationCCTo"/>CC To
                                  </span>
                               </div>
                            
                             
                                <br>
                                <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="socialmediacampaigns.label" />
                                  </span>
                                  <span id="socialMediaCampaignCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="DealsAndOffersRead" style="vertical-align: -2px" id="socialMediaCampaignRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="DealsAndOffersWrite" style="vertical-align: -2px" id="socialMediaCampaignWrite"/>Write
                                  </span>
                                    <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="DealsAndOffersCCTo" style="vertical-align: -2px" id="socialMediaCampaignCCTo"/>CC To
                                  </span>
                               </div>
                               <br>
                               
                               <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  Customer Notification
                                  </span>
                                  <span id="CustomerNotificationCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="DealsAndOffersRead" style="vertical-align: -2px" id="CustomerNotificationRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="DealsAndOffersWrite" style="vertical-align: -2px" id="CustomerNotificationWrite"/>Write
                                  </span>
                                   <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="DealsAndOffersCCTo" style="vertical-align: -2px" id="CustomerNotificationCCTo"/>CC To
                                  </span>
                               </div>
                                <br>
                               
                                    <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="emailcampaigns.label" />
                                  </span>
                                  <span id="EmailCampaignCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="DealsAndOffersRead" style="vertical-align: -2px" id="EmailCampaignRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="DealsAndOffersWrite" style="vertical-align: -2px" id="EmailCampaignWrite"/>Write
                                  </span>
                                   <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="DealsAndOffersCCTo" style="vertical-align: -2px" id="EmailCampaignCCTo"/>CC To
                                  </span>
                               </div>
                                 <br>
                                    <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="mobilecampaigns.label" />
                                  </span>
                                  <span id="MobileCampaignCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="DealsAndOffersRead" style="vertical-align: -2px" id="MobileCampaignRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="DealsAndOffersWrite" style="vertical-align: -2px" id="MobileCampaignWrite"/>Write
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="DealsAndOffersCCTo" style="vertical-align: -2px" id="MobileCampaignCCTo"/>CC To
                                  </span>
                               </div>
                                 <br>
                                    <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="customerreferals.label" />
                                  </span>
                                  <span id="CustomerReferalCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="DealsAndOffersRead" style="vertical-align: -2px" id="CustomerReferalRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="DealsAndOffersWrite" style="vertical-align: -2px" id="CustomerReferalWrite"/>Write
                                  </span>
                                   <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="DealsAndOffersCCTo" style="vertical-align: -2px" id="CustomerReferalCCTo"/>CC To
                                  </span>
                               </div>
                                 <%-- <br>
                                    <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="promotions.label" />
                                  </span>
                                  <span id="PromotionCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="DealsAndOffersRead" style="vertical-align: -2px" id="PromotionRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="DealsAndOffersWrite" style="vertical-align: -2px" id="PromotionWrite"/>Write
                                  </span>
                                   <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="DealsAndOffersCCTo" style="vertical-align: -2px" id="PromotionCCTo"/>CC To
                                  </span>
                               </div> --%>
                             </div>
                            
                          <br>
                          
                            <div id="CustomerLoyalityId"  class="row divbg">
                             <span  onclick="activate('CustomerLoyality');" class="col-lg-6" style="font-size: 15px;cursor: pointer;">
                             	<spring:message code="customer.loyality.label" />
                             </span>
                             <span id="CustomerLoyalityCheck" class="col-lg-2" style="padding: 0px">
                              	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('CustomerLoyalityRead')" name="consoleRead" id="CustomerLoyalityRead"/>Read
                             </span>
                             <span  class="col-lg-2" style="padding: 0px">
                              	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('CustomerLoyalityWrite')" name="consoleWrite" id="CustomerLoyalityWrite"/>Write
<%--                               	<img style="float: right;height: 20px;cursor: pointer;" onclick="activate('CustomerLoyality');" id="CustomerLoyalityImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                             </span>
                             <span  class="col-lg-2" style="padding: 0px">
                              	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('CustomerLoyalityCCTo')" name="consoleCCTo" id="CustomerLoyalityCCTo"/>CC To
                              	<img style="float: right;height: 20px;cursor: pointer;" onclick="activate('CustomerLoyality');" id="CustomerLoyalityImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                             </span>
                             </div>
                              <div id="CustomerLoyalityFlow" style="color:#666; background-color:rgb(240,240,240); ;margin-left: 2px;margin-right: 2px;" class="inactiveBlock">
	                   		 <br>
	                   		   <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="customer.retention.label" />
                                  </span>
                                  <span id="CustomerRetentionCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="CustomerLoyalityRead" style="vertical-align: -2px" id="CustomerRetentionRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="CustomerLoyalityWrite" style="vertical-align: -2px" id="CustomerRetentionWrite"/>Write
                                  </span>
                                   <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="CustomerLoyalityCCTo" style="vertical-align: -2px" id="CustomerRetentionCCTo"/>CC To
                                  </span>
                               </div>
                                <br>
	                   		   <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="customer.patterns.label" />
                                  </span>
                                  <span id="CustomerPatternsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="CustomerLoyalityRead" style="vertical-align: -2px" id="CustomerPatternsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="CustomerLoyalityWrite" style="vertical-align: -2px" id="CustomerPatternsWrite"/>Write
                                  </span>
                                   <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="CustomerLoyalityCCTo" style="vertical-align: -2px" id="CustomerPatternsCCTo"/>CC To
                                  </span>
                               </div>
                               <br>
                                <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="loyality.cards.label" />
                                  </span>
                                  <span id="LoyaltycardsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="CustomerLoyalityRead" style="vertical-align: -2px" id="LoyaltycardsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="CustomerLoyalityWrite" style="vertical-align: -2px" id="LoyaltycardsWrite"/>Write
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="CustomerLoyalityCCTo" style="vertical-align: -2px" id="LoyaltycardsCCTo"/>CC To
                                  </span>
                               </div>
                               <br>
                                    <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="loyality.coupons.label" />
                                  </span>
                                  <span id="GiftCouponsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="CustomerLoyalityRead" style="vertical-align: -2px" id="GiftCouponsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="CustomerLoyalityWrite" style="vertical-align: -2px" id="GiftCouponsWrite"/>Write
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="CustomerLoyalityCCTo" style="vertical-align: -2px" id="GiftCouponsCCTo"/>CC To
                                  </span>
                               </div>
                                 <br>
                                    <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="loyality.giftvouchers.label" />
                                  </span>
                                  <span id="GiftVoucherCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="CustomerLoyalityRead" style="vertical-align: -2px" id="GiftVoucherRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="CustomerLoyalityWrite" style="vertical-align: -2px" id="GiftVoucherWrite"/>Write
                                  </span>
                                    <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="CustomerLoyalityCCTo" style="vertical-align: -2px" id="GiftVoucherCCTo"/>CC To
                                  </span>
                               </div>
                                 <br>
                                    <%-- <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="loyality.rewards.label" />
                                  </span>
                                  <span id="LoyalityRewardsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="CustomerLoyalityRead" style="vertical-align: -2px" id="LoyalityRewardsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="CustomerLoyalityWrite" style="vertical-align: -2px" id="LoyalityRewardsWrite"/>Write
                                  </span>
                                    <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="CustomerLoyalityCCTo" style="vertical-align: -2px" id="LoyalityRewardsCCTo"/>CC To
                                  </span>
                               </div>
                                <br>
		                                <div class="row divsubbg" style="border: none">
		                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                                  	Wallets
		                                  </span>
		                                  <span id="WalletsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="CustomerLoyalityRead" style="vertical-align: -2px" id="WalletsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="CustomerLoyalityWrite" style="vertical-align: -2px" id="WalletsWrite"/>Write
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="CustomerLoyalityCCTo" style="vertical-align: -2px" id="WalletsCCTo"/>CC To
		                                  </span>
		                               </div> --%>
		                               
		                               
		                               
		                                                  <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="loyality.rewards.label" />
                                  </span>
                                  <span id="LoyalityRewardsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="CustomerLoyalityRead" style="vertical-align: -2px" id="LoyalityRewardsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="CustomerLoyalityWrite" style="vertical-align: -2px" id="LoyalityRewardsWrite"/>Write
                                  </span>
                                    <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="CustomerLoyalityCCTo" style="vertical-align: -2px" id="LoyalityRewardsCCTo"/>CC To
                                  </span>
                               </div>
                               <br>
                               
                                <div class="row divsubbg" style="border: none">
		                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                                  	Memberships
		                                  </span>
		                                  <span id="MembershipsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="CustomerLoyalityRead" style="vertical-align: -2px" id="MembershipsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="CustomerLoyalityWrite" style="vertical-align: -2px" id="MembershipsWrite"/>Write
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="CustomerLoyalityCCTo" style="vertical-align: -2px" id="MembershipsCCTo"/>CC To
		                                  </span>
		                               </div>
		                               <br>
                               
		                                <div class="row divsubbg" style="border: none">
		                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                                  	Wallets
		                                  </span>
		                                  <span id="WalletsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="CustomerLoyalityRead" style="vertical-align: -2px" id="WalletsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="CustomerLoyalityWrite" style="vertical-align: -2px" id="WalletsWrite"/>Write
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="CustomerLoyalityCCTo" style="vertical-align: -2px" id="WalletsCCTo"/>CC To
		                                  </span>
		                               </div>
		                               <br>
		                               
		                               <div class="row divsubbg" style="border: none">
		                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                                  	Subscription
		                                  </span>
		                                  <span id="SubscriptionCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="CustomerLoyalityRead" style="vertical-align: -2px" id="SubscriptionRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="CustomerLoyalityWrite" style="vertical-align: -2px" id="SubscriptionWrite"/>Write
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="CustomerLoyalityCCTo" style="vertical-align: -2px" id="SubscriptionCCTo"/>CC To
		                                  </span>
		                               </div>
                               
                                 
                             </div>
                          <br>
                          
                           <div id="crmId" class="row divbg">
                             <span  class="col-lg-6" onclick="activate('crm');" style="font-size: 15px;cursor: pointer;">
                             	<spring:message code="loyaltyprogram.label" />
                             </span>
                             <span id="crmCheck" class="col-lg-2" style="padding: 0px">
                              	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('crmRead');" name="consoleRead" id="crmRead"/>Read
                             </span>
                             <span  class="col-lg-2" style="padding: 0px">
                              	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('crmWrite')" name="consoleWrite" id="crmWrite"/>Write
<%--                               	<img style="float: right;height: 20px;cursor: pointer;" onclick="activate('crm');" id="crmImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                             </span>
                              <span  class="col-lg-2" style="padding: 0px">
                              	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('crmCCTo')" name="consoleCCTo" id="crmCCTo"/>CC To
                              	<img style="float: right;height: 20px;cursor: pointer;" onclick="activate('crm');" id="crmImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                             </span>
                          </div>
                          <div id="crmFlow" style="margin-left: 0%;color:#666;background-color: rgb(240,240,278);margin-left: 2px;margin-right: 2px;" class="inactiveBlock">
                          		<br>
                          		<div class="row divsubbg" style="border: none">
	                   			  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="customer.view.label" />
                                  </span>
                                  <span id="CustomerViewCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="CustomerView" name="crmRead" id="CustomerViewRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="crmWrite"  id="CustomerViewWrite"/>Write
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="crmCCTo" id="CustomerViewCCTo"/>CC To
                                  </span>
                                </div>
                                <br>
                               <div class="row divsubbg" style="border: none">
	                   			  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="customerGroups.label" />
                                  </span>
                                  <span id="CustomerGroupCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="CustomerGroup" name="crmRead" id="CustomerGroupRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="crmWrite"  id="CustomerGroupWrite"/>Write
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="crmCCTo" id="CustomerGroupCCTo"/>CC To
                                  </span>
                                </div>
                                <br> 
                                
                          		<div class="row divsubbg" style="border: none">
	                   			  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="customer.visits.label" />
                                  </span>
                                  <span id="CustomerVisitsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="CustomerVisits" name="crmRead" id="CustomerVisitsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="crmWrite"  id="CustomerVisitsWrite"/>Write
                                  </span>
                                     <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="crmCCTo" id="CustomerVisitsCCTo"/>CC To
                                  </span>
                                </div>
                                <br>
                          		<div class="row divsubbg" style="border: none">
	                   			  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="customer.purchases.label" />
                                  </span>
                                  <span id="CustomerPurchasesCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="CustomerView" name="crmRead" id="CustomerPurchasesRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="crmWrite"  id="CustomerPurchasesWrite"/>Write
                                  </span>
                                      <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="crmCCTo"  id="CustomerPurchasesCCTo"/>CC To
                                  </span>
                                </div>
                              <%--   <br>
		                   		 <div id="LoyaltyProgramId" class="row divsubbg"  style="border: none;">
		                             <span  class="col-lg-6" onclick="activateSubFlow('LoyaltyProgram');" style="cursor: pointer;padding-left: 40px;">
		                             	<spring:message code="loyalty.program.label" />
		                             </span>
		                             <span id="LoyaltyProgramCheck" class="col-lg-2" style="padding: 0px">
		                              	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('LoyaltyProgramRead');" name="crmRead" id="LoyaltyProgramRead"/>Read
		                             </span>
		                             <span  class="col-lg-2" style="padding: 0px">
		                              	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('LoyaltyProgramWrite')" name="crmWrite" id="LoyaltyProgramWrite"/>Write
		                              	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('LoyaltyProgram');" id="LoyaltyProgramImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                             </span>
		                               <span  class="col-lg-2" style="padding: 0px">
		                              	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('LoyaltyProgramCCTo')" name="crmCCTo" id="LoyaltyProgramCCTo"/>CC To
		                              	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('LoyaltyProgram');" id="LoyaltyProgramImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                             </span>
		                             </div>
		                              <div id="LoyaltyProgramFlow" class="inactiveSubBlock" style="font-size: 12px">
			                   		 <br>
			                   		   <div class="row divsubbg" style="border: none">
		                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                                  	<spring:message code="giftvouchers.label" />
		                                  </span>
		                                  <span id="GiftVoucherCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="LoyaltyProgramRead" style="vertical-align: -2px" id="GiftVoucherRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="LoyaltyProgramWrite" style="vertical-align: -2px" id="GiftVoucherWrite"/>Write
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="LoyaltyProgramCCTo" style="vertical-align: -2px" id="GiftVoucherCCTo"/>CC To
		                                  </span>
		                               </div>
		                               <br>
		                               <div class="row divsubbg" style="border: none">
			                   			  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                                  	<spring:message code="giftCoupons.label" />
		                                  </span>
		                                  <span id="GiftCouponsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="LoyaltyProgramRead" style="vertical-align: -2px" id="GiftCouponsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="LoyaltyProgramWrite" style="vertical-align: -2px" id="GiftCouponsWrite"/>Write
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="LoyaltyProgramCCTo" style="vertical-align: -2px" id="GiftCouponsCCTo"/>CC To
		                                  </span>
		                                </div>
		                                <br>
		                                <div class="row divsubbg" style="border: none">
		                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                                  	<spring:message code="loyaltycards.label" />
		                                  </span>
		                                  <span id="LoyaltycardsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="LoyaltyProgramRead" style="vertical-align: -2px" id="LoyaltycardsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="LoyaltyProgramWrite" style="vertical-align: -2px" id="LoyaltycardsWrite"/>Write
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="LoyaltyProgramCCTo" style="vertical-align: -2px" id="LoyaltycardsCCTo"/>CC To
		                                  </span>
		                               </div>
		                             </div>
		                         --%><br>
                          		<div class="row divsubbg" style="border: none">
	                   			  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="customer.notifications.label" />
                                  </span>
                                  <span id="CustomerNotificationCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="CustomerView" name="crmRead" id="CustomerNotificationRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="crmWrite"  id="CustomerNotificationWrite"/>Write
                                  </span>
                                   <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="crmCCTo"id="CustomerNotificationCCTo"/>CC To
                                  </span>
                                </div>
                                <br>
                          		<div class="row divsubbg" style="border: none">
	                   			  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="customer.warrants.label" />
                                  </span>
                                  <span id="CustomerWarrantsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="CustomerView" name="crmRead" id="CustomerWarrantsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="crmWrite"  id="CustomerWarrantsWrite"/>Write
                                  </span>
                                   <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="crmCCTo"  id="CustomerWarrantsCCTo"/>CC To
                                  </span>
                                </div>
                                 <br>
                          		<div class="row divsubbg" style="border: none">
	                   			  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="customer.feedback.label" />
                                  </span>
                                  <span id="CustomerFeedbackCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="CustomerFeedback" name="crmRead" id="CustomerFeedbackRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="crmWrite"  id="CustomerFeedbackWrite"/>Write
                                  </span>
                                   <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="crmCCTo"id="CustomerFeedbackCCTo"/>CCTo
                                  </span>
                                </div>
                                   <br>
                                <div id="CustomerComplaintsId"  class="row divsubbg" style="border: none">
                               	  <span class="col-lg-6"  onclick="activateSubFlow('CustomerComplaints');" style="cursor: pointer;padding-left: 40px;">
	                              	<spring:message code="customer.complaints.label" />
	                              </span>
	                              <span id="CustomerComplaintsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="crmRead" style="vertical-align: -2px" onclick="selectAll('CustomerComplaintsRead')" id="CustomerComplaintsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="crmWrite" style="vertical-align: -2px" onclick="selectAll('CustomerComplaintsWrite')" id="CustomerComplaintsWrite"/>Write
<%--                                   	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('CustomerComplaints');" id="CustomerComplaintsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                    <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="crmCCTo" style="vertical-align: -2px" onclick="selectAll('CustomerComplaintsCCTo')" id="CustomerComplaintsCCTo"/>CCTo
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('CustomerComplaints');" id="CustomerComplaintsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                             </div>
                             <div style="margin-left: 0%;">
	                            <div id="CustomerComplaintsFlow" class="inactiveSubBlock" style="font-size: 12px;">
	                                 <br>
	                               		<div class="row divsubbg" style="border: none">
		                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                              		  	<spring:message code="activities.label" />
		                              		  </span>
		                              		  <span id="" class="col-lg-6" style="padding: 0px">
		                              		  	<select class="form-control activities" name="CustomerComplaints" multiple="multiple" id="CustomerComplaintsActivities">
			                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
							                            <c:if test="${workflow.businessFlow == 'Customer Complaints'}">
							                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
							                            </c:if>
	                                 				</c:forEach>
		                              		  	</select>
			                                  </span>
			                           </div>
		                           </div>
		                        </div>
                                   <br>
                                   
                                   <br>
                          		<div class="row divsubbg" style="border: none">
	                   			  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	Customer OTP
                                  </span>
                                  <span id="CustomerOTPCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="CustomerView" name="crmRead" id="CustomerOTPRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="crmWrite"  id="CustomerOTPWrite"/>Write
                                  </span>
                                   <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="crmCCTo"  id="CustomerOTPCCTo"/>CC To
                                  </span>
                                </div>
                                   
                                   
                                   
                                <div id="BusinessEnquiryId"  class="row divsubbg" style="border: none">
                               	  <span class="col-lg-6"  onclick="activateSubFlow('BusinessEnquiry');" style="cursor: pointer;padding-left: 40px;">
	                              	<spring:message code="business.enquiry.label" />
	                              </span>
	                              <span id="BusinessEnquiryCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="crmRead" style="vertical-align: -2px" onclick="selectAll('BusinessEnquiryRead')" id="BusinessEnquiryRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="crmWrite" style="vertical-align: -2px" onclick="selectAll('BusinessEnquiryWrite')" id="BusinessEnquiryWrite"/>Write
<%--                                   	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('BusinessEnquiry');" id="BusinessEnquiryImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                    <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="crmCCTo" style="vertical-align: -2px" onclick="selectAll('BusinessEnquiryCCTo')" id="BusinessEnquiryCCTo"/>CCTo
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('BusinessEnquiry');" id="BusinessEnquiryImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                             </div>
                             <div style="margin-left: 0%;">
	                            <div id="BusinessEnquiryFlow" class="inactiveSubBlock" style="font-size: 12px;background-color: rgb(240,240,240)">
	                                 <br>
	                               		<div class="row divsubbg" style="border: none">
		                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                              		  	<spring:message code="activities.label" />
		                              		  </span>
		                              		  <span id="" class="col-lg-6" style="padding: 0px">
		                              		  	<select class="form-control activities" name="BusinessEnquiry" multiple="multiple" id="BusinessEnquiryActivities">
			                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
							                            <c:if test="${workflow.businessFlow == 'Business Enquiry'}">
							                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
							                            </c:if>
	                                 				</c:forEach>
		                              		  	</select>
			                                  </span>
			                           </div>
		                           </div>
		                        </div>
                             </div>
                  		 <br>
                   		 <div id="b2cManagementId"  class="row divbg">
                             <span  onclick="activate('b2cManagement');" class="col-lg-6" style="font-size: 15px;cursor: pointer;">
                             	<spring:message code="b2c.configuration.label" />
                             </span>
                             <span id="b2cManagementCheck" class="col-lg-2" style="padding: 0px">
                              	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('b2cManagementRead')" name="consoleRead" id="b2cManagementRead"/>Read
                             </span>
                             <span  class="col-lg-2" style="padding: 0px">
                              	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('b2cManagementWrite')" name="consoleWrite" id="b2cManagementWrite"/>Write
<%--                               	<img style="float: right;height: 20px;cursor: pointer;" onclick="activate('b2cManagement');" id="b2cManagementImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                             </span>
                                <span  class="col-lg-2" style="padding: 0px">
                              	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('b2cManagementCCTo')" name="consoleCCTo" id="b2cManagementCCTo"/>CC To
                              	<img style="float: right;height: 20px;cursor: pointer;" onclick="activate('b2cManagement');" id="b2cManagementImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                             </span>
                             </div>
                              <div id="b2cManagementFlow" style="color:#666;background-color: rgb(240,240,240);margin-left: 2px;margin-right: 2px;" class="inactiveBlock">
	                   		 <br>
	                   		   <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="home.page.banner.label" />
                                  </span>
                                  <span id="HomePageBannerCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="b2cManagementRead" style="vertical-align: -2px" id="HomePageBannerRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="b2cManagementWrite" style="vertical-align: -2px" id="HomePageBannerWrite"/>Write
                                  </span>
                                     <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="b2cManagementCCTo" style="vertical-align: -2px" id="HomePageBannerCCTo"/>CC To
                                  </span>
                               </div>
                                <br>
	                   		   <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="mini.banner.label" />
                                  </span>
                                  <span id="MiniBannerCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="b2cManagementRead" style="vertical-align: -2px" id="MiniBannerRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="b2cManagementWrite" style="vertical-align: -2px" id="MiniBannerWrite"/>Write
                                  </span>
                                   <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="b2cManagementCCTo" style="vertical-align: -2px" id="MiniBannerCCTo"/>CC To
                                  </span>
                               </div>
                               <br>
	                   		  <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="home.page.groups.label" />
                                  </span>
                                  <span id="HomePageGroupsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="b2cManagementRead" style="vertical-align: -2px" id="HomePageGroupsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="b2cManagementWrite" style="vertical-align: -2px" id="HomePageGroupsWrite"/>Write
                                  </span>
                                      <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="b2cManagementCCTo" style="vertical-align: -2px" id="HomePageGroupsCCTo"/>CC To
                                  </span>
                               </div>
                                <br>
                               
	                   		   <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="home.page.offers.label" />
                                  </span>
                                  <span id="HomePageDealsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="b2cManagementRead" style="vertical-align: -2px" id="HomePageDealsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="b2cManagementWrite" style="vertical-align: -2px" id="HomePageDealsWrite"/>Write
                                  </span>
                                      <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="b2cManagementCCTo" style="vertical-align: -2px" id="HomePageDealsCCTo"/>CC To
                                  </span>
                               </div>
                                <br>
	                   		   <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="brand.deals.label" />
                                  </span>
                                  <span id="BrandDealsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="b2cManagementRead" style="vertical-align: -2px" id="BrandDealsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="b2cManagementWrite" style="vertical-align: -2px" id="BrandDealsWrite"/>Write
                                  </span>
                                   <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="b2cManagementCCTo" style="vertical-align: -2px" id="BrandDealsCCTo"/>CC To
                                  </span>
                               </div>
                               <br>
	                   		   <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="deals.categories.label" />
                                  </span>
                                  <span id="DealCategoriesCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="b2cManagementRead" style="vertical-align: -2px" id="DealCategoriesRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="b2cManagementWrite" style="vertical-align: -2px" id="DealCategoriesWrite"/>Write
                                  </span>
                                     <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="b2cManagementCCTo" style="vertical-align: -2px" id="DealCategoriesCCTo"/>CC To
                                  </span>
                               </div>
                                <br>
	                   		   <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="new.arrivals.label" />
                                  </span>
                                  <span id="NewArrivalsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="b2cManagementRead" style="vertical-align: -2px" id="NewArrivalsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="b2cManagementWrite" style="vertical-align: -2px" id="NewArrivalsWrite"/>Write
                                  </span>
                                    <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="b2cManagementCCTo" style="vertical-align: -2px" id="NewArrivalsCCTo"/>CC To
                                  </span>
                               </div>
                               <br>
	                   		   <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="featured.products.label" />
                                  </span>
                                  <span id="FeaturedProductsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="b2cManagementRead" style="vertical-align: -2px" id="FeaturedProductsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="b2cManagementWrite" style="vertical-align: -2px" id="FeaturedProductsWrite"/>Write
                                  </span>
                                    <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="b2cManagementCCTo" style="vertical-align: -2px" id="FeaturedProductsCCTo"/>CC To
                                  </span>
                               </div>
                               <br>
	                   		   <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="payment.gateway.label" />
                                  </span>
                                  <span id="PaymentGatewayCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="b2cManagementRead" style="vertical-align: -2px" id="PaymentGatewayRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="b2cManagementWrite" style="vertical-align: -2px" id="PaymentGatewayWrite"/>Write
                                  </span>
                                     <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="b2cManagementCCTo" style="vertical-align: -2px" id="PaymentGatewayCCTo"/>CC To
                                  </span>
                               </div>
                                <br>
	                   		   <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="events.label" />
                                  </span>
                                  <span id="EventsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="b2cManagementRead" style="vertical-align: -2px" id="EventsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="b2cManagementWrite" style="vertical-align: -2px" id="EventsWrite"/>Write
                                  </span>
                                    <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="b2cManagementCCTo" style="vertical-align: -2px" id="EventsCCTo"/>CC To
                                  </span>
                               </div>
                                   <br>
                                <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="shoppinglist.label" />
                                  </span>
                                  <span id="ShoppingListCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="b2cManagementRead" style="vertical-align: -2px" id="ShoppingListRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="b2cManagementWrite" style="vertical-align: -2px" id="ShoppingListWrite"/>Write
                                  </span>
                                   <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="b2cManagementCCTo" style="vertical-align: -2px" id="ShoppingListCCTo"/>CC To
                                  </span>
                               </div>
                             </div> 
                   		  	<br>
                   		  	 <div id="DashboardId"  class="row divbg" >
                                <span class="col-lg-6" style="cursor: pointer;font-size: 15px;" onclick="activate('Dashboard');">
                                	<spring:message code="dashboard.label" />
                                </span>
                                <span id="DashboardCheck" class="col-lg-2" style="padding: 0px">
                                	<input type="checkbox" style="vertical-align: -2px" value="Dashboard"  onclick="selectAll('DashboardRead')" name="consoleRead" id="DashboardRead"/>Read
                                </span>
                                <span  class="col-lg-2" style="padding: 0px">
                                	<!-- <input type="checkbox" style="vertical-align: -2px" name="consoleWrite" id="DashboardWrite"/>Write -->
<%--                                 	<img style="float: right;height: 20px;cursor: pointer;" id="DashboardImg" onclick="activate('Dashboard');" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                </span>
                                 <span  class="col-lg-2" style="padding: 0px">
                                	<input type="checkbox" style="vertical-align: -2px" value="Dashboard"  onclick="selectAll('DashboardCCTo')" name="consoleRead" id="DashboardCCTo"/>CC To
                                	<img style="float: right;height: 20px;cursor: pointer;" id="DashboardImg" onclick="activate('Dashboard');" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                </span>
                   		 </div>
                   		 <div id="DashboardFlow" style="color:#666;background-color:rgb(240,240,240);margin-left: 2px;margin-right: 2px; " class="inactiveBlock">
                              <br>
                               <div class="row divsubbg" style="border: none">
                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="outlet.management.label" />
                                  </span>
                                  <span id="outletDashboardCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="outletDashboard" name="DashboardRead" id="outletDashboardRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<!-- <input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="EventLogWrite"  id="ProfileSettingsWrite"/>Write -->
                                  </span>
                                    <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)"  name="DashboardCCTo" id="outletDashboardCCTo"/>CC To
                                  </span>
                               </div>
                               <c:if test="${sessionScope.warehouseLicense == true}">
	                               <br>
	                               <div class="row divsubbg" style="border: none">  
	                                  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                                  	<spring:message code="warehouse.management.label" />
	                                  </span>
	                                  <span id="warehouseDashboardCheck" class="col-lg-2" style="padding: 0px">
	                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="warehouseDashboard" name="DashboardRead" id="warehouseDashboardRead"/>Read
	                                  </span>
	                                  <span class="col-lg-2" style="padding: 0px">
	                                  	<!-- <input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" name="SettingsWrite"  id="EmailSettingsWrite"/>Write -->
	                                  </span>
	                                   <span class="col-lg-2" style="padding: 0px">
	                                  	<input type="checkbox" style="vertical-align: -2px" onclick="toggleCheckBox(this)" value="warehouseDashboard" name="DashboardCCTo" id="warehouseDashboardCCTo"/>CC To
	                                  </span>
	                               </div>
                               </c:if>
                            </div>
                            <br>
                            <div id="ReportsId" class="row divbg" >
                             <span onclick="activate('Reports');" class="col-lg-6" style="font-size: 15px;cursor: pointer;">
                             	<spring:message code="warehouse_reports.label" />
                             </span>
                             <span id="ReportsCheck" class="col-lg-2" style="padding: 0px">
                              	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('ReportsRead')" name="consoleRead" id="ReportsRead"/>Read
                             </span>
                             <span  class="col-lg-2" style="padding: 0px">
                              	<!-- <input type="checkbox" style="vertical-align: -2px" onclick="selectAll('ReportsWrite')" name="consoleWrite" id="ReportsWrite"/>Write -->
                             </span>
                              <span  class="col-lg-2" style="padding: 0px">
                              	<input type="checkbox" style="vertical-align: -2px" onclick="selectAll('ReportsCCTo')" name="consoleCCTo" id="ReportsCCTo"/>CC To
                              	<img style="float: right;height: 20px;cursor: pointer;" onclick="activate('Reports');" id="ReportsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                             </span>
                             </div>
                             <div id="ReportsFlow" style="margin-left: 0%;color:#666;background-color: rgb(240,240,240);margin-left: 2px;margin-right: 2px;" class="inactiveBlock">
	                   		<br>
                               <div id="OutletReportsId"  class="row divsubbg" style="border: none">
	                               	  <span class="col-lg-6"  onclick="activateSubFlow('OutletReports');" style="cursor: pointer;padding-left: 40px;">
		                              	<spring:message code="outlet_management.reports.label" />
		                              </span>
		                              <span id="OutletReportsCheck" class="col-lg-2" style="padding: 0px">
	                                  	<input type="checkbox" name="ReportsRead" style="vertical-align: -2px" onclick="selectAll('OutletReportsRead')" id="OutletReportsRead"/>Read
	                                  </span>
	                                  <span class="col-lg-2" style="padding: 0px">
	                                  	<!-- <input type="checkbox" name="ReportsWrite" style="vertical-align: -2px" onclick="selectAll('OutletReportsWrite')" id="OutletReportsWrite"/>Write -->
<%-- 	                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('OutletReports');" id="OutletReportsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
	                                  </span>
	                                   <span class="col-lg-2" style="padding: 0px">
	                                  	<input type="checkbox" name="ReportsCCTo" style="vertical-align: -2px" onclick="selectAll('OutletReportsCCTo')" id="OutletReportsCCTo"/>CC To
	                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('OutletReports');" id="OutletReportsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
	                                  </span>
                                </div>
                                 <div style="margin-left: 0%;">
	                              <div id="OutletReportsFlow" class="inactiveSubBlock" style="font-size: 12px;background-color: rgb(240,240,240)">
	                                	<br>
		                                <div id="OutletSalesReportsId"  class="row divsubbg" style="border: none">
		                               	  <span class="col-lg-6"  onclick="activateSubChildFlow('OutletSalesReports');" style="cursor: pointer;padding-left: 60px;">
			                              		<spring:message code="sales.reports.label" />
			                              </span>
			                              <span id="OutletSalesReportsCheck" class="col-lg-2" style="padding: 0px">
		                                  		<input type="checkbox" name="OutletReportsRead" style="vertical-align: -2px" onclick="selectAll('OutletSalesReportsRead')" id="OutletSalesReportsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
<%-- 		                                  		<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('OutletSalesReports');" id="OutletSalesReportsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
		                                  </span>
		                                     <span class="col-lg-2" style="padding: 0px">
		                                     <input type="checkbox" name="OutletReportsCCTo" style="vertical-align: -2px" onclick="selectAll('OutletSalesReportsCCTo')" id="OutletSalesReportsCCTo"/>CC To
		                                     
		                                  		<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('OutletSalesReports');" id="OutletSalesReportsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                                  </span>
	                                  </div>
	                                  <div style="margin-left: 0%;">
			                              <div id="OutletSalesReportsFlow" class="inactiveSubChildBlock" style="font-size: 10px;background-color: rgb(240,240,240)">
				                                <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="xreading.reports.label" />
				                              		  </span>
				                              		  <span id="OutletSalesXCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="OutletSalesXRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span id="OutletSalesXCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsCCTo" style="vertical-align: -2px" id="OutletSalesXCCTo"/>CC To
					                                  </span>
					                           </div>
					                            <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="zreading.reports.label" />
				                              		  </span>
				                              		  <span id="OutletSalesZCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="OutletSalesZRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsCCTo" style="vertical-align: -2px" id="OutletSalesZCCTo"/>CC To
					                                  </span>
					                           </div>
					                           <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="xzreading.reports.label" />
				                              		  </span>
				                              		  <span id="OutletSalesXZCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="OutletSalesXZRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsCCTo" style="vertical-align: -2px" id="OutletSalesXZCCTo"/>CC To
					                                  </span>
					                           </div>
					                           <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="date.wise.sales.label" />
				                              		  </span>
				                              		  <span id="OutletSalesDateWiseCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="OutletSalesDateWiseRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                   <span id="" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsCCTo" style="vertical-align: -2px" id="OutletSalesDateWiseCCTo"/>CC To
					                                  </span>
					                           </div>
					                            <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="counter.wise.label" />
				                              		  </span>
				                              		  <span id="OutletSalesCounterWiseCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="OutletSalesCounterWiseRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span id="" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsCCTo" style="vertical-align: -2px" id="OutletSalesCounterWiseCCTo"/>CC To
					                                  </span>
					                           </div>
					                           <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="category.wise.label" />
				                              		  </span>
				                              		  <span id="OutletSalesCategoryWiseCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="OutletSalesCategoryWiseRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                   <span id="" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsCCTo" style="vertical-align: -2px" id="OutletSalesCategoryWiseCCTo"/>CC To
					                                  </span>
					                           </div>
					                           <br>
					                                       	<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="department.wise" />
				                              		  </span>
				                              		  <span id="OutletSalesDepartmentWiseCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="OutletSalesDepartmentWiseRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                   <span class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsCCTo" style="vertical-align: -2px" id="OutletSalesDepartmentWiseCCTo"/>CC To
					                                  </span>
					                           </div>
					                           <br>
					                           	<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="sku.wise.label" />
				                              		  </span>
				                              		  <span id="OutletSalesSkuWiseCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="OutletSalesSkuWiseRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                  	  <span class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsCCTo" style="vertical-align: -2px" id="OutletSalesSkuWiseCCTo"/>CC To
					                                  </span>
					                           </div>
					                           
					                            
					                            <br>
					                           	<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="hourlyBill.label" />
				                              		  </span>
				                              		  <span id="OutletSalesHourWiseBillCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="OutletSalesHourWiseBillRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                  	  <span class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsCCTo" style="vertical-align: -2px" id="OutletSalesHourWiseBillCCTo"/>CC To
					                                  </span>
					                           </div>
					                           
					                           
					                           <br>
					                           	<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="hour.wise.sales.label" />
				                              		  </span>
				                              		  <span id="OutletSalesHourWiseCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="OutletSalesHourWiseRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                   <span class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsCCTo" style="vertical-align: -2px" id="OutletSalesHourWiseCCTo"/>CC To
					                                  </span>
					                           </div>
					                           <br>
					                           	<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="brandwise.reports.label" />
				                              		  </span>
				                              		  <span id="OutletSalesBrandWiseCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="OutletSalesBrandWiseRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                   <span class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsCCTo" style="vertical-align: -2px" id="OutletSalesBrandWiseCCTo"/>CCTo
					                                  </span>
					                           </div>
					                           <br>
					                           	<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="sectionwise.reports.label" />
				                              		  </span>
				                              		  <span id="OutletSalesSectionWiseCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="OutletSalesSectionWiseRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsCCTo" style="vertical-align: -2px" id="OutletSalesSectionWiseCCTo"/>CC To
					                                  </span>
					                           </div>
					                           <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="supplier.wise.label" />
				                              		  </span>
				                              		  <span id="OutletSalesSupplierWiseCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="OutletSalesSupplierWiseRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsCCTo" style="vertical-align: -2px" id="OutletSalesSupplierWiseCCTo"/>CC To
					                                  </span>
					                           </div>
					                           
					                           
					                           
					                            <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="void.item.report.label" />
				                              		  </span>
				                              		  <span id="OutletSalesVoidReportCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="OutletSalesVoidReportRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsCCTo" style="vertical-align: -2px" id="OutletSalesVoidReportCCTo"/>CC To
					                                  </span>
					                           </div>
					                           
					                           
					                            <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	Item Wise Tax Report
				                              		  </span>
				                              		  <span id="OutletSalesItemWiseTaxCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="OutletSalesItemWiseTaxRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsCCTo" style="vertical-align: -2px" id="OutletSalesItemWiseTaxCCTo"/>CC To
					                                  </span>
					                           </div>
					                           
					                           
					                           
					                           <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	Item Wise GST Report
				                              		  </span>
				                              		  <span id="OutletSalesItemWiseGSTCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="OutletSalesItemWiseGSTRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsCCTo" style="vertical-align: -2px" id="OutletSalesItemWiseGSTCCTo"/>CC To
					                                  </span>
					                           </div>
					                           
					                           
					                           
					                           
					                           
					                            <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="tax.label" />
				                              		  </span>
				                              		  <span id="OutletSalesTaxCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="OutletSalesTaxRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsCCTo" style="vertical-align: -2px" id="OutletSalesTaxCCTo"/>CC To
					                                  </span>
					                           </div>
					                           <br>
					                           
					                           <div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="reports.tender.wise.sales.label" />
				                              		  </span>
				                              		  <span id="OutletSalesTenderWiseSalesCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="OutletSalesTenderWiseSalesRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span id="" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsCCTo" style="vertical-align: -2px" id="OutletSalesTenderWiseSalesCCTo"/>CC To
					                                  </span>
					                           </div>
					                           
					                           
					                           <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="salesmenCommission.label" />
				                              		  </span>
				                              		  <span id="OutletSalesMenSalesCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="OutletSalesMenSalesRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                   <span class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsCCTo" style="vertical-align: -2px" id="OutletSalesMenSalesCCTo"/>CC To
					                                  </span>
					                           </div>
					                           
					                           <br>
					                           
					                           
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="due.collection.label" />
				                              		  </span>
				                              		  <span id="OutletSalesDueCollectionCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="OutletSalesDueCollectionRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                   <span class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsCCTo" style="vertical-align: -2px" id="OutletSalesDueCollectionCCTo"/>CC To
					                                  </span>
					                           </div>
					                            <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="credit.sales.label" />
				                              		  </span>
				                              		  <span id="OutletSalesCreditSalesCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="OutletSalesCreditSalesRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span id="" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsCCTo" style="vertical-align: -2px" id="OutletSalesCreditSalesCCTo"/>CC To
					                                  </span>
					                           </div>
					                           
					                            <br>
		                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
	                              		  <spring:message code="price.override.report.label" />
	                              		  </span>
	                              		  <span id="OutletSalesPriceOverrideCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="OutletSalesPriceOverrideRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                                   <span id="OutletSalesSupplierWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsCCTo" style="vertical-align: -2px" id="OutletSalesPriceOverrideCCTo"/><spring:message code="cc.to.label"/>
		                                  </span>
		                             </div>
		                             
		                             <!-- price Change report -->

 											<br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="cashier.shortage.report" />
				                              		  </span>
				                              		  <span id="OutletSalesCashierShortageReportCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="OutletSalesCashierShortageReportRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span id="" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsCCTo" style="vertical-align: -2px" id="OutletSalesCashierShortageReportCCTo"/>CC To
					                                  </span>
					                           </div>


					                           <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="price.chnage.report" />
				                              		  </span>
				                              		  <span id="OutletSalesPriceChangeReportCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="OutletSalesPriceChangeReportRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span id="" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsCCTo" style="vertical-align: -2px" id="OutletSalesPriceChangeReportCCTo"/>CC To
					                                  </span>
					                           </div>
					                           <!-- standard salesReports -->
					                           <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="standard.sales.report" />
				                              		  </span>
				                              		  <span id="OutletSalesStandardSalesReportCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="OutletSalesStandardSalesReportRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span id="" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsCCTo" style="vertical-align: -2px" id="OutletSalesStandardSalesReportCCTo"/>CC To
					                                  </span>
					                           </div>
					                           
					                           <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="standard.sales.detailed.report" />
				                              		  </span>
				                              		  <span id="OutletSalesStandardSalesDetailedReportCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="OutletSalesStandardSalesDetailedReportRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span id="" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsCCTo" style="vertical-align: -2px" id="OutletSalesStandardSalesDetailedReportCCTo"/>CC To
					                                  </span>
					                           </div>
					                           <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	Events Dashboard
				                              		  </span>
				                              		  <span id="EventsDashboardReportCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="EventsDashboardReportRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span id="" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsCCTo" style="vertical-align: -2px" id="EventsDashboardReportCCTo"/>CC To
					                                  </span>
					                           </div>
					                           
					                           <!-- Events Dashboard Reports end-->
					                           
					                           <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	Events Summary
				                              		  </span>
				                              		  <span id="EventsSummaryReportCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="EventsSummaryReportRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span id="" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsCCTo" style="vertical-align: -2px" id="EventsSummaryReportCCTo"/>CC To
					                                  </span>
					                           </div>
					                           
					                           <!-- Events Summary Reports end-->
					                           
					                           <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	Bill Wise
				                              		  </span>
				                              		  <span id="BillWiseReportCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsRead" style="vertical-align: -2px" id="BillWiseReportRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span id="" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletSalesReportsCCTo" style="vertical-align: -2px" id="BillWiseReportCCTo"/>CC To
					                                  </span>
					                           </div>
					                           
					                           <!-- standard salesReports end-->
		                             
		                             
		                             
					                           
					                           
				                         </div>
			                        </div>
		                             <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="orders.reports.label" />
	                              		  </span>
	                              		  <span id="OutletOrdersReportsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsRead" style="vertical-align: -2px" id="OutletOrdersReportsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsWrite" style="vertical-align: -2px" id="OutletOrdersReportsWrite"/>Write -->
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsCCTo" style="vertical-align: -2px" id="OutletOrdersReportsCCTo"/>CC To
		                                  </span>
		                           </div>
		                           <br>
		                           <div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="profitability.report.label" />
	                              		  </span>
	                              		  <span id="OutletProfitabilityReportCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsRead" style="vertical-align: -2px" id="OutletProfitabilityReportsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsWrite" style="vertical-align: -2px" id="OutletOrdersReportsWrite"/>Write -->
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsCCTo" style="vertical-align: -2px" id="OutletProfitabilityReportsCCTo"/>CC To
		                                  </span>
		                           </div>
		                           <br>
		                           
		                           
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="stock.reports.label" />
	                              		  </span>
	                              		  <span id="OutletStockReportsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsRead" style="vertical-align: -2px" id="OutletStockReportsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsWrite" style="vertical-align: -2px" id="OutletStockReportsWrite"/>Write -->
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsCCTo" style="vertical-align: -2px" id="OutletStockReportsCCTo"/>CC To
		                                  </span>
		                           </div>
		                           <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;;padding-left: 60px;" >
	                              		  	<spring:message code="purchases.reports.label" />
	                              		  </span>
	                              		  <span id="OutletPurchaseReportsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsRead" style="vertical-align: -2px" id="OutletPurchaseReportsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsWrite" style="vertical-align: -2px" id="OutletPurchaseReportsWrite"/>Write -->
		                                  </span>
		                                    <span id="" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsCCTo" style="vertical-align: -2px" id="OutletPurchaseReportsCCTo"/>CC To
		                                  </span>
		                           </div>
		                            <br>
		                            <%-- <div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="itemWise.shipments.label" />
	                              		  </span>
	                              		  <span id="OutletShipmentReportsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsRead" style="vertical-align: -2px" id="OutletShipmentReportsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsWrite" style="vertical-align: -2px" id="OutletShipmentReportsWrite"/>Write -->
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsCCTo" style="vertical-align: -2px" id="OutletShipmentReportsCCTo"/>CC To
		                                  </span>
		                           </div>
		                            
		                            
		                        <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="shipments.reports.label" />
	                              		  </span>
	                              		  <span id="OutletShipmentReceiptReportsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsRead" style="vertical-align: -2px" id="OutletShipmentReceiptReportsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsWrite" style="vertical-align: -2px" id="OutletShipmentReportsWrite"/>Write -->
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsCCTo" style="vertical-align: -2px" id="OutletShipmentReceiptReportsCCTo"/>CC To
		                                  </span>
		                           </div> --%>
		                           
		                           
		                            <div id="OutletGRNReportsId"  class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" onclick="activateSubChildFlow('OutletGRNReports');"  style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="shipments.reports.label" />
	                              		  </span>
	                              		
	                              		  <span id="OutletGRNReportsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="selectAll('OutletGRNReportsRead')" name="OutletReportsRead" style="vertical-align: -2px" id="OutletGRNReportsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
<!-- 		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsWrite" style="vertical-align: -2px" id="OutletCRMReportsWrite"/>Write -->
		                                  </span>
		                                    <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="selectAll('OutletGRNReportsCCTo')" name="OutletReportsCCTo" style="vertical-align: -2px" id="OutletGRNReportsCCTo"/>CC To
		                                    <img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('OutletGRNReports');" id="OutletGRNReportsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                                  </span>
		                           </div>
		                             <div style="margin-left: 0%;">
		                             <div id="OutletGRNReportsFlow" class="inactiveSubChildBlock" style="font-size: 10px;">
                               		<br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="itemWise.shipments.label" />
	                              		  </span>
	                              		  <span id="OutletShipmentReportsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletGRNReportsRead" style="vertical-align: -2px" id="OutletShipmentReportsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsWrite" style="vertical-align: -2px" id="OutletShipmentReportsWrite"/>Write -->
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletGRNReportsCCTo" style="vertical-align: -2px" id="OutletShipmentReportsCCTo"/>CC To
		                                  </span>
		                           </div>
		                           
		                           
		                            <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="supplier.wise.shipments.label" />
	                              		  </span>
	                              		  <span id="OutletShipmentReceiptReportsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletGRNReportsRead" style="vertical-align: -2px" id="OutletShipmentReceiptReportsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsWrite" style="vertical-align: -2px" id="OutletShipmentReportsWrite"/>Write -->
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletGRNReportsCCTo" style="vertical-align: -2px" id="OutletShipmentReceiptReportsCCTo"/>CC To
		                                  </span>
		                           </div>
		                     </div>
		                        </div>   
		                           
		                            <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="waste_management.reports.label" />
	                              		  </span>
	                              		  <span id="OutletWasteReportsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsRead" style="vertical-align: -2px" id="OutletWasteReportsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  <!-- 	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsWrite" style="vertical-align: -2px" id="OutletWasteReportsWrite"/>Write -->
		                                  </span>
		                                    <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsCCTo" style="vertical-align: -2px" id="OutletWasteReportsCCTo"/>CC To
		                                  </span>
		                           </div>
		                            <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="expiry_management.reports.label" />
	                              		  </span>
	                              		  <span id="OutletExpiryReportsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsRead" style="vertical-align: -2px" id="OutletExpiryReportsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsWrite" style="vertical-align: -2px" id="OutletExpiryReportsWrite"/>Write -->
		                                  </span>
		                                    <span  class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsCCTo" style="vertical-align: -2px" id="OutletExpiryReportsCCTo"/>CC To
		                                  </span>
		                           </div>
		                           <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="financial.reports.label" />
	                              		  </span>
	                              		  <span id="OutletFinancialReportsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsRead" style="vertical-align: -2px" id="OutletFinancialReportsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsWrite" style="vertical-align: -2px" id="OutletFinancialReportsWrite"/>Write -->
		                                  </span>
		                                     <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsCCTo" style="vertical-align: -2px" id="OutletFinancialReportsCCTo"/>CC To
		                                  </span>
		                           </div>
		                           <br>
		                           <div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	Deals and Offers
	                              		  </span>
	                              		  <span id="OutletDealsAndOffersReportsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsRead" style="vertical-align: -2px" id="OutletDealsAndOffersReportsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsWrite" style="vertical-align: -2px" id="OutletFinancialReportsWrite"/>Write -->
		                                  </span>
		                                     <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsCCTo" style="vertical-align: -2px" id="OutletDealsAndOffersReportsCCTo"/>CC To
		                                  </span>
		                           </div>
		                           <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="warehouse_stockverification.label" />
	                              		  </span>
	                              		  <span id="OutletStockVerificationReportsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsRead" style="vertical-align: -2px" id="OutletStockVerificationReportsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsWrite" style="vertical-align: -2px" id="OutletFinancialReportsWrite"/>Write -->
		                                  </span>
		                                     <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsCCTo" style="vertical-align: -2px" id="OutletStockVerificationReportsCCTo"/>CC To
		                                  </span>
		                           </div>
		                           <br>
		                           
		                           <div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	DSR Report
	                              		  </span>
	                              		  <span id="OutletDSRReportsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsRead" style="vertical-align: -2px" id="OutletDSRReportsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsWrite" style="vertical-align: -2px" id="OutletFinancialReportsWrite"/>Write -->
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsCCTo" style="vertical-align: -2px" id="OutletDSRReportsCCTo"/>CCTo
		                                  </span>
		                           </div> 
		                       <br>
		                           
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="campaignmanagment.label" />
	                              		  </span>
	                              		  <span id="OutletDealsAndOffersReportsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsRead" style="vertical-align: -2px" id="OutletDealsAndOffersReportsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsWrite" style="vertical-align: -2px" id="OutletFinancialReportsWrite"/>Write -->
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsCCTo" style="vertical-align: -2px" id="OutletDealsAndOffersReportsCCTo"/>CCTo
		                                  </span>
		                           </div>
		                           
		                        
		                        
		                        
		                       <br>
                               		<div id="outletCustomerRelationship" class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" onclick="activateSubChildFlow('OutletCustomerRelationship');"  style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="loyaltyprogram.label" />
	                              		  </span>
	                              		  <span id="OutletCRMReportsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="selectAll('OutletCRMReportsRead')" name="OutletReportsRead" style="vertical-align: -2px" id="OutletCRMReportsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
<!-- 		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsWrite" style="vertical-align: -2px" id="OutletCRMReportsWrite"/>Write -->
		                                  </span>
		                                    <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="selectAll('OutletCRMReportsCCTo')" name="OutletReportsCCTo" style="vertical-align: -2px" id="OutletCRMReportsCCTo"/>CC To
		                                    <img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('OutletCustomerRelationship');" id="OutletCustomerRelationshipImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                                  </span>
		                           </div>
		                               <div style="margin-left: 0%;">
			                              <div id="OutletCustomerRelationshipFlow" class="inactiveSubChildBlock" style="font-size: 10px;">
				                                <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="customer.conversion.report.label" />
				                              		  </span>
				                              		  <span id="customerConversionCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletCRMReportsRead" style="vertical-align: -2px" id="customerConversionRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                   <span class="col-lg-2" style="padding: 0px">
					                                   	<input type="checkbox" onclick="toggleCheckBox(this)" name="OutletCRMReportsCCTo" style="vertical-align: -2px" id="customerConversionCCTo"/>CC To
					                                   
					                                  </span>
					                           </div>
					                            <br>
			                               			                           </div>
					                           </div>
		                        
		                        
		                        
		                        
		                        
		                        
		                        
		                        
		                        
		                        
		                        
		                        
		                           
		                         </div>
		                       </div>
		                   <c:if test="${sessionScope.warehouseLicense == true}">
                  			<br>
                               <div id="WarehouseReportsId"  class="row divsubbg" style="border: none">
                               	  <!-- <span class="col-lg-6"  onclick="activateSubFlow('WarehouseReports');" style="cursor: pointer;"> -->
                               	  <span class="col-lg-6"  style="cursor: pointer;padding-left: 40px;">
	                              	<spring:message code="warehouse_management.reports.label" />
	                              </span>
	                              <span id="WarehouseReportsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="ReportsRead" style="vertical-align: -2px" onclick="selectAll('WarehouseReportsRead')" id="WarehouseReportsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<!-- <input type="checkbox" name="ReportsWrite" style="vertical-align: -2px" onclick="selectAll('WarehouseReportsWrite')" id="WarehouseReportsWrite"/>Write -->
<%--                                   	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('WarehouseReports');" id="WarehouseReportsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                     <span id="WarehouseReportsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="ReportsCCTo" style="vertical-align: -2px" onclick="selectAll('WarehouseReportsCCTo')" id="WarehouseReportsCCTo"/>CC To
                                                                   	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('WarehouseReports');" id="WarehouseReportsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                 
                                  </span>
                             </div>
                             
                             <br>
                                    <div id="WarehouseReportsFlow" style="margin-left: 0%;color:#666;margin-left: 2px;margin-right: 2px;" class="inactiveSubBlock">
                            
                            
                            <div id="WarehouseSalesReportsId"  class="row divsubbg" style="border: none">
		                               	  <span class="col-lg-6"  onclick="activateSubChildFlow('WarehouseSalesReports');" style="cursor: pointer;padding-left: 60px;">
			                              		<spring:message code="sales.reports.label" />
			                              </span>
			                              <span id="WarehouseSalesReportsCheck" class="col-lg-2" style="padding: 0px">
		                                  		<input type="checkbox" name="WarehouseReportsRead" style="vertical-align: -2px" onclick="selectAll('WarehouseSalesReportsRead')" id="WarehouseSalesReportsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
<%-- 		                                  		<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('OutletSalesReports');" id="OutletSalesReportsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
		                                  </span>
		                                     <span class="col-lg-2" style="padding: 0px">
		                                     <input type="checkbox" name="WarehouseReportsCCTo" style="vertical-align: -2px" onclick="selectAll('WarehouseSalesReportsCCTo')" id="WarehouseSalesReportsCCTo"/>CC To
		                                     
		                                  		<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('WarehouseSalesReports');" id="WarehouseSalesReportsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                                  </span>
	                                  </div>
	                                  
	                                  
	                                    <div id="WarehouseSalesReportsFlow" class="inactiveSubChildBlock" style="font-size: 10px;background-color: rgb(240,240,240)">
				                                <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="xreading.reports.label" />
				                              		  </span>
				                              		  <span id="WarehouseSalesXCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsRead" style="vertical-align: -2px" id="WarehouseSalesXRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span id="WarehouseSalesXCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsCCTo" style="vertical-align: -2px" id="WarehouseSalesXCCTo"/>CC To
					                                  </span>
					                           </div>
					                            <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="zreading.reports.label" />
				                              		  </span>
				                              		  <span id="WarehouseSalesZCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsRead" style="vertical-align: -2px" id="WarehouseSalesZRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsCCTo" style="vertical-align: -2px" id="WarehouseSalesZCCTo"/>CC To
					                                  </span>
					                           </div>
					                           <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="xzreading.reports.label" />
				                              		  </span>
				                              		  <span id="WarehouseSalesXZCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsRead" style="vertical-align: -2px" id="WarehouseSalesXZRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsCCTo" style="vertical-align: -2px" id="WarehouseSalesXZCCTo"/>CC To
					                                  </span>
					                           </div>
					                           <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="date.wise.sales.label" />
				                              		  </span>
				                              		  <span id="WarehouseSalesDateWiseCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsRead" style="vertical-align: -2px" id="WarehouseSalesDateWiseRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                   <span id="" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsCCTo" style="vertical-align: -2px" id="WarehouseSalesDateWiseCCTo"/>CC To
					                                  </span>
					                           </div>
					                            <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="counter.wise.label" />
				                              		  </span>
				                              		  <span id="WarehouseSalesCounterWiseCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsRead" style="vertical-align: -2px" id="WarehouseSalesCounterWiseRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span id="" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsCCTo" style="vertical-align: -2px" id="WarehouseSalesCounterWiseCCTo"/>CC To
					                                  </span>
					                           </div>
					                           <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="category.wise.label" />
				                              		  </span>
				                              		  <span id="WarehouseSalesCategoryWiseCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsRead" style="vertical-align: -2px" id="WarehouseSalesCategoryWiseRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                   <span id="" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsCCTo" style="vertical-align: -2px" id="WarehouseSalesCategoryWiseCCTo"/>CC To
					                                  </span>
					                           </div>
					                           <br>
					                                       	<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="department.wise" />
				                              		  </span>
				                              		  <span id="WarehouseSalesDepartmentWiseCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsRead" style="vertical-align: -2px" id="WarehouseSalesDepartmentWiseRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                   <span class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsCCTo" style="vertical-align: -2px" id="WarehouseSalesDepartmentWiseCCTo"/>CC To
					                                  </span>
					                           </div>
					                           <br>
					                           	<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="sku.wise.label" />
				                              		  </span>
				                              		  <span id="WarehouseSalesSkuWiseCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsRead" style="vertical-align: -2px" id="WarehouseSalesSkuWiseRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                  	  <span class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsCCTo" style="vertical-align: -2px" id="WarehouseSalesSkuWiseCCTo"/>CC To
					                                  </span>
					                           </div>
					                           
					                           
					                            <br>
					                           	<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="hourlyBill.label" />
				                              		  </span>
				                              		  <span id="WarehouseSalesHourWiseBillCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsRead" style="vertical-align: -2px" id="WarehouseSalesHourWiseBillRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                  	  <span class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsCCTo" style="vertical-align: -2px" id="WarehouseSalesHourWiseBillCCTo"/>CC To
					                                  </span>
					                           </div>
					                           
					                           <br>
					                           	<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="hour.wise.sales.label" />
				                              		  </span>
				                              		  <span id="WarehouseSalesHourWiseCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsRead" style="vertical-align: -2px" id="WarehouseSalesHourWiseRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                   <span class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsCCTo" style="vertical-align: -2px" id="WarehouseSalesHourWiseCCTo"/>CC To
					                                  </span>
					                           </div>
					                           <br>
					                           	<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="brandwise.reports.label" />
				                              		  </span>
				                              		  <span id="WarehouseSalesBrandWiseCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsRead" style="vertical-align: -2px" id="WarehouseSalesBrandWiseRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                   <span class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsCCTo" style="vertical-align: -2px" id="WarehouseSalesBrandWiseCCTo"/>CCTo
					                                  </span>
					                           </div>
					                           <br>
					                           	<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="sectionwise.reports.label" />
				                              		  </span>
				                              		  <span id="WarehouseSalesSectionWiseCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsRead" style="vertical-align: -2px" id="WarehouseSalesSectionWiseRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsCCTo" style="vertical-align: -2px" id="WarehouseSalesSectionWiseCCTo"/>CC To
					                                  </span>
					                           </div>
					                           <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="supplier.wise.label" />
				                              		  </span>
				                              		  <span id="WarehouseSalesSupplierWiseCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsRead" style="vertical-align: -2px" id="WarehouseSalesSupplierWiseRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsCCTo" style="vertical-align: -2px" id="WarehouseSalesSupplierWiseCCTo"/>CC To
					                                  </span>
					                           </div>
					                           
					                           
					                            <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="void.item.report.label" />
				                              		  </span>
				                              		  <span id="WarehouseSalesVoidReportCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsRead" style="vertical-align: -2px" id="WarehouseSalesVoidReportRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsCCTo" style="vertical-align: -2px" id="WarehouseSalesVoidReportCCTo"/>CC To
					                                  </span>
					                           </div>
					                           
					                           
					                            <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	Item Wise Tax Report
				                              		  </span>
				                              		  <span id="WarehouseSalesItemWiseTaxCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsRead" style="vertical-align: -2px" id="WarehouseSalesItemWiseTaxRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsCCTo" style="vertical-align: -2px" id="WarehouseSalesItemWiseTaxCCTo"/>CC To
					                                  </span>
					                           </div>
					                           
					                           
					                           
					                           <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	Item Wise GST Report
				                              		  </span>
				                              		  <span id="WarehouseSalesItemWiseGSTCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsRead" style="vertical-align: -2px" id="WarehouseSalesItemWiseGSTRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsCCTo" style="vertical-align: -2px" id="WarehouseSalesItemWiseGSTCCTo"/>CC To
					                                  </span>
					                           </div>
					                           
					                            <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="tax.label" />
				                              		  </span>
				                              		  <span id="WarehouseSalesTaxCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsRead" style="vertical-align: -2px" id="WarehouseSalesTaxRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsCCTo" style="vertical-align: -2px" id="WarehouseSalesTaxCCTo"/>CC To
					                                  </span>
					                           </div>
					                           <br>
					                           
					                           <div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="reports.tender.wise.sales.label" />
				                              		  </span>
				                              		  <span id="WarehouseSalesTenderWiseSalesCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsRead" style="vertical-align: -2px" id="WarehouseSalesTenderWiseSalesRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span id="" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsCCTo" style="vertical-align: -2px" id="WarehouseSalesTenderWiseSalesCCTo"/>CC To
					                                  </span>
					                           </div>
					                           
					                            <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="salesman.commission.label" />
				                              		  </span>
				                              		  <span id="WarehouseSalesManSalesCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsRead" style="vertical-align: -2px" id="WarehouseSalesManSalesRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                   <span class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsCCTo" style="vertical-align: -2px" id="WarehouseSalesManSalesCCTo"/>CC To
					                                  </span>
					                           </div>
					                           
					                           <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="salesmenCommission.label" />
				                              		  </span>
				                              		  <span id="WarehouseSalesMenSalesCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsRead" style="vertical-align: -2px" id="WarehouseSalesMenSalesRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                   <span class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsCCTo" style="vertical-align: -2px" id="WarehouseSalesMenSalesCCTo"/>CC To
					                                  </span>
					                           </div>
					                           
					                           <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="due.collection.label" />
				                              		  </span>
				                              		  <span id="WarehouseSalesDueCollectionCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsRead" style="vertical-align: -2px" id="WarehouseSalesDueCollectionRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                   <span class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsCCTo" style="vertical-align: -2px" id="WarehouseSalesDueCollectionCCTo"/>CC To
					                                  </span>
					                           </div>
					                            <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="credit.sales.label" />
				                              		  </span>
				                              		  <span id="WarehouseSalesCreditSalesCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsRead" style="vertical-align: -2px" id="WarehouseSalesCreditSalesRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span id="" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsCCTo" style="vertical-align: -2px" id="WarehouseSalesCreditSalesCCTo"/>CC To
					                                  </span>
					                           </div>
					                           
					                                <br>
		                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
	                              		  <spring:message code="price.override.report.label" />
	                              		  </span>
	                              		  <span id="WarehouseSalesPriceOverrideCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsRead" style="vertical-align: -2px" id="WarehouseSalesPriceOverrideRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                                   <span id="OutletSalesSupplierWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsCCTo" style="vertical-align: -2px" id="WarehouseSalesPriceOverrideCCTo"/><spring:message code="cc.to.label"/>
		                                  </span>
		                             </div>
					                           
					                           
					                           
					                           
					                            <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="bill.report.label" />
				                              		  </span>
				                              		  <span id="WarehouseSalesSerialBillReportCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsRead" style="vertical-align: -2px" id="WarehouseSalesSerialBillReportRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span id="" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsCCTo" style="vertical-align: -2px" id="WarehouseSalesSerialBillReportCCTo"/>CC To
					                                  </span>
					                           </div>
					                           
					                            <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="coupon.report.label" />
				                              		  </span>
				                              		  <span id="WarehouseSalesCouponReportCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsRead" style="vertical-align: -2px" id="WarehouseSalesCouponReportRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span id="" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsCCTo" style="vertical-align: -2px" id="WarehouseSalesCouponReportCCTo"/>CC To
					                                  </span>
					                           </div>
					                           
					                           <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="voucher.report.label" />
				                              		  </span>
				                              		  <span id="WarehouseSalesVoucherReportCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsRead" style="vertical-align: -2px" id="WarehouseSalesVoucherReportRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span id="" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsCCTo" style="vertical-align: -2px" id="WarehouseSalesVoucherReportCCTo"/>CC To
					                                  </span>
					                           </div>
					                            <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="reports.Delievy.person.Wise" />
				                              		  </span>
				                              		  <span id="WarehouseSalesPersonWiseReportCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsRead" style="vertical-align: -2px" id="WarehouseSalesPersonWiseReportRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span id="" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsCCTo" style="vertical-align: -2px" id="WarehouseSalesPersonWiseReportCCTo"/>CC To
					                                  </span>
					                           </div>
					                           <!--4 new Roles on 21/02/2020-->
					                            <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="sale.price.variation.label" />
				                              		  </span>
				                              		  <span id="WarehouseSalesPriceVariationReportCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsRead" style="vertical-align: -2px" id="WarehouseSalesPriceVariationReportRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span id="" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsCCTo" style="vertical-align: -2px" id="WarehouseSalesPriceVariationReportCCTo"/>CC To
					                                  </span>
					                           </div>
					                           
					                           <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="salesvsprocurement" />
				                              		  </span>
				                              		  <span id="WarehouseSalesSalesVsProcurementReportCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsRead" style="vertical-align: -2px" id="WarehouseSalesSalesVsProcurementReportRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span id="" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsCCTo" style="vertical-align: -2px" id="WarehouseSalesSalesVsProcurementReportCCTo"/>CC To
					                                  </span>
					                           </div>
					                           
					                            <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="credit.note.reports.label" />
				                              		  </span>
				                              		  <span id="WarehouseSalesCreditNoteReportCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsRead" style="vertical-align: -2px" id="WarehouseSalesCreditNoteReportRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span id="" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsCCTo" style="vertical-align: -2px" id="WarehouseSalesCreditNoteReportCCTo"/>CC To
					                                  </span>
					                           </div>
					                           
					                            <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="credit.note.redemption.reports.label" />
				                              		  </span>
				                              		  <span id="WarehouseSalesCreditNoteRedeemReportCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsRead" style="vertical-align: -2px" id="WarehouseSalesCreditNoteRedeemReportRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span id="" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsCCTo" style="vertical-align: -2px" id="WarehouseSalesCreditNoteRedeemReportCCTo"/>CC To
					                                  </span>
					                           </div>
					                           
					                            <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="cashier.efficeency.report" />
				                              		  </span>
				                              		  <span id="WarehouseSalesCashierEfficiencyReportCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsRead" style="vertical-align: -2px" id="WarehouseSalesCashierEfficiencyReportRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span id="" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsCCTo" style="vertical-align: -2px" id="WarehouseSalesCashierEfficiencyReportCCTo"/>CC To
					                                  </span>
					                           </div>
					                           <!-- price Change report -->
					                           <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="cashier.shortage.report" />
				                              		  </span>
				                              		  <span id="WarehouseSalesCashierShortageReportCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsRead" style="vertical-align: -2px" id="WarehouseSalesCashierShortageReportRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span id="" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsCCTo" style="vertical-align: -2px" id="WarehouseSalesCashierShortageReportCCTo"/>CC To
					                                  </span>
					                           </div>
					                           
					                           <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="price.chnage.report" />
				                              		  </span>
				                              		  <span id="WarehouseSalesPriceChangeReportCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsRead" style="vertical-align: -2px" id="WarehouseSalesPriceChangeReportRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span id="" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsCCTo" style="vertical-align: -2px" id="WarehouseSalesPriceChangeReportCCTo"/>CC To
					                                  </span>
					                           </div>
					                           <!-- standard salesReports -->
					                           <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="standard.sales.report" />
				                              		  </span>
				                              		  <span id="WarehouseSalesStandardSalesReportCheck" class="col-lg-2" style="padding: 0px">
					                <input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsRead" style="vertical-align: -2px" id="WarehouseSalesStandardSalesReportRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span id="" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsCCTo" style="vertical-align: -2px" id="WarehouseSalesStandardSalesReportCCTo"/>CC To
					                                  </span>
					                           </div>
					                           
					                           <br>
			                               		<div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="standard.sales.detailed.report" />
				                              		  </span>
				                              		  <span id="WarehouseSalesStandardSalesDetailedReportCheck" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsRead" style="vertical-align: -2px" id="WarehouseSalesStandardSalesDetailedReportRead"/>Read
					                                  </span>
					                                  <span class="col-lg-2" style="padding: 0px">
					                                  </span>
					                                    <span id="" class="col-lg-2" style="padding: 0px">
					                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseSalesReportsCCTo" style="vertical-align: -2px" id="WarehouseSalesStandardSalesDetailedReportCCTo"/>CC To
					                                  </span>
					                           </div>
					                           
					                           <!-- standard salesReports end-->
					                           
				                         </div>
			                       
			                       <br>
	                                  
                            
                            
                            
                            
                             <div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="supplies.report.label" />
	                              		  </span>
	                              		  <span id="WarehouseSuppliesReportsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseReportsRead" style="vertical-align: -2px" id="WarehouseSuppliesReportsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsWrite" style="vertical-align: -2px" id="OutletOrdersReportsWrite"/>Write -->
		                                  </span>
		                                    <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseReportsCCTo" style="vertical-align: -2px" id="WarehouseSuppliesReportsCCTo"/>CC To
		                                  </span>
		                           </div>
		                           
		                         
		                           
                                 <br>
                         
                             <div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="supplies.label" />
	                              		  </span>
	                              		  <span id="WarehouseSuppliesCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseReportsRead" style="vertical-align: -2px" id="WarehouseSuppliesRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsWrite" style="vertical-align: -2px" id="OutletOrdersReportsWrite"/>Write -->
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseReportsCCTo" style="vertical-align: -2px" id="WarehouseSuppliesCCTo"/>CC To
		                                  </span>
		                           </div>
                             
		                           
		                         <br>  
		                           
		                               <div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="price.variation.label" />
	                              		  </span>
	                              		  <span id="WarehousePriceVariationCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseReportsRead" style="vertical-align: -2px" id="WarehousePriceVariationRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsWrite" style="vertical-align: -2px" id="OutletOrdersReportsWrite"/>Write -->
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseReportsCCTo" style="vertical-align: -2px" id="WarehousePriceVariationCCTo"/>CC To
		                                  </span>
		                           </div>
		                          
		                           
		                             <br>
      
                             <div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="procurement.consumption.label" />
	                              		  </span>
	                              		  <span id="WarehouseProcurementVsConsumptionCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseReportsRead" style="vertical-align: -2px" id="WarehouseProcurementVsConsumptionRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsWrite" style="vertical-align: -2px" id="OutletOrdersReportsWrite"/>Write -->
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseReportsCCTo" style="vertical-align: -2px" id="WarehouseProcurementVsConsumptionCCTo"/>CC To
		                                  </span>
		                           </div>
		                           
		                           <br>
		                             <div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	Stock Issue Report
	                              		  </span>
	                              		  <span id="WarehouseStockIssueReportCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseReportsRead" style="vertical-align: -2px" id="WarehouseStockIssueReportRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsWrite" style="vertical-align: -2px" id="OutletOrdersReportsWrite"/>Write -->
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseReportsCCTo" style="vertical-align: -2px" id="WarehouseStockIssueReportCCTo"/>CC To
		                                  </span>
		                           </div>
		                            <br>
		                            <div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	Purchase Report
	                              		  </span>
	                              		  <span id="WarehousePurchaseReportCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseReportsRead" style="vertical-align: -2px" id="WarehousePurchaseReportRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="OutletReportsWrite" style="vertical-align: -2px" id="OutletOrdersReportsWrite"/>Write -->
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="WarehouseReportsCCTo" style="vertical-align: -2px" id="WarehousePurchaseReportCCTo"/>CC To
		                                  </span>
		                           </div>
		                           
                             
		                           </div>
		                     
                             
                             
                             
                           </c:if>
                       </div>
                   	
						</div>       
				</div>    
					
					
					   <div class="form-group col-lg-1"></div>
                   <div class="form-group col-lg-5">
                  		 <label><spring:message code="select.locations.label" /></label>
                           <select multiple="multiple" style="height: 230px" class="form-control" name="location" id="consoleLocation">
                           	<c:forEach var="location" items="${cloudLocationsList}">
								<option value="${location.locationId}" title="${location.businessActivity}">${location.locationId}</option>
							</c:forEach>
                           </select>
                  </div>
					
                   	
                   		</div>
				
				      
               	<!-- </div> --><!-- /.box-body -->
               	
               	<br>
                   <div class="row" >
                    <div class="form-group col-lg-12"  >
                    <div class="form-group col-lg-2" style="padding-left: 1px;padding-right: 1px;margin-top: 8px;cursor: pointer;margin-bottom: 0px;" onclick="activateHeader('storeApp');" ><label style="font-weight: bold;font-size: 16px;color:#666;cursor: pointer;"><spring:message code="outlet.permissions.label" /> </label></div>
                    <div class="form-group col-lg-10" style="background-color: rgb(195,195,195);margin-bottom: 4px">
                    	<span>It helps you to delegate administration and other business operations to executives. Please note that OUTLET APP will be used by your emplyees in Retail Outlet for handling the day to day functionalities in the outlet.
                    	<img style="float: right;height: 60px;cursor: pointer;margin-right: -34px;margin-top: -24px;margin-bottom: -26px" onclick="activateHeader('storeApp');" id="storeAppImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIcon.png">
                    	</span></div>
                    <hr style="margin-top: 44px;width: 100%;border-top: 1px solid rgb(181,230,29);" />
                    <hr style="margin-top: -18px;width: 100%;border-top: 1px solid rgb(181,230,29);" />
                    </div>
                   </div>
                   <div class="row" id="storeAppFlow" >
                   <div class="form-group col-lg-6">
                   		  <div class="row divbg activeDiv" style="margin-top: 10px;">
                                <span id="storeBillingId" class="col-lg-6" style="cursor: pointer;font-size: 15px;" onclick="activate('storeBilling');">
                                	<spring:message code="billing.label" />
                                </span>
                                <span id="storeBillingCheck" class="col-lg-2" style="padding: 0px">
                                	<input type="checkbox" onclick="selectAll('storeBillingRead')" style="vertical-align: -2px"" name="storeAppRead" id="storeBillingRead"/>Read
                                </span>
                                <span  class="col-lg-2" style="padding: 0px">
                                	<input type="checkbox" onclick="selectAll('storeBillingWrite')" style="vertical-align: -2px"" name="storeAppWrite" id="storeBillingWrite"/>Write
                                </span>
                                <span  class="col-lg-2" style="padding: 0px">
                                	<input type="checkbox" onclick="selectAll('storeBillingCCTo')" style="vertical-align: -2px"" name="storeAppCCTo" id="storeBillingCCTo"/><spring:message code="cc.to.label" />
                                	<img style="float: right;height: 20px;cursor: pointer;" onclick="activate('storeBilling');" id="storeBillingImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                </span>
                   		 </div>
                   		 <div id="storeBillingFlow" style="margin-left:0%;color:#666;margin-left: 2px;margin-right: 2px;background-color: rgb(240,240,240)" class="inactiveBlock">
	                   	
	                   	
	                   		<br>
                               	<div id="storeDayOpenId" class="row divsubbg" style="border: none;">
	                              <span class="col-lg-6"  onclick="activateSubFlow('storeDayOpen');" style="cursor: pointer;padding-left: 40px;">
	                              	<spring:message code="day.open.label" />
	                              </span>
	                             
	                              <span id="storeDayOpenCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="storeBillingRead" id="storeDayOpenRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="storeBillingWrite" id="storeDayOpenWrite"/>Write
                                  	</span>
                                  	  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="storeBillingCCTo" id="storeDayOpenCCTo"/><spring:message code="cc.to.label" />
                                  <%-- 	<img style="float: right; height: 20px;cursor: pointer;" onclick="activateSubFlow('storeCreditBills');" id="storeCreditBillsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                </div>
                                
                                
                                
                                <br>
                               	<div id="storeDayCloseId" class="row divsubbg" style="border: none;">
	                              <span class="col-lg-6"  onclick="activateSubFlow('storeDayClose');" style="cursor: pointer;padding-left: 40px;">
	                              	<spring:message code="day.close.label" />
	                              </span>
	                             
	                              <span id="storeDayCloseCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="storeBillingRead" id="storeDayCloseRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="storeBillingWrite" id="storeDayCloseWrite"/>Write
                                  	</span>
                                  	  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="storeBillingCCTo" id="storeDayCloseCCTo"/><spring:message code="cc.to.label" />
                                  <%-- 	<img style="float: right; height: 20px;cursor: pointer;" onclick="activateSubFlow('storeCreditBills');" id="storeCreditBillsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                </div>
                                
	                   	
	                   	
	                   	
	                   		 <br>
                               	<div id="storeNewBillId" class="row divsubbg" style="border: none;">
	                              <span class="col-lg-6"  onclick="activateSubFlow('storeNewBill');" style="cursor: pointer;padding-left: 40px;">
	                              	<spring:message code="new.bill.label" />
	                              </span>
	                             
	                              <span id="storeNewBillCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px"" onclick="" name="storeBillingRead" id="storeNewBillRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px"" onclick="" name="storeBillingWrite" id="storeNewBillWrite"/>Write
                                  	</span>
                                  	  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px"" onclick="" name="storeBillingCCTo" id="storeNewBillCCTo"/><spring:message code="cc.to.label" />
                                  	<img style="float: right; height: 20px;cursor: pointer;" onclick="activateSubFlow('storeNewBill');" id="storeNewBillImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                                 
                                </div>
                                	<div style="margin-left:0%;">
		                              <div id="storeNewBillFlow" class="inactiveSubBlock" style="font-size: 12px">
		                                <br>
	                               		<div class="row divsubbg" style="border: none">
	                               		<span class="col-lg-6" style="padding-left: 60px;" >
	                               		<spring:message code="activities.label" /></span>
		                              		 <%--  <span class="col-lg-4" style="padding: 5px; font-weight: bold;font-size: 14px;" >
		                              		  	<font ><spring:message code="cc.to.label" /></font>
		                              		  
		                              		   <select class="form-control" id="CCto" multiple="multiple">
                                 			<c:forEach var="roles" items="${roleList}">
													<c:if test="${roles.roleName != role.roleName}">
													<option value="${roles.roleName}">${roles.roleName}</option>
													</c:if>
											</c:forEach> 
		                              		  	</select>
		                              		  	
		                              		  </span> --%>
<!-- 		                              		   <span class="col-lg-2" style="padding: 0px;" > -->
		                              		
<%-- 		                              		    <input type="checkbox" style="vertical-align: -2px"" onclick="" name="storeBillingMailTo" id="storeNewBillMailTo"/><b><spring:message code="mail.to.label" /></b> --%>
		                              		
<!-- 		                              		  </span> -->
		                              		  <span class="col-lg-6" style="padding:0px;" >
		                              		  
		                              		  	<select class="form-control activities" name="storeNewBill" multiple="multiple" id="storeNewBillActivities">
		                              		  		<option value ="Cash Payment">Cash Payment</option>
		                              		  		<option value ="Card Payment">Card Payment</option>
		                              		  		<option value ="Food Coupons">Food Coupons</option>
		                              		  		<option value ="Gift Vouchers">Gift Vouchers</option>
		                              		  		<option value ="Loyalty Cards">Loyalty Cards</option>
		                              		  		<option value ="Discount Coupons">Discount Coupons</option>
		                              		  		<option value ="Item Discount">Item Discount</option>
		                              		  		<option value ="SMS">SMS</option>
		                              		  		<option value ="Email">Email</option>
		                              		  		<option value ="Print">Print</option>
		                              		  		<option value ="Duplicate Print">Duplicate Print</option>
		                              		  		<option value ="Return">Return</option>
		                              		  		<option value ="Direct Return">Direct Return</option>
		                              		  		<option value ="Exchange">Exchange</option>
		                              		        <option value ="Quick Pay">Quick Pay</option>
		                              		        <option value="Edit Price">Edit Price</option>
		                              		        <option value="New SKU">New SKU</option>
		                              		         <option value="Edit SKU">Edit SKU</option>
		                              		  	</select>
			                                  </span>
			                           </div>
		                              </div>
	                          </div>
	                          
	                          
	                            <br>
                               	<div id="storeCreditBillsId" class="row divsubbg" style="border: none;">
	                              <span class="col-lg-6"  onclick="activateSubFlow('storeCreditBills');" style="cursor: pointer;padding-left: 40px;">
	                              	<spring:message code="creditbills.label" />
	                              </span>
	                             
	                              <span id="storeCreditBillsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="storeBillingRead" id="storeCreditBillsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="storeBillingWrite" id="storeCreditBillsWrite"/>Write
                                  	</span>
                                  	  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="storeBillingCCTo" id="storeCreditBillsCCTo"/><spring:message code="cc.to.label" />
                                  <%-- 	<img style="float: right; height: 20px;cursor: pointer;" onclick="activateSubFlow('storeCreditBills');" id="storeCreditBillsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                </div>
	                          
	                          
	                          
                                 <br>
                               	<div id="storePendigBillId" class="row divsubbg" style="border: none;">
	                              <span class="col-lg-6"  onclick="activateSubFlow('storePendigBill');" style="cursor: pointer;padding-left: 40px;"">
	                              	<spring:message code="pending.bill.label" />
	                              </span>
	                              <span id="storePendigBillCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="storeBillingRead" id="storePendigBillRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="storeBillingWrite" id="storePendigBillWrite"/>Write
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="storeBillingCCTo" id="storePendigBillCCTo"/><spring:message code="cc.to.label" />
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('storePendigBill');" id="storePendigBillImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                                </div>
                                <div style="margin-left:0%;">
	                              <div id="storePendigBillFlow" class="inactiveSubBlock" style="font-size: 12px">
	                                <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="activities.label" />
	                              		  </span>
	                              		  <span id="" class="col-lg-6" style="padding: 0px">
	                              		  	<select class="form-control activities" name="storePendigBill" multiple="multiple" id="storePendigBillActivities">
	                              		  		<option value ="Cash Payment">Cash Payment</option>
	                              		  		<option value ="Card Payment">Card Payment</option>
	                              		  		<option value ="Food Coupons">Food Coupons</option>
	                              		  		<option value ="Gift Vouchers">Gift Vouchers</option>
	                              		  		<option value ="Loyalty Cards">Loyalty Cards</option>
	                              		  		<option value ="Discount Coupons">Discount Coupons</option>
	                              		  		<option value ="SMS">SMS</option>
	                              		  		<option value ="Email">Email</option>
	                              		  		<option value ="Print">Print</option>
	                              		  		<option value ="Duplicate Print">Duplicate Print</option>
	                              		  		<option value ="Return">Return</option>
	                              		  		<option value ="Exchange">Exchange</option>
	                              		  		<option value ="Quick Pay">Quick Pay</option>
	                              		  		<option value ="Update Home Delivery">Update Home Delivery</option>
	                              		  	</select>
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="storeStockmanagementRead" style="vertical-align: -2px"" value="ViewStocks" id="StockmanagementViewStocksRead"/>Read -->
		                                  </span>
		                                  <!-- <span class="col-lg-3" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeStockmanagementWrite" style="vertical-align: -2px""  id="StockmanagementViewStocksWrite"/>Write
		                                  </span> -->
		                           </div>
	                              </div>
	                          </div>
                                 <br>
                               	<div id="storeCancelledBillId" class="row divsubbg" style="border: none;">
	                              <span class="col-lg-6"   style="cursor: pointer;padding-left: 40px;">
	                              	<spring:message code="cancelled.bill.label" />
	                              </span>
	                              <span id="storeCancelledBillCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="storeBillingRead" id="storeCancelledBillRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="storeBillingWrite" id="storeCancelledBillWrite"/>Write
                                  <%-- 	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('storeCancelledBill');" id="storeCancelledBillImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="storeBillingCCTo" id="storeCancelledBillCCTo"/><spring:message code="cc.to.label" />
                                  <%-- 	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('storeCancelledBill');" id="storeCancelledBillImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                </div>
                                
                                
                                
                                
                                 <br>
                               	<div id="storeReturnedBillsId" class="row divsubbg" style="border: none;">
	                              <span class="col-lg-6"  onclick="activateSubFlow('storeReturnedBills');" style="cursor: pointer;padding-left: 40px;">
	                              	<spring:message code="all.returned.bills.label" />
	                              </span>
	                             
	                              <span id="storeReturnedBillsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="storeBillingRead" id="storeReturnedBillsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="storeBillingWrite" id="storeReturnedBillsWrite"/>Write
                                  	</span>
                                  	  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="storeBillingCCTo" id="storeReturnedBillsCCTo"/><spring:message code="cc.to.label" />
<%--                                   	<img style="float: right; height: 20px;cursor: pointer;" onclick="activateSubFlow('storeReturnedBills');" id="storeReturnedBillsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                </div>
                                   <br>
                                   
                               	<div id="storeDirectReturnedBillsId" class="row divsubbg" style="border: none;">
	                              <span class="col-lg-6"  onclick="activateSubFlow('storeDirectReturnedBills');" style="cursor: pointer;padding-left: 40px;">
	                              	<spring:message code="direct.return.bill.label" />
	                              </span>
	                             
	                              <span id="storeDirectReturnedBillsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="storeBillingRead" id="storeDirectReturnedBillsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="storeBillingWrite" id="storeDirectReturnedBillsWrite"/>Write
                                  	</span>
                                  	  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="storeBillingCCTo" id="storeDirectReturnedBillsCCTo"/><spring:message code="cc.to.label" />
<%--                                   	<img style="float: right; height: 20px;cursor: pointer;" onclick="activateSubFlow('storeReturnedBills');" id="storeReturnedBillsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                </div>
                              
                                
                                 <br>
                               	<div id="storeVoidBillsId" class="row divsubbg" style="border: none;">
	                              <span class="col-lg-6"  onclick="activateSubFlow('storeVoidBills');" style="cursor: pointer;padding-left: 40px;">
	                              	<spring:message code="all.void.bills.label" />
	                              </span>
	                             
	                              <span id="storeVoidBillsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="storeBillingRead" id="storeVoidBillsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="storeBillingWrite" id="storeVoidBillsWrite"/>Write
                                  	</span>
                                  	  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="storeBillingCCTo" id="storeVoidBillsCCTo"/><spring:message code="cc.to.label" />
<%--                                   	<img style="float: right; height: 20px;cursor: pointer;" onclick="activateSubFlow('storeReturnedBills');" id="storeReturnedBillsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                </div>
                                
                                
                                
                                <br>
                               	<div id="storeExchangedBillsId" class="row divsubbg" style="border: none;">
	                              <span class="col-lg-6"  onclick="activateSubFlow('storeExchangedBills');" style="cursor: pointer;padding-left: 40px;">
	                              	<spring:message code="all.exchanged.bills.label" />
	                              </span>
	                             
	                              <span id="storeExchangedBillsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="storeBillingRead" id="storeExchangedBillsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="storeBillingWrite" id="storeExchangedBillsWrite"/>Write
                                  	</span>
                                  	  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="storeBillingCCTo" id="storeExchangedBillsCCTo"/><spring:message code="cc.to.label" />
<%--                                   	<img style="float: right; height: 20px;cursor: pointer;" onclick="activateSubFlow('storeReturnedBills');" id="storeReturnedBillsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                </div>
                                
                                
                                <br>
                               	<div id="storeCompletedBillsId" class="row divsubbg" style="border: none;">
	                              <span class="col-lg-6"  onclick="activateSubFlow('storeCompletedBills');" style="cursor: pointer;padding-left: 40px;">
	                              	<spring:message code="all.completed.bills.label" />
	                              </span>
	                             
	                              <span id="storeCompletedBillsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="storeBillingRead" id="storeCompletedBillsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="storeBillingWrite" id="storeCompletedBillsWrite"/>Write
                                  	</span>
                                  	  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="storeBillingCCTo" id="storeCompletedBillsCCTo"/><spring:message code="cc.to.label" />
<%--                                   	<img style="float: right; height: 20px;cursor: pointer;" onclick="activateSubFlow('storeReturnedBills');" id="storeReturnedBillsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                </div>
                                
                                
                                
                                <%-- <div style="margin-left:0%;">
	                              <div id="storeCancelledBillFlow" class="inactiveSubBlock" style="font-size: 12px">
	                                <br>
                               		<div class="row divbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;" >
	                              		  	<spring:message code="activities.label" />
	                              		  </span>
	                              		  <span id="" class="col-lg-6" style="padding: 0px">
	                              		  	<select class="form-control activities" name="storeCancelledBill" multiple="multiple" id="storeCancelledBillActivities">
	                              		  		<option value ="Cash Payment">Cash Payment</option>
	                              		  		<option value ="Card Payment">Card Payment</option>
	                              		  		<option value ="Food Coupons">Food Coupons</option>
	                              		  		<option value ="Gift Vouchers">Gift Vouchers</option>
	                              		  		<option value ="Loyalty Cards">Loyalty Cards</option>
	                              		  		<option value ="Discount Coupons">Discount Coupons</option>
	                              		  		<option value ="SMS">SMS</option>
	                              		  		<option value ="Email">Email</option>
	                              		  		<option value ="Print">Print</option>
	                              		  		<option value ="Duplicate Print">Duplicate Print</option>
	                              		  		<option value ="Return">Return</option>
	                              		  		<option value ="Exchange">Exchange</option>
	                              		  	</select>
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="storeStockmanagementRead" style="vertical-align: -2px"" value="ViewStocks" id="StockmanagementViewStocksRead"/>Read -->
		                                  </span>
		                                  <!-- <span class="col-lg-3" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeStockmanagementWrite" style="vertical-align: -2px""  id="StockmanagementViewStocksWrite"/>Write
		                                  </span> -->
		                           </div>
	                              </div>
	                          </div> --%>
                                 <br>
                                 
                                 
                                 
                               	<div id="storeHomeDeliveryBillId" class="row divsubbg" style="border: none;">
	                              <span class="col-lg-6"  onclick="activateSubFlow('storeHomeDeliveryBill');" style="padding-left: 40px;cursor: pointer;">
	                              	<spring:message code="home.delivery.bills.label" />
	                              </span>
	                              <span id="storeHomeDeliveryBillCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="storeBillingRead" id="storeHomeDeliveryBillRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="storeBillingWrite" id="storeHomeDeliveryBillWrite"/>Write
<%--                                   	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('storeHomeDeliveryBill');" id="storeHomeDeliveryBillImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                   <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="storeBillingCCTo" id="storeHomeDeliveryBillCCTo"/><spring:message code="cc.to.label" />
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('storeHomeDeliveryBill');" id="storeHomeDeliveryBillImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                                </div>
                                <div style="margin-left:0%;">
	                              <div id="storeHomeDeliveryBillFlow" class="inactiveSubBlock" style="font-size: 12px">
	                                <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="activities.label" />
	                              		  </span>
	                              		  <span id="" class="col-lg-6" style="padding: 0px">
	                              		  	<select class="form-control activities" name="storeHomeDeliveryBill" multiple="multiple" id="storeHomeDeliveryBillActivities">
	                              		  		
	                              		  		<option value ="SMS">SMS</option>
	                              		  		<option value ="Email">Email</option>
	                              		  		<option value ="Print">Print</option>
	                              		  		<option value ="Duplicate Print">Duplicate Print</option>
	                              		  		<option value ="Return">Return</option>
	                              		  		<option value ="Exchange">Exchange</option>
	                              		  	</select>
		                                  </span>
		                                
		                           </div>
	                              </div>
	                          </div>
	                          <br>
	                          
	                        
	                          
                         </div>
                           <br>
                         <div id="storeShipmentBillsId" class="row divbg" >
	                              <span class="col-lg-6"  onclick="activateSubFlow('storeShipmentBills');" style="cursor: pointer;padding-left: 15px;">
	                            	Shipment Order
	                              </span>
	                             
	                              <span id="storeShipmentBillsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="storeAppRead" id="storeShipmentBillsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="storeAppWrite" id="storeShipmentBillsWrite"/>Write
                                  	</span>
                                  	  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="storeAppCCTo" id="storeShipmentBillsCCTo"/><spring:message code="cc.to.label" />
                                  </span>
                                </div>
                   		 <br>
                   			  <div id="storeStockManagementId" class="row divbg" >
                             <span  class="col-lg-6" onclick="activate('storeStockManagement');" id="storeStockManagementId" style="font-size: 15px;cursor: pointer;">
                             	<spring:message code="stockmanagement.label" />
                             </span>
                             <span id="storeStockManagementCheck" class="col-lg-2" style="padding: 0px">
                              	<input type="checkbox" onclick="selectAll('storeStockManagementRead')" style="vertical-align: -2px"" name="storeAppRead" id="storeStockManagementRead"/>Read
                             </span>
                             <span  class="col-lg-2" style="padding: 0px">
                              	<input type="checkbox" onclick="selectAll('storeStockManagementWrite')" style="vertical-align: -2px"" name="storeAppWrite" id="storeStockManagementWrite"/>Write
<%--                               	<img style="float: right;height: 20px;cursor: pointer;" onclick="activate('storeStockManagement');" id="storeStockManagementImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                             </span>
                              <span  class="col-lg-2" style="padding: 0px">
                              	<input type="checkbox" onclick="selectAll('storeStockManagementCCTo')" style="vertical-align: -2px"" name="storeAppCCTo" id="storeStockManagementCCTo"/><spring:message code="cc.to.label" />
                              	<img style="float: right;height: 20px;cursor: pointer;" onclick="activate('storeStockManagement');" id="storeStockManagementImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                             </span>
                             
                             </div>
	                   		 <div id="storeStockManagementFlow" style="margin-left:0%;color:#666;margin-left: 2px;margin-right: 2px;background-color: rgb(240,240,240)" class="inactiveBlock">
	                   		<br>
	                   		 <div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  	<spring:message code="view.stock.label" />
	                              		  </span>
	                              		  <span id="storeViewStocksCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeStockManagementRead" style="vertical-align: -2px"" value="ViewStocks" id="storeStockmanagementViewStocksRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeStockManagementWrite" style="vertical-align: -2px""  id="storeStockmanagementViewStocksWrite"/>Write
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeStockManagementCCTo" style="vertical-align: -2px""  id="storeStockmanagementViewStocksCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                           </div>
	                   		
                               <br>
	                          <div id="storeGoodsTransferId" class="row divsubbg" style="border: none;">
	                              <span class="col-lg-6"  onclick="activateSubFlow('storeGoodsTransfer');" style="padding-left: 40px;cursor: pointer;">
	                              	<spring:message code="goodstransfer.label" />
	                              </span>
	                              <span id="storeGoodsTransferCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px"" onclick="selectAll('storeGoodsTransferRead');" name="storeStockManagementRead" id="storeGoodsTransferRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="storeStockManagementWrite" style="vertical-align: -2px"" onclick="selectAll('storeGoodsTransferWrite')" id="storeGoodsTransferWrite"/>Write
<%--                                   	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('storeGoodsTransfer');" id="storeGoodsTransferImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                   <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="storeStockManagementCCTo" style="vertical-align: -2px"" onclick="selectAll('storeGoodsTransferCCTo')" id="storeGoodsTransferCCTo"/><spring:message code="cc.to.label" />
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('storeGoodsTransfer');" id="storeGoodsTransferImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                                  </div>
                                  <div style="margin-left:0%;">
	                              <div id="storeGoodsTransferFlow" class="inactiveSubBlock" style="font-size: 12px">
	                                <br>
                               		<div id="GoodsTransferStockReceiptId" class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" onclick="activateSubChildFlow('GoodsTransferStockReceipt');" >
	                              		  	<spring:message code="receiptstock.label" />
	                              		  </span>
	                              		  <span id="GoodsTransferStockReceiptCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeGoodsTransferRead" style="vertical-align: -2px"" value="StockReceipt" id="GoodsTransferStockReceiptRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeGoodsTransferWrite" style="vertical-align: -2px""  id="GoodsTransferStockReceiptWrite"/>Write
<%-- 		                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('GoodsTransferStockReceipt');" id="GoodsTransferStockReceiptImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeGoodsTransferCCTo" style="vertical-align: -2px""  id="GoodsTransferStockReceiptCCTo"/><spring:message code="cc.to.label" />
		                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('GoodsTransferStockReceipt');" id="GoodsTransferStockReceiptImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                                  </span>
		                           </div>
			                       <div style="margin-left: 0%">
			                       		<div id="GoodsTransferStockReceiptFlow" class="inactiveSubChildBlock" style="font-size: 10px;background-color: rgb(240,240,240)">
			                       			<br>
			                       			<div class="row divsubbg" style="border: none">
			                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
			                              		  	<spring:message code="activities.label" />
			                              		  </span>
			                              		  <span id="" class="col-lg-6" style="padding: 0px">
			                              		  	<select class="form-control activities" name="GoodsTransferStockReceipt" multiple="multiple" id="GoodsTransferStockReceiptActivities">
				                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
								                            <c:if test="${workflow.businessFlow == 'Stock Receipt'}">
								                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
								                            </c:if>
		                                 				</c:forEach>
			                              		  	</select>
				                                  </span>
				                           </div>
			                       		</div>
			                       </div>
		                             <br>
	                                <div id="GoodsTransferStockIssueId" class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" onclick="activateSubChildFlow('GoodsTransferStockIssue');" >
	                              		  	<spring:message code="stock.issue.label" />
	                              		  </span>
	                              		  <span id="GoodsTransferStockIssueCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeGoodsTransferRead" style="vertical-align: -2px"" value="StockIssue" id="GoodsTransferStockIssueRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeGoodsTransferWrite" style="vertical-align: -2px"" id="GoodsTransferStockIssueWrite"/>Write
<%-- 		                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('GoodsTransferStockIssue');" id="GoodsTransferStockIssueImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
		                                  </span>
		                                    <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeGoodsTransferCCTo" style="vertical-align: -2px"" id="GoodsTransferStockIssueCCTo"/><spring:message code="cc.to.label" />
		                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('GoodsTransferStockIssue');" id="GoodsTransferStockIssueImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                                  </span>
		                             </div>
		                             <div style="margin-left: 0%">
					                      <div id="GoodsTransferStockIssueFlow" class="inactiveSubChildBlock" style="font-size: 10px;background-color: rgb(240,240,240)">
					                       		<br>
					                             <div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="activities.label" />
				                              		  </span>
				                              		  <span id="" class="col-lg-6" style="padding: 0px">
				                              		  	<select class="form-control activities" name="GoodsTransferStockIssue" multiple="multiple" id="GoodsTransferStockIssueActivities">
					                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
									                            <c:if test="${workflow.businessFlow == 'Stock Issue'}">
									                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
									                            </c:if>
			                                 				</c:forEach>
				                              		  	</select>
					                                  </span>
					                           </div>
					                       </div>
					                  </div>
			                             <br>
                               		<div id="GoodsTransferStockRequestId" class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" onclick="activateSubChildFlow('GoodsTransferStockRequest');" >
	                              		  	<spring:message code="outlet.stock.request.label" />
	                              		  </span>
	                              		  <span id="GoodsTransferStockRequestCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeGoodsTransferRead" style="vertical-align: -2px"" value="StockRequest" id="GoodsTransferStockRequestRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeGoodsTransferWrite" style="vertical-align: -2px""  id="GoodsTransferStockRequestWrite"/>Write
<%-- 		                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('GoodsTransferStockRequest');" id="GoodsTransferStockRequestImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeGoodsTransferCCTo" style="vertical-align: -2px""  id="GoodsTransferStockRequestCCTo"/><spring:message code="cc.to.label" />
		                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('GoodsTransferStockRequest');" id="GoodsTransferStockRequestImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                                  </span>
		                           </div>
			                       <div style="margin-left: 0%">
			                       		<div id="GoodsTransferStockRequestFlow" class="inactiveSubChildBlock" style="font-size: 10px;background-color: rgb(240,240,240)">
			                       			<br>
			                       			<div class="row divsubbg" style="border: none">
			                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
			                              		  	<spring:message code="activities.label" />
			                              		  </span>
			                              		  <span id="" class="col-lg-6" style="padding: 0px">
			                              		  	<select class="form-control activities" name="GoodsTransferStockRequest" multiple="multiple" id="GoodsTransferStockRequestActivities">
				                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
								                            <c:if test="${workflow.businessFlow == 'Stock Request'}">
								                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
								                            </c:if>
		                                 				</c:forEach>
			                              		  	</select>
				                                  </span>
				                           </div>
			                       		</div>
			                       </div>
		                             <br>
	                                <div id="GoodsTransferStockReturnId" class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" onclick="activateSubChildFlow('GoodsTransferStockReturn');" >
	                              		  	<spring:message code="warehouse.stockreturn.label" />
	                              		  </span>
	                              		  <span id="GoodsTransferStockReturnCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeGoodsTransferRead" style="vertical-align: -2px"" value="StockReturn" id="GoodsTransferStockReturnRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeGoodsTransferWrite" style="vertical-align: -2px"" id="GoodsTransferStockReturnWrite"/>Write
<%-- 		                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('GoodsTransferStockReturn');" id="GoodsTransferStockReturnImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeGoodsTransferCCTo" style="vertical-align: -2px"" id="GoodsTransferStockReturnCCTo"/><spring:message code="cc.to.label" />
		                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('GoodsTransferStockReturn');" id="GoodsTransferStockReturnImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                                  </span>
		                             </div>
		                             <div style="margin-left: 0%">
					                      <div id="GoodsTransferStockReturnFlow" class="inactiveSubChildBlock" style="font-size: 10px;background-color: rgb(240,240,240)">
					                       		<br>
					                             <div class="row divsubbg" style="border: none">
				                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
				                              		  	<spring:message code="activities.label" />
				                              		  </span>
				                              		  <span id="" class="col-lg-6" style="padding: 0px">
				                              		  	<select class="form-control activities" name="GoodsTransferStockReturn" multiple="multiple" id="GoodsTransferStockReturnActivities">
					                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
									                            <c:if test="${workflow.businessFlow == 'Stock Return'}">
									                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
									                            </c:if>
			                                 				</c:forEach>
				                              		  	</select>
					                                  </span>
					                           </div>
					                       </div>
					                  </div>
	                              </div>
	                          </div>
	                          <br>
	                          
	                          
	                          
	                              
	                          
	                          
	                          <div id="storeGoodsProcurementId" class="row divsubbg" style="border: none;">
	                              <span class="col-lg-6"  onclick="activateSubFlow('storeGoodsProcurement');" style="cursor: pointer;padding-left: 40px;">
	                              	<spring:message code="goods.procurement" />
	                              </span>
	                              <span id="storeGoodsProcurementCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px"" onclick="selectAll('storeGoodsProcurementRead');" name="storeStockManagementRead" id="storeGoodsProcurementRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="storeStockManagementWrite" style="vertical-align: -2px"" onclick="selectAll('storeGoodsProcurementWrite')" id="storeGoodsProcurementWrite"/>Write
<%--                                   	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('storeGoodsProcurement');" id="storeGoodsProcurementImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="storeStockManagementCCTo" style="vertical-align: -2px"" onclick="selectAll('storeGoodsProcurementCCTo')" id="storeGoodsProcurementCCTo"/><spring:message code="cc.to.label" />
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('storeGoodsProcurement');" id="storeGoodsProcurementImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                                  </div>
                                  <div style="margin-left:0%;">
	                              <div id="storeGoodsProcurementFlow" class="inactiveSubBlock" style="font-size: 12px">
	                                <br>
                               		<div id="GoodsProcurementPurchasesId" class="row divsubbg" style="border: none;">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" onclick="activateSubChildFlow('GoodsProcurementPurchases');" >
	                              		  	<spring:message code="purchases.label" />
	                              		  </span>
	                              		  <span id="GoodsProcurementPurchasesCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeGoodsProcurementRead" style="vertical-align: -2px"" value="Purchases" id="GoodsProcurementPurchasesRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeGoodsProcurementWrite" style="vertical-align: -2px""  id="GoodsProcurementPurchasesWrite"/>Write
<%-- 		                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('GoodsProcurementPurchases');" id="GoodsProcurementPurchasesImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeGoodsProcurementCCTo" style="vertical-align: -2px""  id="GoodsProcurementPurchasesCCTo"/><spring:message code="cc.to.label" />
		                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('GoodsProcurementPurchases');" id="GoodsProcurementPurchasesImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                                  </span>
		                           </div>
	                            <div style="margin-left: 0%;">
		                            <div id="GoodsProcurementPurchasesFlow" class="inactiveSubChildBlock" style="font-size: 12px;background-color: rgb(240,240,240)">
		                                 <br>
		                               		<div class="row divsubbg" style="border: none">
			                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
			                              		  	<spring:message code="activities.label" />
			                              		  </span>
			                              		  <span id="" class="col-lg-6" style="padding: 0px">
			                              		  	<select class="form-control activities" name="GoodsProcurementPurchases" multiple="multiple" id="GoodsProcurementPurchasesActivities">
				                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
								                            <c:if test="${workflow.businessFlow == 'Purchase Order'}">
								                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
								                            </c:if>
		                                 				</c:forEach>
			                              		  	</select>
				                                  </span>
				                           </div>
			                           </div>
			                        </div>
		                           
		                           
		                           
		                             <br>
	                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="shipment.label" />
	                              		  </span>
	                              		  <span id="ShipmentsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeGoodsProcurementRead" style="vertical-align: -2px"" value="Shipments" id="GoodsProcurementShipmentsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeGoodsProcurementWrite" style="vertical-align: -2px"" id="GoodsProcurementShipmentsWrite"/>Write
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeGoodsProcurementCCTo" style="vertical-align: -2px"" id="GoodsProcurementShipmentsCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                             </div>
		                              <br>
		                              
		                              
		                                <div id="GoodsProcurementOutletGRNId"  class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="outlet.grn.label" />
	                              		  </span>
	                              		  <span id="OutletGRNCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeGoodsProcurementRead" style="vertical-align: -2px"" value="OutletGRN" id="GoodsProcurementOutletGRNRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeGoodsProcurementWrite" style="vertical-align: -2px"" id="GoodsProcurementOutletGRNWrite"/>Write
<%-- 		                                 <img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('GoodsProcurementOutletGRN');" id="GoodsProcurementOutletGRNImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeGoodsProcurementCCTo" style="vertical-align: -2px"" id="GoodsProcurementOutletGRNCCTo"/><spring:message code="cc.to.label" />
		                                 <img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('GoodsProcurementOutletGRN');" id="GoodsProcurementOutletGRNImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                                  </span>
		                             </div>
		                             
		                               <div style="margin-left: 0%;">
		                            <div id="GoodsProcurementOutletGRNFlow" class="inactiveSubChildBlock" style="font-size: 12px;background-color: rgb(240,240,240)">
		                                 <br>
		                               		<div class="row divsubbg" style="border: none">
			                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
			                              		  	<spring:message code="activities.label" />
			                              		  </span>
			                              		  <span id="" class="col-lg-6" style="padding: 0px">
			                              		  	<select class="form-control activities" name="GoodsProcurementOutletGRN" multiple="multiple" id="GoodsProcurementOutletGRNActivities">
				                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
								                            <c:if test="${workflow.businessFlow == 'Outlet GRN'}">
								                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
								                            </c:if>
		                                 				</c:forEach>
			                              		  	</select>
				                                  </span>
				                           </div>
			                           </div>
			                        </div>
		                              
		                              
	                              
		                             <br>
		                             
		                             <!--added by manasa  -->
		                             <div id="GoodsProcurementShipmentReturnId"  class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="shipmentreturns.label" />
	                              		  </span>
	                              		  <span id="ShipmentReturnCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeGoodsProcurementRead" style="vertical-align: -2px"" value="ShipmentReturn" id="GoodsProcurementShipmentReturnRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeGoodsProcurementWrite" style="vertical-align: -2px"" id="GoodsProcurementShipmentReturnWrite"/>Write
<%-- 		                                 <img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('GoodsProcurementShipmentReturn');" id="GoodsProcurementShipmentReturnImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeGoodsProcurementCCTo" style="vertical-align: -2px"" id="GoodsProcurementShipmentReturnCCTo"/><spring:message code="cc.to.label" />
		                                 <img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('GoodsProcurementShipmentReturn');" id="GoodsProcurementShipmentReturnImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                                  </span>
		                             </div>
		                             
		                               <div style="margin-left: 0%;">
		                            <div id="GoodsProcurementShipmentReturnFlow" class="inactiveSubChildBlock" style="font-size: 12px;background-color: rgb(240,240,240)">
		                                 <br>
		                               		<div class="row divsubbg" style="border: none">
			                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 80px;" >
			                              		  	<spring:message code="activities.label" />
			                              		  </span>
			                              		  <span id="" class="col-lg-6" style="padding: 0px">
			                              		  	<select class="form-control activities" name="GoodsProcurementShipmentReturn" multiple="multiple" id="GoodsProcurementShipmentReturnActivities">
				                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
								                            <c:if test="${workflow.businessFlow == 'Shipment Return'}">
								                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
								                            </c:if>
		                                 				</c:forEach>
			                              		  	</select>
				                                  </span>
				                           </div>
			                           </div>
			                        </div>
		                             
		                             
		                             
	                              </div>
	                          </div>
	                          
	                        
	                          
	                          
	                          <br>
	                            <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer; padding-left: 40px;" onclick="activateSubChildFlow('storeStoreStockVerification');" >
	                              		  	<spring:message code="warehouse_stockverification.label" />
	                              		  </span>
	                              		  <span id="storeStoreStockVerificationCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeStockManagementRead" style="vertical-align: -2px" id="storeStoreStockVerificationRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeStockManagementWrite" style="vertical-align: -2px" id="storeStoreStockVerificationWrite"/>Write
<%-- 		                                 <img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('warehouseAppWarehouseStockIssues');" id="warehouseAppWarehouseStockIssuesImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeStockManagementCCTo" style="vertical-align: -2px" id="storeStoreStockVerificationCCTo"/>CC To
		                                 <img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('storeStoreStockVerification');" id="storeStoreStockVerificationIssuesImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                                  </span>
		                             </div>
		                            <div style="margin-left: 0%">
			                       		<div id="storeStoreStockVerificationFlow" class="inactiveSubChildBlock" style="font-size: 10px;">
			                       			<br>
			                       			<div class="row divsubbg" style="border: none">
			                              		  <span class="col-lg-6" style="cursor: pointer; padding-left: 60px;" >
			                              		  	<spring:message code="activities.label" />
			                              		  </span>
			                              		  <span id="" class="col-lg-6" style="padding: 0px">
			                              		  	<select class="form-control activities" name="storeStoreStockVerification" multiple="multiple" id="storeStoreStockVerificationActivities">
				                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
								                            <c:if test="${workflow.businessFlow == 'Store Stock Verification'}">
								                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
								                            </c:if>
		                                 				</c:forEach>
			                              		  	</select>
				                                  </span>
				                           </div>
			                       		</div>
			                       </div>
		                             
	                          
	                          
	                          <br>
	                          <div id="storeDeliveriesId" class="row divsubbg" style="border: none;">
	                              <span class="col-lg-6"  onclick="activateSubFlow('storeDeliveries');" style="cursor: pointer;padding-left: 40px;">
	                              	<spring:message code="all.deliveries.label" />
	                              </span>
	                              <span id="storeDeliveriesCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px"" onclick="selectAll('storeDeliveriesRead');" name="storeStockManagementRead" id="storeDeliveriesRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="storeStockManagementWrite" style="vertical-align: -2px"" onclick="selectAll('storeDeliveriesWrite')" id="storeDeliveriesWrite"/>Write
<%--                                   	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('storeDeliveries');" id="storeDeliveriesImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                   <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="storeStockManagementCCTo" style="vertical-align: -2px"" onclick="selectAll('storeDeliveriesCCTo')" id="storeDeliveriesCCTo"/><spring:message code="cc.to.label" />
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('storeDeliveries');" id="storeDeliveriesImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                                  </div>
                                  <div style="margin-left:0%;">
	                              <div id="storeDeliveriesFlow" class="inactiveSubBlock" style="font-size: 12px">
	                                <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="orders.label" />
	                              		  </span>
	                              		  <span id="OrderstCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeDeliveriesRead" style="vertical-align: -2px"" value="Orders" id="DeliveriesOrdersRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeDeliveriesWrite" style="vertical-align: -2px""  id="DeliveriesOrdersWrite"/>Write
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeDeliveriesCCTo" style="vertical-align: -2px""  id="DeliveriesOrdersCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                           </div>
		                             <br>
	                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="shipment.label" />
	                              		  </span>
	                              		  <span id="ShipmentCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeDeliveriesRead" style="vertical-align: -2px"" value="Shipments" id="DeliveriesShipmentsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeDeliveriesWrite" style="vertical-align: -2px"" id="DeliveriesShipmentsWrite"/>Write
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeDeliveriesCCTo" style="vertical-align: -2px"" id="DeliveriesShipmentsCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                             </div>
	                              </div>
	                          </div>
	                          </div>
	                          <br>
	                           <div id="storeDealsAndOffersId" class="row divbg" style="border: none;">
	                              <span class="col-lg-6"  onclick="activate('storeDealsAndOffers');" style="font-size: 15px;cursor: pointer;">
	                              	<spring:message code="campaignmanagment.label" />
	                              </span>
	                              <span id="storeDealsAndOffersCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px"" onclick="selectAll('storeDealsAndOffersRead');" name="storeAppRead" id="storeDealsAndOffersRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px"" onclick="selectAll('storeDealsAndOffersWrite')" name="storeAppWrite" id="storeDealsAndOffersWrite"/>Write
<%--                                   	<img style="float: right;height: 20px;cursor: pointer;" onclick="activate('storeDealsAndOffers');" id="storeDealsAndOffersImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px"" onclick="selectAll('storeDealsAndOffersCCTo')" name="storeAppCCTo" id="storeDealsAndOffersCCTo"/><spring:message code="cc.to.label" />
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activate('storeDealsAndOffers');" id="storeDealsAndOffersImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                                  
                                  </div>
                                  <div style="margin-left:0%;">
	                              <div id="storeDealsAndOffersFlow" class="inactiveBlock" style="margin-left: 2px;margin-right: 2px;background-color: rgb(240,240,240)">
	                                <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  	<spring:message code="deals.label" />
	                              		  </span>
	                              		  <span id="storeDealsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeDealsAndOffersRead" style="vertical-align: -2px"" id="storeDealsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeDealsAndOffersWrite" style="vertical-align: -2px""  id="storeDealsWrite"/>Write
		                                  </span>
		                                    <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeDealsAndOffersCCTo" style="vertical-align: -2px""  id="storeDealsCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                           </div>
		                             <br>
	                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  <spring:message code="offers.label" />
	                              		  </span>
	                              		  <span id="storeOffersCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeDealsAndOffersRead" style="vertical-align: -2px"" id="storeOffersRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeDealsAndOffersWrite" style="vertical-align: -2px"" id="storeOffersWrite"/>Write
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeDealsAndOffersCCTo" style="vertical-align: -2px"" id="storeOffersCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                             </div>
		                             <br>
		                               <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="socialmediacampaigns.label" />
                                  </span>
                                  <span id="storesocialMediaCampaignCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeDealsAndOffersRead" style="vertical-align: -2px"" id="storesocialMediaCampaignRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeDealsAndOffersWrite" style="vertical-align: -2px"" id="storesocialMediaCampaignWrite"/>Write
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeDealsAndOffersCCTo" style="vertical-align: -2px"" id="storesocialMediaCampaignCCTo"/><spring:message code="cc.to.label" />
                                  </span>
                               </div>
                               <br>
                                      <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="emailcampaigns.label" />
                                  </span>
                                  <span id="storeEmailCampaignCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeDealsAndOffersRead" style="vertical-align: -2px"" id="storeEmailCampaignRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeDealsAndOffersWrite" style="vertical-align: -2px"" id="storeEmailCampaignWrite"/>Write
                                  </span>
                                   <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeDealsAndOffersCCTo" style="vertical-align: -2px"" id="storeEmailCampaignCCTo"/><spring:message code="cc.to.label" />
                                  </span>
                                  
                               </div>
                                 <br>
                                    <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="mobilecampaigns.label" />
                                  </span>
                                  <span id="storeMobileCampaignCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeDealsAndOffersRead" style="vertical-align: -2px"" id="storeMobileCampaignRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeDealsAndOffersWrite" style="vertical-align: -2px"" id="storeMobileCampaignWrite"/>Write
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeDealsAndOffersCCTo" style="vertical-align: -2px"" id="storeMobileCampaignCCTo"/><spring:message code="cc.to.label" />
                                  </span>
                               </div>
                                 <br>
                                    <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="customerreferals.label" />
                                  </span>
                                  <span id="storeCustomerReferalCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeDealsAndOffersRead" style="vertical-align: -2px"" id="storeCustomerReferalRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeDealsAndOffersWrite" style="vertical-align: -2px"" id="storeCustomerReferalWrite"/>Write
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeDealsAndOffersCCTo" style="vertical-align: -2px"" id="storeCustomerReferalCCTo"/><spring:message code="cc.to.label" />
                                  </span>
                               </div>
                                 <br>
                                    <div class="row divsubbg" style="border: none">
                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
                                  	<spring:message code="promotions.label" />
                                  </span>
                                  <span id="storePromotionCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeDealsAndOffersRead" style="vertical-align: -2px"" id="storePromotionRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeDealsAndOffersWrite" style="vertical-align: -2px"" id="storePromotionWrite"/>Write
                                  </span>
                                    <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeDealsAndOffersCCTo" style="vertical-align: -2px"" id="storePromotionCCTo"/><spring:message code="cc.to.label" />
                                  </span>
                                  
                               </div>
	                              </div>
	                          </div>
	                          <br>
	                          <div class="row divbg">
                                <span id="storeOrdersId" class="col-lg-6" style="cursor: pointer;font-size: 15px;" onclick="activate('storeOrders');">
                                	<spring:message code="orders.label" />
                                </span>
                                <span id="storeOrdersCheck" class="col-lg-2" style="padding: 0px">
                                	<input type="checkbox" onclick="selectAll('storeOrdersRead')" style="vertical-align: -2px"" name="storeAppRead" id="storeOrdersRead"/>Read
                                </span>
                                <span  class="col-lg-2" style="padding: 0px">
                                	<input type="checkbox" onclick="selectAll('storeOrdersWrite')" style="vertical-align: -2px"" name="storeAppWrite" id="storeOrdersWrite"/>Write
<%--                                 	<img style="float: right;height: 20px;cursor: pointer;" onclick="activate('storeOrders');" id="storeOrdersImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                </span>
                                  <span  class="col-lg-2" style="padding: 0px">
                                	<input type="checkbox" onclick="selectAll('storeOrdersCCTo')" style="vertical-align: -2px"" name="storeAppCCTo" id="storeOrdersCCTo"/><spring:message code="cc.to.label" />
                                	<img style="float: right;height: 20px;cursor: pointer;" onclick="activate('storeOrders');" id="storeOrdersImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                </span>
                   		   </div>
                   		   
                   		   
                   		 <div id="storeOrdersFlow" style="margin-left:0%;color:#666;margin-left: 2px;margin-right: 2px;background-color: rgb(240,240,240)" class="inactiveBlock">
	                   		 <br>
                               	<div id="storeOrderId" class="row divsubbg" style="border: none;">
	                              <span class="col-lg-6"  onclick="activateSubFlow('storeOrder');" style="cursor: pointer;padding-left: 40px;">
	                              	<spring:message code="order.label" />
	                              </span>
	                              <span id="storeOrderCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px"" onclick="" name="storeOrdersRead" id="storeOrderRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px"" onclick="" name="storeOrdersWrite" id="storeOrderWrite"/>Write
<%--                                   	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('storeOrder');" id="storeOrderImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                      <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px"" onclick="" name="storeOrdersCCTo" id="storeOrderCCTo"/><spring:message code="cc.to.label" />
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('storeOrder');" id="storeOrderImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                                </div>
                               	<div style="margin-left:0%;">
	                              <div id="storeOrderFlow" class="inactiveSubBlock" style="font-size: 12px">
	                                <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="activities.label" />
	                              		  </span>
	                              		  <span id="" class="col-lg-6" style="padding: 0px">
	                              		  	<select class="form-control activities" name="storeOrder" multiple="multiple" id="storeOrderActivities">
	                              		  		<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
							                            <c:if test="${workflow.businessFlow == 'Order'}">
							                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
							                            </c:if>
	                                 				</c:forEach>
	                              		  	</select>
		                                  </span>
		                           </div>
	                             </div>
                          	</div>
                   		    <br>
                               	<div id="storeOrderComplaintsId" class="row divsubbg" style="border: none;">
	                              <span class="col-lg-6"  style="cursor: pointer;padding-left: 40px;">
	                              	<spring:message code="complaints.label" />
	                              </span>
	                              <span id="storeOrderComplaintsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px"" onclick="" name="storeOrdersRead" id="storeOrderComplaintsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px"" onclick="" name="storeOrdersWrite" id="storeOrderComplaintsWrite"/>Write
                                  	<%-- <img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('storeOrderComplaints');" id="storeOrderComplaintsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                   <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px"" onclick="" name="storeOrdersCCTo" id="storeOrderComplaintsCCTo"/><spring:message code="cc.to.label" />
                                  	<%-- <img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('storeOrderComplaints');" id="storeOrderComplaintsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                </div>
                   		   </div>
                   		   
                   		   
                   		   <br>
                   		   <div id="storeLoyaltyCardsId" class="row divbg" style="border: none;">
                                <span class="col-lg-6" style="cursor: pointer;font-size: 15px;" onclick="activate('storeLoyaltyCards');">
                                	<spring:message code="loyaltycards.label" />
                                </span>
                                <span id="storeLoyaltyCardsCheck" class="col-lg-2" style="padding: 0px">
                                	<input type="checkbox" style="vertical-align: -2px"" onclick="selectAll('storeLoyaltyCardsRead');" name="storeAppRead" id="storeLoyaltyCardsRead"/>Read
                                </span>
                                <span  class="col-lg-2" style="padding: 0px">
                                	<input type="checkbox" style="vertical-align: -2px"" onclick="selectAll('storeLoyaltyCardsWrite');" name="storeAppWrite" id="storeLoyaltyCardsWrite"/>Write
<%--                                 	<img style="float: right;height: 20px;cursor: pointer;" onclick="activate('storeLoyaltyCards');" id="storeLoyaltyCardsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                </span>
                                  <span  class="col-lg-2" style="padding: 0px">
                                	<input type="checkbox" style="vertical-align: -2px"" onclick="selectAll('storeLoyaltyCardsCCTo');" name="storeAppCCTo" id="storeLoyaltyCardsCCTo"/><spring:message code="cc.to.label" />
                                	<img style="float: right;height: 20px;cursor: pointer;" onclick="activate('storeLoyaltyCards');" id="storeLoyaltyCardsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                </span>
                   		   </div>
                   		   <div style="margin-left:0%;">
	                              <div id="storeLoyaltyCardsFlow" class="inactiveBlock" style="margin-left: 2px;margin-right: 2px;background-color: rgb(240,240,240)">
	                                <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  	<spring:message code="loyalty.card.label" />
	                              		  </span>
	                              		  <span id="storeLoyaltyCardCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeLoyaltyCardsRead" style="vertical-align: -2px"" id="storeLoyaltyCardRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeLoyaltyCardsWrite" style="vertical-align: -2px""  id="storeLoyaltyCardWrite"/>Write
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeLoyaltyCardsCCTo" style="vertical-align: -2px""  id="storeLoyaltyCardCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                           </div>
		                             <br>
		                             <div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  	<spring:message code="deal_giftvoucher.label" />
	                              		  </span>
	                              		  <span id="storeGiftVoucherCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeLoyaltyCardsRead" style="vertical-align: -2px"" id="storeGiftVoucherRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeLoyaltyCardsWrite" style="vertical-align: -2px""  id="storeGiftVoucherWrite"/>Write
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeLoyaltyCardsCCTo" style="vertical-align: -2px""  id="storeGiftVoucherCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                           </div>
		                             <br>
		                             <div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  	<spring:message code="gift.coupon.label" />
	                              		  </span>
	                              		  <span id="storeGiftCouponCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeLoyaltyCardsRead" style="vertical-align: -2px"" id="storeGiftCouponRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeLoyaltyCardsWrite" style="vertical-align: -2px""  id="storeGiftCouponWrite"/>Write
		                                  </span>
		                                    <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeLoyaltyCardsCCTo" style="vertical-align: -2px""  id="storeGiftCouponCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                           </div>
	                              </div>
	                        </div>
	                        
	                        <br>
	                        
	                         <div  class="row divbg" >
                             <span  class="col-lg-6" onclick="activate('storeHealth');" id="storeHealthId" style="font-size: 15px;cursor: pointer;">
                             		<spring:message code="health.label" />
                             </span>
                             <span id="storeHealthCheck" class="col-lg-2" style="padding: 0px">
                              	<input type="checkbox" onclick="selectAll('storeHealthRead')" style="vertical-align: -2px" name="storeAppRead"  id="storeHealthRead"/>Read
                             </span>
                             <span  class="col-lg-2" style="padding: 0px">
                              	<input type="checkbox" onclick="selectAll('storeHealthWrite')" style="vertical-align: -2px" name="storeAppWrite" id="storeHealthWrite"/>Write
                              <%-- 	<img style="float: right;height: 20px;cursor: pointer;" onclick="activate('storeStockManagement');" id="storeStockManagementImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                             </span>
                              <span  class="col-lg-2" style="padding: 0px">
                              	<input type="checkbox" onclick="selectAll('storeHealthCCTo')" style="vertical-align: -2px" name="storeAppCCTo" id="storeHealthCCTo"/><spring:message code="cc.to.label" />
                              	<img style="float: right;height: 20px;cursor: pointer;" onclick="activate('storeHealth');" id="storeHealthImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                             </span>
                             </div>
	                        
	                          <div id="storeHealthFlow" style="margin-left:0%;color:#666;margin-left: 2px;margin-right: 2px;background-color: rgb(240,240,240)" class="inactiveBlock">
	                   		     <br>
	                   		     
	                   		     <div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  	<spring:message code="clinic.label" />
	                              		  </span>
	                              		  <span id="storeClinicCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeHealthRead" style="vertical-align: -2px" id="storeClinicRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeHealthWrite" style="vertical-align: -2px"  id="storeClinicWrite"/>Write
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeHealthCCTo" style="vertical-align: -2px"  id="storeClinicCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                           </div>
	                   		     <br>
	                   		 <div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		 	<spring:message code="billing.label" />
	                              		  </span>
	                              		  <span id="storeBillingHealthCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeHealthRead" style="vertical-align: -2px" id="storeBillingHealthRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeHealthWrite" style="vertical-align: -2px"  id="storeBillingHealthWrite"/>Write
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeHealthCCTo" style="vertical-align: -2px"  id="storeBillingHealthCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                           </div>
	                   		     
	                   		      <br>
	                   		 <div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		 	<spring:message code="pharma.label" />
	                              		  </span>
	                              		  <span id="storePharmaCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeHealthRead" style="vertical-align: -2px" id="storePharmaRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeHealthWrite" style="vertical-align: -2px"  id="storePharmaWrite"/>Write
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeHealthCCTo" style="vertical-align: -2px"  id="storePharmaCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                           </div>
	                   		     
	                   		      <br>
	                   		 <div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		 	<spring:message code="support.label" />
	                              		  </span>
	                              		  <span id="storeSupportCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeHealthRead" style="vertical-align: -2px" id="storeSupportRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeHealthWrite" style="vertical-align: -2px"  id="storeSupportWrite"/>Write
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeHealthCCTo" style="vertical-align: -2px"  id="storeSupportCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                           </div>
	                   		     
	                   		     <br>
	                   		 <div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		 	<spring:message code="lab.label" />
	                              		  </span>
	                              		  <span id="storeLabManagementCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeHealthRead" style="vertical-align: -2px" id="storeLabManagementRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeHealthWrite" style="vertical-align: -2px"  id="storeLabManagementWrite"/>Write
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeHealthCCTo" style="vertical-align: -2px"  id="storeLabManagementCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                           </div>
	                   		     
	                   		     <br> 
		                        <div id="storeHealthDoctorsHistoryId" class="row divsubbg" style="border: none;">
		                            <span  onclick="activateSubFlow('storeHealthDoctorsHistory');" class="col-lg-6" style="cursor: pointer;padding-left: 40px;">
		                           	<spring:message code="doctor.label" />
		                            </span>
		                            <span id="storeHealthDoctorsHistoryCheck" class="col-lg-2" style="padding: 0px">
		                            	<input type="checkbox" style="vertical-align: -2px" name="storeHealthRead"  onclick="selectAll('storeHealthDoctorsHistoryRead')" id="storeHealthDoctorsHistoryRead"/>Read
		                            </span>
		                            <span class="col-lg-2" style="padding: 0px">
		                            	<input type="checkbox" style="vertical-align: -2px" name="storeHealthWrite" onclick="selectAll('storeHealthDoctorsHistoryWrite')" id="storeHealthDoctorsHistoryWrite"/>Write
		                            </span>
		                             <span class="col-lg-2" style="padding: 0px">
		                            	<input type="checkbox" style="vertical-align: -2px" name="storeHealthCCTo" onclick="selectAll('storeHealthDoctorsHistoryCCTo')" id="storeHealthDoctorsHistoryCCTo"/>CC To
		                            	<img style="float: right;height: 20px;cursor: pointer;" id="storeHealthDoctorsHistoryImg" onclick="activateSubFlow('storeHealthDoctorsHistory');" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                            </span>
		                        </div>
		                        
		                        
		                         <div style="margin-left: 0%">
		                            <div id="storeHealthDoctorsHistoryFlow" style="font-size: 12px;" class="inactiveSubBlock">
		                               <br>
		                           <div class="row divsubbg" style="border: none">
		                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                                  	<spring:message code="appointment.label" />
		                                  </span>
		                                  <span id="AppointmentCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeHealthDoctorsHistoryRead" value="Appointment" style="vertical-align: -2px" id="HealthDoctorsHistoryAppointmentRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeHealthDoctorsHistoryWrite" style="vertical-align: -2px" id="HealthDoctorsHistoryAppointmentWrite"/>Write
		                                  </span>
		                                    <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeHealthDoctorsHistoryCCTo" style="vertical-align: -2px" id="HealthDoctorsHistoryAppointmentCCTo"/>CC To
		                                  </span>
		                               </div>
		                           
		                           
		                           <br>
		                           <div class="row divsubbg" style="border: none">
		                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                                  	<spring:message code="calander.label" />
		                                  </span>
		                                  <span id="Check" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeHealthDoctorsHistoryRead" value="DoctorCalendar" style="vertical-align: -2px" id="HealthDoctorsHistoryDoctorCalendarRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeHealthDoctorsHistoryWrite" style="vertical-align: -2px" id="HealthDoctorsHistoryDoctorCalendarWrite"/>Write
		                                  </span>
		                                    <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeHealthDoctorsHistoryCCTo" style="vertical-align: -2px" id="HealthDoctorsHistoryDoctorCalendarCCTo"/>CC To
		                                  </span>
		                               </div>
		                           <br>
		                          
		                               <div id="HealthDoctorsHistoryDoctorsTreatmentsId"  class="row divsubbg" style="border: none">
		                               	  <span class="col-lg-6"  onclick="activateSubChildFlow('HealthDoctorsHistoryDoctorsTreatments');" style="cursor: pointer;padding-left: 60px;">
			                              		<spring:message code="treatment.label" />
			                              </span>
			                              <span id="HealthDoctorsHistoryDoctorsTreatmentsCheck" class="col-lg-2" style="padding: 0px">
		                                  		<input type="checkbox" name="storeHealthDoctorsHistoryRead" style="vertical-align: -2px" onclick="selectAll('HealthDoctorsHistoryDoctorsTreatmentsRead')" value="DoctorsTreatments" id="HealthDoctorsHistoryDoctorsTreatmentsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  		<input type="checkbox" name="storeHealthDoctorsHistoryWrite" style="vertical-align: -2px" onclick="selectAll('HealthDoctorsHistoryDoctorsTreatmentsWrite')" id="HealthDoctorsHistoryDoctorsTreatmentsWrite"/>Write
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  		<input type="checkbox" name="storeHealthDoctorsHistoryCCTo" style="vertical-align: -2px" onclick="selectAll('HealthDoctorsHistoryDoctorsTreatmentsCCTo')" id="HealthDoctorsHistoryDoctorsTreatmentsCCTo"/>CC To
		                                  		<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('HealthDoctorsHistoryDoctorsTreatments');" id="HealthDoctorsHistoryDoctorsTreatmentsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                                  </span>
	                                  </div>
		                               
		                            <div style="margin-left:0%;">
		                            <div id="HealthDoctorsHistoryDoctorsTreatmentsFlow" class="inactiveSubChildBlock" style="font-size: 10px;background-color: rgb(240,240,240)">
		                           		<br>
				                          <div id="HealthDoctorsHistoryDoctorsPreviousVisitsId" class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="previous.visit.label" />
	                              		  </span>
	                              		  <span id="HealthDoctorsHistoryDoctorsPreviousVisitsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsTreatmentsRead" style="vertical-align: -2px" value="DoctorsPreviousVisits" id="HealthDoctorsHistoryDoctorsPreviousVisitsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsTreatmentsWrite" style="vertical-align: -2px" id="HealthDoctorsHistoryDoctorsPreviousVisitsWrite"/>Write
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsTreatmentsCCTo" style="vertical-align: -2px" id="HealthDoctorsHistoryDoctorsPreviousVisitsCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                             </div>
                                  
                                   <br>
                               		<div id="HealthDoctorsHistoryDoctorsMedicationsId" class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="medicationa.label" />
	                              		  </span>
	                              		  <span id="HealthDoctorsHistoryDoctorsMedicationsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsTreatmentsRead" style="vertical-align: -2px" value="DoctorsMedications"  id="HealthDoctorsHistoryDoctorsMedicationsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsTreatmentsWrite" style="vertical-align: -2px" id="HealthDoctorsHistoryDoctorsMedicationsWrite"/>Write
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsTreatmentsCCTo" style="vertical-align: -2px" id="HealthDoctorsHistoryDoctorsMedicationsCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                             </div>
                                  <br>
                               		<div id="HealthDoctorsHistoryDoctorsLabsId" class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="labs.label" />
	                              		  </span>
	                              		  <span id="HealthDoctorsHistoryDoctorsLabsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsTreatmentsRead" style="vertical-align: -2px" value="DoctorsLabs"  id="HealthDoctorsHistoryDoctorsLabsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsTreatmentsWrite" style="vertical-align: -2px" id="HealthDoctorsHistoryDoctorsLabsWrite"/>Write
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsTreatmentsCCTo" style="vertical-align: -2px" id="HealthDoctorsHistoryDoctorsLabsCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                             </div>
                                  
                                   <br>
                               		<div  id="HealthDoctorsHistoryDoctorsPersonalHistoryId" class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="personal.history.label" />
	                              		  </span>
	                              		  <span id="HealthDoctorsHistoryDoctorsPersonalHistoryCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsTreatmentsRead" style="vertical-align: -2px" value="DoctorsPersonalHistory"  id="HealthDoctorsHistoryDoctorsPersonalHistoryRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsTreatmentsWrite" style="vertical-align: -2px" id="HealthDoctorsHistoryDoctorsPersonalHistoryWrite"/>Write
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsTreatmentsCCTo" style="vertical-align: -2px" id="HealthDoctorsHistoryDoctorsPersonalHistoryCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                             </div>  
		                                
		                                
		                                 <br>
                               		<div id="HealthDoctorsHistoryDoctorsPendingId" class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="pending.label" />
	                              		  </span>
	                              		  <span id="HealthDoctorsHistoryDoctorsPendingCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsTreatmentsRead" style="vertical-align: -2px" value="DoctorsPending"  id="HealthDoctorsHistoryDoctorsPendingRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsTreatmentsWrite" style="vertical-align: -2px" id="HealthDoctorsHistoryDoctorsPendingWrite"/>Write
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsTreatmentsCCTo" style="vertical-align: -2px" id="HealthDoctorsHistoryDoctorsPendingCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                             </div>
		                                <br>
		                             <div id="HealthDoctorsHistoryDoctorsSearchId" class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="searchHealth.label" />
	                              		  </span>
	                              		  <span id="HealthDoctorsHistoryDoctorsLabsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsTreatmentsRead" style="vertical-align: -2px" value="DoctorsSearch"  id="HealthDoctorsHistoryDoctorsSearchRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsTreatmentsWrite" style="vertical-align: -2px" id="HealthDoctorsHistoryDoctorsSearchWrite"/>Write
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsTreatmentsCCTo" style="vertical-align: -2px" id="HealthDoctorsHistoryDoctorsSearchCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                             </div>
		                                
		                                
		                           </div>    
		                          
		                          </div> 
		                          
		                          <br>
		                          
		                            <div id="HealthDoctorsHistoryDoctorsConsultTreatmentsId"  class="row divsubbg" style="border: none">
		                               	  <span class="col-lg-6"  onclick="activateSubChildFlow('HealthDoctorsHistoryDoctorsConsultTreatments');" style="cursor: pointer;padding-left: 60px;">
			                              		<spring:message code="consultant.treatment.label" />
			                              </span>
			                              <span id="HealthDoctorsHistoryDoctorsConsultTreatmentsCheck" class="col-lg-2" style="padding: 0px">
		                                  		<input type="checkbox" name="storeHealthDoctorsHistoryRead" style="vertical-align: -2px" onclick="selectAll('HealthDoctorsHistoryDoctorsConsultTreatmentsRead')" value="DoctorsConsultTreatments" id="HealthDoctorsHistoryDoctorsConsultTreatmentsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  		<input type="checkbox" name="storeHealthDoctorsHistoryWrite" style="vertical-align: -2px" onclick="selectAll('HealthDoctorsHistoryDoctorsConsultTreatmentsWrite')" id="HealthDoctorsHistoryDoctorsConsultTreatmentsWrite"/>Write
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  		<input type="checkbox" name="storeHealthDoctorsHistoryCCTo" style="vertical-align: -2px" onclick="selectAll('HealthDoctorsHistoryDoctorsConsultTreatmentsCCTo')" id="HealthDoctorsHistoryDoctorsConsultTreatmentsCCTo"/>CC To
		                                  		<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('HealthDoctorsHistoryDoctorsConsultTreatments');" id="HealthDoctorsHistoryDoctorsConsultTreatmentsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                                  </span>
	                                  </div>
		                          
		                           <div style="margin-left:0%;">
		                            <div id="HealthDoctorsHistoryDoctorsConsultTreatmentsFlow" class="inactiveSubChildBlock" style="font-size: 10px;background-color: rgb(240,240,240)">
		                           		<br>
		                           		 <div id="HealthDoctorsHistoryDoctorsConsultPreviousVisitsId" class="row divsubchildbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="previous.visit.label" />
	                              		  </span>
	                              		  <span id="HealthDoctorsHistoryDoctorsConsultPreviousVisitsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsConsultTreatmentsRead" style="vertical-align: -2px" value="DoctorsConsultPreviousVisits" id="HealthDoctorsHistoryDoctorsConsultPreviousVisitsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsConsultTreatmentsWrite" style="vertical-align: -2px" id="HealthDoctorsHistoryDoctorsConsultPreviousVisitsWrite"/>Write
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsConsultTreatmentsCCTo" style="vertical-align: -2px" id="HealthDoctorsHistoryDoctorsConsultPreviousVisitsCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                             </div>
                                  
                                   <br>
		                        
		                        <div id="HealthDoctorsHistoryDoctorsConsultPetinantFindingsId" class="row divsubchildbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="pertinent.findings.label" />
	                              		  </span>
	                              		  <span id="HealthDoctorsHistoryDoctorsConsultPetinantFindingsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsConsultTreatmentsRead" style="vertical-align: -2px" value="DoctorsConsultPetinantFindings" id="HealthDoctorsHistoryDoctorsConsultPetinantFindingsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsConsultTreatmentsWrite" style="vertical-align: -2px" id="HealthDoctorsHistoryDoctorsConsultPetinantFindingsWrite"/>Write
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsConsultTreatmentsCCTo" style="vertical-align: -2px" id="HealthDoctorsHistoryDoctorsConsultPetinantFindingsCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                             </div>
		                        <br>
		                        
		                        <div id="HealthDoctorsHistoryDoctorsConsultMedicationId" class="row divsubchildbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="medicationa.label" />
	                              		  </span>
	                              		  <span id="HealthDoctorsHistoryDoctorsConsultMedicationCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsConsultTreatmentsRead" style="vertical-align: -2px" value="DoctorsConsultMedication" id="HealthDoctorsHistoryDoctorsConsultMedicationRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsConsultTreatmentsWrite" style="vertical-align: -2px" id="HealthDoctorsHistoryDoctorsConsultMedicationWrite"/>Write
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsConsultTreatmentsCCTo" style="vertical-align: -2px" id="HealthDoctorsHistoryDoctorsConsultMedicationCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                             </div>
		                             <br>
		                         <div id="HealthDoctorsHistoryDoctorsConsultInvestigationId" class="row divsubchildbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="investigations.label" />
	                              		  </span>
	                              		  <span id="HealthDoctorsHistoryDoctorsConsultInvestigationCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsConsultTreatmentsRead" style="vertical-align: -2px" value="DoctorsConsultInvestigation" id="HealthDoctorsHistoryDoctorsConsultInvestigationRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsConsultTreatmentsWrite" style="vertical-align: -2px" id="HealthDoctorsHistoryDoctorsConsultInvestigationWrite"/>Write
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsConsultTreatmentsCCTo" style="vertical-align: -2px" id="HealthDoctorsHistoryDoctorsConsultInvestigationCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                             </div>
		                           		
		                           		
		                           		</div>
		                           </div>
		                          
		                          
		                          
		                          
		                           <br>
		                           
		                           
		                            <div id="HealthDoctorsHistoryDoctorsBillingId"  class="row divsubbg" style="border: none">
		                               	  <span class="col-lg-6"  onclick="activateSubChildFlow('HealthDoctorsHistoryDoctorsBilling');" style="cursor: pointer;padding-left: 60px;">
			                              		 	<spring:message code="billing.label" />
			                              </span>
			                              <span id="HealthDoctorsHistoryDoctorsConsultTreatmentsCheck" class="col-lg-2" style="padding: 0px">
		                                  		<input type="checkbox" name="storeHealthDoctorsHistoryRead" style="vertical-align: -2px" onclick="selectAll('HealthDoctorsHistoryDoctorsBillingRead')" value="DoctorsBilling" id="HealthDoctorsHistoryDoctorsBillingRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  		<input type="checkbox" name="storeHealthDoctorsHistoryWrite" style="vertical-align: -2px" onclick="selectAll('HealthDoctorsHistoryDoctorsBillingWrite')" id="HealthDoctorsHistoryDoctorsBillingWrite"/>Write
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  		<input type="checkbox" name="storeHealthDoctorsHistoryCCTo" style="vertical-align: -2px" onclick="selectAll('HealthDoctorsHistoryDoctorsBillingCCTo')" id="HealthDoctorsHistoryDoctorsBillingCCTo"/>CC To
		                                  		<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('HealthDoctorsHistoryDoctorsBilling');" id="HealthDoctorsHistoryDoctorsBillingImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                                  </span>
	                                  </div>
		                          
		                          <div style="margin-left:0%;">
		                            <div id="HealthDoctorsHistoryDoctorsBillingFlow" class="inactiveSubChildBlock" style="font-size: 10px;background-color: rgb(240,240,240)">
		                           		<br>
		                           		 <div id="HealthDoctorsHistoryDoctorsBillingConsultancyId" class="row divsubchildbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="consultancy.label" />
	                              		  </span>
	                              		  <span id="HealthDoctorsHistoryDoctorsBillingConsultancyCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsBillingRead" style="vertical-align: -2px" value="DoctorsBillingConsultancy" id="HealthDoctorsHistoryDoctorsBillingConsultancyRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsBillingWrite" style="vertical-align: -2px" id="HealthDoctorsHistoryDoctorsBillingConsultancyWrite"/>Write
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsBillingCCTo" style="vertical-align: -2px" id="HealthDoctorsHistoryDoctorsBillingConsultancyCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                             </div>
                                  
                                   <br>
		                        
		                        <div id="HealthDoctorsHistoryDoctorsBillingLabTestId" class="row divsubchildbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="labTest.label" />
	                              		  </span>
	                              		  <span id="HealthDoctorsHistoryDoctorsBillingLabTestCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsBillingRead" style="vertical-align: -2px" value="DoctorsBillingLabTest" id="HealthDoctorsHistoryDoctorsBillingLabTestRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsBillingWrite" style="vertical-align: -2px" id="HealthDoctorsHistoryDoctorsBillingLabTestWrite"/>Write
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsBillingCCTo" style="vertical-align: -2px" id="HealthDoctorsHistoryDoctorsBillingLabTestCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                             </div>
		                        <br>
		                        
		                        <div id="HealthDoctorsHistoryDoctorsBillingPrescriptionId" class="row divsubchildbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="prescription.label" />
	                              		  </span>
	                              		  <span id="HealthDoctorsHistoryDoctorsBillingPrescriptionCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsBillingRead" style="vertical-align: -2px" value="DoctorsBillingPrescription" id="HealthDoctorsHistoryDoctorsBillingPrescriptionRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsBillingWrite" style="vertical-align: -2px" id="HealthDoctorsHistoryDoctorsBillingPrescriptionWrite"/>Write
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsBillingCCTo" style="vertical-align: -2px" id="HealthDoctorsHistoryDoctorsBillingPrescriptionCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                             </div>
		                             <br>
		                         <div id="HealthDoctorsHistoryDoctorsBillingPrevId" class="row divsubchildbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="prevBill.label" />
	                              		  </span>
	                              		  <span id="HealthDoctorsHistoryDoctorsBillingPrevCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsBillingRead" style="vertical-align: -2px" value="DoctorsBillingPrev" id="HealthDoctorsHistoryDoctorsBillingPrevRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsBillingWrite" style="vertical-align: -2px" id="HealthDoctorsHistoryDoctorsBillingPrevWrite"/>Write
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthDoctorsHistoryDoctorsBillingCCTo" style="vertical-align: -2px" id="HealthDoctorsHistoryDoctorsBillingPrevCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                             </div>
		                           		
		                           		
		                           		</div>
		                           </div>
	                               <%--  <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="billing.label" />
	                              		  </span>
	                              		  <span id="BillingCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeHealthDoctorsHistoryRead" style="vertical-align: -2px" value="Billing" id="HealthDoctorsHistoryBillingRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeHealthDoctorsHistoryWrite" style="vertical-align: -2px" id="HealthDoctorsHistoryBillingWrite"/>Write
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeHealthDoctorsHistoryCCTo" style="vertical-align: -2px" id="HealthDoctorsHistoryBillingCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                             </div>
		                          <br> --%>
		                         <br>
		                          <div class="row divsubbg" style="border: none">
		                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                                  	<spring:message code="notification.label" />
		                                  </span>
		                                  <span id="Check" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeHealthDoctorsHistoryRead" value="DoctorNotification" style="vertical-align: -2px" id="HealthDoctorsHistoryDoctorNotificationRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeHealthDoctorsHistoryWrite" style="vertical-align: -2px" id="HealthDoctorsHistoryDoctorNotificationWrite"/>Write
		                                  </span>
		                                    <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeHealthDoctorsHistoryCCTo" style="vertical-align: -2px" id="HealthDoctorsHistoryDoctorNotificationCCTo"/>CC To
		                                  </span>
		                               </div>
		                        
		                               
		                               
		                           </div>
		                         </div>
		                        
		                        
		                        
		                        
		                            <br>
		                            <div id="storeHealthPatientsHistoryId" class="row divsubbg" style="border: none;">
		                            <span  onclick="activateSubFlow('storeHealthPatientsHistory');" class="col-lg-6" style="cursor: pointer;padding-left: 40px;">
		                            <spring:message code="patient.label" />
		                            </span>
		                            <span id="storeHealthPatientsHistoryCheck" class="col-lg-2" style="padding: 0px">
		                            	<input type="checkbox" style="vertical-align: -2px" name="storeHealthRead"  onclick="selectAll('storeHealthPatientsHistoryRead')" id="storeHealthPatientsHistoryRead"/>Read
		                            </span>
		                            <span class="col-lg-2" style="padding: 0px">
		                            	<input type="checkbox" style="vertical-align: -2px" name="storeHealthWrite" onclick="selectAll('storeHealthPatientsHistoryWrite')" id="storeHealthPatientsHistoryWrite"/>Write
		                            </span>
		                             <span class="col-lg-2" style="padding: 0px">
		                            	<input type="checkbox" style="vertical-align: -2px" name="storeHealthCCTo" onclick="selectAll('storeHealthPatientsHistoryCCTo')" id="storeHealthPatientsHistoryCCTo"/>CC To
		                            	<img style="float: right;height: 20px;cursor: pointer;" id="storeHealthPatientsHistoryImg" onclick="activateSubFlow('storeHealthPatientsHistory');" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                            </span>
		                        </div>
		                           
	                   		       
		                        <div style="margin-left: 0%">
		                            <div id="storeHealthPatientsHistoryFlow" style="font-size: 12px;" class="inactiveSubBlock">
			                        <br>
			                   		   <div class="row divsubbg" style="border: none">
		                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                                  	<spring:message code="resgistration.label" />
		                                  </span>
		                                  <span id="HealthPatientsHistoryRegistrationCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeHealthPatientsHistoryRead" style="vertical-align: -2px" value="Registration" id="HealthPatientsHistoryRegistrationRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeHealthPatientsHistoryWrite" style="vertical-align: -2px" id="HealthPatientsHistoryRegistrationWrite"/>Write
		                                  </span>
		                                    <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeHealthPatientsHistoryCCTo" style="vertical-align: -2px" id="HealthPatientsHistoryRegistrationCCTo"/>CC To
		                                  </span>
		                               </div>
		                               <br>
		                           
		                           <div class="row divsubbg" style="border: none">
		                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                                  	<spring:message code="clinic.appointmet.label" />
		                                  </span>
		                                  <span id="HealthPatientsHistoryClinicAppointmentCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeHealthPatientsHistoryRead" style="vertical-align: -2px" value="ClinicAppointment" id="HealthPatientsHistoryClinicAppointmentRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeHealthPatientsHistoryWrite" style="vertical-align: -2px" id="HealthPatientsHistoryClinicAppointmentWrite"/>Write
		                                  </span>
		                                    <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeHealthPatientsHistoryCCTo" style="vertical-align: -2px" id="HealthPatientsHistoryClinicAppointmentCCTo"/>CC To
		                                  </span>
		                               </div>
		                           
		                           
		                           <br>
		                           
		                          
		                               <div id="HealthPatientsHistoryTreatmentsId"  class="row divsubbg" style="border: none">
		                               	  <span class="col-lg-6"  onclick="activateSubChildFlow('storeHealthPatientsHistory');" style="cursor: pointer;padding-left: 60px;">
			                              		<spring:message code="treatment.label" />
			                              </span>
			                              <span id="storeHealthPatientsHistoryTreatmentsCheck" class="col-lg-2" style="padding: 0px">
		                                  		<input type="checkbox" name="storeHealthPatientsHistoryRead" style="vertical-align: -2px" onclick="selectAll('HealthPatientsHistoryTreatmentsRead')" value="Treatments" id="HealthPatientsHistoryTreatmentsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  		<input type="checkbox" name="storeHealthPatientsHistoryWrite" style="vertical-align: -2px" onclick="selectAll('HealthPatientsHistoryTreatmentsWrite')" id="HealthPatientsHistoryTreatmentsWrite"/>Write
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  		<input type="checkbox" name="storeHealthPatientsHistoryCCTo" style="vertical-align: -2px" onclick="selectAll('HealthPatientsHistoryTreatmentsCCTo')" id="HealthPatientsHistoryTreatmentsCCTo"/>CC To
		                                  		<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('HealthPatientsHistoryTreatments');" id="HealthPatientsHistoryTreatmentsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                                  </span>
	                                  </div>
		                               
		                            <div style="margin-left:0%;">
		                            <div id="HealthPatientsHistoryTreatmentsFlow" class="inactiveSubChildBlock" style="font-size: 10px;background-color: rgb(240,240,240)">
		                           		<br>
				                          <div id="HealthPatientsHistoryPreviousVisitsId" class="row divsubchildbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="previous.visit.label" />
	                              		  </span>
	                              		  <span id="healthPatientPreviousVisitsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthPatientsHistoryTreatmentsRead" style="vertical-align: -2px" value="PreviousVisits"  id="HealthPatientsHistoryPreviousVisitsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthPatientsHistoryTreatmentsWrite" style="vertical-align: -2px" id="HealthPatientsHistoryPreviousVisitsWrite"/>Write
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthPatientsHistoryTreatmentsCCTo" style="vertical-align: -2px" id="HealthPatientsHistoryPreviousVisitsCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                             </div>
                                  
                                   <br>
                               		 <div id="HealthPatientsHistoryMedicationsId" class="row divsubchildbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="medicationa.label" />
	                              		  </span>
	                              		  <span id="HealthPatientsHistoryMedicationsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthPatientsHistoryTreatmentsRead" style="vertical-align: -2px"  value="Medications" id="HealthPatientsHistoryMedicationsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthPatientsHistoryTreatmentsWrite" style="vertical-align: -2px" id="HealthPatientsHistoryMedicationsWrite"/>Write
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthPatientsHistoryTreatmentsCCTo" style="vertical-align: -2px" id="HealthPatientsHistoryMedicationsCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                             </div>
                                  
                                  
                                  <br>
                                  
                                  
                                  <div id="HealthPatientsHistoryPatientDiagnosticsId" class="row divsubchildbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  		<spring:message code="diagnostics.label" />
	                              		  </span>
	                              		  <span id="HealthPatientsHistoryPatientDiagnosticsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthPatientsHistoryTreatmentsRead" style="vertical-align: -2px" value="PatientDiagnostics"  id="HealthPatientsHistoryPatientDiagnosticsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthPatientsHistoryTreatmentsWrite" style="vertical-align: -2px" id="HealthPatientsHistoryPatientDiagnosticsWrite"/>Write
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthPatientsHistoryTreatmentsCCTo" style="vertical-align: -2px" id="HealthPatientsHistoryPatientDiagnosticsCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                             </div>  
                                  
                                  
                                  
                                   <br>
                               		<div id="HealthPatientsHistoryPatientPersonalHistoryId" class="row divsubchildbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="personal.history.label" />
	                              		  </span>
	                              		  <span id="HealthPatientsHistoryPatientPersonalHistoryCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthPatientsHistoryTreatmentsRead" style="vertical-align: -2px" value="PatientPersonalHistory"  id="HealthPatientsHistoryPatientPersonalHistoryRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthPatientsHistoryTreatmentsWrite" style="vertical-align: -2px" id="HealthPatientsHistoryPatientPersonalHistoryWrite"/>Write
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="HealthPatientsHistoryTreatmentsCCTo" style="vertical-align: -2px" id="HealthPatientsHistoryPatientPersonalHistoryCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                             </div>     
		                           </div>    
		                          
		                          </div> 
		                          
		                            <br>
		                           <div class="row divsubbg" style="border: none">
		                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                                  	<spring:message code="billing.label" />
		                                  </span>
		                                  <span id="HealthPatientsHistoryPatientBillingCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeHealthPatientsHistoryRead" style="vertical-align: -2px" value="PatientBilling" id="HealthPatientsHistoryPatientBillingRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeHealthPatientsHistoryWrite" style="vertical-align: -2px" id="HealthPatientsHistoryPatientBillingWrite"/>Write
		                                  </span>
		                                    <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeHealthPatientsHistoryCCTo" style="vertical-align: -2px" id="HealthPatientsHistoryPatientBillingCCTo"/>CC To
		                                  </span>
		                               </div>
		                               
		                               <br>
		                               
		                                <div class="row divsubbg" style="border: none">
		                   		  		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
		                                  	<spring:message code="clinic.calander.label" />
		                                  </span>
		                                  <span id="HealthPatientsHistoryPatientClinicCalanderCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeHealthPatientsHistoryRead" style="vertical-align: -2px" value="PatientClinicCalander" id="HealthPatientsHistoryPatientClinicCalanderRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeHealthPatientsHistoryWrite" style="vertical-align: -2px" id="HealthPatientsHistoryPatientClinicCalanderWrite"/>Write
		                                  </span>
		                                    <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeHealthPatientsHistoryCCTo" style="vertical-align: -2px" id="HealthPatientsHistoryPatientClinicCalanderCCTo"/>CC To
		                                  </span>
		                               </div>
		                           </div>
		                         </div>
		                           
		                       <br>    
		                           
		                         
		                       </div>
	                         <br>
	                        
	                        
	                        
	                        
	                        
	                        
	                        
	                        
                           <div id="storeReportsId" class="row divbg" style="border: none;">
	                              <span  class="col-lg-6"  onclick="activate('storeReports');" style="font-size: 15px;cursor: pointer;">
	                              	<spring:message code="reports.label" />
	                              </span>
	                              <span id="storeReportsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px"" onclick="selectAll('storeReportsRead');" name="storeAppRead" id="storeReportsRead"/>Read
                                  </span>
                                    <span id="" class="col-lg-2" style="padding: 0px"></span>
                                   <span id="storeReportsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px"" onclick="selectAll('storeReportsCCTo');" name="storeAppCCTo" id="storeReportsCCTo"/><spring:message code="cc.to.label" />
<!--                                   </span> -->
<!--                                   <span class="col-lg-2" style="padding: 0px"> -->
                                  	<!-- <input type="checkbox" style="vertical-align: -2px"" onclick="selectAll('storeReportsWrite')" name="storeAppWrite" id="storeReportsWrite"/>Write -->
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activate('storeReports');" id="storeReportsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                                  </div>
                                  <div style="margin-left:0%;">
	                              <div id="storeReportsFlow" class="inactiveBlock" style="margin-left: 2px;margin-right: 2px; background-color: rgb(240,240,240)">
	                                <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  	<spring:message code="sales_reports.label" />
	                              		  </span>
	                              		  <span id="storeSalesReportsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsRead" style="vertical-align: -2px"" id="storeSalesReportsRead"/>Read
		                                  </span>
		                                  <span id="" class="col-lg-2" style="padding: 0px"></span>
		                                   <span id="storeSalesReportsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsCCTo" style="vertical-align: -2px"" id="storeSalesReportsCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                                 <!--  <span class="col-lg-3" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsWrite" style="vertical-align: -2px""  id="storeSalesReportsWrite"/>Write
		                                  </span> -->
		                           </div>
		                             <br>
	                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  <spring:message code="orders.reports.label" />
	                              		  </span>
	                              		  <span id="storeOrdersReportCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsRead" style="vertical-align: -2px"" id="storeOrdersReportRead"/>Read
		                                  </span>
		                                  <span id="" class="col-lg-2" style="padding: 0px"></span>
		                                   <span id="storeOrdersReportCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsCCTo" style="vertical-align: -2px"" id="storeOrdersReportCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                                 <!--  <span class="col-lg-3" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsWrite" style="vertical-align: -2px"" id="storeOrdersReportWrite"/>Write
		                                  </span> -->
		                             </div>
		                             
		                                
		                          
		                             
		                              <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  	<spring:message code="xreading.reports.label" />
	                              		  </span>
	                              		  <span id="storeXReportCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsRead" style="vertical-align: -2px"" id="storeXReportRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                                  <span id="storeXReportCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsCCTo" style="vertical-align: -2px"" id="storeXReportCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                              
		                           </div>
		                             <br>
	                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  <spring:message code="zreading.reports.label" />
	                              		  </span>
	                              		  <span id="storeZReportCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsRead" style="vertical-align: -2px"" id="storeZReportRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                                   <span id="storeZReportCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsCCTo" style="vertical-align: -2px"" id="storeZReportCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                             
		                             </div>
		                              <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  	<spring:message code="zreading.consolidate.label" />
	                              		  </span>
	                              		  <span id="storeZReportConsolidateCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsRead" style="vertical-align: -2px"" id="storeZReportConsolidateRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                                   <span id="storeZReportConsolidateCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsCCTo" style="vertical-align: -2px"" id="storeZReportConsolidateCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                                
		                           </div>
		                              <br>
		                             <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  <spring:message code="date.wise.sales.label" />
	                              		  </span>
	                              		  <span id="storeDateWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsRead" style="vertical-align: -2px"" id="storeDateWiseRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                                    <span id="storeDateWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsCCTo" style="vertical-align: -2px"" id="storeDateWiseCCTo"/>  <spring:message code="cc.to.label" />
		                                  </span>
		                           
		                             </div>
		                              <br>
		                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  <spring:message code="counter.wise.label" />
	                              		  </span>
	                              		  <span id="storeCounterWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsRead" style="vertical-align: -2px"" id="storeCounterWiseRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                                   <span id="storeCounterWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsCCTo" style="vertical-align: -2px"" id="storeCounterWiseCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                             
		                             </div>
		                              <br>
		                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  <spring:message code="category.wise.label" />
	                              		  </span>
	                              		  <span id="storeCategoryWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsRead" style="vertical-align: -2px"" id="storeCategoryWiseRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                                  <span id="storeCategoryWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsCCTo" style="vertical-align: -2px"" id="storeCategoryWiseCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                             
		                             </div>
		                              <br>
		                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  <spring:message code="department.wise" />
	                              		  </span>
	                              		  <span id="storeDepartmentWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsRead" style="vertical-align: -2px"" id="storeDepartmentWiseRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                                   <span id="storeDepartmentWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsCCTo" style="vertical-align: -2px"" id="storeDepartmentWiseCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                             
		                             </div>
		                              <br>
		                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  <spring:message code="sku.wise.label" />
	                              		  </span>
	                              		  <span id="storeSkuWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsRead" style="vertical-align: -2px"" id="storeSkuWiseRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                              <span id="storeSkuWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsCCTo" style="vertical-align: -2px"" id="storeSkuWiseCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                             </div>
		                              <br>
		                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  <spring:message code="hour.wise.sales.label" />
	                              		  </span>
	                              		  <span id="storeHourWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsRead" style="vertical-align: -2px"" id="storeHourWiseRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                                    <span id="storeHourWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsCCTo" style="vertical-align: -2px"" id="storeHourWiseCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                             
		                             </div>
		                              <br>
		                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  <spring:message code="brandwise.reports.label" />
	                              		  </span>
	                              		  <span id="storeBrandWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsRead" style="vertical-align: -2px"" id="storeBrandWiseRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                                   <span id="storeBrandWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsCCTo" style="vertical-align: -2px"" id="storeBrandWiseCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                                  
		                             
		                             </div>
		                              <br>
		                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  <spring:message code="sectionwise.reports.label" />
	                              		  </span>
	                              		  <span id="storeSectionWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsRead" style="vertical-align: -2px"" id="storeSectionWiseRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                              <span id="storeSectionWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsCCTo" style="vertical-align: -2px"" id="storeSectionWiseCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                             </div>
		                              <br>
		                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  <spring:message code="supplier.wise.label" />
	                              		  </span>
	                              		  <span id="storeSupplierWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsRead" style="vertical-align: -2px"" id="storeSupplierWiseRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                                   <span id="storeSupplierWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsCCTo" style="vertical-align: -2px"" id="storeSupplierWiseCCTo"/><spring:message code="cc.to.label"/>
		                                  </span>
		                             
		                             </div>
		                              <br>
		                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  <spring:message code="tax.label" />
	                              		  </span>
	                              		  <span id="storeTaxWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsRead" style="vertical-align: -2px"" id="storeTaxWiseRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                                  <span id="storeTaxWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsCCTo" style="vertical-align: -2px"" id="storeTaxWiseCCTo"/><spring:message code="cc.to.label"/>
		                                  </span>
		                             
		                             </div>
		                              <br>
		                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  <spring:message code="due.collection.label" />
	                              		  </span>
	                              		  <span id="storeDueCollectionCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsRead" style="vertical-align: -2px"" id="storeDueCollectionRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                                   <span id="storeDueCollectionCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsCCTo" style="vertical-align: -2px"" id="storeDueCollectionCCTo"/><spring:message code="cc.to.label"/>
		                                  </span>
		                             
		                             </div>
		                              <br>
		                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;">
	                              		  <spring:message code="credit.sales.label" />
	                              		  </span>
	                              		  <span id="storeCreditSalesCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsRead" style="vertical-align: -2px"" id="storeCreditSalesRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                                   <span id="storeCreditSalesCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsCCTo" style="vertical-align: -2px"" id="storeCreditSalesCCTo"/><spring:message code="cc.to.label"/>
		                                  </span>
		                             
		                             </div>
		                              <br>
		                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  <spring:message code="supplies.report.label" />
	                              		  </span>
	                              		  <span id="storeSuppliesReportCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsRead" style="vertical-align: -2px"" id="storeSuppliesReportRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                                   <span id="storeSuppliesReportCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsCCTo" style="vertical-align: -2px"" id="storeSuppliesReportCCTo"/><spring:message code="cc.to.label"/>
		                                  </span>
		                             
		                             </div>
		                              <br>
		                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  <spring:message code="material.consumption.label" />
	                              		  </span>
	                              		  <span id="storeMaterialConsumptionCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsRead" style="vertical-align: -2px"" id="storeMaterialConsumptionRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                                  <span id="storeMaterialConsumptionCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsCCTo" style="vertical-align: -2px"" id="storeMaterialConsumptionCCTo"/><spring:message code="cc.to.label"/>
		                                  </span>
		                             
		                             </div>
		                              <br>
		                               <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  <spring:message code="stockmovement.label" />
	                              		  </span>
	                              		  <span id="storeStockMovementCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsRead" style="vertical-align: -2px"" id="storeStockMovementRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                                   <span id="storeStockMovementCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsCCTo" style="vertical-align: -2px"" id="storeStockMovementCCTo"/><spring:message code="cc.to.label"/>
		                                  </span>
		                             </div>
		                             <br>
		                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  Profitability
	                              		  </span>
	                              		  <span id="storeProfitabilityCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsRead" style="vertical-align: -2px"" id="storeProfitabilityRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                                   <span id="storeProfitabilityCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsCCTo" style="vertical-align: -2px"" id="storeProfitabilityCCTo"/><spring:message code="cc.to.label"/>
		                                  </span>
		                             </div>
		                             
		                              <br>
		                             <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		 PriceOverride Report
	                              		  </span>
	                              		  <span id="storePriceOverrideCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsRead" style="vertical-align: -2px"" id="storePriceOverrideRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                                   <span id="storePriceOverrideCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsCCTo" style="vertical-align: -2px"" id="storePriceOverrideCCTo"/><spring:message code="cc.to.label"/>
		                                  </span>
		                             </div>
		                             
		                             <br>
		                             <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		 Void Items
	                              		  </span>
	                              		  <span id="storeVoidItemsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsRead" style="vertical-align: -2px"" id="storeVoidItemsRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                                   <span id="storeVoidItemsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsCCTo" style="vertical-align: -2px"" id="storeVoidItemsCCTo"/><spring:message code="cc.to.label"/>
		                                  </span>
		                             </div>
		                             
		                             <br>
		                             <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		 SalesPerson Report
	                              		  </span>
	                              		  <span id="storeSalesPersonCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsRead" style="vertical-align: -2px"" id="storeSalesPersonRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                                   <span id="storeSalesPersonCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeReportsCCTo" style="vertical-align: -2px"" id="storeSalesPersonCCTo"/><spring:message code="cc.to.label"/>
		                                  </span>
		                             </div>
		                             
		                             
		                             
	                              </div>
	                          </div>
	                          <br>   
                        </div>
                        <div class="form-group col-lg-1"></div>
                   <div class="form-group col-lg-5">
                  		 <label><spring:message code="select.locations.label" /></label>
                           <select multiple="multiple" style="height: 230px" class="form-control" name="location" id="storeLocation">
                           	<c:forEach var="location" items="${outletLocationsList}">
								<option value="${location}">${location}</option>
							</c:forEach>
                           </select>
                  </div>
                  
				</div>    
					<br>
                   <div class="row" >
                    <div class="form-group col-lg-12"  >
                    <div class="form-group col-lg-2" style="padding-left: 1px;padding-right: 1px;margin-top: 8px;cursor: pointer; margin-bottom: 0px;width: 19.666667%" onclick="activateHeader('warehouseApp');" ><label style="font-weight: bold;font-size: 16px;color:#666;cursor: pointer;"><spring:message code="warehouse.permissions.label" /> </label></div>
                    <div class="form-group col-lg-10" style="background-color: rgb(195,195,195);margin-bottom: 4px;width: 80.3333333%">
                    	<span>It helps you to delegate administration and other business operations to executives. Please note that WAREHOUSE APP will be used by your employees for handling Warehouse related functionalities.
                    	<img style="float: right;height: 60px;cursor: pointer;margin-right: -34px;margin-top: -24px;margin-bottom: -26px" onclick="activateHeader('warehouseApp');" id="warehouseAppImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIcon.png">
                    	</span></div>
                    <hr style="margin-top: 44px;width: 100%;border-top: 1px solid rgb(181,230,29);" />
                    <hr style="margin-top: -18px;width: 100%;border-top: 1px solid rgb(181,230,29);" />
                    </div>
                   </div>
                       <div class="row" id="warehouseAppFlow" >
                   		<div class="form-group col-lg-6">
                   		
	                   		 	<br>
	                   		 	
                   	
                   		
                   		          			  <div class="row divbg" style="margin-top: 10px;">
                                <span id="warehouseAppBillingId" class="col-lg-6" style="cursor: pointer;font-size: 15px;" onclick="activate('warehouseAppBilling');">
                                	<spring:message code="billing.label" />
                                </span>
                                <span id="warehouseAppBillingCheck" class="col-lg-2" style="padding: 0px">
                                	<input type="checkbox" onclick="selectAll('warehouseAppBillingRead')" style="vertical-align: -2px" name="warehouseAppRead" id="warehouseAppBillingRead"/>Read
                                </span>
                                <span  class="col-lg-2" style="padding: 0px">
                                	<input type="checkbox" onclick="selectAll('warehouseAppBillingWrite')" style="vertical-align: -2px" name="warehouseAppWrite" id="warehouseAppBillingWrite"/>Write
                                </span>
                                <span  class="col-lg-2" style="padding: 0px">
                                	<input type="checkbox" onclick="selectAll('warehouseAppBillingCCTo')" style="vertical-align: -2px" name="warehouseAppWrite" id="warehouseAppBillingCCTo"/><spring:message code="cc.to.label" />
                                	<img style="float: right;height: 20px;cursor: pointer;" onclick="activate('warehouseAppBilling');" id="warehouseAppBillingImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                </span>
                   		 </div>
                   		 <div id="warehouseAppBillingFlow" style="margin-left:0%;color:#666;margin-left: 2px;margin-right: 2px;background-color: rgb(240,240,240)" class="inactiveBlock">
	                   		 
	                   		 
	                   		 	<br>
                               	<div id="warehouseAppDayOpenId" class="row divsubbg" style="border: none;">
	                              <span class="col-lg-6"  onclick="activateSubFlow('warehouseAppDayOpen');" style="cursor: pointer;padding-left: 40px;">
	                              	<spring:message code="day.open.label" />
	                              </span>
	                             
	                              <span id="warehouseAppDayOpenCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="warehouseAppBillingRead" id="warehouseAppDayOpenRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="warehouseAppBillingWrite" id="warehouseAppDayOpenWrite"/>Write
                                  	</span>
                                  	  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="warehouseAppBillingCCTo" id="warehouseAppDayOpenCCTo"/><spring:message code="cc.to.label" />
                                  <%-- 	<img style="float: right; height: 20px;cursor: pointer;" onclick="activateSubFlow('storeCreditBills');" id="storeCreditBillsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                </div>
                                
                                
                                
                                <br>
                               	<div id="warehouseAppDayCloseId" class="row divsubbg" style="border: none;">
	                              <span class="col-lg-6"  onclick="activateSubFlow('warehouseAppDayClose');" style="cursor: pointer;padding-left: 40px;">
	                              	<spring:message code="day.close.label" />
	                              </span>
	                             
	                              <span id="warehouseAppDayCloseCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="warehouseAppBillingRead" id="warehouseAppDayCloseRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="warehouseAppBillingWrite" id="warehouseAppDayCloseWrite"/>Write
                                  	</span>
                                  	  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="warehouseAppBillingCCTo" id="warehouseAppDayCloseCCTo"/><spring:message code="cc.to.label" />
                                  <%-- 	<img style="float: right; height: 20px;cursor: pointer;" onclick="activateSubFlow('storeCreditBills');" id="storeCreditBillsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                </div>
                                
	                   		 
	                   		 
	                   		 
	                   		 <br>
                               	<div id="warehouseAppNewBillId" class="row divsubbg" style="border: none;">
	                              <span class="col-lg-6"  onclick="activateSubFlow('warehouseAppNewBill');" style="cursor: pointer;padding-left: 40px;">
	                              	<spring:message code="new.bill.label" />
	                              </span>
	                             
	                              <span id="warehouseAppNewBillCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="warehouseAppBillingRead" id="warehouseAppNewBillRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="warehouseAppBillingWrite" id="warehouseAppNewBillWrite"/>Write
                                  	</span>
                                  	  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="warehouseAppBillingCCTo" id="warehouseAppNewBillCCTo"/><spring:message code="cc.to.label" />
                                  	<img style="float: right; height: 20px;cursor: pointer;" onclick="activateSubFlow('warehouseAppNewBill');" id="warehouseAppNewBillImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                                 
                                </div>
                                	<div style="margin-left:0%;">
		                              <div id="warehouseAppNewBillFlow" class="inactiveSubBlock" style="font-size: 12px">
		                                <br>
	                               		<div class="row divsubbg" style="border: none">
	                               		<span class="col-lg-6" style="padding-left: 60px;" >
	                               		<spring:message code="activities.label" /></span>
		                              		 <%--  <span class="col-lg-4" style="padding: 5px; font-weight: bold;font-size: 14px;" >
		                              		  	<font ><spring:message code="cc.to.label" /></font>
		                              		  
		                              		   <select class="form-control" id="CCto" multiple="multiple">
                                 			<c:forEach var="roles" items="${roleList}">
													<c:if test="${roles.roleName != role.roleName}">
													<option value="${roles.roleName}">${roles.roleName}</option>
													</c:if>
											</c:forEach> 
		                              		  	</select>
		                              		  	
		                              		  </span> --%>
<!-- 		                              		   <span class="col-lg-2" style="padding: 0px;" > -->
		                              		
<%-- 		                              		    <input type="checkbox" style="vertical-align: -2px" onclick="" name="storeBillingMailTo" id="storeNewBillMailTo"/><b><spring:message code="mail.to.label" /></b> --%>
		                              		
<!-- 		                              		  </span> -->
		                              		  <span class="col-lg-6" style="padding: 0px;">
		                              		  
		                              		  	<select class="form-control activities" name="warehouseAppNewBill" multiple="multiple" id="warehouseAppNewBillActivities">
		                              		  		<option value ="Cash Payment">Cash Payment</option>
		                              		  		<option value ="Card Payment">Card Payment</option>
		                              		  		<option value ="Food Coupons">Food Coupons</option>
		                              		  		<option value ="Gift Vouchers">Gift Vouchers</option>
		                              		  		<option value ="Loyalty Cards">Loyalty Cards</option>
		                              		  		<option value ="Discount Coupons">Discount Coupons</option>
		                              		  		<option value ="Item Discount">Item Discount</option>
		                              		  		<option value ="SMS">SMS</option>
		                              		  		<option value ="Email">Email</option>
		                              		  		<option value ="Print">Print</option>
		                              		  		<option value ="Duplicate Print">Duplicate Print</option>
		                              		  		<option value ="Return">Return</option>
		                              		  		<option value ="Direct Return">Direct Return</option>
		                              		  		<option value ="Exchange">Exchange</option>
		                              		  	    <option value ="Quick Pay">Quick Pay</option>
		                              		  	    <option value="Edit Price">Edit Price</option>
		                              		  	    <option value="credit admin">Credit Limit</option>
		                              		  	    <option value="Cash Return">Cash Return</option>
		                              		  	    <option value="New SKU">New SKU</option>
		                              		  	</select>
			                                  </span>
			                           </div>
		                              </div>
	                          </div>
	                          
	                          
	                            <br>
                               	<div id="warehouseAppCreditBillsId" class="row divsubbg" style="border: none;">
	                              <span class="col-lg-6"  onclick="activateSubFlow('warehouseAppCreditBills');" style="cursor: pointer;padding-left: 40px;">
	                              	<spring:message code="creditbills.label" />
	                              </span>
	                             
	                              <span id="warehouseAppCreditBillsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="warehouseAppBillingRead" id="warehouseAppCreditBillsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="warehouseAppBillingWrite" id="warehouseAppCreditBillsWrite"/>Write
                                  	</span>
                                  	  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="warehouseAppBillingCCTo" id="warehouseAppCreditBillsCCTo"/><spring:message code="cc.to.label" />
                                  <%-- 	<img style="float: right; height: 20px;cursor: pointer;" onclick="activateSubFlow('storeCreditBills');" id="storeCreditBillsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                </div>
	                          
	                          
	                          
                                 <br>
                               	<div id="warehouseAppPendigBillId" class="row divsubbg" style="border: none;">
	                              <span class="col-lg-6"  onclick="activateSubFlow('warehouseAppPendigBill');" style="cursor: pointer;padding-left: 40px;">
	                              	<spring:message code="pending.bill.label" />
	                              </span>
	                              <span id="warehouseAppPendigBillCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="warehouseAppBillingRead" id="warehouseAppPendigBillRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="warehouseAppBillingWrite" id="warehouseAppPendigBillWrite"/>Write
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="warehouseAppBillingCCTo" id="warehouseAppPendigBillCCTo"/><spring:message code="cc.to.label" />
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('warehouseAppPendigBill');" id="warehouseAppPendigBillImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                                </div>
                                <div style="margin-left:0%;">
	                              <div id="warehouseAppPendigBillFlow" class="inactiveSubBlock" style="font-size: 12px">
	                                <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="activities.label" />
	                              		  </span>
	                              		  <span id="" class="col-lg-6" style="padding: 0px">
	                              		  	<select class="form-control activities" name="warehouseAppPendigBill" multiple="multiple" id="warehouseAppPendigBillActivities">
	                              		  		<option value ="Cash Payment">Cash Payment</option>
	                              		  		<option value ="Card Payment">Card Payment</option>
	                              		  		<option value ="Food Coupons">Food Coupons</option>
	                              		  		<option value ="Gift Vouchers">Gift Vouchers</option>
	                              		  		<option value ="Loyalty Cards">Loyalty Cards</option>
	                              		  		<option value ="Discount Coupons">Discount Coupons</option>
	                              		  		<option value ="SMS">SMS</option>
	                              		  		<option value ="Email">Email</option>
	                              		  		<option value ="Print">Print</option>
	                              		  		<option value ="Duplicate Print">Duplicate Print</option>
	                              		  		<option value ="Return">Return</option>
	                              		  		<option value ="Exchange">Exchange</option>
	                              		  		<option value ="Quick Pay">Quick Pay</option>
	                              		  		<option value ="Update Home Delivery">Update Home Delivery</option>
	                              		  		<option value ="Update Home Delivery">Update Home Delivery</option>
	                              		  	</select>
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="storeStockmanagementRead" style="vertical-align: -2px" value="ViewStocks" id="StockmanagementViewStocksRead"/>Read -->
		                                  </span>
		                                  <!-- <span class="col-lg-3" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeStockmanagementWrite" style="vertical-align: -2px"  id="StockmanagementViewStocksWrite"/>Write
		                                  </span> -->
		                           </div>
	                              </div>
	                          </div>
                                 <br>
                               	<div id="warehouseAppCancelledBillId" class="row divsubbg" style="border: none;">
	                              <span class="col-lg-6"   style="cursor: pointer;padding-left: 40px;">
	                              	<spring:message code="cancelled.bill.label" />
	                              </span>
	                              <span id="warehouseAppCancelledBillCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="warehouseAppBillingRead" id="warehouseAppCancelledBillRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="warehouseAppBillingWrite" id="warehouseAppCancelledBillWrite"/>Write
                                  <%-- 	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('storeCancelledBill');" id="storeCancelledBillImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="warehouseAppBillingCCTo" id="warehouseAppCancelledBillCCTo"/><spring:message code="cc.to.label" />
                                  <%-- 	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('storeCancelledBill');" id="storeCancelledBillImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                </div>
                                
                                
                                 <br>
                               	<div id="warehouseAppReturnedBillsId" class="row divsubbg" style="border: none;">
	                              <span class="col-lg-6"  onclick="activateSubFlow('warehouseAppReturnedBills');" style="cursor: pointer;padding-left: 40px;">
	                              	<spring:message code="all.returned.bills.label" />
	                              </span>
	                             
	                              <span id="storeReturnedBillsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="warehouseAppBillingRead" id="warehouseAppReturnedBillsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="warehouseAppBillingWrite" id="warehouseAppReturnedBillsWrite"/>Write
                                  	</span>
                                  	  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="warehouseAppBillingCCTo" id="warehouseAppReturnedBillsCCTo"/><spring:message code="cc.to.label" />
<%--                                   	<img style="float: right; height: 20px;cursor: pointer;" onclick="activateSubFlow('storeReturnedBills');" id="storeReturnedBillsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                </div>
                                
                                   <br>
                               	<div id="warehouseAppDirectReturnedBillsId" class="row divsubbg" style="border: none;">
	                              <span class="col-lg-6"  onclick="activateSubFlow('warehouseAppDirectReturnedBills');" style="cursor: pointer;padding-left: 40px;">
	                              	<spring:message code="direct.return.bill.label" />
	                              </span>
	                             
	                              <span id="warehouseAppDirectReturnedBillsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="warehouseAppBillingRead" id="warehouseAppDirectReturnedBillsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="warehouseAppBillingWrite" id="warehouseAppDirectReturnedBillsWrite"/>Write
                                  	</span>
                                  	  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="warehouseAppBillingCCTo" id="warehouseAppDirectReturnedBillsCCTo"/><spring:message code="cc.to.label" />
<%--                                   	<img style="float: right; height: 20px;cursor: pointer;" onclick="activateSubFlow('storeReturnedBills');" id="storeReturnedBillsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                </div>
                              
                                
                                 <br>
                               	<div id="warehouseAppVoidBillsId" class="row divsubbg" style="border: none;">
	                              <span class="col-lg-6"  onclick="activateSubFlow('warehouseAppVoidBills');" style="cursor: pointer;padding-left: 40px;">
	                              	<spring:message code="all.void.bills.label" />
	                              </span>
	                             
	                              <span id="storeVoidBillsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="warehouseAppBillingRead" id="warehouseAppVoidBillsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="warehouseAppBillingWrite" id="warehouseAppVoidBillsWrite"/>Write
                                  	</span>
                                  	  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="warehouseAppBillingCCTo" id="warehouseAppVoidBillsCCTo"/><spring:message code="cc.to.label" />
<%--                                   	<img style="float: right; height: 20px;cursor: pointer;" onclick="activateSubFlow('storeReturnedBills');" id="storeReturnedBillsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                </div>
                                
                                
                                
                                <br>
                               	<div id="warehouseAppExchangedBillsId" class="row divsubbg" style="border: none;">
	                              <span class="col-lg-6"  onclick="activateSubFlow('warehouseAppExchangedBills');" style="cursor: pointer;padding-left: 40px;">
	                              	<spring:message code="all.exchanged.bills.label" />
	                              </span>
	                             
	                              <span id="warehouseAppExchangedBillsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="warehouseAppBillingRead" id="warehouseAppExchangedBillsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="warehouseAppBillingWrite" id="warehouseAppExchangedBillsWrite"/>Write
                                  	</span>
                                  	  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="warehouseAppBillingCCTo" id="warehouseAppExchangedBillsCCTo"/><spring:message code="cc.to.label" />
<%--                                   	<img style="float: right; height: 20px;cursor: pointer;" onclick="activateSubFlow('storeReturnedBills');" id="storeReturnedBillsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                </div>
                                
                               <%--   <div style="margin-left:0%;">
		                              <div id="storeExchangedBillsFlow" class="inactiveSubBlock" style="font-size: 12px">
		                                <br>
	                               		<div class="row divsubbg" style="border: none">
	                               		<span class="col-lg-6" style="padding-left: 60px;" >
	                               		<spring:message code="activities.label" /></span>
	                               		 <span class="col-lg-6" style="padding:0px;" >
		                              		 <select class="form-control activities" name="storeExchangedBills" multiple="multiple" id="storeExchangedBillsActivities">
	                               		<option>Edit Price</option>
	                               		</select>
	                               		</span>
                                      </div>
                                      </div>
                                      </div> --%>
                                  
                                
                                
                                <br>
                               	<div id="warehouseAppCompletedBillsId" class="row divsubbg" style="border: none;">
	                              <span class="col-lg-6"  onclick="activateSubFlow('warehouseAppCompletedBills');" style="cursor: pointer;padding-left: 40px;">
	                              	<spring:message code="all.completed.bills.label" />
	                              </span>
	                             
	                              <span id="warehouseAppCompletedBillsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="warehouseAppBillingRead" id="warehouseAppCompletedBillsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="warehouseAppBillingWrite" id="warehouseAppCompletedBillsWrite"/>Write
                                  	</span>
                                  	  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="warehouseAppBillingCCTo" id="warehouseAppCompletedBillsCCTo"/><spring:message code="cc.to.label" />
<%--                                   	<img style="float: right; height: 20px;cursor: pointer;" onclick="activateSubFlow('storeReturnedBills');" id="storeReturnedBillsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                </div>
                                
                                 
                                
                                
                                <%-- <div style="margin-left:0%;">
	                              <div id="storeCancelledBillFlow" class="inactiveSubBlock" style="font-size: 12px">
	                                <br>
                               		<div class="row divbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;" >
	                              		  	<spring:message code="activities.label" />
	                              		  </span>
	                              		  <span id="" class="col-lg-6" style="padding: 0px">
	                              		  	<select class="form-control activities" name="storeCancelledBill" multiple="multiple" id="storeCancelledBillActivities">
	                              		  		<option value ="Cash Payment">Cash Payment</option>
	                              		  		<option value ="Card Payment">Card Payment</option>
	                              		  		<option value ="Food Coupons">Food Coupons</option>
	                              		  		<option value ="Gift Vouchers">Gift Vouchers</option>
	                              		  		<option value ="Loyalty Cards">Loyalty Cards</option>
	                              		  		<option value ="Discount Coupons">Discount Coupons</option>
	                              		  		<option value ="SMS">SMS</option>
	                              		  		<option value ="Email">Email</option>
	                              		  		<option value ="Print">Print</option>
	                              		  		<option value ="Duplicate Print">Duplicate Print</option>
	                              		  		<option value ="Return">Return</option>
	                              		  		<option value ="Exchange">Exchange</option>
	                              		  	</select>
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="storeStockmanagementRead" style="vertical-align: -2px" value="ViewStocks" id="StockmanagementViewStocksRead"/>Read -->
		                                  </span>
		                                  <!-- <span class="col-lg-3" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeStockmanagementWrite" style="vertical-align: -2px"  id="StockmanagementViewStocksWrite"/>Write
		                                  </span> -->
		                           </div>
	                              </div>
	                          </div> --%>
                                 <br>
                               	<div id="warehouseAppHomeDeliveryBillId" class="row divsubbg" style="border: none;">
	                              <span class="col-lg-6"  onclick="activateSubFlow('warehouseAppHomeDeliveryBill');" style="cursor: pointer;padding-left: 40px;">
	                              	<spring:message code="home.delivery.bills.label" />
	                              </span>
	                              <span id="warehouseAppHomeDeliveryBillCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="warehouseAppBillingRead" id="warehouseAppHomeDeliveryBillRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="warehouseAppBillingWrite" id="warehouseAppHomeDeliveryBillWrite"/>Write
<%--                                   	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('storeHomeDeliveryBill');" id="storeHomeDeliveryBillImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                   <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="warehouseAppBillingCCTo" id="warehouseAppHomeDeliveryBillCCTo"/><spring:message code="cc.to.label" />
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubFlow('warehouseAppHomeDeliveryBill');" id="warehouseAppHomeDeliveryBillImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                                </div>
                                <div style="margin-left:0%;">
	                              <div id="warehouseAppHomeDeliveryBillFlow" class="inactiveSubBlock" style="font-size: 12px">
	                                <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
	                              		  	<spring:message code="activities.label" />
	                              		  </span>
	                              		  <span id="" class="col-lg-6" style="padding: 0px">
	                              		  	<select class="form-control activities" name="warehouseAppHomeDeliveryBill" multiple="multiple" id="warehouseAppHomeDeliveryBillActivities">
	                              		  		<!-- <option value ="Cash Payment">Cash Payment</option>
	                              		  		<option value ="Card Payment">Card Payment</option>
	                              		  		<option value ="Food Coupons">Food Coupons</option>
	                              		  		<option value ="Gift Vouchers">Gift Vouchers</option>
	                              		  		<option value ="Loyalty Cards">Loyalty Cards</option>
	                              		  		<option value ="Discount Coupons">Discount Coupons</option> -->
	                              		  		<option value ="SMS">SMS</option>
	                              		  		<option value ="Email">Email</option>
	                              		  		<option value ="Print">Print</option>
	                              		  		<option value ="Duplicate Print">Duplicate Print</option>
	                              		  		<option value ="Return">Return</option>
	                              		  		<option value ="Exchange">Exchange</option>
	                              		  	</select>
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="storeStockmanagementRead" style="vertical-align: -2px" value="ViewStocks" id="StockmanagementViewStocksRead"/>Read -->
		                                  </span>
		                                  <!-- <span class="col-lg-3" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="storeStockmanagementWrite" style="vertical-align: -2px"  id="StockmanagementViewStocksWrite"/>Write
		                                  </span> -->
		                           </div>
	                              </div>
	                          </div>
                         </div>
                   		
                   		
                   		<br>
                               
                   		
                   		 	<div id="warehouseAppShipmentBillsId" class="row divbg" >
	                              <span class="col-lg-6"  onclick="activateSubFlow('warehouseAppShipmentBills');" style="cursor: pointer;padding-left: 15px;">
	                            	Shipment Order
	                              </span>
	                             
	                              <span id="warehouseAppShipmentBillsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="warehouseAppRead" id="warehouseAppShipmentBillsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="warehouseAppWrite" id="warehouseAppShipmentBillsWrite"/>Write
                                  	</span>
                                  	  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px" onclick="" name="warehouseAppCCTo" id="warehouseAppShipmentBillsCCTo"/><spring:message code="cc.to.label" />
<%--                                   	<img style="float: right; height: 20px;cursor: pointer;" onclick="activateSubFlow('storeReturnedBills');" id="storeReturnedBillsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                </div>
                                <br>
                   		  <div id="warehouseAppStockManagementId" class="row divbg" >
                   		  
                   		    <span  class="col-lg-6" onclick="activate('warehouseAppStockManagement');" style="font-size: 15px;cursor: pointer;">
                             	<spring:message code="stockmanagement.label" />
                             </span>
                             <span id="warehouseAppStockManagementCheck" class="col-lg-2" style="padding: 0px">
                              	<input type="checkbox" onclick="selectAll('warehouseAppStockManagementRead')" style="vertical-align: -2px"" name="warehouseAppRead" id="warehouseAppStockManagementRead"/>Read
                             </span>
                             <span  class="col-lg-2" style="padding: 0px">
                              	<input type="checkbox" onclick="selectAll('warehouseAppStockManagementWrite')" style="vertical-align: -2px"" name="warehouseAppWrite" id="warehouseAppStockManagementWrite"/>Write
<%--                               	<img style="float: right;height: 20px;cursor: pointer;" onclick="activate('warehouseAppStockManagement');" id="warehouseAppStockManagementImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                             </span>
                   		  
                       
                               <span  class="col-lg-2" style="padding: 0px">
                              	<input type="checkbox" onclick="selectAll('warehouseAppStockManagementCCTo')" style="vertical-align: -2px"" name="warehouseAppCCTo" id="warehouseAppStockManagementCCTo"/><spring:message code="cc.to.label" />
                              	<img style="float: right;height: 20px;cursor: pointer;" onclick="activate('warehouseAppStockManagement');" id="warehouseAppStockManagementImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                             </span>
                             </div>
	                   		 <div id="warehouseAppStockManagementFlow" style="margin-left:0%;color:#666;margin-left: 2px;margin-right: 2px;background-color: rgb(240,240,240)" class="inactiveBlock">
	                   		 <br>
                               	<div class="row divsubbg" style="border: none;">
	                             <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" onclick="activateSubChildFlow('warehouseAppPurchaseOrder');" >
	                              	<spring:message code="purchase.order.label" />
	                              </span>
	                              <span id="warehouseAppPurchaseOrderCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px"" onclick="toggleCheckBox(this)" name="warehouseAppStockManagementRead" id="warehouseAppWarehousePurchaseOrdersRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="warehouseAppStockManagementWrite" onclick="toggleCheckBox(this)" style="vertical-align: -2px"" id="warehouseAppWarehousePurchaseOrdersWrite"/>Write
<%--                                   <img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('warehouseAppPurchaseOrder');" id="warehouseAppPurchaseOrderImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="warehouseAppStockManagementCCTo" onclick="toggleCheckBox(this)" style="vertical-align: -2px"" id="warehouseAppWarehousePurchaseOrdersCCTo"/><spring:message code="cc.to.label" />
                                  <img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('warehouseAppPurchaseOrder');" id="warehouseAppPurchaseOrderImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                                  </div>
                                   <div style="margin-left: 0%">
			                       		<div id="warehouseAppPurchaseOrderFlow" class="inactiveSubChildBlock" style="font-size: 10px;background-color: rgb(240,240,240)">
			                       			<br>
			                       			<div class="row divsubbg" style="border: none">
			                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
			                              		  	<spring:message code="activities.label" />
			                              		  </span>
			                              		  <span id="" class="col-lg-6" style="padding: 0px">
			                              		  	<select class="form-control activities" name="warehouseAppWarehousePurchaseOrders" multiple="multiple" id="warehouseAppWarehousePurchaseOrdersActivities">
				                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
								                            <c:if test="${workflow.businessFlow == 'Warehouse Purchase Orders'}">
								                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
								                            </c:if>
		                                 				</c:forEach>
			                              		  	</select>
				                                  </span>
				                           </div>
			                       		</div>
			                       </div>
		                             <br>
                               	<div class="row divsubbg" style="border: none;">
	                              <span id="warehouseAppShipmentsNotesId" class="col-lg-6"  style="cursor: pointer;padding-left: 40px;">
	                              	<spring:message code="shipment.notes.label" />
	                              </span>
	                              <span id="warehouseAppShipmentsNotesCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px"" onclick="toggleCheckBox(this)" name="warehouseAppStockManagementRead" id="warehouseAppShipmentsNotesRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="warehouseAppStockManagementWrite" onclick="toggleCheckBox(this)" style="vertical-align: -2px"" id="warehouseAppShipmentsNotesWrite"/>Write
                                  </span>
                                    <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="warehouseAppStockManagementCCTo" onclick="toggleCheckBox(this)" style="vertical-align: -2px"" id="warehouseAppShipmentsNotesCCTo"/><spring:message code="cc.to.label" />
                                  </span>
                                  </div>
                                  <br>
                               	<div class="row divsubbg" style="border: none;">
	                             <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" onclick="activateSubChildFlow('warehouseAppGoodsReceipts');" >
	                              	<spring:message code="goods.receipts.label" />
	                              </span>
	                              <span id="warehouseAppGoodsReceiptsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px"" onclick="toggleCheckBox(this)" name="warehouseAppStockManagementRead" id="warehouseAppWarehouseGRNRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="warehouseAppStockManagementWrite" onclick="toggleCheckBox(this)" style="vertical-align: -2px"" id="warehouseAppWarehouseGRNWrite"/>Write
<%--                                    <img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('warehouseAppGoodsReceipts');" id="warehouseAppGoodsReceiptsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                   <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="warehouseAppStockManagementCCTo" onclick="toggleCheckBox(this)" style="vertical-align: -2px"" id="warehouseAppWarehouseGRNCCTo"/><spring:message code="cc.to.label" />
                                   <img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('warehouseAppGoodsReceipts');" id="warehouseAppGoodsReceiptsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                                  </div>
                                    <div style="margin-left: 0%">
			                       		<div id="warehouseAppGoodsReceiptsFlow" class="inactiveSubChildBlock" style="font-size: 10px;background-color: rgb(240,240,240)">
			                       			<br>
			                       			<div class="row divsubbg" style="border: none">
			                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
			                              		  	<spring:message code="activities.label" />
			                              		  </span>
			                              		  <span id="" class="col-lg-6" style="padding: 0px">
			                              		  	<select class="form-control activities" name="warehouseAppWarehouseGRN" multiple="multiple" id="warehouseAppWarehouseGRNActivities">
				                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
								                            <c:if test="${workflow.businessFlow == 'Warehouse GRN'}">
								                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
								                            </c:if>
		                                 				</c:forEach>
			                              		  	</select>
				                                  </span>
				                           </div>
			                       		</div>
			                       </div>
                                  <br>
                                  
                                  
                                  	<div class="row divsubbg" style="border: none;">
	                             <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" onclick="activateSubChildFlow('warehouseAppShipmentReturn');" >
	                              	<spring:message code="shipment.return.label" />
	                              </span>
	                              <span id="warehouseAppShipmentReturnCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px"" onclick="toggleCheckBox(this)" name="warehouseAppStockManagementRead" id="warehouseAppWarehouseShipmentReturnRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="warehouseAppStockManagementWrite" onclick="toggleCheckBox(this)" style="vertical-align: -2px"" id="warehouseAppWarehouseShipmentReturnWrite"/>Write
<%--                                    <img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('warehouseAppGoodsReceipts');" id="warehouseAppGoodsReceiptsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                   <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="warehouseAppStockManagementCCTo" onclick="toggleCheckBox(this)" style="vertical-align: -2px"" id="warehouseAppWarehouseShipmentReturnCCTo"/><spring:message code="cc.to.label" />
                                   <img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('warehouseAppShipmentReturn');" id="warehouseAppShipmentReturnImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                                  </div>
                                  
                                  
                                  
                                   <div style="margin-left: 0%">
			                       		<div id="warehouseAppShipmentReturnFlow" class="inactiveSubChildBlock" style="font-size: 10px;">
			                       			<br>
			                       			<div class="row divsubbg" style="border: none">
			                              		  <span class="col-lg-6" style="cursor: pointer; padding-left: 60px;" >
			                              		  	<spring:message code="activities.label" />
			                              		  </span>
			                              		  <span id="" class="col-lg-6" style="padding: 0px">
			                              		  	<select class="form-control activities" name="warehouseAppShipmentReturn" multiple="multiple" id="warehouseAppShipmentReturnActivities">
				                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
								                            <c:if test="${workflow.businessFlow == 'Warehouse Shipment Return'}">
								                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
								                            </c:if>
		                                 				</c:forEach>
			                              		  	</select>
				                                  </span>
				                           </div>
			                       		</div>
			                       </div>
		                             
		                             <br>
                                  
                                  
                                  
                                  
                               	<div class="row divsubbg" style="border: none;">
	                              <span id="warehouseAppInspectionReceiptsId" class="col-lg-6"  style="cursor: pointer;padding-left: 40px;">
	                              	<spring:message code="inspection.receipts.label" />
	                              </span>
	                              <span id="warehouseAppInspectionReceiptsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px"" onclick="toggleCheckBox(this)" name="warehouseAppStockManagementRead" id="warehouseAppInspectionReceiptsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="warehouseAppStockManagementWrite" onclick="toggleCheckBox(this)" style="vertical-align: -2px"" id="warehouseAppInspectionReceiptsWrite"/>Write
                                  </span>
                                   <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="warehouseAppStockManagementCCTo" onclick="toggleCheckBox(this)" style="vertical-align: -2px"" id="warehouseAppInspectionReceiptsCCTo"/><spring:message code="cc.to.label" />
                                  </span>
                                  </div>
                                  <br>
                               	<div class="row divsubbg" style="border: none;">
	                              <span id="warehouseAppInvoicingId" class="col-lg-6"  style="cursor: pointer;padding-left: 40px;">
	                              	<spring:message code="invoicing.label" />
	                              </span>
	                              <span id="warehouseAppInvoicingCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px"" onclick="toggleCheckBox(this)" name="warehouseAppStockManagementRead" id="warehouseAppInvoicingRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="warehouseAppStockManagementWrite" onclick="toggleCheckBox(this)" style="vertical-align: -2px"" id="warehouseAppInvoicingWrite"/>Write
                                  </span>
                                   <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="warehouseAppStockManagementCCTo" onclick="toggleCheckBox(this)" style="vertical-align: -2px"" id="warehouseAppInvoicingCCTo"/><spring:message code="cc.to.label" />
                                  </span>
                                  </div>
                                  <br>
                               	<div class="row divsubbg" style="border: none;">
	                              <span id="warehouseAppPaymentsId" class="col-lg-6"  style="cursor: pointer;padding-left: 40px;">
	                              	<spring:message code="payments.label" />
	                              </span>
	                              <span id="warehouseAppPaymentsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px"" onclick="toggleCheckBox(this)" name="warehouseAppStockManagementRead" id="warehouseAppPaymentsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="warehouseAppStockManagementWrite" onclick="toggleCheckBox(this)" style="vertical-align: -2px"" id="warehouseAppPaymentsWrite"/>Write
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" name="warehouseAppStockManagementCCTo" onclick="toggleCheckBox(this)" style="vertical-align: -2px"" id="warehouseAppPaymentsCCTo"/><spring:message code="cc.to.label" />
                                  </span>
                                  </div>  
                             </div>
	                          <br>
	                          <div id="warehouseAppGoodsTransferId" class="row divbg" style="border: none;">
	                              <span class="col-lg-6"  onclick="activate('warehouseAppGoodsTransfer');" style="cursor: pointer;font-weight: 15px">
	                              	<spring:message code="goodstransfer.label" />
	                              </span>
	                              <span id="warehouseAppGoodsTransferCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px"" onclick="selectAll('warehouseAppGoodsTransferRead');" name="warehouseAppRead" id="warehouseAppGoodsTransferRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px"" onclick="selectAll('warehouseAppGoodsTransferWrite')" name="warehouseAppWrite" id="warehouseAppGoodsTransferWrite"/>Write
<%--                                   	<img style="float: right;height: 20px;cursor: pointer;" onclick="activate('warehouseAppGoodsTransfer');" id="warehouseAppGoodsTransferImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                     <span class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px"" onclick="selectAll('warehouseAppGoodsTransferCCTo')" name="warehouseAppCCTo" id="warehouseAppGoodsTransferCCTo"/><spring:message code="cc.to.label" />
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activate('warehouseAppGoodsTransfer');" id="warehouseAppGoodsTransferImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                               </div>
                                  <div style="margin-left:0%;">
	                              <div id="warehouseAppGoodsTransferFlow" class="inactiveBlock" style="margin-left: 2px;margin-right: 2px; background-color: rgb(240,240,240)">
	                                <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  	<spring:message code="receiptstock.label" />
	                              		  </span>
	                              		  <span id="warehouseAppStockReceiptCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppGoodsTransferRead" style="vertical-align: -2px"" id="warehouseAppStockReceiptRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppGoodsTransferWrite" style="vertical-align: -2px""  id="warehouseAppStockReceiptWrite"/>Write
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppGoodsTransferCCTo" style="vertical-align: -2px""  id="warehouseAppStockReceiptCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                           </div>
		                      <br>
	                          <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer; padding-left: 40px;" onclick="activateSubChildFlow('warehouseAppWarehouseStockIssues');" >
	                              		  	<spring:message code="stock.issue.label" />
	                              		  </span>
	                              		  <span id="warehouseAppWarehouseStockIssuesCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppGoodsTransferRead" style="vertical-align: -2px" id="warehouseAppWarehouseStockIssuesRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppGoodsTransferWrite" style="vertical-align: -2px" id="warehouseAppWarehouseStockIssuesWrite"/>Write
<%-- 		                                 <img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('warehouseAppWarehouseStockIssues');" id="warehouseAppWarehouseStockIssuesImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppGoodsTransferCCTo" style="vertical-align: -2px" id="warehouseAppWarehouseStockIssuesCCTo"/>CC To
		                                 <img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('warehouseAppWarehouseStockIssues');" id="warehouseAppWarehouseStockIssuesImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                                  </span>
		                             </div>
		                            <div style="margin-left: 0%">
			                       		<div id="warehouseAppWarehouseStockIssuesFlow" class="inactiveSubChildBlock" style="font-size: 10px;">
			                       			<br>
			                       			<div class="row divsubbg" style="border: none">
			                              		  <span class="col-lg-6" style="cursor: pointer; padding-left: 60px;" >
			                              		  	<spring:message code="activities.label" />
			                              		  </span>
			                              		  <span id="" class="col-lg-6" style="padding: 0px">
			                              		  	<select class="form-control activities" name="warehouseAppWarehouseStockIssues" multiple="multiple" id="warehouseAppWarehouseStockIssuesActivities">
				                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
								                            <c:if test="${workflow.businessFlow == 'Warehouse Stock Issues'}">
								                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
								                            </c:if>
		                                 				</c:forEach>
			                              		  	</select>
				                                  </span>
				                           </div>
			                       		</div>
			                       </div>
		                             
		                             
		                             <br>
		                       <div id="GoodsTransferStockRequestId" class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" onclick="activateSubChildFlow('warehouseAppStockRequest');" >
	                              		  	<spring:message code="outlet.stock.request.label" />
	                              		  </span>
	                              		  <span id="warehouseAppStockRequestCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppGoodsTransferRead" style="vertical-align: -2px"" value="StockRequest" id="warehouseAppStockRequestRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppGoodsTransferWrite" style="vertical-align: -2px""  id="warehouseAppStockRequestWrite"/>Write
<%-- 		                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('warehouseAppStockRequest');" id="warehouseAppStockRequestImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
		                                  </span>
		                                    <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppGoodsTransferCCTo" style="vertical-align: -2px""  id="warehouseAppStockRequestCCTo"/><spring:message code="cc.to.label" />
		                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('warehouseAppStockRequest');" id="warehouseAppStockRequestImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                                  </span>
		                           </div>
			                       <div style="margin-left: 0%">
			                       		<div id="warehouseAppStockRequestFlow" class="inactiveSubChildBlock" style="font-size: 10px;background-color: rgb(240,240,240)">
			                       			<br>
			                       			<div class="row divsubbg" style="border: none;">
			                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
			                              		  	<spring:message code="activities.label" />
			                              		  </span>
			                              		  <span id="" class="col-lg-6" style="padding: 0px">
			                              		  	<select class="form-control activities" name="warehouseAppStockRequest" multiple="multiple" id="warehouseAppStockRequestActivities">
				                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
								                            <c:if test="${workflow.businessFlow == 'Stock Request'}">
								                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
								                            </c:if>
		                                 				</c:forEach>
			                              		  	</select>
				                                  </span>
				                           </div>
			                       		</div>
			                       </div>
		                             <br>
		                             
		                             
		                             <div id="GoodsTransferStockReturnId" class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" onclick="activateSubChildFlow('warehouseAppStockReturn');" >
	                              		  	<spring:message code="warehouse.stockreturn.label" />
	                              		  </span>
	                              		  <span id="warehouseAppStockReturnCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppGoodsTransferRead" style="vertical-align: -2px"" value="StockReturn" id="warehouseAppStockReturnRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppGoodsTransferWrite" style="vertical-align: -2px""  id="warehouseAppStockReturnWrite"/>Write
<%-- 		                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('warehouseAppStockRequest');" id="warehouseAppStockRequestImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
		                                  </span>
		                                    <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppGoodsTransferCCTo" style="vertical-align: -2px""  id="warehouseAppStockReturnCCTo"/><spring:message code="cc.to.label" />
		                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('warehouseAppStockReturn');" id="warehouseAppStockReturnImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
		                                  </span>
		                           </div>
			                       <div style="margin-left: 0%">
			                       		<div id="warehouseAppStockReturnFlow" class="inactiveSubChildBlock" style="font-size: 10px;background-color: rgb(240,240,240)">
			                       			<br>
			                       			<div class="row divsubbg" style="border: none;">
			                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
			                              		  	<spring:message code="activities.label" />
			                              		  </span>
			                              		  <span id="" class="col-lg-6" style="padding: 0px">
			                              		  	<select class="form-control activities" name="warehouseAppStockReturn" multiple="multiple" id="warehouseAppStockReturnActivities">
				                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
								                            <c:if test="${workflow.businessFlow == 'Stock Return'}">
								                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
								                            </c:if>
		                                 				</c:forEach>
			                              		  	</select>
				                                  </span>
				                           </div>
			                       		</div>
			                       </div>
		                             
		                             
	                              </div>
	                          </div>
	                          <br>
	                          <div class="row divbg">
                                <span id="warehouseAppOrdersId" class="col-lg-6" style="cursor: pointer;font-size: 15px;" >
                                	<spring:message code="orders.label" />
                                </span>
                                <span id="warehouseAppOrdersCheck" class="col-lg-2" style="padding: 0px">
                                	<input type="checkbox" style="vertical-align: -2px"" name="warehouseAppRead"  id="warehouseAppOrdersRead"/>Read
                                </span>
                                <span  class="col-lg-2" style="padding: 0px">
                                	<input type="checkbox" style="vertical-align: -2px"" name="warehouseAppWrite"  id="warehouseAppOrdersWrite"/>Write
                                </span>
                                <span  class="col-lg-2" style="padding: 0px">
                                	<input type="checkbox" style="vertical-align: -2px"" name="warehouseAppCCTo"  id="warehouseAppOrdersCCTo"/><spring:message code="cc.to.label" />
                                </span>
                   		   </div>
                   		   <br>
                   		   <div id="warehouseAppShipmentsId" class="row divbg">
                                <span class="col-lg-6" style="cursor: pointer;font-size: 15px;">
                                	<spring:message code="warehouse_shipments.label" />
                                </span>
                                <span id="warehouseAppShipmentsCheck" class="col-lg-2" style="padding: 0px">
                                	<input type="checkbox" style="vertical-align: -2px"" name="warehouseAppRead"  id="warehouseAppShipmentsRead"/>Read
                                </span>
                                <span  class="col-lg-2" style="padding: 0px">
                                	<input type="checkbox" style="vertical-align: -2px"" name="warehouseAppWrite" id="warehouseAppShipmentsWrite"/>Write
                                </span>
                                  <span  class="col-lg-2" style="padding: 0px">
                                	<input type="checkbox" style="vertical-align: -2px"" name="warehouseAppCCTo" id="warehouseAppShipmentsCCTo"/><spring:message code="cc.to.label" />
                                </span>
                   		   </div>
                   		   <br>
                   		  <%--  <div id="warehouseAppStockVerificationId" class="row divbg">
                                <span class="col-lg-6" style="cursor: pointer;font-size: 15px;">
                                	<spring:message code="warehouse_stockverification.label" />
                                </span>
                                <span id="warehouseAppStockVerificationCheck" class="col-lg-2" style="padding: 0px">
                                	<input type="checkbox" style="vertical-align: -2px"" name="warehouseAppRead" id="warehouseAppStockVerificationRead"/>Read
                                </span>
                                <span  class="col-lg-2" style="padding: 0px">
                                	<input type="checkbox" style="vertical-align: -2px"" name="warehouseAppWrite" id="warehouseAppStockVerificationWrite"/>Write
                                </span>
                                  <span  class="col-lg-2" style="padding: 0px">
                                	<input type="checkbox" style="vertical-align: -2px"" name="warehouseAppCCTo" id="warehouseAppStockVerificationCCTo"/><spring:message code="cc.to.label" />
                                </span>
                   		   </div> --%>
                   		   
                   		   		   <div id="warehouseAppWareHouseStockVerificationId" class="row divbg">
                                <span class="col-lg-6" style="cursor: pointer;font-size: 15px;" onclick="activateSubChildFlow('warehouseAppStockVerification');" >
                                	<spring:message code="warehouse_stockverification.label" />
                                </span>
                                <span id="warehouseAppWareHouseStockVerificationCheck" class="col-lg-2" style="padding: 0px">
                                	<input type="checkbox" style="vertical-align: -2px"" name="warehouseAppRead" id="warehouseAppWareHouseStockVerificationRead"/>Read
                                </span>
                                <span  class="col-lg-2" style="padding: 0px">
                                	<input type="checkbox" style="vertical-align: -2px"" name="warehouseAppWrite" id="warehouseAppWareHouseStockVerificationWrite"/>Write
                                </span>
                                  <span  class="col-lg-2" style="padding: 0px">
                                	<input type="checkbox" style="vertical-align: -2px"" name="warehouseAppCCTo" id="warehouseAppWareHouseStockVerificationCCTo"/><spring:message code="cc.to.label" />
                                <img style="float: right;height: 20px;cursor: pointer;" onclick="activateSubChildFlow('warehouseAppWareHouseStockVerification');" id="warehouseAppWareHouseStockVerificationImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                
                                </span>
                   		   </div>
                   		  
                   		   <div style="margin-left: 0%">
			                       		<div id="warehouseAppWareHouseStockVerificationFlow" class="inactiveSubChildBlock" style="font-size: 10px;background-color: rgb(240,240,240)">
			                       			<br>
			                       			<div class="row divsubbg" style="border: none;">
			                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 60px;" >
			                              		  	<spring:message code="activities.label" />
			                              		  </span>
			                              		  <span id="" class="col-lg-6" style="padding: 0px">
			                              		  	<select class="form-control activities" name="warehouseAppStockVerification" multiple="multiple" id="warehouseAppWareHouseStockVerificationActivities">
				                              		  	<c:forEach var="workflow" items="${workflowsList}" varStatus="theCount">
								                            <c:if test="${workflow.businessFlow == 'Warehouse Stock Verification'}">
								                            	<option value ="${workflow.statusName}">${workflow.statusName}</option>
								                            </c:if>
		                                 				</c:forEach>
			                              		  	</select>
				                                  </span>
				                           </div>
			                       		</div>
			                       </div>
                   		
                   		   
                   		   <br>
                           <div id="warehouseAppReportsId" class="row divbg" style="border: none;">
	                              <span  class="col-lg-6"  onclick="activate('warehouseAppReports');" style="font-size: 15px;cursor: pointer;">
	                              	<spring:message code="reports.label" />
	                              </span>
	                              <span id="warehouseAppReportsCheck" class="col-lg-2" style="padding: 0px">
                                  	<input type="checkbox" style="vertical-align: -2px"" onclick="selectAll('warehouseAppReportsRead');" name="warehouseAppRead" id="warehouseAppReportsRead"/>Read
                                  </span>
                                  <span class="col-lg-2" style="padding: 0px">
                                  	<!-- <input type="checkbox" style="vertical-align: -2px"" onclick="selectAll('warehouseAppReportsWrite')" name="warehouseAppWrite" id="warehouseAppReportsWrite"/>Write -->
<%--                                   	<img style="float: right;height: 20px;cursor: pointer;" onclick="activate('warehouseAppReports');" id="warehouseAppReportsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png"> --%>
                                  </span>
                                   <span class="col-lg-2" style="padding: 0px">
                                  	<!-- <input type="checkbox" style="vertical-align: -2px"" onclick="selectAll('warehouseAppReportsWrite')" name="warehouseAppWrite" id="warehouseAppReportsWrite"/>Write -->
                                  <input type="checkbox" style="vertical-align: -2px"" onclick="selectAll('warehouseAppReportsCCTo');" name="warehouseAppCCTo" id="warehouseAppReportsCCTo"/><spring:message code="cc.to.label" />
                                  
                                  	<img style="float: right;height: 20px;cursor: pointer;" onclick="activate('warehouseAppReports');" id="warehouseAppReportsImg" alt="" src="${pageContext.request.contextPath}/images/leftIcon.png">
                                  </span>
                                  </div>
                                  <div style="margin-left:0%;">
	                              <div id="warehouseAppReportsFlow" class="inactiveBlock" style="margin-left: 2px;margin-right: 2px; background-color: rgb(240,240,240)">
	                                <br>
	                                
	                         
	                                                        <div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  	<spring:message code="sales_reports.label" />
	                              		  </span>
	                              		  <span id="warehouseAppSalesReportsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsRead" style="vertical-align: -2px"" id="warehouseAppSalesReportsRead"/>Read
		                                  </span>
		                                  <span id="" class="col-lg-2" style="padding: 0px"></span>
		                                   <span id="warehouseAppSalesReportsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsCCTo" style="vertical-align: -2px"" id="warehouseAppSalesReportsCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                                 <!--  <span class="col-lg-3" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsWrite" style="vertical-align: -2px""  id="warehouseAppSalesReportsWrite"/>Write
		                                  </span> -->
		                           </div>
		                             <br>
	                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  <spring:message code="orders.reports.label" />
	                              		  </span>
	                              		  <span id="warehouseAppOrdersReportCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsRead" style="vertical-align: -2px"" id="warehouseAppOrdersReportRead"/>Read
		                                  </span>
		                                  <span id="" class="col-lg-2" style="padding: 0px"></span>
		                                   <span id="warehouseAppOrdersReportCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsCCTo" style="vertical-align: -2px"" id="warehouseAppOrdersReportCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                                 <!--  <span class="col-lg-3" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsWrite" style="vertical-align: -2px"" id="warehouseAppOrdersReportWrite"/>Write
		                                  </span> -->
		                             </div>
		                             
		                                
		                          
		                             
		                              <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  	<spring:message code="xreading.reports.label" />
	                              		  </span>
	                              		  <span id="warehouseAppXReportCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsRead" style="vertical-align: -2px"" id="warehouseAppXReportRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                                  <span id="warehouseAppXReportCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsCCTo" style="vertical-align: -2px"" id="warehouseAppXReportCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                              
		                           </div>
		                             <br>
	                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  <spring:message code="zreading.reports.label" />
	                              		  </span>
	                              		  <span id="warehouseAppZReportCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsRead" style="vertical-align: -2px"" id="warehouseAppZReportRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                                   <span id="warehouseAppZReportCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsCCTo" style="vertical-align: -2px"" id="warehouseAppZReportCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                             
		                             </div>
		                              <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  	<spring:message code="zreading.consolidate.label" />
	                              		  </span>
	                              		  <span id="warehouseAppZReportConsolidateCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsRead" style="vertical-align: -2px"" id="warehouseAppZReportConsolidateRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                                   <span id="warehouseAppZReportConsolidateCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsCCTo" style="vertical-align: -2px"" id="warehouseAppZReportConsolidateCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                                
		                           </div>
		                              <br>
		                             <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  <spring:message code="date.wise.sales.label" />
	                              		  </span>
	                              		  <span id="warehouseAppDateWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsRead" style="vertical-align: -2px"" id="warehouseAppDateWiseRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                                    <span id="warehouseAppDateWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsCCTo" style="vertical-align: -2px"" id="warehouseAppDateWiseCCTo"/>  <spring:message code="cc.to.label" />
		                                  </span>
		                           
		                             </div>
		                              <br>
		                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  <spring:message code="counter.wise.label" />
	                              		  </span>
	                              		  <span id="warehouseAppCounterWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsRead" style="vertical-align: -2px"" id="warehouseAppCounterWiseRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                                   <span id="warehouseAppCounterWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsCCTo" style="vertical-align: -2px"" id="warehouseAppCounterWiseCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                             
		                             </div>
		                              <br>
		                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  <spring:message code="category.wise.label" />
	                              		  </span>
	                              		  <span id="warehouseAppCategoryWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsRead" style="vertical-align: -2px"" id="warehouseAppCategoryWiseRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                                  <span id="warehouseAppCategoryWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsCCTo" style="vertical-align: -2px"" id="warehouseAppCategoryWiseCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                             
		                             </div>
		                              <br>
		                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  <spring:message code="department.wise" />
	                              		  </span>
	                              		  <span id="warehouseAppDepartmentWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsRead" style="vertical-align: -2px"" id="warehouseAppDepartmentWiseRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                                   <span id="warehouseAppDepartmentWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsCCTo" style="vertical-align: -2px"" id="warehouseAppDepartmentWiseCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                             
		                             </div>
		                              <br>
		                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  <spring:message code="sku.wise.label" />
	                              		  </span>
	                              		  <span id="warehouseAppSkuWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsRead" style="vertical-align: -2px"" id="warehouseAppSkuWiseRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                              <span id="warehouseAppSkuWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsCCTo" style="vertical-align: -2px"" id="warehouseAppSkuWiseCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                             </div>
		                              <br>
		                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  <spring:message code="hour.wise.sales.label" />
	                              		  </span>
	                              		  <span id="warehouseAppHourWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsRead" style="vertical-align: -2px"" id="warehouseAppHourWiseRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                                    <span id="warehouseAppHourWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsCCTo" style="vertical-align: -2px"" id="warehouseAppHourWiseCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                             
		                             </div>
		                              <br>
		                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  <spring:message code="brandwise.reports.label" />
	                              		  </span>
	                              		  <span id="warehouseAppBrandWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsRead" style="vertical-align: -2px"" id="warehouseAppBrandWiseRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                                   <span id="warehouseAppBrandWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsCCTo" style="vertical-align: -2px"" id="warehouseAppBrandWiseCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                                  
		                             
		                             </div>
		                              <br>
		                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  <spring:message code="sectionwise.reports.label" />
	                              		  </span>
	                              		  <span id="warehouseAppSectionWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsRead" style="vertical-align: -2px"" id="warehouseAppSectionWiseRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                              <span id="warehouseAppSectionWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsCCTo" style="vertical-align: -2px"" id="warehouseAppSectionWiseCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                             </div>
		                              <br>
		                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  <spring:message code="supplier.wise.label" />
	                              		  </span>
	                              		  <span id="warehouseAppSupplierWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsRead" style="vertical-align: -2px"" id="warehouseAppSupplierWiseRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                                   <span id="warehouseAppSupplierWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsCCTo" style="vertical-align: -2px"" id="warehouseAppSupplierWiseCCTo"/><spring:message code="cc.to.label"/>
		                                  </span>
		                             
		                             </div>
		                              <br>
		                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  <spring:message code="tax.label" />
	                              		  </span>
	                              		  <span id="warehouseAppTaxWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsRead" style="vertical-align: -2px"" id="warehouseAppTaxWiseRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                                  <span id="warehouseAppTaxWiseCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsCCTo" style="vertical-align: -2px"" id="warehouseAppTaxWiseCCTo"/><spring:message code="cc.to.label"/>
		                                  </span>
		                             
		                             </div>
		                              <br>
		                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  <spring:message code="due.collection.label" />
	                              		  </span>
	                              		  <span id="warehouseAppDueCollectionCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsRead" style="vertical-align: -2px"" id="warehouseAppDueCollectionRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                                   <span id="warehouseAppDueCollectionCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsCCTo" style="vertical-align: -2px"" id="warehouseAppDueCollectionCCTo"/><spring:message code="cc.to.label"/>
		                                  </span>
		                             
		                             </div>
		                              <br>
		                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;">
	                              		  <spring:message code="credit.sales.label" />
	                              		  </span>
	                              		  <span id="warehouseAppCreditSalesCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsRead" style="vertical-align: -2px"" id="warehouseAppCreditSalesRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                                   <span id="warehouseAppCreditSalesCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsCCTo" style="vertical-align: -2px"" id="warehouseAppCreditSalesCCTo"/><spring:message code="cc.to.label"/>
		                                  </span>
		                             
		                             </div>
		                              <br>
		                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  <spring:message code="supplies.report.label" />
	                              		  </span>
	                              		  <span id="warehouseAppSuppliesReportCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsRead" style="vertical-align: -2px"" id="warehouseAppSuppliesReportRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                                   <span id="warehouseAppSuppliesReportCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsCCTo" style="vertical-align: -2px"" id="warehouseAppSuppliesReportCCTo"/><spring:message code="cc.to.label"/>
		                                  </span>
		                             
		                             </div>
		                              <br>
		                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  <spring:message code="material.consumption.label" />
	                              		  </span>
	                              		  <span id="warehouseAppMaterialConsumptionCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsRead" style="vertical-align: -2px"" id="warehouseAppMaterialConsumptionRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                                  <span id="warehouseAppMaterialConsumptionCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsCCTo" style="vertical-align: -2px"" id="warehouseAppMaterialConsumptionCCTo"/><spring:message code="cc.to.label"/>
		                                  </span>
		                             
		                             </div>
		                              <br>
		                               <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  <spring:message code="stockmovement.label" />
	                              		  </span>
	                              		  <span id="warehouseAppStockMovementCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsRead" style="vertical-align: -2px"" id="warehouseAppStockMovementRead"/>Read
		                                  </span><span id="" class="col-lg-2" style="padding: 0px"></span>
		                                   <span id="warehouseAppStockMovementCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsCCTo" style="vertical-align: -2px"" id="warehouseAppStockMovementCCTo"/><spring:message code="cc.to.label"/>
		                                  </span>
		                             
		                             </div>
	                          
	                          <br> 
	                                
	                              
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  	<spring:message code="purchase.reports.label" />
	                              		  </span>
	                              		  <span id="warehouseAppPurchaseReportsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsRead" style="vertical-align: -2px"" id="warehouseAppPurchaseReportsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsWrite" style="vertical-align: -2px""  id="warehouseAppPurchaseReportsWrite"/>Write -->
		                                  </span>
		                                    <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsCCTo" style="vertical-align: -2px"" id="warehouseAppPurchaseReportsCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                           </div>
		                             <br>
	                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  <spring:message code="shipment.reports.label" />
	                              		  </span>
	                              		  <span id="warehouseAppShipmentReportsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsRead" style="vertical-align: -2px"" id="warehouseAppShipmentReportsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsWrite" style="vertical-align: -2px"" id="warehouseAppShipmentReportsWrite"/>Write -->
		                                  </span>
		                                   <span  class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsCCTo" style="vertical-align: -2px"" id="warehouseAppShipmentReportsCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                             </div>
		                             <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  	<spring:message code="stock.reports.label" />
	                              		  </span>
	                              		  <span id="warehouseAppStockReportsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsRead" style="vertical-align: -2px"" id="warehouseAppStockReportsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsWrite" style="vertical-align: -2px""  id="warehouseAppStockReportsWrite"/>Write -->
		                                  </span>
		                                   <span id="" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsCCTo" style="vertical-align: -2px"" id="warehouseAppStockReportsCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                           </div>
		                             <br>
	                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  <spring:message code="inspection.reports.label" />
	                              		  </span>
	                              		  <span id="warehouseAppInspectionReportsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsRead" style="vertical-align: -2px"" id="warehouseAppInspectionReportsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsWrite" style="vertical-align: -2px"" id="warehouseAppInspectionReportsWrite"/>Write -->
		                                  </span>
		                                  <span id="" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsCCTo" style="vertical-align: -2px"" id="warehouseAppInspectionReportsCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                             </div>
		                              <br>
                               		<div class="row divsubbg" style="border: none">
	                              		  <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  	<spring:message code="goods.transfer.reports.label" />
	                              		  </span>
	                              		  <span id="warehouseAppGoodsTransferReportsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsRead" style="vertical-align: -2px"" id="warehouseAppGoodsTransferReportsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsWrite" style="vertical-align: -2px""  id="warehouseAppGoodsTransferReportsWrite"/>Write -->
		                                  </span>
		                                   <span class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsCCTo" style="vertical-align: -2px"" id="warehouseAppGoodsTransferReportsCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                           </div>
		                             <br>
	                                <div class="row divsubbg" style="border: none">
	                              		   <span class="col-lg-6" style="cursor: pointer;padding-left: 40px;" >
	                              		  <spring:message code="expiry.reports.label" />
	                              		  </span>
	                              		  <span id="warehouseAppExpiryReportsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsRead" style="vertical-align: -2px"" id="warehouseAppExpiryReportsRead"/>Read
		                                  </span>
		                                  <span class="col-lg-2" style="padding: 0px">
		                                  	<!-- <input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsWrite" style="vertical-align: -2px"" id="warehouseAppExpiryReportsWrite"/>Write -->
		                                  </span>
		                                    <span id="warehouseAppExpiryReportsCheck" class="col-lg-2" style="padding: 0px">
		                                  	<input type="checkbox" onclick="toggleCheckBox(this)" name="warehouseAppReportsCCTo" style="vertical-align: -2px"" id="warehouseAppExpiryReportsCCTo"/><spring:message code="cc.to.label" />
		                                  </span>
		                             </div>
	                              </div>
	                          </div>
                        </div>
                        <div class="form-group col-lg-1"></div>
                   <div class="form-group col-lg-5">
                  		 <label><spring:message code="select.locations.label" /></label>
                           <select multiple="multiple" style="height: 230px" class="form-control" name="location" id="warehouseLocation">
                           	<c:forEach var="location" items="${warehouseLocationsList}">
								<option value="${location}">${location}</option>
							</c:forEach>
                           </select>
                  </div>
                  <input type="hidden" id="consoleLocations" value='${consoleLocations}'>
				  <input type="hidden" id="wareHouseLocations" value='${wareHouseLocations}'>
				  <input type="hidden" id="outletLocations" value='${outletLocations}'>
				  <input type="hidden" id="Edit" value='true'>
				  <input type="hidden"  id="maxRecords" value="">
				  	 <input type="hidden" id="searchRoles" value="${searchRoles}">		
																
				</div>  
                     	</div><!-- /.box-body -->
               	<br>
				<div class="row" style="text-align: center;">
<%-- 			 		<input type="button" class="btn bg-olive btn-inline" onclick="validateRole('edit');" value="&nbsp;&nbsp;<spring:message code="submit.label" />&nbsp;&nbsp;" /> --%>
					<input type="button" class="btnCls" style="margin-left:5%;" onclick="viewRolesMaster('role','0');" value="<spring:message code="cancel.label" />" />
				</div>
				<br/>
             <div class="box-footer"> </div>
          </form>
        </div>
</div>
</div>
</section><!-- /.content -->
 <!-- InputMask -->
</body>

</html>