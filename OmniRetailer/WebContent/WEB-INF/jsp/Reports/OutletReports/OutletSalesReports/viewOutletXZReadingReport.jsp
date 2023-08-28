<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : Inventory Manager/Reports/viewOutletXZReadingReport.jsp
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
         <!-- InputMask -->
        <%-- <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script> --%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
   
   <script type="text/javascript">

	$(document).ready(function(){
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
				<input type="hidden" id="stockdownloadurl" value="${downloadurl}">
                    <h1>
                       <spring:message code="outlet_management.reports.label"/>&nbsp;<spring:message code="sales.reports.label"/>&nbsp;&#45;&nbsp;<spring:message code="xzreading.reports.label"/>&nbsp;<spring:message code="report.label"/>
                    </h1>
                    <%-- <ol class="breadcrumb">
                        <li><a href="#" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
                        <li><a href="#" onclick="showReportsFlows();"><spring:message code="reports.label"/></a></li>
                        <li><a href="#" onclick="showOutletReportsFlows();"><spring:message code="outlet_management.reports.label"/></a></li>
                        <li><a href="#" onclick="showOutletSalesReportsFlows();"><spring:message code="sales.reports.label"/></a></li>
                        <li class="active"><spring:message code="xzreading.reports.label"/></li>
                    </ol> --%>
                </section>
                
                         <!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
	<div class="box box-primary">
       <div class="box-body">      
         <div class="row">
         <div class="form-group col-lg-3">
         </div>
         <div class="form-group col-lg-3">
            <label><spring:message code="location.label" /></label>
            <select class="form-control" name="location" id="location" onchange="return changeInfoBasedOnLocation(this.options[this.selectedIndex].value);">
               <c:forEach var="location" items="${workLocationsList}">
            	 <option value="${location}">${location}</option>
 	           </c:forEach>
 	        </select>
          </div>
          <div class="form-group col-lg-3">
              <label><spring:message code="date.label" /> <span class="requiredField">*</span> </label>
              <!-- <div class="input-group">
                <div class="input-group-addon">
                  <i class="fa fa-calendar"></i>
                </div>
                 <input class="form-control" name="date" id="date" size="20" type="text" onfocus="callCalenderYYYYMMDD('date')" onclick="callCalenderYYYYMMDD('date')" placeholder="YYYY/MM/DD"/>
             </div> --><!-- /.input group -->
               <input class="form-control calendar_icon" readonly="readonly" style="background-color: white;" name="date" id="date" size="20" type="text" onfocus="callCalender('date')" onclick="callCalender('date')" placeholder="DD/MM/YYYY"/>
             <span id="dateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
           </div>
            <div class="form-group col-lg-3">
            </div>
         </div>
          <br/>
         <div class="row" style="text-align: center;">
		   <input type="button" class="btn bg-olive btn-inline" onclick="generateReport('XZ');" style="" value="<spring:message code="generate.report.label" />" />
		 </div>
          <br/>
          <div id="xzReportsDisplay" style="">
            
          </div>
      </div>
    </div>
  </div>
</div>
</section><!-- /.content -->
 <!-- <script type="text/javascript">
            $(function() {
                //Datemask dd/mm/yyyy
                $("#date").inputmask("yyyy/mm/dd", {"placeholder": "yyyy/mm/dd"});
            });
            </script>  -->                       
</body>
</html>