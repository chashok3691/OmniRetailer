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
	<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.timepicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.timepicker.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/css/jquery.timepicker.min.css"></script>
	 --%><script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/timepicker/bootstrap-timepicker.min.js" ></script>
	<script type="text/javascript">
$(document).ready(function(){
	
	
	callCalender('startDate');
	callCalender('endDate');
	callCalender('routeStartDate1');
	callCalender('routeEndDate1');
// 	  $('input.timepicker').timepicker({});
	
});

$("#routeName").keydown(function(){
	$("#routeNameError").html("");
	$(".Error").html("");
});
</script>
<style type="text/css">
  /* .odd{display:none!important;} */
  
 .without_ampm::-webkit-datetime-edit-ampm-field {
   display: none;
 }
  
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
</style>
<!--  added by        :  koti bomminei
      description     :  to ristrict the user from entering special characters     -->

<script type="text/javascript">

	
	
	function gps(data){
		
		
		var x = $(data).val();
		if(x.includes(".") || x.includes("(0-9)")){
		
	}else{
		alert("Enter Correct Data");
		}
	}
	

</script>
	
	 

</head>
<body>
<!-- Content Header (Page header) -->

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
				<div class="box box-primary">
                                <div class="box-header" style="text-align: left;">
<%--                                 <h3 style="text-align:center;"><spring:message code="invoice.label" /></h3> --%>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                              
                                    <div class="box-body" style="margin-right:1%">
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
           <input type="text" class="form-control" onblur="criteria(this)"  name="routeId" id="routeId" value="${routeMaster.routeId}"  placeholder="<spring:message code="enterroute.id.label" />">
        </div>
        </div>
         <div class="row" style="padding: 4px;white-space:nowrap;margin-bottom: 14px;">
        <div  class="col-lg-4 col-xs-3 col-sm-3">
         <label><spring:message code="route.name.label"/><span style="color:red; font-size:2">*</span></label>
        </div>
          <div  class="col-lg-6 col-xs-6 col-sm-6" style="padding-left: 0px;">
           <input type="text"class="form-control"  onblur="criteria(this)" name="routeName" id="routeName" value="${routeMaster.routeName}" placeholder="<spring:message code="enterroute.name.label" />">
         <span id="routeNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
        </div>
        </div>
         <div class="row" style="padding: 4px;white-space:nowrap;">
        <div  class="col-lg-4 col-xs-3 col-sm-3">
         <label><spring:message code="route.category.label"/></label>
        </div>
          
          <div class="col-lg-6 col-xs-6 col-sm-6" style="padding-left: 0px;">
          
             <select class="form-control" id="routeCategory" onchange="searchlocationsBasedOnZone('outletZone','outletLocation','')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                        <%--     <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == routeMaster.zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach> --%>
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
         <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZone('outletZone','location','')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == routeMaster.zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
        </div>
        </div>
        <div class="row" style="padding: 4px;margin-bottom: 14px;">
        <div  class="col-lg-3 col-xs-4 col-sm-4" style="white-space:nowrap;">
         <label><spring:message code="pickup.lcation.label"/></label>
        </div>
        <div class="col-lg-1"></div>
          <div  class="col-lg-6 col-xs-6 col-sm-6" style="padding-left: 0px;">
           <select class="form-control" name="location" id="location" >
                <c:forEach var="location" items="${locationsList}">
                    <option value="${location.locationId}" ${location.locationId == routeMaster.pickupPoint ? 'selected' : ''}>${location.locationId}</option>
                 </c:forEach>
            </select> 
