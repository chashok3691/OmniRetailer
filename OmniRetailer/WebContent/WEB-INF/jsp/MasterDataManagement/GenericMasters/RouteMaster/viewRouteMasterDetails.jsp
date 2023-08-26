<!--/*
 * Project Name 	        : OmniRetailer
 * Written By		        : Vijay
 * file name		        : Warehouse Management/Stocks Management/shipments/newInvoicing.jsp
 * file type		        : JSP
 * description				: The new Creation form of shipment invoice is displayed using this jsp
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <!DOCTYPE html>
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 -->

<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

	 <!-- DATA TABLES -->
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
<%-- 	<script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script> --%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/masterDataManagement/genericMasters/routeMaster.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script type="text/javascript">
$(document).ready(function(){
	
	callCalender('startDate');
	callCalender('endDate');
	
});
</script>
<style type="text/css">
  /* .odd{display:none!important;} */
.buttons {
	float: left;
	padding-top: 0px;
	margin-right: 2%;
	margin-top: 1%;
}
a.button, .list a.button {
position:relative;
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 3.6px 10px 3.8px 10px;
	/* border-radius: 5px; */
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
	font-weight: normal; 
    background-color: rgb(128,128,128);
}
@media (min-width:1200px) and (max-width:1600px)
{
	.lbl{
		text-align:right;
		padding-right: 0px;
	}
}
@media only screen and (max-width:1200px)
{
.lbl{
		text-align:left;
	}
}
.row-fluid-5 {
   width: 100%;
   *zoom: 1;
 }
 .row-fluid-5:before,
 .row-fluid-5:after {
   display: table;
   line-height: 0;
   content: "";
 }
 .row-fluid-5:after {
   clear: both;
 }
 .row-fluid-5 [class*="span"] {
   display: block;
   float: left;
   width: 100%;
   min-height: 30px;
   margin-left: 1.875%;
   *margin-left: 1.875%;

   -webkit-box-sizing: border-box;
   -moz-box-sizing: border-box;
   box-sizing: border-box;
 }
 .row-fluid-5 .controls-row [class*="span"] + [class*="span"] {

   margin-left: 1.875%;
 }
 .row-fluid-5 [class*="span"]:first-child{
    margin-left: 0;
 }
 .row-fluid-5 .span2 {
   width: 18.5%;
   *width: 18.5%;
 }
 /* responsive ONLY */
 @media (max-width: 600px){ /* spans reduce to 100px then go full width */
    .row-fluid-5 [class*="span"]{
    margin-left: 0;
    float: left;
    width: 100%;
    padding: 10px; 
    }
    }
   
 }
</style>


	

</head>
<body>
<!-- Content Header (Page header) -->

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
				<div class="box box-primary">
                                <div class="box-header" style="text-align: left;">
                                <h3 style="text-align:center;">View Route Master Details</h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                              <c:forEach  items="${routeList}" var="routeList" varStatus="">
                                    <div class="box-body" style="margin-right:1%;margin-left:5%">
                                     <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                                     <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
                <br>     
                    
                    
        <div class="row">
        <div class="col-lg-4 col-xs-4 col-sm-4">
       
        <div class="row" style="padding: 4px; white-space:nowrap;margin-bottom: 14px;">
        <div  class="col-lg-4 col-xs-3 col-sm-3">
         <label><spring:message code="route.id.label"/></label>
        </div>
          <div  class="col-lg-6 col-xs-6 col-sm-6" style="padding-left: 0px;">
           <input type="text" class="form-control"  disabled name="routeId" id="routeId" value="${routeList.routeId}"  placeholder="<spring:message code="enterroute.id.label" />">
        </div>
        </div>
         <div class="row" style="padding: 4px;white-space:nowrap;margin-bottom: 14px;">
        <div  class="col-lg-4 col-xs-3 col-sm-3">
         <label><spring:message code="route.name.label"/></label>
        </div>
          <div  class="col-lg-6 col-xs-6 col-sm-6" style="padding-left: 0px;">
           <input type="text"class="form-control" disabled  name="routeName" id="routeName" value="${routeList.routeName}" placeholder="<spring:message code="enterroute.name.label" />">
        </div>
        </div>
         <div class="row" style="padding: 4px;white-space:nowrap;">
        <div  class="col-lg-4 col-xs-3 col-sm-3">
         <label><spring:message code="route.category.label"/></label>
        </div>
          
          <div class="col-lg-6 col-xs-6 col-sm-6" style="padding-left: 0px;">
          
             <select class="form-control" id="routeCategory" disabled onchange="searchlocationsBasedOnZoneForDashboard('outletZone','outletLocation','')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == routeList.zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
          </div>
        </div>
          
           
        </div>
        
        
         <div class="col-lg-4 col-xs-4 col-sm-4">
         <div class="row" style="padding: 4px;margin-bottom: 14px;">
        <div  class="col-lg-4 col-xs-5 col-sm-5" style="white-space:nowrap;">
         <label><spring:message code="zone.label"/></label>
        </div>
          <div  class="col-lg-6 col-xs-6 col-sm-6" style="padding-left: 0px;">
         <select class="form-control" id="outletZone" disabled onchange="searchlocationsBasedOnZoneForDashboard('outletZone','outletLocation','')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <%-- <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach> --%>
	                        </select>
        </div>
        </div>
        <div class="row" style="padding: 4px;margin-bottom: 14px;">
        <div  class="col-lg-3 col-xs-4 col-sm-4" style="white-space:nowrap;">
         <label><spring:message code="pickup.lcation.label"/></label>
        </div>
        <div class="col-lg-1"></div>
          <div  class="col-lg-6 col-xs-6 col-sm-6" style="padding-left: 0px;">
           <select class="form-control" name="location" disabled id="location" >
                <c:forEach var="location" items="${locationsList}">
                    <option value="${location.locationId}" ${location.locationId == routeList.pickupPoint ? 'selected' : ''}>${location.locationId}</option>
                 </c:forEach>
            </select> 
