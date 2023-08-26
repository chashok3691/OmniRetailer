<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/loyaltyPrograms/customerView.jsp
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
	 <script src="${pageContext.request.contextPath}/js/form_plugin.js"></script> 
	 	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/controller.js"></script>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/countriesAndStates.js"></script>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/crm/customer.js"></script>
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
.buttons {
	/* float: right; */
	padding-top: 0px;
	/* margin-right: 2%; */
	margin-top:1%;
}
a.button, .list a.button {
position:relative;
	text-decoration: none;
	color: black;
	display: inline-block;
	padding: 5px 10px 5px 10px;
	background: rgb(195,195,195);
	border-radius: 5px;
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
}	

</style>
<script type="text/javascript">
$(document).ready(function(){
	callCalender('from');
	callCalender('to');
});
</script>
</head>
<body>
<section class="content">
<div class="row">
  <div class="col-xs-12">
	<div class="box box-primary">
		 <%-- <div class="box-header" style="text-align: center">
		   <h3><spring:message code="customer.view.label" /></h3>
		 </div> --%><!-- /.box-header -->
    <!-- form start -->
    <form id="customersInfo" method="post">
        <div class="box-body">
        <br>
        <div id="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;">${err}</div>
       	<div class="row" style="padding-left: 10px; padding-right: 24px;">
               <div class="col-lg-2" style="">
                  <%-- <div class="col-lg-4" style="text-align:right;top:5px;">
                    <label><spring:message code="location.label"/></label>
                  </div> --%>
                   <label><spring:message code="location.label"/></label>
                    <select class="form-control" id="outletLocation" onchange="">
<%--                        <option value=""><spring:message code="ALL.label"/></option> --%>
                       <c:forEach var="location" items="${locationsList}">
						<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option>
					   </c:forEach>
                   </select>
               </div>
                  <div class="col-lg-2">
                <div class="row">
                 
                 <%--  <div class="col-lg-10">
                  <label><spring:message code="time.cycle.label"/></label>
                    <select class="form-control" id="timeCycle">
                    	<option value="date">Date</option>
                    	<option value="weekly">Week</option>
                      	<!-- <option value="Fortnight">Fortnight</option> -->
                      	<option value="monthly">Monthly</option>
                      	<option value="quarterly">Quarterly</option>
                      	<option value="yearly">Yearly</option>
                   </select>
                  </div> --%>
               </div>
               </div>
               <div class="col-lg-4"></div>
               <div class="col-lg-3" style="    padding-right: 0px;">
								        <div class="col-lg-6" style="    padding-left: 0px;padding-right: 0px;">
								        <label><spring:message code="offer_start_date.label"/></label>
							              <div class="col-lg-12" style="    padding-left: 0px;padding-right: 0px;">
							                	 <div class="col-lg-12 col-xs-8 col-sm-12 col-md-12" style="padding-left: 0px;">
							                	 	<!-- <input type="hidden" id="sd" value="12/01/2017">
								                    <input type="hidden" id="ed" value=""> -->
							                	 	<input class="form-control calendar_icon form-group " readonly="readonly" value="" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="From Date">
							                	 </div>
								              </div>
								            </div>
								            <div class="col-lg-6" style="    padding-left: 0px;padding-right: 0px;">
								             <label><spring:message code="offer_end_date.label"/></label>
								               <div class="col-lg-12" style="    padding-left: 0px;padding-right: 0px;">
								                 <div class="col-lg-12 col-xs-8 col-sm-12 col-md-12" style="padding-left: 0px;">
								                 	<input class="form-control calendar_icon  form-group" readonly="readonly" value="" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="End Date">
							                	  </div>
									           </div>
									          </div></div>
								        
             <%-- <div class="col-lg-3">
                <div class="row">
                  <div class="col-lg-5" style="text-align:right;top:5px;">
                    <label><spring:message code="offer_start_date.label"/></label>
                  </div>
                  <div class="col-lg-7">
                    <label><spring:message code="offer_start_date.label"/></label>
                    <input class="form-control calendar_icon" readonly="readonly" value="${startDate}" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="From Date" />
                  </div>
               </div>
               </div>
               <div class="col-lg-3">
                <div class="row">
                  <div class="col-lg-5" style="text-align:right;top:5px;">
                    <label><spring:message code="offer_end_date.label"/></label>
                  </div>
                  <div class="col-lg-7">
                   <label><spring:message code="offer_end_date.label"/></label>
                    <input class="form-control calendar_icon" readonly="readonly" value="${endDate}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="End Date" />
                  </div>
               </div>
               </div> --%>
           
                 <div class="col-lg-1" style="text-align: right;margin-top: 18px;padding-right: 0px;">
              		 <input type="button" id="submit" style="position: relative;" class="btn bg-olive btn-inline addBtn" onclick="searchAvgStock('0')" value="&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="search" />&nbsp;&nbsp;&nbsp;&nbsp;" />
               </div>
      </div>
      <br>
      <div class="row" style="padding-left: 10px; padding-right: 10px;">
               <div class="col-lg-3">
                <%-- <div class="row">
                  <div class="col-lg-4" style="text-align:right;top:5px;">
                    <label><spring:message code="filter.by.label"/></label>
                  </div>
                  <div class="col-lg-8">
                    <select class="form-control" id="filterBy" onchange="">
                    	<option value="select">-- Select --</option>
                    	<option value="category">Category</option>
                    	<option value="skuId">SKU</option>
                   </select>
                  </div>
               </div> --%>
               </div>
               <div class="col-lg-3"></div>
               <div class="col-lg-3"></div>
              <%--  <div class="col-lg-3" style="text-align: right;">
              		 <input type="button" id="submit" style="position: relative;" class="btn bg-olive btn-inline" onclick="searchAvgStock('0')" value="&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="search" />&nbsp;&nbsp;&nbsp;&nbsp;" />
               </div> --%>
        </div>
          <div id="inventoryTable">
          	<%@ include file="inventoryReport.jsp" %>
          </div>
      </div>
         <div class="box-footer"></div>
     </form>
 </div>
</div>
</div>
</section><!-- /.content -->
</body>
</html>