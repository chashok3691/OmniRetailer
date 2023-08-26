<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri.S
 * file name		        : Inventory Manager/Reports/salesReportsCounterWise.jsp
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
		callCalender('startDate');
		callCalender('endDate');
// 		 var zone = $("#outletZone").val();
// 		 if( zone != null && zone !="")
// 			 {
// 			 	searchlocationsBasedOnZoneForDashboard('outletZone','location','');
// 			 }
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
<div id="gensalereportcriteriawise">
				<section class="content-header">
                    <h1>
                       <spring:message code="outlet_management.reports.label"/>&nbsp;<spring:message code="sales.reports.label"/>&nbsp;&#45;&nbsp;<spring:message code="hour.wise.sales.label"/>&nbsp;<spring:message code="report.label"/>
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
       <div class="col-lg-12">
         <div class="col-lg-11" style=" background: #f4f4f4;    padding: 10px 20px;    width: 88%;">
                  <div class="row">
                         <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="zone.label"/></label>
                           <select class="form-control" id="outletZone" onchange="searchZonallocationsBasedOnZone('outletZone','location','')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
                         </div>
                      </div>
                     
                      <div class="col-lg1-2 col-lg-2">
                     <div class="col-lg-12" style="">
                 	<label>Sales Channel</label>
	             	<select class="form-control form-group" id="salesChannel" style=" padding-left: 5px !important;" onchange="">
                    	<option value=""><spring:message code="ALL.label"/></option>
							<option value="<spring:message code="sales.channel.direct"/>"><spring:message code="sales.channel.direct"/></option>
							<option value="<spring:message code="sales.channel.online"/>"><spring:message code="sales.channel.online"/></option>
							<option value="<spring:message code="sales.channel.mobile"/>"><spring:message code="sales.channel.mobile"/></option>
							<option value="<spring:message code="sales.channel.salesExecutive"/>"><spring:message code="sales.channel.salesExecutive"/></option>
                 	</select>
          
                    </div>
                     </div>
                  
                       
                         <div class="col-lg1-2 col-lg-2">
              <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
                 		<label><spring:message code="offer_start_date.label"/></label>
                	 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${startdate}" style="background-color: white;" id="startDate" size="20" type="text" onfocus="callCalender('startDate')" onclick="callCalender('startDate')" placeholder="DD/MM/YYYY" />
	              </div>
	            </div>
	           
                    </div>
                     <div class="row">
                       <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="location.label"/></label>
                           <select class="form-control" id="location" >
<%--                            		 <option value="all"><spring:message code="ALL.label"/></option> --%>
	                            <c:forEach var="location" items="${workLocationsList}">
