<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : admin/genericData/viewShift.jsp
 * file type		        : JSP
 * description				: View Shift form is displayed using this jsp
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
	 <script src="${pageContext.request.contextPath}/js/shift.js"></script> 
	 	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
	<%-- <script src="${pageContext.request.contextPath}/js/jquery-1.6.4.min.js"></script> --%>
	
<style type="text/css">
	.col-xs-12 {
	 padding: 2% 10%;
	 }
</style>
<script>
$(document).ready(function(){
	
	displayShiftTimings();
});
</script>
	<style>
	 
hr{width: 100%;border-top: 1px solid #e5e6e6;margin-bottom:0px;margin-top:0px;}

@media (min-width: 768px){
.datepicker-dropdown{top:36% !important;}
}
@media (min-width: 992px){
.datepicker-dropdown{top:100% !important;}
}
@media (min-width: 1200px){
.datepicker-dropdown{top:36% !important;}
}
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
                                <br/>
                                <h3><spring:message code="view.shift.label" /></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                
                                
                                
                                <form id="newShift" method="post">
                                    <div class="box-body">
                                    
                                    <div class="row" style="text-align: right;margin-right:3%">
						 <input type="button" class="btnCls" onclick="return viewShiftMaster('${flowUnder}shiftMaster','0','${shiftLocation}','${flowUnder}');" value="<spring:message code="cancel.label" />" />
						</div>
                                    
                                    
<%--                                     <div id="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-top: -10px;">${err}</div> --%>
                                       	<div class="row" style="margin-top: 5px;border: 2px solid rgba(51, 45, 45, 0.11);width:90%;margin-left:50px;margin-right:20px">
                                      
                                      
                                      
                                         <div class="form-group col-lg-3">
                                            <label><spring:message code="shift.name.label" /> <span class="requiredField">*</span></label>
                                            <input type="text" class="form-control" value="${shiftMasterDetailsObj.shiftName}" name="shiftName" id="shiftName" required readonly placeholder="<spring:message code="enter.label" /> <spring:message code="shift.name.label" />" />
                                        </div>
                                        <div class="form-group col-lg-1 col-lg-space2"></div> 
                                         <div class="form-group col-lg-3">
                                            <label><spring:message code="shift.location.label" /></label>
                                            <input type="text" class="form-control" name="location" id="location" value="${shiftMasterDetailsObj.storeLocation}" readonly/>
                                         </div>
                                        <div class="form-group col-lg-1 col-lg-space2"></div> 
                                         <div class="form-group col-lg-2 col-lg2-2">
                                         	<label><spring:message code="start.date.label" /> <span class="requiredField">*</span></label>
                                        	<div class="input-group">
	                                            <div class="input-group-addon">
	                                                <i class="fa fa-calendar"></i>
	                                            </div>
                                           		<input type="text" name="startDate" id="startDate" required class="form-control" value="${shiftMasterDetailsObj.start_date}" readonly/>
                                        	</div><!-- /.input group -->
                                         </div>
                                        <div class="form-group col-lg-1 col-lg-space2"></div> 
                                         <div class="form-group col-lg-2 col-lg2-2">
                                         	<label><spring:message code="end.date.label" /></label>
                                        	<div class="input-group">
	                                            <div class="input-group-addon">
	                                                <i class="fa fa-calendar"></i>
	                                            </div>
	                                            <input type="text" name="endDate" id="endDate" required class="form-control" value="${shiftMasterDetailsObj.end_date}" readonly/>
                                          	</div>
                                         </div>
                                         <div class="form-group col-lg-1"></div>
                                        </div>
                                        <br>
                                        <div class="row" style="border: 2px solid rgba(51, 45, 45, 0.11);width:90%;margin-left:50px;margin-right:10px">
                                        <!-- <div class="row"><div class="form-group col-lg-10"> <hr style="margin-top:10px;"></div></div> -->
                                       <div class="row" style="margin-left: 3px;"> 
                                        <div class="form-group col-lg-2" style="margin-top:30px;">
                                          <div class="checkbox">
                                               <label><input type="checkbox" value="Monday" id="mondayChkbox" disabled>Monday</label><br/>
                                          </div>                                          
                                        </div>
                                         <div class="form-group col-lg-1 col-lg2-space"></div>
                                         <div class="form-group col-lg-2">
                                            <div class="bootstrap-timepicker">
                                            <label><spring:message code="start.time.label"/> <span class="requiredField">*</span></label>
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="start_time" id="mondayStartTime" readonly/>
                                                <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
                                            </div><!-- /.input group -->
                                        </div><!-- /.form group -->
                                         </div>
                                         <div class="form-group col-lg-1 col-lg2-space"></div>
                                         <div class="form-group col-lg-2">
                                            <div class="bootstrap-timepicker">
                                            <label><spring:message code="end.time.label"/> <span class="requiredField">*</span></label>
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="end_time" id="mondayEndTime" readonly/>
                                                <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
                                            </div><!-- /.input group -->
                                        </div><!-- /.form group -->
                                         </div>
                                         <div class="form-group col-lg-1 col-lg2-space"></div>
                                         <div class="form-group col-lg-2">
                                            <label><spring:message code="extend.time.label" /></label>
                                            <div class="radio" style="">
                                                <label>
                                                    <input type="radio" name="mondayExtendTime" class="mondayExtendTime" value=true disabled>
                                                    <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="mondayExtendTime" class="mondayExtendTime" value=false disabled>
                                                   <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                         </div>
                                         <!--  <div class="form-group col-lg-1"></div> -->
                                       </div>
                                       
                                      <input type="hidden" id="flowUnder" value="${flowUnder}">
                                       <div class="row" style="margin-left: 3px;margin-right:37px"><div class="form-group col-lg-12"> <hr style=""></div></div>
                                        
                                        
                                       <div class="row" style="margin-left: 3px;"> 
                                        <div class="form-group col-lg-2" style="margin-top:30px;">
                                          <div class="checkbox">
                                               <label><input type="checkbox" value="Tuesday" id="tuesdayChkbox" disabled>Tuesday</label><br/>
                                          </div>                                          
                                        </div>
                                        <div class="form-group col-lg-1 col-lg2-space"></div>
                                         <div class="form-group col-lg-2">
                                            <div class="bootstrap-timepicker">
                                            <label><spring:message code="start.time.label"/> <span class="requiredField">*</span></label>
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="start_time" id="tuesdayStartTime" readonly/>
                                                <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
                                            </div><!-- /.input group -->
                                        </div><!-- /.form group -->
                                        </div>
                                        <div class="form-group col-lg-1 col-lg2-space"></div>
                                         <div class="form-group col-lg-2">
                                            <div class="bootstrap-timepicker">
                                            <label><spring:message code="end.time.label"/> <span class="requiredField">*</span></label>
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="end_time" id="tuesdayEndTime" readonly/>
                                                <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
                                            </div><!-- /.input group -->
                                        </div><!-- /.form group -->
                                        </div>
                                         <div class="form-group col-lg-1 col-lg2-space"></div>
                                         <div class="form-group col-lg-2">
                                            <label><spring:message code="extend.time.label" /></label>
                                            <div class="radio" style="">
                                                <label>
                                                    <input type="radio" name="tuesdayExtendTime" class="tuesdayExtendTime" value=true disabled>
                                                    <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="tuesdayExtendTime" class="tuesdayExtendTime" value=false disabled>
                                                   <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                         </div>
                                         <!--  <div class="form-group col-lg-1"></div> -->
                                       </div> 
                                      
                                      
                                     <div class="row" style="margin-left: 3px;margin-right:37px"><div class="form-group col-lg-12"> <hr style=""></div></div>
                                        
                                        
                                       <div class="row" style="margin-left: 3px;"> 
                                        <div class="form-group col-lg-2" style="margin-top:30px;">
                                          <div class="checkbox">
                                               <label><input type="checkbox" value="Wednesday" id="wednesdayChkbox" disabled>Wednesday</label><br/>
                                          </div>                                          
                                        </div>
                                         <div class="form-group col-lg-1 col-lg2-space"></div>
                                         <div class="form-group col-lg-2">
                                            <div class="bootstrap-timepicker">
                                            <label><spring:message code="start.time.label"/> <span class="requiredField">*</span></label>
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="start_time" id="wednesdayStartTime" readonly/>
                                                <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
                                            </div><!-- /.input group -->
                                        </div><!-- /.form group -->
                                        </div>
                                          <div class="form-group col-lg-1 col-lg2-space"></div>
                                         <div class="form-group col-lg-2">
                                            <div class="bootstrap-timepicker">
                                            <label><spring:message code="end.time.label"/> <span class="requiredField">*</span></label>
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="end_time" id="wednesdayEndTime" readonly/>
                                                <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
                                            </div><!-- /.input group -->
                                        </div><!-- /.form group -->
                                        </div>
                                        <div class="form-group col-lg-1 col-lg2-space"></div>
                                         <div class="form-group col-lg-2">
                                            <label><spring:message code="extend.time.label" /></label>
                                            <div class="radio" style="">
                                                <label>
                                                    <input type="radio" name="wednesdayExtendTime" class="wednesdayExtendTime" value=true disabled>
                                                    <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="wednesdayExtendTime" class="wednesdayExtendTime" value=false disabled>
                                                   <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                         </div>
                                         <!--  <div class="form-group col-lg-1"></div> -->
                                       </div>
                                      
                                      
                                     <div class="row" style="margin-left: 3px;margin-right:37px"><div class="form-group col-lg-12"> <hr style=""></div></div>
                                        
                                        
                                       <div class="row" style="margin-left: 3px;"> 
                                        <div class="form-group col-lg-2" style="margin-top:30px;">
                                          <div class="checkbox">
                                               <label><input type="checkbox" value="Thursday" id="thursdayChkbox" disabled>Thursday</label><br/>
                                          </div>                                          
                                        </div>
                                        <div class="form-group col-lg-1 col-lg2-space"></div>
                                         <div class="form-group col-lg-2">
                                            <div class="bootstrap-timepicker">
                                            <label><spring:message code="start.time.label"/> <span class="requiredField">*</span></label>
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="start_time" id="thursdayStartTime" readonly/>
                                                <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
                                            </div><!-- /.input group -->
                                        </div><!-- /.form group -->
                                        </div>
                                          <div class="form-group col-lg-1 col-lg2-space"></div>
                                         <div class="form-group col-lg-2">
                                            <div class="bootstrap-timepicker">
                                            <label><spring:message code="end.time.label"/> <span class="requiredField">*</span></label>
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="end_time" id="thursdayEndTime" readonly/>
                                                <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
                                            </div><!-- /.input group -->
                                        </div><!-- /.form group -->
                                        </div>
                                        <div class="form-group col-lg-1 col-lg2-space"></div>
                                         <div class="form-group col-lg-2">
                                            <label><spring:message code="extend.time.label" /></label>
                                            <div class="radio" style="">
                                                <label>
                                                    <input type="radio" name="thursdayExtendTime" class="thursdayExtendTime" value=true disabled>
                                                    <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="thursdayExtendTime" class="thursdayExtendTime" value=false disabled>
                                                   <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                         </div>
                                       <!--    <div class="form-group col-lg-1"></div> -->
                                       </div>
                                       
                                       
                                        <div class="row" style="margin-left: 3px;margin-right:37px"><div class="form-group col-lg-12"> <hr style=""></div></div>
                                        
                                        
                                       <div class="row" style="margin-left: 3px;"> 
                                        <div class="form-group col-lg-2" style="margin-top:30px;">
                                          <div class="checkbox">
                                               <label><input type="checkbox" value="Friday" id="fridayChkbox" disabled>Friday</label><br/>
                                          </div>                                          
                                        </div>
                                        <div class="form-group col-lg-1 col-lg2-space"></div>
                                         <div class="form-group col-lg-2">
                                            <div class="bootstrap-timepicker">
                                            <label><spring:message code="start.time.label"/> <span class="requiredField">*</span></label>
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="start_time" id="fridayStartTime" readonly/>
                                                <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
                                            </div><!-- /.input group -->
                                        </div><!-- /.form group -->
                                        </div>
                                          <div class="form-group col-lg-1 col-lg2-space"></div>
                                         <div class="form-group col-lg-2">
                                            <div class="bootstrap-timepicker">
                                            <label><spring:message code="end.time.label"/> <span class="requiredField">*</span></label>
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="end_time" id="fridayEndTime" readonly/>
                                                <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
                                            </div><!-- /.input group -->
                                        </div><!-- /.form group -->
                                         </div>
                                          <div class="form-group col-lg-1 col-lg2-space"></div>
                                         <div class="form-group col-lg-2">
                                            <label><spring:message code="extend.time.label" /></label>
                                            <div class="radio" style="">
                                                <label>
                                                    <input type="radio" name="fridayExtendTime" class="fridayExtendTime" value=true disabled>
                                                    <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="fridayExtendTime" class="fridayExtendTime" value=false disabled>
                                                   <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                         </div>
                                         <!--  <div class="form-group col-lg-1"></div> -->
                                       </div>
                                       <div class="row" style="margin-left: 3px;margin-right:37px"><div class="form-group col-lg-12"> <hr style=""></div></div>
                                       <div class="row" style="margin-left: 3px;"> 
                                        <div class="form-group col-lg-2" style="margin-top:30px;">
                                          <div class="checkbox">
                                               <label><input type="checkbox" value="Saturday" id="saturdayChkbox" disabled>Saturday</label><br/>
                                          </div>                                          
                                        </div>
                                          <div class="form-group col-lg-1 col-lg2-space"></div>
                                         <div class="form-group col-lg-2">
                                            <div class="bootstrap-timepicker">
                                            <label><spring:message code="start.time.label"/> <span class="requiredField">*</span></label>
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="start_time" id="saturdayStartTime" readonly/>
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
                                                <input type="text" class="form-control timepicker" name="end_time" id="saturdayEndTime" readonly/>
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
                                                    <input type="radio" name="saturdayExtendTime" class="saturdayExtendTime" value=true disabled>
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
                                          <!--  <div class="form-group col-lg-1 col-lg2-space"></div> -->
                                       </div>
                                       
                                       <div class="row" style="margin-left: 3px;margin-right:37px"><div class="form-group col-lg-12"> <hr style=""></div></div>
                                       <div class="row" style="margin-left: 3px;"> 
                                        <div class="form-group col-lg-2" style="margin-top:30px;">
                                          <div class="checkbox">
                                               <label><input type="checkbox" value="Sunday" id="sundayChkbox" disabled>Sunday</label><br/>
                                          </div>                                          
                                        </div>
                                        <div class="form-group col-lg-1 col-lg2-space"></div>
                                         <div class="form-group col-lg-2">
                                            <div class="bootstrap-timepicker">
                                            <label><spring:message code="start.time.label"/> <span class="requiredField">*</span></label>
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="start_time" id="sundayStartTime" readonly/>
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
                                                <input type="text" class="form-control timepicker" name="end_time" id="sundayEndTime" readonly/>
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
                                                    <input type="radio" name="sundayExtendTime" class="sundayExtendTime" value=true disabled>
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
                                          <!-- <div class="form-group col-lg-1"></div> -->
                                       </div>
                                       </div>
                                       <!--  <div class="row"><div class="form-group col-lg-10"> <hr style=""></div></div> -->
                                         
                                        <div class="row" style="margin-left: 35px;" >
                                         <div class="form-group col-lg-11" style="width:95% !important">
                                           <label><spring:message code="remarks.label" /></label>
                                           <textarea class="form-control" name="remarks" id="shiftRemarks" style="resize: none;" rows="3" readonly placeholder="<spring:message code="enter.remarks.label" />" >${shiftMasterDetailsObj.remarks}</textarea>
                                         </div>
                                       </div>
                                       <input type="hidden" id="shiftTimings" value='${shiftTimings}' />
                                        <input type="hidden" id="shiftmaster" value='${searchName}' />
<%--                                         <input type="hidden" id="flowUnder" value="${flowunder}"> --%>
                              
                          </div><!-- /.box-body -->
									
						<div class="row" style="text-align: right;">
						 <input type="button" class="btnCls" style="margin-right:3%" onclick="return viewShiftMaster('${flowUnder}shiftMaster','0','${shiftLocation}','${flowUnder}');" value="<spring:message code="cancel.label" />" />
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