<%--            <input type="text" class="form-control" name="pickUpLocation" id="pickUpLocation" value="" placeholder="<spring:message code="enterpickup.lcation.label" />"> --%>
        </div>
        </div>
         <div class="row" style="padding: 4px; ">
        <div  class="col-lg-4 col-xs-4 col-sm-4" style="width:32%;white-space:nowrap;">
         <label><spring:message code="end.point.label"/></label>
        </div>
       <div  class="col-lg-6 col-xs-6 col-sm-6" style="padding-left: 6px;">
           <input type="text" class="form-control" style="" disabled name="endPoint" value="${routeList.endPoint}" placeholder="<spring:message code="enterend.point.label" />"  id="endPoint" />
											
           <%-- <input type="text" name="supplierRef" id="supplierRef" value="${itemLists.supplierName}"> --%>
        </div>
        </div>
        

        </div>
        
        
        
          <div class="col-lg-4 col-xs-4 col-sm-4">
         <div class="row" style="padding: 4px;margin-bottom: 14px;">
        <div  class="col-lg-4 col-xs-4 col-sm-4" style="width:27%;">
        <label><spring:message code="newarrival.startdate"/></label>
        </div>
          <div  class="col-lg-6 col-xs-6 col-sm-6" style="padding-left: 0px;">
          <input class="form-control calendar_icon" disabled  readonly="readonly"  name="startDate" id="startDate" value="${routeList.startDateStr}" style="background-color: white;"  size="20" type="text" onfocus="callCalender('startDate')" onclick="callCalender('startDate')" placeholder="DD/MM/YYYY">
        </div>
        </div>
        <div class="row" style="padding: 4px;margin-bottom: 14px;">
        <div  class="col-lg-4 col-xs-4 col-sm-4" style="width:27%;">
            <label><spring:message code="newarrival.enddate"/></label>
        </div>
          <div  class="col-lg-6 col-xs-6 col-sm-6" style="padding-left: 0px;">
         <input class="form-control calendar_icon"  disabled readonly="readonly"  name="endDate" id="endDate" value="${routeList.endDateStr}" style="background-color: white;"  size="20" type="text" onfocus="callCalender('endDate')" onclick="callCalender('endDate')" placeholder="DD/MM/YYYY">
        </div>
        </div>
        
        <div class="row" style="padding: 4px;margin-bottom: 14px;">
        <div  class="col-lg-4 col-xs-4 col-sm-4" style="width:26%;">
            <label><spring:message code="Status.label"/></label>
        </div>
          <div  class="col-lg-6 col-xs-6 col-sm-6" style="padding-left: 0px;">
        <select class="form-control" name="routeStatusStr" id="routeStatusStr">
											<option value="1" ${routeList.routeStatus==true?'selected':''}>Active</option>
											<option value="0"  ${routeList.routeStatus==false?'selected':''}>Disabled</option>
											
										</select>
        </div>
        </div>

        </div>
        
        
        
        <%--   <div class="col-lg-4 col-xs-4 col-sm-4">
         <div class="row" style="padding: 4px;margin-bottom: 14px;">
        <div  class="col-lg-5 col-xs-5 col-sm-5" style="white-space:nowrap;">
         <label><spring:message code="newarrival.startdate"/></label>
        </div>
          <div  class="col-lg-6 col-xs-6 col-sm-6">
           
         <input class="form-control calendar_icon"  readonly="readonly"  name="startDate" id="startDate" value="" style="background-color: white;"  size="20" type="text" onfocus="callCalender('startDate')" onclick="callCalender('startDate')" placeholder="DD/MM/YYYY">
           
        </div>
        </div>
        <div class="row" style="padding: 4px;margin-bottom: 14px;">
        <div  class="col-lg-5 col-xs-5 col-sm-5" style="white-space:nowrap;">         
        <label><spring:message code="newarrival.enddate"/></label>
        </div>
          <div  class="col-lg-5 col-xs-5 col-sm-5">
          <input class="form-control calendar_icon"  readonly="readonly"  name="endDate" id="endDate" value="" style="background-color: white;"  size="20" type="text" onfocus="callCalender('endDate')" onclick="callCalender('endDate')" placeholder="DD/MM/YYYY">
          
        </div>
        </div>
        
        
         
        </div> --%>
        </div>
       <%--   <div class="row">
                      <div class="col-lg-12">
                      <div class="col-lg-10"></div>
                      <div class="col-lg-1" style="margin-right:1%">
                        <div class="buttons" style="margin-bottom: -5px;text-align:right">
		  				     <a onclick="appendRouteMapDetails();" class="btnCls"><font size="2px"><spring:message code="addnew.label" /></font></a>
		   			    </div>
		   			    </div>
                   		</div>
   </div> --%>
                 <div class="row">
               <div class="col-lg-12">  
                   <div class="col-lg-12" id="WeeklyExecution" style="margin-top:17px;">
                   
                                        <c:if test="${routeList.day1 ==true}">
                                        <input type="checkbox"  id="mondayChkbox" checked style="vertical-align: -2px">
                                        </c:if>
                                         <c:if test="${routeList.day1 == false}">
                                        <input type="checkbox"  id="mondayChkbox"  style="vertical-align: -2px">
                                        </c:if>
                                        <label style="font-size: 15px;"><spring:message code="monday.label"/></label>  
                                        &nbsp; &nbsp; &nbsp;&nbsp;
                                        
                                         <c:if test="${routeList.day2 ==true}">
                                        <input type="checkbox"  id="tuesdayChkbox" checked style="vertical-align: -2px">
                                        </c:if>
                                         <c:if test="${routeList.day2 ==false}">
                                        <input type="checkbox"  id="tuesdayChkbox"  style="vertical-align: -2px">
                                        </c:if>
                                        <label style="font-size: 15px;"><spring:message code="tuesday.label"/></label>  
                                         &nbsp; &nbsp;&nbsp; &nbsp;
                                         
                                         <c:if test="${routeList.day3 ==true}">
                                        <input type="checkbox"  id="wednesdayChkbox" checked style="vertical-align: -2px">
                                        </c:if>
                                         <c:if test="${routeList.day3 ==false}">
                                        <input type="checkbox"  id="wednesdayChkbox"  style="vertical-align: -2px">
                                        </c:if>
                                        <label style="font-size: 15px;"><spring:message code="wednesday.label"/></label> 
                                         &nbsp; &nbsp;&nbsp; &nbsp;
                                         
                                          <c:if test="${routeList.day4 ==true}">
                                        <input type="checkbox"  id="thursdayChkbox"  checked style="vertical-align: -2px">
                                      </c:if> 
                                      <c:if test="${routeList.day4 ==false}">
                                        <input type="checkbox"  id="thursdayChkbox"  style="vertical-align: -2px">
                                      </c:if> 
                                       <label style="font-size: 15px;"><spring:message code="thursday.label"/></label> 
                                        &nbsp; &nbsp;&nbsp; &nbsp;
                                        
                                         <c:if test="${routeList.day5 ==true}">
                                        <input type="checkbox"  id="fridayChkbox" checked style="vertical-align: -2px">
                                        </c:if>
                                         <c:if test="${routeList.day5 ==false}">
                                        <input type="checkbox"  id="fridayChkbox" style="vertical-align: -2px">
                                        </c:if>
                                        <label style="font-size: 15px;"><spring:message code="friday.label"/></label> 
                                        &nbsp; &nbsp;&nbsp; &nbsp;
                                      
                                        <c:if test="${routeList.day6 ==true}">
                                        <input type="checkbox"  checked id="saturdayChkbox" style="vertical-align: -2px">
                                       </c:if>
                                        <c:if test="${routeList.day6 ==false}">
                                        <input type="checkbox"  id="saturdayChkbox" style="vertical-align: -2px">
                                       </c:if>
                                        <label style="font-size: 15px;"><spring:message code="saturday.label"/></label> 
                                        &nbsp; &nbsp;&nbsp; &nbsp;
                                        
                                          <c:if test="${routeList.day7 ==true}">
                                        <input type="checkbox" checked id="sundayChkbox" style="vertical-align: -2px">
                                       </c:if>
                                       <c:if test="${routeList.day7 ==false}">
                                        <input type="checkbox"  id="sundayChkbox" style="vertical-align: -2px">
                                       </c:if>
                                        <label style="font-size: 15px;"><spring:message code="sunday.label"/></label> 
                              </div>
                            </div>
                           </div>
                
                
                
                <div class="table-responsive" style="overflow-x:auto;margin-right: 6%;">
             <table id="productsList" class="table table-bordered table-hover">
               <thead style="background-color: #3c8dbc; color: #ffffff">
                 <tr>
                 	<th>S.No</th>
                 	<th><spring:message code="newarrival.startdate" /></th>
                     <th><spring:message code="newarrival.enddate" /></th>
                     <th><spring:message code="starttime.label" /></th>
                     <th><spring:message code="endtime.label" /></th>
                      <th><spring:message code="longitude.label" /></th>
                     <th><spring:message code="lattitude.label" /></th>
                      <th><spring:message code="report.description.laabel" /></th>
                      <th>Max Orders</th>