<%-- 									<option value="${location}" ${location == loc ? 'selected' : ''} id="${location}" >${location}</option> --%>
						 		<c:choose>
							     <c:when test="${location.description == ''}">
							       <option value="${location.locationId}" ${location.locationId == loc ? 'selected' : ''}>${location.locationId}</option>
							     </c:when>
							    <c:otherwise>
							     <option value="${location.locationId}" ${location.locationId == loc ? 'selected' : ''}>${location.locationId}-${location.description}</option>
							    </c:otherwise>
							   </c:choose>
						 		
						 		
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                            <div class="col-lg1-2 col-lg-2">
                   
                        <div class="col-lg-12" style="">
                 	<label>Hour-wise</label>
	             	<select class="form-control form-group" id="hourselection" style=" padding-left: 5px !important;" onchange="">
                    	<option value=""><spring:message code="ALL.label"/></option>
							<option value="00-01" selected="selected"  >00-01</option>
							<option value="01-02">01-02</option>
							<option value="02-03">02-03</option>
							<option value="03-04">03-04</option>
							<option value="04-05">04-05</option>
							<option value="05-06">05-06</option>
							<option value="06-07">06-07</option>
							<option value="07-08">07-08</option>
							<option value="08-09">08-09</option>
							<option value="09-10">09-10</option>
							<option value="10-11">10-11</option>
							<option value="11-12">11-12</option>
							<option value="12-13">12-13</option>
							<option value="13-14">13-14</option>
							<option value="14-15">14-15</option>
							<option value="15-16">15-16</option>
							<option value="16-17">16-17</option>
							<option value="17-18">17-18</option>
							<option value="18-19">18-19</option>
							<option value="19-20">19-20</option>
							<option value="20-21">20-21</option>
							<option value="21-22">21-22</option>
							<option value="22-23">22-23</option>
							<option value="23-0">23-0</option>
                 	</select>
          
                    </div>
                    </div>
                      <div class="col-lg1-2 col-lg-2">
	               <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="offer_end_date.label"/></label>
	                 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${enddate}" style="background-color: white;" id="endDate" size="20" type="text" onfocus="callCalender('endDate')" onclick="callCalender('endDate')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div>
                    </div>
                  </div>
                  <div class="col-lg-1" style="width: 12%;background: #ccc;">
                  <div class="col-lg-12" style="border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">
                  <div class="row">
                  <a onclick="generateSalesReportCriteriaWise('${criteria}','validationCheck','0','NOPOP','${flowLocation}');" class="button"><spring:message code="searchbutton.label"/></a>
                  </div>
                  <div class="row">
                  <a onclick="resetForm();" class="button"><spring:message code="clearbutton.label"/></a>
                  </div>
                  </div></div>
       </div>    
            
       <%--   <div class="row">
         <div class="row" style="padding-left: 25px;">
         <div class="form-group col-lg-3" style="padding-right: 60px">
            <label><spring:message code="location.label" /></label>
            <select class="form-control" name="location" id="location">
               <c:forEach var="location" items="${workLocationsList}">
            	 <option value="${location}">${location}</option>
 	           </c:forEach>
 	        </select>
          </div>
          <div class="form-group col-lg-3"></div>
          <div class="form-group col-lg-2">
            <label><spring:message code="billing_counter.label" /></label>
            <select class="form-control" name="counter" id="counter">
               <c:forEach var="counter" items="${countersList}">
            	 <option value="${counter}">${counter}</option>
 	           </c:forEach>
            </select>
            <span id="counterError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
            <label><spring:message code="offer_start_date.label" /></label>
            <input class="form-control calendar_icon" readonly="readonly" style="background-color: white;" name="startDate" id="startDate" size="20" type="text" onfocus="callCalender('startDate')" onclick="callCalender('startDate')" placeholder="DD/MM/YYYY"/>
             <span id="startDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
          </div>
          
          <div class="form-group col-lg-2">
           	 <label><spring:message code="offer_end_date.label" /></label>
             <input class="form-control calendar_icon" readonly="readonly" style="background-color: white;" name="endDate" id="endDate" size="20" type="text" onfocus="callCalender('endDate')" onclick="callCalender('endDate')" placeholder="DD/MM/YYYY"/>
             <span id="endDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
          </div>
          <div class="col-lg-2" style="text-align: center;margin-top: 17px">
		   <input type="button" class="btn bg-olive btn-inline" onclick="generateSalesReportCriteriaWise('${criteria}','','0');" style="" value="<spring:message code="generate.report.label" />" />
		 </div>
		 
        
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
 <input type="button" class="iosclosebutton1" onclick="generateSalesReportCriteriaWise('${criteria}','save','0');"  value="Ok">
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
         </div>
         
         </div>
          
          <br/> --%>
         
		 <input type="hidden" id="criteria" value="${criteria}">
          <div id="xReportsDisplay" style="">
            <%@ include file="viewHourSalesReport.jsp" %>
          </div>
      </div>
    </div>
  </div>
</div>
 <%@ include file="savePopUp.jsp"%>
</section><!-- /.content -->
</div>
</body>
</html>