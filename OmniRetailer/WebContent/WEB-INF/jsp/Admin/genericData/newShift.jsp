<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : admin/genericData/newShift.jsp
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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
		 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
	 <script src="${pageContext.request.contextPath}/js/form_plugin.js"></script> 
	 <script src="${pageContext.request.contextPath}/js/shift.js"></script> 
	 
	 <!--  added by        :  koti bomminei
      description     :  to ristrict the user from entering special characters     -->


	
	
	 
	 
	 
	
<style type="text/css">
	.col-xs-12 {
	 padding: 2% 10%;
	 }
</style>

	<style>
	 
hr{width: 100%;border-top: 1px solid #e5e6e6;margin-bottom:0px;margin-top:0px;}

.checkbox, .radio {
	margin-bottom:4px !important;
	margin-top:-4px !important;
}
.col-lg2-2
{
width:18.5% ! important;
}
.col-lg2-space
{
width:10.5%
}

.col-lg-space2
{
width:2% !important;
}
	</style>
	
<script>

$(document).ready(function(){
	callCalender('startDate');
	callCalender('endDate');
	var dateTime = getCurrentDate();
	var date = dateTime.split(' ');
	date = date[0].split('/');
	var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
	$("#startDate").val(formatedDate);
	$("#endDate").val(formatedDate);
});
</script>
</head>
<body>
<!-- Content Header (Page header) -->
<%-- <section class="content-header">
   <h1><spring:message code="masters.label" />
     <small><spring:message code="shift.master.label" /></small>
    </h1>
      <ol class="breadcrumb">
      	<li><a style="cursor: pointer;" onclick="return viewDashboard('admin');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><spring:message code="generic.data.label" /></li>
       </ol>
 </section> --%>

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
				<div class="box box-primary">
                                <div class="box-header" style="text-align: center">
                                <h3><spring:message code="new.shift.label" /></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form id="newShift" method="post">
                                    <div class="box-body">
                                    <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 15px; margin-top: -25px">${err}</div>
	        						 <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 15px; margin-top: -25px">${success}</div>
                                       	<div class="row" style="margin-top: -15px;;border: 2px solid rgba(51, 45, 45, 0.11);width:90%;margin-left:50px;margin-right:20px">
                                      <!--  <div class="row col-lg-12" style="margin-top: -15px;"> -->
                                         <div class="form-group col-lg-3">
                                            <label><spring:message code="shift.name.label" /> <span class="requiredField">*</span></label>
                                            <input type="text"  onblur="criteria(this)" class="form-control" name="shiftName" id="shiftName" required placeholder="<spring:message code="enter.label" /> <spring:message code="shift.name.label" />" />
                                        	<span id="shiftNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                          <div class="form-group col-lg-1 col-lg-space2"></div> 
                                         <div class="form-group col-lg-3">
                                           
                                           
                                            <label><spring:message code="shift.location.label" /></label>
                                            
                                           
                                            <select class="form-control" name="location" id="location">
                                             <c:forEach var="location" items="${workLocationsList}">
                                           <c:if test="${flowUnder == 'warehouse' }">
												<option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
											</c:if>
											  <c:if test="${flowUnder != 'warehouse' }">
											   <c:if test="${location.businessActivity != 'Warehouse' }">
												<option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
											</c:if>
											</c:if>
																						</c:forEach>
                                           </select>
                                          
                                         </div>
                                      <div class="form-group col-lg-1 col-lg-space2"></div> 
                                         <div class="form-group col-lg-2 col-lg2-2">
                                           <label><spring:message code="start.date.label" /> <span class="requiredField">*</span></label>
                                        	<div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <!-- <input type="text" name="startDate" id="startDate" required class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/> -->
                                            <input class="form-control" readonly="readonly" style="background-color: white;" name="startDate" id="startDate" size="20" type="text" onfocus="callCalender('startDate')" onclick="callCalender('startDate')" placeholder="DD/MM/YYYY"/>
                                        </div><!-- /.input group -->
                                        <span id="startDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                       <div class="form-group col-lg-1 col-lg-space2"></div>
                                         <div class="form-group col-lg-2 col-lg2-2">
                                         <label><spring:message code="end.date.label" /></label>
                                        	<div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <!-- <input type="text" name="endDate" id="endDate" required class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/> -->
                                            <input class="form-control" readonly="readonly" style="background-color: white;" name="endDate" id="endDate" size="20" type="text" onfocus="callCalender('endDate')" onclick="callCalender('endDate')" placeholder="DD/MM/YYYY"/>
                                          </div>
                                          <span id="endDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                         <div class="form-group col-lg-1"></div>
                                        </div>
                                        <br>
                                        <div class="row" style="border: 2px solid rgba(51, 45, 45, 0.11);width:90%;margin-left:50px;margin-right:10px">
                                       <!--  <div class="row" ><div class="form-group col-lg-10"> <hr style="margin-top: -5px;"></div></div> -->
                                       <div class="row" style="margin-left: 3px;" > 
                                        <div class="form-group col-lg-2" style="margin-top:30px;">
                                          <div class="checkbox">
                                               <label><input type="checkbox" checked value="Monday" id="mondayChkbox">Monday</label><br/>
                                          </div>                                          
                                        </div>
                                         <div class="form-group col-lg-1 col-lg2-space"></div>
                                         <div class="form-group col-lg-2">
                                            <div class="bootstrap-timepicker">
                                            <label><spring:message code="start.time.label"/> <span class="requiredField">*</span></label>
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="start_time" value="09:00:00" id="mondayStartTime"/>
                                                <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
                                            </div><!-- /.input group -->
                                        </div><!-- /.form group -->
                                        <span id="mondayStartTimeError" style="text-align:right;color:red;font-weight:bold;"></span>
                                         </div>
                                          <div class="form-group col-lg-1 col-lg2-space"></div>
                                         <div class="form-group col-lg-2">
                                            <div class="bootstrap-timepicker">
                                            <label><spring:message code="end.time.label"/> <span class="requiredField">*</span></label>
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="end_time" value="22:00:00" id="mondayEndTime"/>
                                                <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
                                            </div><!-- /.input group -->
                                        </div><!-- /.form group -->
                                        <span id="mondayEndTimeError" style="text-align:right;color:red;font-weight:bold;"></span>
                                         </div>
                                          <div class="form-group col-lg-1 col-lg2-space"></div>
                                         <div class="form-group col-lg-2">
                                            <label><spring:message code="extend.time.label" /></label>
                                            <div class="radio" style="">
                                                <label>
                                                    <input type="radio" name="mondayExtendTime" class="mondayExtendTime" value=true checked="checked">
                                                    <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="mondayExtendTime" class="mondayExtendTime" value=false>
                                                   <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                         </div>
                                          <!-- <div class="form-group col-lg-1"></div> -->
                                       </div>
                                       
                                      
                                        <div class="row" style="margin-left: 3px;margin-right:37px"><div class="form-group col-lg-12"> <hr style=""></div></div>
                                        
                                        
                                       <div class="row" style="margin-left: 3px;" > 
                                        <div class="form-group col-lg-2" style="margin-top:30px;">
                                          <div class="checkbox">
                                               <label><input type="checkbox" checked value="Tuesday" id="tuesdayChkbox">Tuesday</label><br/>
                                          </div>                                          
                                        </div>
                                         <div class="form-group col-lg-1 col-lg2-space"></div>
                                         <div class="form-group col-lg-2">
                                            <div class="bootstrap-timepicker">
                                            <label><spring:message code="start.time.label"/> <span class="requiredField">*</span></label>
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="start_time" value="09:00:00" id="tuesdayStartTime"/>
                                                <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
                                            </div><!-- /.input group -->
                                        </div><!-- /.form group -->
                                        <span id="tuesdayStartTimeError" style="text-align:right;color:red;font-weight:bold;"></span>
                                         </div>
                                          <div class="form-group col-lg-1 col-lg2-space"></div>
                                         <div class="form-group col-lg-2">
                                            <div class="bootstrap-timepicker">
                                            <label><spring:message code="end.time.label"/> <span class="requiredField">*</span></label>
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="end_time" value="22:00:00" id="tuesdayEndTime"/>
                                                <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
                                            </div><!-- /.input group -->
                                        </div><!-- /.form group -->
                                        <span id="tuesdayEndTimeError" style="text-align:right;color:red;font-weight:bold;"></span>
                                         </div>
                                          <div class="form-group col-lg-1 col-lg2-space"></div>
                                         <div class="form-group col-lg-2">
                                            <label><spring:message code="extend.time.label" /></label>
                                            <div class="radio" style="">
                                                <label>
                                                    <input type="radio" name="tuesdayExtendTime" class="tuesdayExtendTime" value=true checked="checked">
                                                    <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="tuesdayExtendTime" class="tuesdayExtendTime" value=false>
                                                   <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                         </div>
                                          <!-- <div class="form-group col-lg-1"></div> -->
                                       </div> 
                                      
                                      
                                        <div class="row" style="margin-left: 3px;margin-right:37px"><div class="form-group col-lg-12"> <hr style=""></div></div>
                                        
                                        
                                       <div class="row" style="margin-left: 3px;" > 
                                        <div class="form-group col-lg-2" style="margin-top:30px;">
                                          <div class="checkbox">
                                               <label><input type="checkbox" checked value="Wednesday" id="wednesdayChkbox">Wednesday</label><br/>
                                          </div>                                          
                                        </div>
                                         <div class="form-group col-lg-1 col-lg2-space"></div>
                                         <div class="form-group col-lg-2">
                                            <div class="bootstrap-timepicker">
                                            <label><spring:message code="start.time.label"/> <span class="requiredField">*</span></label>
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="start_time" value="09:00:00" id="wednesdayStartTime"/>
                                                <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
                                            </div><!-- /.input group -->
                                        </div><!-- /.form group -->
                                        <span id="wednesdayStartTimeError" style="text-align:right;color:red;font-weight:bold;"></span>
                                         </div>
                                          <div class="form-group col-lg-1 col-lg2-space"></div>
                                         <div class="form-group col-lg-2">
                                            <div class="bootstrap-timepicker">
                                            <label><spring:message code="end.time.label"/> <span class="requiredField">*</span></label>
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="end_time" value="22:00:00" id="wednesdayEndTime"/>
                                                <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
                                            </div><!-- /.input group -->
                                        </div><!-- /.form group -->
                                        <span id="wednesdayEndTimeError" style="text-align:right;color:red;font-weight:bold;"></span>
                                         </div>
                                          <div class="form-group col-lg-1 col-lg2-space"></div>
                                         <div class="form-group col-lg-2">
                                            <label><spring:message code="extend.time.label" /></label>
                                            <div class="radio" style="">
                                                <label>
                                                    <input type="radio" name="wednesdayExtendTime" class="wednesdayExtendTime" value=true checked="checked">
                                                    <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="wednesdayExtendTime" class="wednesdayExtendTime" value=false>
                                                   <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                         </div>
                                         <!--  <div class="form-group col-lg-1 col-lg2-space"></div> -->
                                       </div>
                                      
                                      
                                       <div class="row" style="margin-left: 3px;margin-right:37px"><div class="form-group col-lg-12"> <hr style=""></div></div>
                                        
                                        
                                       <div class="row" style="margin-left: 3px;" > 
                                        <div class="form-group col-lg-2" style="margin-top:30px;">
                                          <div class="checkbox">
                                               <label><input type="checkbox" checked value="Thursday" id="thursdayChkbox">Thursday</label><br/>
                                          </div>                                          
                                        </div>
                                         <div class="form-group col-lg-1 col-lg2-space"></div>
                                         <div class="form-group col-lg-2">
                                            <div class="bootstrap-timepicker">
                                            <label><spring:message code="start.time.label"/> <span class="requiredField">*</span></label>
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="start_time" value="09:00:00" id="thursdayStartTime"/>
                                                <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
                                            </div><!-- /.input group -->
                                        </div><!-- /.form group -->
                                        <span id="thursdayStartTimeError" style="text-align:right;color:red;font-weight:bold;"></span>
                                         </div>
                                          <div class="form-group col-lg-1 col-lg2-space"></div>
                                         <div class="form-group col-lg-2">
                                            <div class="bootstrap-timepicker">
                                            <label><spring:message code="end.time.label"/> <span class="requiredField">*</span></label>
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="end_time" value="22:00:00" id="thursdayEndTime"/>
                                                <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
                                            </div><!-- /.input group -->
                                        </div><!-- /.form group -->
                                        <span id="thursdayEndTimeError" style="text-align:right;color:red;font-weight:bold;"></span>
                                         </div>
                                          <div class="form-group col-lg-1 col-lg2-space"></div>
                                         <div class="form-group col-lg-2">
                                            <label><spring:message code="extend.time.label" /></label>
                                            <div class="radio" style="">
                                                <label>
                                                    <input type="radio" name="thursdayExtendTime" class="thursdayExtendTime" value=true checked="checked">
                                                    <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="thursdayExtendTime" class="thursdayExtendTime" value=false>
                                                   <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                         </div>
                                        <!--   <div class="form-group col-lg-1 col-lg2-space"></div> -->
                                       </div>
                                       
                                       
                                        <div class="row" style="margin-left: 3px;margin-right:37px"><div class="form-group col-lg-12"> <hr style=""></div></div>
                                        
                                        
                                       <div class="row" style="margin-left: 3px;" > 
                                        <div class="form-group col-lg-2" style="margin-top:30px;">
                                          <div class="checkbox">
                                               <label><input type="checkbox" checked value="Friday" id="fridayChkbox">Friday</label><br/>
                                          </div>                                          
                                        </div>
                                         <div class="form-group col-lg-1 col-lg2-space"></div>
                                         <div class="form-group col-lg-2">
                                            <div class="bootstrap-timepicker">
                                            <label><spring:message code="start.time.label"/> <span class="requiredField">*</span></label>
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="start_time" value="09:00:00" id="fridayStartTime"/>
                                                <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
                                            </div><!-- /.input group -->
                                        </div><!-- /.form group -->
                                        <span id="fridayStartTimeError" style="text-align:right;color:red;font-weight:bold;"></span>
                                         </div>
                                          <div class="form-group col-lg-1 col-lg2-space"></div>
                                         <div class="form-group col-lg-2">
                                            <div class="bootstrap-timepicker">
                                            <label><spring:message code="end.time.label"/> <span class="requiredField">*</span></label>
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="end_time" value="22:00:00" id="fridayEndTime"/>
                                                <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
                                            </div><!-- /.input group -->
                                        </div><!-- /.form group -->
                                        <span id="fridayEndTimeError" style="text-align:right;color:red;font-weight:bold;"></span>
                                         </div>
                                          <div class="form-group col-lg-1 col-lg2-space"></div>
                                         <div class="form-group col-lg-2">
                                            <label><spring:message code="extend.time.label" /></label>
                                            <div class="radio" style="">
                                                <label>
                                                    <input type="radio" name="fridayExtendTime" class="fridayExtendTime" value=true checked="checked">
                                                    <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="fridayExtendTime" class="fridayExtendTime" value=false>
                                                   <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                         </div>
                                          <!-- <div class="form-group col-lg-1 col-lg2-space"></div> -->
                                       </div>
                                       
                                       
                                        <div class="row" style="margin-left: 3px;margin-right:37px"><div class="form-group col-lg-12"> <hr style=""></div></div>
                                        
                                        
                                       <div class="row" style="margin-left: 3px;" > 
                                        <div class="form-group col-lg-2" style="margin-top:30px;">
                                          <div class="checkbox">
                                               <label><input type="checkbox" value="Saturday" id="saturdayChkbox">Saturday</label><br/>
                                          </div>                                          
                                        </div>
                                         <div class="form-group col-lg-1 col-lg2-space"></div>
                                         <div class="form-group col-lg-2">
                                            <div class="bootstrap-timepicker">
                                            <label><spring:message code="start.time.label"/> <span class="requiredField">*</span></label>
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="start_time" value="09:00:00" id="saturdayStartTime" disabled/>
                                                <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
                                            </div><!-- /.input group -->
                                        </div><!-- /.form group -->
                                        <span id="saturdayStartTimeError" style="text-align:right;color:red;font-weight:bold;"></span>
                                         </div>
                                          <div class="form-group col-lg-1 col-lg2-space"></div>
                                         <div class="form-group col-lg-2">
                                            <div class="bootstrap-timepicker">
                                            <label><spring:message code="end.time.label"/> <span class="requiredField">*</span></label>
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="end_time" value="22:00:00" id="saturdayEndTime" disabled/>
                                                <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
                                            </div><!-- /.input group -->
                                        </div><!-- /.form group -->
                                        <span id="saturdayEndTimeError" style="text-align:right;color:red;font-weight:bold;"></span>
                                         </div>
                                          <div class="form-group col-lg-1 col-lg2-space"></div>
                                         <div class="form-group col-lg-2">
                                            <label><spring:message code="extend.time.label" /></label>
                                            <div class="radio" style="">
                                                <label>
                                                    <input type="radio" name="saturdayExtendTime" class="saturdayExtendTime" value=true checked="checked" disabled>
                                                    <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="saturdayExtendTime" class="saturdayExtendTime" value=false disabled>
                                                   <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                         </div>
                                        <!--   <div class="form-group col-lg-1 col-lg2-space"></div> -->
                                       </div>
                                       
                                       
                                        <div class="row" style="margin-left: 3px;margin-right:37px"><div class="form-group col-lg-12"> <hr style=""></div></div>
                                        
                                        
                                       <div class="row" style="margin-left: 3px;" > 
                                        <div class="form-group col-lg-2" style="margin-top:30px;">
                                          <div class="checkbox">
                                               <label><input type="checkbox" value="Sunday" id="sundayChkbox">Sunday</label><br/>
                                          </div>                                          
                                        </div>
                                         <div class="form-group col-lg-1 col-lg2-space"></div>
                                         <div class="form-group col-lg-2">
                                            <div class="bootstrap-timepicker">
                                            <label><spring:message code="start.time.label"/> <span class="requiredField">*</span></label>
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="start_time" value="09:00:00" id="sundayStartTime" disabled/>
                                                <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
                                            </div><!-- /.input group -->
                                        </div><!-- /.form group -->
                                        <span id="sundayStartTimeError" style="text-align:right;color:red;font-weight:bold;"></span>
                                         </div>
                                          <div class="form-group col-lg-1 col-lg2-space"></div>
                                         <div class="form-group col-lg-2">
                                            <div class="bootstrap-timepicker">
                                            <label><spring:message code="end.time.label"/> <span class="requiredField">*</span></label>
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="end_time" value="22:00:00" id="sundayEndTime" disabled/>
                                                <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
                                            </div><!-- /.input group -->
                                        </div><!-- /.form group -->
                                        <span id="sundayEndTimeError" style="text-align:right;color:red;font-weight:bold;"></span>
                                         </div>
                                          <div class="form-group col-lg-1 col-lg2-space"></div>
                                         <div class="form-group col-lg-2">
                                            <label><spring:message code="extend.time.label" /></label>
                                            <div class="radio" style="">
                                                <label>
                                                    <input type="radio" name="sundayExtendTime" class="sundayExtendTime" value=true checked="checked" disabled>
                                                    <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="sundayExtendTime" class="sundayExtendTime" value=false disabled>
                                                   <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                         </div>
                                        <!--   <div class="form-group col-lg-1"></div> -->
                                       </div>
                                       </div>
                                      <!--   <div class="row"><div class="form-group col-lg-12"> <hr style=""></div></div> -->
                                         
                                        <div class="row" style="margin-left: 35px;" >
                                         <div class="form-group col-lg-11" style="width:95% !important">
                                           <label><spring:message code="remarks.label" /></label>
                                           <textarea class="form-control"  onblur="criteria(this)" name="remarks" id="shiftRemarks" style="resize: none;" rows="3" placeholder="<spring:message code="enter.remarks.label" />" ></textarea>
                                         <span id="shiftRemarksError" style="text-align:right;color: red;font-size: 2;font-weight: bold;margin-left: 20px;white-space: nowrap;"></span>
                                         </div>
                                       </div>
                                         <input type="hidden" id="flowUnder" value="${flowUnder}">
                                       
                          </div><!-- /.box-body -->
									
						<div class="row" style="text-align: center;">
						 <input type="button" class="btnCls" onclick="validateShiftForm('new')"  value="<spring:message code="submit.label" />" />
						  <c:if test="${sessionScope.role == 'super admin'}"> 
						  	 <input type="button" class="btnCls buttonMargin"  onclick="return viewShiftMaster('${flowUnder}shiftMaster','0','');" value="<spring:message code="cancel.label" />" />
						  </c:if>
						    <c:if test="${flowUnder == 'outlet'}">
						 <c:forEach var="accessControl" items="${sessionScope.shiftManagement}">
               			   <c:if test="${accessControl.appDocument == 'ShiftMaster' && accessControl.write == true && accessControl.read == true}">
						     <input type="button" class="btnCls buttonMargin"  onclick="return viewShiftMaster('${flowUnder}shiftMaster','0','','${flowUnder}');" value="<spring:message code="cancel.label" />" />
						   </c:if>
						 </c:forEach>
						 </c:if>
						 
						  <c:if test="${flowUnder == 'warehouse'}">
						  <c:forEach var="accessControl" items="${sessionScope.warehouseshiftManagement}">
               			   <c:if test="${accessControl.appDocument == 'WarehouseShiftMaster' && accessControl.write == true && accessControl.read == true}">
						     <input type="button" class="btnCls buttonMargin"  onclick="return viewShiftMaster('${flowUnder}shiftMaster','0','','${flowUnder}');" value="<spring:message code="cancel.label" />" />
						   </c:if>
						 </c:forEach>
						 </c:if>
						 
						</div>
									<br/>
                                    <div class="box-footer">
                                     
                                    </div>
                                </form>
                            </div>

</div>
</div>
</section><!-- /.content -->
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/timepicker/bootstrap-timepicker.min.js" ></script>
  <script>
  //Timepicker
  $(".timepicker").timepicker({
      showInputs: false,
      showMeridian:false,
      showSeconds:true,
      
   });
 	
</script>
<!-- <script type="text/javascript">
            $(function() {
                //Datemask dd/mm/yyyy
                $("#startDate").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
                $("#endDate").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
            });
            </script> -->
</body>
</html>