<%--                      <th><spring:message code="action.label"/></th> --%>
                </tr>
               </thead>
 			<tbody  style="text-align: center;">
 			<c:forEach items="${routeList.routeList}" var="routMapList" varStatus="theCount">
 			<tr>
 			<td>${theCount.count}</td>
 			   <%--  <c:set var="dateAndTime" value="${routeList.startDateStr}" />
 			     <c:set var="dateAndTime" value="${fn:split(dateAndTime,' ')}" />
 			      <c:set var="enddateAndTime" value="${routeList.endDateStr}" />
 			     <c:set var="enddateAndTime" value="${fn:split(enddateAndTime,' ')}" /> --%>
 				<td><input class="form-control calendar_icon startDate" value="${routMapList.startDateStr}" readonly="readonly" style="width:100px;background-color: white;" id="routeStartDate${theCount.count}" onfocus="callCalender('routeStartDate${theCount.count}')" onclick="callCalender('routeStartDate${theCount.count}')" placeholder='DD/MM/YYYY' type="text"/>
 			</td>
 			<td><input class="form-control calendar_icon startDate" value="${routMapList.endDateStr}" readonly="readonly" style="width:100px;background-color: white;" id="routeEndDate${theCount.count}" onfocus="callCalender('routeEndDate${theCount.count}')" onclick="callCalender('routeEndDate${theCount.count}')" placeholder='DD/MM/YYYY' type="text"/>
 			</td>
 			<td> <%--  <div class="bootstrap-timepicker">
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="start_time" id="mondayStartTime${theCount.count}" />
                                              
                                            </div>
                                        </div>
 			</td> --%>
 			
 			<input type="text" class="form-control timepicker" value="${routMapList.startTimeStr}" id="routeStartTime${theCount.count}"/></td>
 			<td><input type="text" class="form-control timepicker" value="${routMapList.endTimeStr}" id="routeEndTime${theCount.count}"/>
 			</td>
 			<td>${routMapList.gpsLatitude}</td>
 			<td>${routMapList.gpsLongitude}</td>
 			<td>${routMapList.description}</td>
 			<td>${routMapList.maximum_allowed_orders}</td>
