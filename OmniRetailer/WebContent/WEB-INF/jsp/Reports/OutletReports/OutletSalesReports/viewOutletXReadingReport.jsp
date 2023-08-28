<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : Inventory Manager/Reports/viewOutletXReadingReport.jsp
 * file type		        : JSP
 * description				: display outlet sales reports
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <script src="${pageContext.request.contextPath}/js/outletReports/reports.js"></script>  
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
         <!-- InputMask -->
        <%-- <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script> --%>
        
<script type="text/javascript">

	$(document).ready(function(){
		// callCalenderYYYYMMDD('date');
		callCalender('date');
	});
</script>
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

</style>
    </head>
<body>
				<section class="content-header">
                    <h1>
                       <spring:message code="outlet_management.reports.label"/>&nbsp;<spring:message code="sales.reports.label"/>&nbsp;&#45;&nbsp;<spring:message code="xreading.reports.label"/>&nbsp;<spring:message code="report.label"/>
                    </h1>
                   <%--  <ol class="breadcrumb">
                        <li><a href="#" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
                        <li><a href="#" onclick="showReportsFlows();"><spring:message code="reports.label"/></a></li>
                        <li><a href="#" onclick="showOutletReportsFlows();"><spring:message code="outlet_management.reports.label"/></a></li>
                        <li><a href="#" onclick="showOutletSalesReportsFlows();"><spring:message code="sales.reports.label"/></a></li>
                        <li class="active"><spring:message code="xreading.reports.label"/></li>
                    </ol> --%>
                </section>
                
                         <!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
	<div class="box box-primary">
       <div class="box-body">      
         <div class="row">
         <div class="form-group col-lg-3" style="    padding-right: 60px;">
            <label><spring:message code="location.label" /></label>
            <select class="form-control" name="location" id="location" readonly  onchange="return changeInfoBasedOnLocation(this.options[this.selectedIndex].value);">
            	 <option value="${selectedlocation}">${selectedlocation}</option>
 	        </select>
          </div>
          
          <div class="form-group col-lg-2">
            <label><spring:message code="billing_counter.label" /></label>
            <select class="form-control" name="counter" id="counter" readonly>
            	 <option value="${counter}">${counter}</option>
            </select>
            <span id="counterError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
          </div><div class="form-group col-lg-1"></div>
          
          <div class="form-group col-lg-2">
            <label><spring:message code="shift.label" /></label>
            <select class="form-control" name="shiftId" id="shiftId" readonly>
            	 <option value="${shiftId}">${shiftId}</option>
            </select>
            <span id="shiftError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
          </div>
          <div class="form-group col-lg-1"></div>
           <div class="form-group col-lg-2">
              <label><spring:message code="date.label" /> <span class="requiredField">*</span> </label>
              <!-- <div class="input-group">
                <div class="input-group-addon">
                  <i class="fa fa-calendar"></i>
                </div>
                <input class="form-control" name="date" id="date" size="20" type="text" onfocus="callCalenderYYYYMMDD('date')" onclick="callCalenderYYYYMMDD('date')" placeholder="YYYY/MM/DD"/> -->
                <input class="form-control calendar_icon" readonly="readonly" value="${date}" style="background-color: white;" name="date" id="date" size="20" type="text" onfocus="callCalender('date')" onclick="callCalender('date')" placeholder="DD/MM/YYYY"/>
               <!--  <input type="text" name="date" id="date" required class="form-control" data-inputmask="'alias': 'yyyy/mm/dd'" data-mask/> -->
            <!--  </div> --><!-- /.input group -->
             <span id="dateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
           </div><div class="form-group col-lg-1"></div>
         </div>
          <br/>
         <%-- <div class="row" style="text-align: center;">
		   <input type="button" class="btn bg-olive btn-inline" onclick="generateReport('X','');" style="" value="<spring:message code="generate.report.label" />" />
		 </div> --%>
		
		 <div id="triggerEvent"></div>
   <div class="modal fade" id="myModalIos" role="dialog" tabindex="-1">
    <div class="modal-dialog iosmodeldialog">
    
      <!-- Modal content-->
      <div class="modal-content iospopup">
        <div class="modal-header">
       
          <button type="button" class="close" onclick="" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
       <div class="form-group col-lg-12" style="padding: 0px;font-size: 15px">Are you sure,you want to save the  file
       
          <!-- <div class="col-lg-1"> -->
         
        <!--  </div> -->
         </div>
        <div class="form-group col-lg-12"></div>
          <div class="col-lg-4 col-sm-6 col-xs-6" style=""></div>
          <div class="form-group col-lg-8 col-sm-6 col-xs-6" style="padding-left: 0px; padding-right: 0px;">
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
 <input type="button" class="iosclosebutton1" onclick="generateReport('X','save');"  value="Ok">
</div>
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
  <input type="button" class="iosclosebutton1" data-dismiss="modal" value="Cancel">
</div></div>
   <br/>
        </div>
        <br/>
        <div class="modal-footer" style="padding:0px;">
         <!--  <input type="button" class="iosclosebutton" data-dismiss="modal" value="Close"/> -->
        </div>
      </div>
      
		</div>
		</div>
		
		<div class="modal fade" id="DenominationsModelID" role="dialog" tabindex="-1">
    <div class="modal-dialog iosmodeldialog">
    
      <!-- Modal content-->
      <div class="modal-content iospopup">
        <div class="modal-header">
       
          <button type="button" class="close" onclick="" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
       <div class="form-group col-lg-12" style="padding: 0px;font-size: 15px">Are you sure, You want to update cash denominations?
       
          <!-- <div class="col-lg-1"> -->
         
        <!--  </div> -->
         </div>
        <div class="form-group col-lg-12"></div>
          <div class="col-lg-2 col-sm-6 col-xs-6" style=""></div>
          <div class="form-group col-lg-8 col-sm-6 col-xs-6" style="padding-left: 0px; padding-right: 0px;">
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
 <input type="button" class="iosclosebutton1"  onclick="UpdateDenominations();"  value="Ok">
</div>
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
  <input type="button" class="iosclosebutton1" data-dismiss="modal" value="Cancel">
</div></div>
   <br/>
        </div>
        <br/>
        <div class="modal-footer" style="padding:0px;">
         <!--  <input type="button" class="iosclosebutton" data-dismiss="modal" value="Close"/> -->
        </div>
      </div>
		</div>
		</div>
		
          <br/>
          <div id="xReportsDisplay" style="">
             <%@ include file="showXReport.jsp" %>
          </div>
      </div>
    </div>
  </div>
</div>
   <%@ include file="savePopUp.jsp"%>
</section><!-- /.content -->
 <!-- <script type="text/javascript">
            $(function() {
                //Datemask dd/mm/yyyy
                $("#date").inputmask("yyyy/mm/dd", {"placeholder": "yyyy/mm/dd"});
            });
            </script>  -->                       
</body>
</html>