<%--            <input type="text" class="form-control" name="pickUpLocation" id="pickUpLocation" value="" placeholder="<spring:message code="enterpickup.lcation.label" />"> --%>
        </div>
        </div>
         <div class="row" style="padding: 4px; ">
        <div  class="col-lg-4 col-xs-4 col-sm-4" style="width:32%;white-space:nowrap;">
         <label><spring:message code="end.point.label"/></label>
        </div>
       <div  class="col-lg-6 col-xs-6 col-sm-6" style="padding-left:6px;">
           <input type="text" class="form-control" onblur="criteria(this)" style="" name="endPoint" value="${routeMaster.endPoint}" placeholder="<spring:message code="enterend.point.label" />"  id="endPoint" />
											
           <%-- <input type="text" name="supplierRef" id="supplierRef" value="${itemLists.supplierName}"> --%>
        </div>
        </div>
        

        </div>
        
        
        
          <div class="col-lg-4 col-xs-4 col-sm-4">
         <div class="row" style="padding: 4px;margin-bottom: 14px;">
        <div  class="col-lg-4 col-xs-4 col-sm-4" style="width:26%;">
        <label><spring:message code="newarrival.startdate"/><span style="color:red; font-size:2">*</span></label>
        </div>
          <div  class="col-lg-6 col-xs-6 col-sm-6" style="padding-left: 0px;">
          <input class="form-control calendar_icon"  readonly="readonly"  name="startDate" id="startDate" value="${routeMaster.startDateStr}" style="background-color: white;"  size="20" type="text" onfocus="callCalender('startDate')" onclick="callCalender('startDate')" placeholder="DD/MM/YYYY">
             <span id="startDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
      
        </div>
        </div>
        <div class="row" style="padding: 4px;margin-bottom: 14px;">
        <div  class="col-lg-4 col-xs-4 col-sm-4" style="width:26%;">
            <label><spring:message code="newarrival.enddate"/><span style="color:red; font-size:2">*</span></label>
        </div>
          <div  class="col-lg-6 col-xs-6 col-sm-6" style="padding-left: 0px;">
         <input class="form-control calendar_icon"  readonly="readonly"  name="endDate" id="endDate" value="${routeMaster.endDateStr}" style="background-color: white;"  size="20" type="text" onfocus="callCalender('endDate')" onclick="callCalender('endDate')" placeholder="DD/MM/YYYY">
       <span id="endDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
        </div>
        </div>
        
        <div class="row" style="padding: 4px;margin-bottom: 14px;">
        <div  class="col-lg-4 col-xs-4 col-sm-4" style="width:26%;">
            <label><spring:message code="Status.label"/></label>
        </div>
          <div  class="col-lg-6 col-xs-6 col-sm-6" style="padding-left: 0px;">
        <select class="form-control" name="routeStatusStr" id="routeStatusStr">
											<option value="1">Active</option>
											<option value="0">Disabled</option>
											
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
         <div class="row">
                       <div class="col-lg-12">
                      <div class="col-lg-10" id="WeeklyExecution" style="margin-top:17px;">
                      
                       <input type="checkbox" checked value="Monday" id="mondayChkbox" style="vertical-align: -2px">
                                        <label style="font-size: 15px;"><spring:message code="monday.label"/></label>  
                                          &nbsp; &nbsp; &nbsp;&nbsp;
                                        <input type="checkbox" checked value="Tuesday" id="tuesdayChkbox" style="vertical-align: -2px">
                                        <label style="font-size: 15px;"><spring:message code="tuesday.label"/></label>  
                                         &nbsp; &nbsp;&nbsp; &nbsp;
                                        <input type="checkbox" checked value="Wednesday" id="wednesdayChkbox" style="vertical-align: -2px">
                                        <label style="font-size: 15px;"><spring:message code="wednesday.label"/></label> 
                                         &nbsp; &nbsp;&nbsp; &nbsp;
                                        <input type="checkbox" checked value="Thursday" id="thursdayChkbox" style="vertical-align: -2px">
                                        <label style="font-size: 15px;"><spring:message code="thursday.label"/></label> 
                                        &nbsp; &nbsp;&nbsp; &nbsp;
                                        <input type="checkbox" checked value="Friday" id="fridayChkbox" style="vertical-align: -2px">
                                        <label style="font-size: 15px;"><spring:message code="friday.label"/></label> 
                                        &nbsp; &nbsp;&nbsp; &nbsp;
                                        <input type="checkbox" checked value="Saturday" id="saturdayChkbox" style="vertical-align: -2px">
                                        <label style="font-size: 15px;"><spring:message code="saturday.label"/></label> 
                                        &nbsp; &nbsp;&nbsp; &nbsp;
                                        <input type="checkbox" checked value="Sunday" id="sundayChkbox" style="vertical-align: -2px">
                                        <label style="font-size: 15px;"><spring:message code="sunday.label"/></label> 
           
                      
                      
                      </div>
                      <div class="col-lg-1" style="">
                        <div class="buttons" style="margin-bottom: -5px;text-align:right">
		  				     <a onclick="appendRouteMapDetails();" class="btnCls"style="margin-left:80px;margin-bottom:-15px"><font size="2px"><spring:message code="addnew.label" /></font></a>
		   			    </div>
		   			    </div>
                   		</div>
   </div>
               
                
                
                <div class="table-responsive" style="margin-right: -1%;">
             <table id="routeMasterTable" class="table table-bordered table-hover">
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
                     <th><spring:message code="action.label"/></th>
                </tr>
               </thead>
 			<tbody  style="text-align: center;">
 			<c:choose>
 			
 			<c:when test="${empty routeMaster.routeList}">
 			
 			 <tr id="dynamicdiv1">
 			<td id="slno1">1</td>
 			<td><input class="form-control calendar_icon startDate"  readonly="readonly" style="width:100px;background-color: white;" id="routeStartDate1" onfocus="callCalender('routeStartDate1')" onclick="callCalender('routeStartDate1')" placeholder='DD/MM/YYYY' type="text"/>
 			</td>
 			<td><input class="form-control calendar_icon startDate"  readonly="readonly" style="width:100px;background-color: white;" id="routeEndDate1" onfocus="callCalender('routeEndDate1')" onclick="callCalender('routeEndDate1')" placeholder='DD/MM/YYYY' type="text"/>
 			</td>
 			<td><input type="text" class="form-control timepicker"   placeholder="HH:MM:SS" id="routeStartTime1" onBlur="validatetime()"/>
 			</td>
 			<td><input type="text" class="form-control timepicker"  placeholder="HH:MM:SS"  id="routeEndTime1" onBlur="validateEndtime()"/>
 			</td>
 			<td><div ><input type='number' onblur="criteria(this)" id="latitude1"  style='vertical-align: -2px;width:100%' ></div>
 			</td>
 			<td><div ><input type='number' id="langitude1" onblur="criteria(this)"  style='vertical-align: -2px;width:100%' ></div>
 			</td>
 		     <td><div style="width: 170px;"><input type="text" onblur="criteria(this)" id="description1"  style='vertical-align: -2px' class='sun'></div></td>
 		     <td><div><input type="number" onblur="criteria(this)" id="maxOrders1"  style='vertical-align: -2px;width:100%' class='sun'></div></td>
 			
 			 <td id="Del1" ><img id="Img1" src="${pageContext.request.contextPath}/images/itemdelete.png" style="width:30px;cursor:pointer;" onclick="deleteItem(this);" /></td>
 			</tr>
 			</c:when>
 			<c:otherwise>
 			
 	  <c:forEach items="${routeMaster.routeList}" var="routMapList" varStatus="theCount">
 		 <tr id="dynamicdiv${theCount.count}">
 			<td >${theCount.count}</td>
 			<input type="hidden" id="slno${theCount.count}" value="${routMapList.sno}">
 			    <c:set var="dateAndTime" value="${routMapList.startDateStr}" />
 			     <c:set var="dateAndTime" value="${fn:split(dateAndTime,' ')}" />
 			      <c:set var="enddateAndTime" value="${routMapList.endDateStr}" />
 			     <c:set var="enddateAndTime" value="${fn:split(enddateAndTime,' ')}" />
 			<td><input class="form-control calendar_icon startDate" value="${routMapList.startDateStr}" readonly="readonly" style="width:100px;background-color: white;" id="routeStartDate${theCount.count}" onfocus="callCalender('routeStartDate${theCount.count}')" onclick="callCalender('routeStartDate${theCount.count}')" placeholder='DD/MM/YYYY' type="text"/>
 			</td>
 			<td><input class="form-control calendar_icon startDate" value="${routMapList.endDateStr}" readonly="readonly" style="width:100px;background-color: white;" id="routeEndDate${theCount.count}" onfocus="callCalender('routeEndDate${theCount.count}')" onclick="callCalender('routeEndDate${theCount.count}')" placeholder='DD/MM/YYYY' type="text"/>
 			</td>
 			<td><input type="text" class="form-control timepicker"    value="${routMapList.startTimeStr}" id="routeStartTime${theCount.count}" onBlur="validatetime()"/>
 			</td>
 			<td><input type="text" class="form-control timepicker"  value="${routMapList.endTimeStr}" id="routeEndTime${theCount.count}" onBlur="validateEndtime()"/>
 			</td>
 			<td><div ><input type='text' id="latitude${theCount.count}" value="${routMapList.gpsLatitude}" style='vertical-align: -2px' ></div>
 			</td>
 			<td><div ><input type='text' id="langitude${theCount.count}" value="${routMapList.gpsLongitude}"  style='vertical-align: -2px' ></div>
 			</td>
 		     <td><div style="width: 170px;"><input type="text" id="description${theCount.count}" value="${routMapList.description}" style='vertical-align: -2px' class='sun'></div>
 			 <td id="Del${theCount.count}" ><img id="Img${theCount.count}" src="${pageContext.request.contextPath}/images/itemdelete.png" style="width:30px;cursor:pointer;" onclick="deleteItem(this);" />
 			</tr>
 			</c:forEach>
 			
 			</c:otherwise>
 			</c:choose>
 		
 			</tbody>
 			
 		
           </table>
           <br/>
         </div>
                
                              
          
           <br>				                                    

						</div><!-- /.box-body -->
						<div class="row" style="text-align: center;">
					<div class="form-group col-lg-12 col-xs-12" style="">
					<input type="hidden" id="flowUnder" value="${flowUnder}">
				       <input type="button" class="btnCls" style="" onclick="return createRouteMaster('routeMaster','new') ;" value="<spring:message code="submit.label" />" />
				 	<input type="button" class="btnCls buttonMargin" style="" onclick="return viewRouteMaster('routeMaster','0');" value="<spring:message code="cancel.label" />" />
				 
				</div>
				</div>
						
                                    <div class="box-footer">
                                    </div>
                                    </div>
                                
                            </div>

                  
 
		</div>
                               

</section><!-- /.content -->

</body>
</html>
		    		 