<%--  			 <td id="Del${theCount.count}" ><img id="Img${theCount.count}" src="${pageContext.request.contextPath}/images/itemdelete.png" style="width:30px;cursor:pointer;" onclick="deleteItem(this);" /> --%>
 			</tr>
 			</c:forEach>
 			</tbody>
           </table>
           <br/>
         </div>
                
                              
          
           <br>				                                    

						</div><!-- /.box-body -->
					</c:forEach>	
						<div class="row" style="text-align: center;">
					<div class="form-group col-lg-12 col-xs-12" style="">
					<input type="hidden" id="flowUnder" value="${flowUnder}">
<%-- 				       <input type="button" class="btnCls" style="" onclick="return createRouteMaster('routeMaster','edit') ;" value="<spring:message code="submit.label" />" /> --%>
				 	<input type="button" class="btnCls " style="" onclick="return viewRouteMaster('routeMaster','0');" value="<spring:message code="cancel.label" />" />
				 
				</div>
				</div>
						
                                    <div class="box-footer">
                                    </div>
                                    </div>
                                
                            </div>

                  
		</div>
                               


</div>

</section><!-- /.content -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/timepicker/bootstrap-timepicker.min.js" ></script>
        <script type="text/javascript">
        $(".timepicker").timepicker({
            showInputs: false,
            showMeridian:false,
            showSeconds:true,
            
         });
        </script>
</body>
</html>
		    		 