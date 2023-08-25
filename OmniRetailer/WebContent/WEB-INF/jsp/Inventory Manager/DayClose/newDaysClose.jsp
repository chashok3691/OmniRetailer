<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Manasa
 * file name		        : Inventory Manager/DaysOpen/newDaysClose.jsp
 * file type		        : JSP
 * description				: The new dayclose is displayed using this jsp
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
		 <%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css"> --%>
	<script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
	<script src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script src="${pageContext.request.contextPath}/js/dayClose.js"></script>
	<style type="text/css">
	.buttons {
	/* float: right; */
	padding-top: 0px;
	/* margin-right: 2%; */
	/* margin-top:1%; */
}
a.button, .list a.button {
	position:relative;
	text-decoration: none;
	color: white;
    display: inline-block;
    padding: 5px 10px 5px 10px;
    background: rgb(60, 141, 188);
	border-radius: 5px;
	/* box-shadow:1px 0px 2px #000; */
	cursor:pointer;
	behavior : url(css/PIE.htc); 
}
.fileUpload {
    position: relative;
    overflow: hidden;
   /*  margin: 10px; */
}
.fileUpload input.upload {
    position: absolute;
    top: 0;
    right: 0;
    margin: 0;
    padding: 0;
    font-size: 20px;
    cursor: pointer;
    opacity: 0;
    filter: alpha(opacity=0);
}
.btn-primar {
	/* font-weight: bold; */
	color: black;
    background-color: rgb(195,195,195);
    border-color: gray;
}
#receiverType option { color: black; }
#notificationType option { color: black; }
.empty { color: #c3c3c3; }


.labelpadding
{
margin-left:-76px;
}
.rowpadding
{
margin-left:-28px;
}
td {
    /* width: 50%;
    height: 2em;
    border: 1px solid #ccc; */
}
tablepr {
    border-collapse: collapse;
    border: 5px solid black;
    width: 100%;
}
.column-right {
     border-right: 1px solid #dddddd;
}

@media only screen and (max-width: 768px) {
    /* For mobile phones: */
    [class*="col-"] {
        width: 100%;
    }
}


	</style>
	
	<!--  added by        :  koti bomminei
      description     :  to ristrict the user from entering special characters     -->


	
	
	
	<script type="text/javascript">
$(document).ready(function(){


	$("a.up").click(function() {
		  var row = $(this).closest("tr");
		  if (row.prev().length > 0) {
		    row.insertBefore(row.prev());
		  }
		  return false;
		});
		$("a.down").click(function() {
		  var row = $(this).closest("tr");
		  if (row.next().length > 0) {
		    row.insertAfter(row.next());
		  }
		  return false;
		});
});



$("#notificationType").change(function () {
    if($(this).val() == "Notification Type") $(this).addClass("empty");
    else $(this).removeClass("empty");
});
$("#notificationType").change();
/* $("#receiverType").change(function () {
    if($(this).val() == "Receiver Type") $(this).addClass("empty");
    else $(this).removeClass("empty");
});
$("#receiverType").change(); */
	</script>
</head>
<body>
<section class="content">
<div class="row">
  <div class="col-xs-12">
	<div class="box box-primary">
		<div class="box-header" style="text-align: center">
            <h3><label style="font-size: 20px;"><spring:message code="day.close.label" /></label></h3> 
        </div>
        
		 <form id="">
		 
            <div class="box-body">
            	<div class="row">
	              <div id="Error" style="text-align:center;color:red;font-weight:bold;margin-top: -5px;">${err}</div>
	               <div id="Error" style="text-align:center;color:blue;font-weight:bold;margin-top: -5px;">${success}</div>
	            </div>
	          
				
	          <%--    <div class="form-group col-lg-12" align="center">
		                			<label style="font-size: 20px;"><spring:message code="day.close.label" /></label>
		                     </div> --%>
	            
	            
	              <br>
	       
	            
	            
	            
	            <div class="row">
	             
	             
	            	<%--  <div class="form-group col-lg-2">
									     <label><spring:message code="location.label" /></label>
                                           <select class="form-control" name="location" id="configurationLocation" onchange="">
                                             <c:forEach var="location" items="${locationsList}"> 
												 <option value="${location}">${location}</option>
											 </c:forEach>
										 </select>
									  </div> --%>
				
				
			
				
				
				
				
			
				
				  <div class="form-group col-lg-2" >
                                    
                                  <div class="row">
                                      <div class="address-group col-lg-12 col-xs-10 " style="margin-left:20px;">
		                                  <label><spring:message code="location.label" /></label>
                                 <select class="form-control" name="location" id="outletLocation" onchange="return changeInfoBasedOnLocation(this.options[this.selectedIndex].value);" >
                                   <c:forEach var="location" items="${workLocationsList}"> 
									 <option value="${location}" ${location == outletDayclose.outletLocation ? 'selected' : ''}>${location}</option>
								  </c:forEach>
							    </select>
		                                 </div> 
		                                 
                                     </div>
                                      
                                    <div class="row">
                               <div class="address-group col-lg-11 col-xs-9 " style="margin-left:20px;white-space:nowrap;">
		                                   <label><spring:message code="business.counter.label" /></label>
                                          <div class="form-group col-lg-12" style="padding-left:0px;">
                                          
                                             <select class="form-control" name="shipped_from" id="businessCounter">
                                         
                                             <c:forEach var="location" items="${counterDetails}">
												<option value="${location}">${location}</option>
											</c:forEach>
                                           </select>

		                                 </div>
                                        </div>
                                       
                                      </div>
				  </div>
				  
	
	
	<!-- <div class="row container control-group">
	<div class="col-lg-2">
	<label style="margin-top:22px;margin-left:34px;">StartTime</label>
	<label style="margin-top:20px;margin-left:34px;">EndTime</label>
	</div>
		
	</div> -->
	
	
			
			<div class="container col-lg-12" style="margin-top: -127px;padding-left:19x;white-space:nowrap;
    margin-left: 286px; box-sizing: border-box;">
		<label style="margin-top:22px;margin-left:-38px;float:left;margin-right:3px;">Starttime</label>
	    <label style="margin-top:64px;margin-left:-59px;float:left">Endtime</label>
			<div class="form-group col-lg-2 rowpadding">
                                    
                                    <div class="row">
                                    
                                     <div class=" col-lg-5 col-sm-4" style="padding-right: 0px;padding-left: 25px">
<input type="checkbox" style="
    vertical-align: -3px;
    width: 25px;
    height: 15px;" checked id="mondayChkbox"><label><spring:message code="import.Select_Week_Days.Mon.label" /></label>&nbsp;	
    </div>	
                                    
                                    
                                    </div>
                                    
                                    
                                  
                                 <div class=" form-group col-lg-10">
                                            <div class=" bootstrap-timepicker">
                                           
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="start_time" id="mondayStartTime" value="${outletDayclose.monStartTimeStr}"/>
                                              <!--  <div class="input-group-addon" style="width:20px;">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>  -->
                                            </div><!-- /.input group -->
                                        </div><!-- /.form group -->
                                        <span id="mondayStartTimeError" style="text-align:right;color:red;font-weight:bold;"></span>
                                         </div>
                                         
                                          
                                    <div class="row">
                                    
                                    
                                    
                                    
                                    
                                    
                                  
                                    
                               <div class="address-group col-lg-10 col-xs-10 ">
		                                  
		                                     <%-- <label class="control-label" style="float:left;"><spring:message code="start.time.label"/> </label> --%>
                                            <div class="form-group col-lg-12">
                                            <div class="bootstrap-timepicker">
                                            
                                            <div class="input-group">                                            
                                                  <input type="text" class="form-control timepicker" name="start_time" id="mondayEndTime"  value="${outletDayclose.monEndTimeStr}"/>
                                               <!--  <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div> -->
                                            </div><!-- /.input group -->
                                    
                                 
                                    
                                        </div>
			
			</div>

		                                 </div>
                                        </div>
                                       
                                      </div>
                                      
   
   
   
   
   
			
			<div class="form-group col-lg-2 labelpadding">
                                    
                                       <div class="row">
                                    
                                     <div class=" col-lg-5 col-sm-4" style="padding-right: 0px;padding-left: 25px">
<input type="checkbox" style="
    vertical-align: -3px;
    width: 25px;
    height: 15px;" checked id="tuesdayChkbox"><label><spring:message code="import.Select_Week_Days.Tue.label" /></label>&nbsp;	
    </div>	
                                    
                                    
                                    </div>
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                  <div class="row">
                                 
                                      <div class="address-group col-lg-10 col-xs-10 ">
		                                     
                                            <div class="form-group col-lg-12">
                                            <div class="bootstrap-timepicker">
                                            
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="start_time" id="tuesdayStartTime"  value="${outletDayclose.tueStartTimeStr}"/>
                                                <!-- <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div> -->
                                            </div><!-- /.input group -->
                                    
                                 
                                    
                                        </div>
			
			</div>
		                                 </div> 
		                                 
                                     </div>
                                      
                                    <div class="row">
                               <div class="address-group col-lg-10 col-xs-10 ">
		                                   
                                            <div class="form-group col-lg-12">
                                            <div class="bootstrap-timepicker">
                                            
                                            <div class="input-group">                                            
                                                 <input type="text" class="form-control timepicker" name="start_time" id="tuesdayEndTime" value="${outletDayclose.tueEndTimeStr}"/>
                                                <!-- <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div> -->
                                            </div><!-- /.input group -->
                                    
                                 
                                    
                                        </div>
			
			</div>

		                                 </div>
                                        </div>
                                       
                                      </div>
			
			
			
			
			<div class="form-group col-lg-2 labelpadding">
                                    
                                       <div class="row">
                                    
                                     <div class=" col-lg-5 col-sm-4" style="padding-right: 0px;padding-left: 25px">
<input type="checkbox" style="
    vertical-align: -3px;
    width: 25px;
    height: 15px;" checked id="wednesdayChkbox"><label><spring:message code="import.Select_Week_Days.Wed.label" /></label>	
    </div>	
                                    
                                    
                                    </div>
                                    
                                    
                                    
                                    
                                    
                                  <div class="row">
                                 
                                      <div class="address-group col-lg-10 col-xs-10 ">
		                                     
                                            <div class="form-group col-lg-12">
                                            <div class="bootstrap-timepicker">
                                            
                                            <div class="input-group">                                            
                                                  <input type="text" class="form-control timepicker" name="start_time" id="wednesdayStartTime" value="${outletDayclose.wedStartTimeStr}"/>
                                               <!--  <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div> -->
                                            </div><!-- /.input group -->
                                    
                                 
                                    
                                        </div>
			
			</div>
		                                 </div> 
		                                 
                                     </div>
                                      
                                    <div class="row">
                               <div class="address-group col-lg-10 col-xs-10 ">
		                                   
                                            <div class="form-group col-lg-12">
                                            <div class="bootstrap-timepicker">
                                            
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="start_time" id="wednesdayEndTime" value="${outletDayclose.wedEndTimeStr}"/>
                                              <!--   <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div> -->
                                            </div><!-- /.input group -->
                                    
                                 
                                    
                                        </div>
			
			</div>

		                                 </div>
                                        </div>
                                       
                                      </div>
			
			
			
			
			<div class="form-group col-lg-2 labelpadding">
                                    
                                       <div class="row">
                                    
                                     <div class=" col-lg-5 col-sm-4" style="padding-right: 0px;padding-left: 25px">
<input type="checkbox" style="
    vertical-align: -3px;
    width: 25px;
    height: 15px;" id="thursdayChkbox" checked><label style="
    width: 25px;
    height: 15px;"  ><spring:message code="import.Select_Week_Days.Thu.label" /></label>	
    </div>	
                                    
                                    
                                    </div>
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                  <div class="row">
                                 
                                      <div class="address-group col-lg-10 col-xs-10 ">
		                                     
                                            <div class="form-group col-lg-12">
                                            <div class="bootstrap-timepicker">
                                            
                                            <div class="input-group">                                            
                                                 <input type="text" class="form-control timepicker" name="start_time" id="thuStartTime" value="${outletDayclose.thuStartTimeStr}"/>
                                               <!--  <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div> -->
                                            </div><!-- /.input group -->
                                    
                                 
                                    
                                        </div>
			
			</div>
		                                 </div> 
		                                 
                                     </div>
                                      
                                    <div class="row">
                               <div class="address-group col-lg-10 col-xs-10 ">
		                                   
                                            <div class="form-group col-lg-12">
                                            <div class="bootstrap-timepicker">
                                            
                                            <div class="input-group">                                            
                                               <input type="text" class="form-control timepicker" name="start_time" id="thursdayEndTime" value="${outletDayclose.thuEndTimeStr}"/>
                                               <!--  <div class="input-group-addon timepicker">
                                                    <i class="fa fa-clock-o"></i>
                                                </div> -->
                                            </div><!-- /.input group -->
                                    
                                 
                                    
                                        </div>
			
			</div>

		                                 </div>
                                        </div>
                                       
                                      </div>
			
			
			
			
			<div class="form-group col-lg-2 labelpadding">
                                    
                                    
                                       <div class="row">
                                    
                                     <div class=" col-lg-5 col-sm-4" style="padding-right: 0px;padding-left: 25px">
<input type="checkbox" style="
    vertical-align: -3px;
    width: 25px;
    height: 15px;" id="fridayChkbox" checked><label style="
    width: 25px; 
    height: 15px;" ><spring:message code="import.Select_Week_Days.Fri.label" /></label>	
    </div>	
                                    
                                    
                                    </div>
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                  <div class="row">
                                 
                                      <div class="address-group col-lg-10 col-xs-10 ">
		                                     
                                            <div class="form-group col-lg-12">
                                            <div class="bootstrap-timepicker">
                                            
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="start_time" id="fridayStartTime" value="${outletDayclose.friStartTimeStr}"/>
                                               <!--  <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div> -->
                                            </div><!-- /.input group -->
                                    
                                 
                                    
                                        </div>
			
			</div>
		                                 </div> 
		                                 
                                     </div>
                                      
                                    <div class="row">
                               <div class="address-group col-lg-10 col-xs-10 ">
		                                   
                                            <div class="form-group col-lg-12">
                                            <div class="bootstrap-timepicker">
                                            
                                            <div class="input-group">                                            
                                               <input type="text" class="form-control timepicker" name="start_time" id="fridayEndTime" value="${outletDayclose.friEndTimeStr}"/>
                                                <!-- <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div> -->
                                            </div><!-- /.input group -->
                                    
                                 
                                    
                                        </div>
			
			</div>

		                                 </div>
                                        </div>
                                       
                                      </div>
			
			
			
			
			<div class="col-lg-2 labelpadding">
                                    
                                       <div class="row">
                                    
                                     <div class=" col-lg-5 col-sm-4" style="padding-right: 0px;padding-left: 25px">
<input type="checkbox" style="
    vertical-align: -3px;
    width: 25px;
    height: 15px;" checked id="saturdayChkbox"><label><spring:message code="import.Select_Week_Days.Sat.label" /></label>	
    </div>	
                                    
                                    
                                    </div>
                                    
                                  <div class="row">
                                 
                                      <div class="address-group col-lg-10 col-xs-10 ">
		                                     
                                            <div class="form-group col-lg-12">
                                            <div class="bootstrap-timepicker">
                                            
                                            <div class="input-group">                                            
                                                  <input type="text" class="form-control timepicker" name="start_time" id="saturdayStartTime" value="${outletDayclose.satStartTimeStr}"/>
                                              <!--   <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div> -->
                                            </div><!-- /.input group -->
                                    
                                 
                                    
                                        </div>
			
			</div>
		                                 </div> 
		                                 
                                     </div>
                                      
                                    <div class="row">
                               <div class="address-group col-lg-10 col-xs-10 ">
		                                   
                                            <div class="form-group col-lg-12">
                                            <div class="bootstrap-timepicker">
                                            
                                            <div class="input-group">                                            
                                                 <input type="text" style="" class="form-control timepicker" name="start_time" id="saturdayEndTime" value="${outletDayclose.satEndTimeStr}"/>
                                                <!-- <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div> -->
                                            </div><!-- /.input group -->
                                    
                                 
                                    
                                        </div>
			
			</div>

		                                 </div>
                                       
			
			
			
			
			                      
			                        
			                        
			 </div></div>
			 
			 
			 
			 
			<div class="form-group col-lg-2 labelpadding">
                                    
                                       <div class="row">
                                    
                                     <div class=" col-lg-5 col-sm-4" style="padding-right: 0px;padding-left: 25px">
<input type="checkbox" style="
    vertical-align: -3px;
    width: 25px;
    height: 15px;" checked id="sundayChkbox"><label><spring:message code="batchOperations.batch_timings.week_days.Sun.label" /></label>&nbsp;	
    </div>	
                                    
                                    
                                    </div>
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                  <div class="row">
                                 
                                      <div class="address-group col-lg-10 col-xs-10 ">
		                                     
                                            <div class="form-group col-lg-12">
                                            <div class="bootstrap-timepicker">
                                            
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="start_time" id="sundayStartTime"/>
                                                <!-- <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div> -->
                                            </div><!-- /.input group -->
                                    
                                 
                                    
                                        </div>
			
			</div>
		                                 </div> 
		                                 
                                     </div>
                                      
                                    <div class="row">
                               <div class="address-group col-lg-10 col-xs-10 ">
		                                   
                                            <div class="form-group col-lg-12">
                                            <div class="bootstrap-timepicker">
                                            
                                            <div class="input-group">                                            
                                                 <input type="text" class="form-control timepicker" name="start_time" id="sundayEndTime"/>
                                                <!-- <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div> -->
                                            </div><!-- /.input group -->
                                    
                                 
                                    
                                        </div>
			
			</div>

		                                 </div>
                                        </div>
                                       
                                      </div>
			
			

</div>












</div>

</div>






<div class="row col-lg-12">
<div class="form-group col-lg-3" style="margin-left:15px;margin-top:4px;">
                                            
                                             <select class="form-control" name="businessDetails" id="businessDetails">
                                           
												<option><spring:message code="counting.label" /></option>
											    <option><spring:message code="receiptlist.label" /></option>
                                               <option><spring:message code="peripheral.status" /></option>
                                              <%--  <option><spring:message code="shiftmanagement" /></option>
                                               <option><spring:message code="billingandpayment.label" /></option>
                                               <option><spring:message code="inventoryManagement.label" /></option>
                                               <option><spring:message code="outlethealth.label" /></option>
                                               <option><spring:message code="notification.label" /></option> --%>
                                                
                                           </select>
                                        </div>

 <div class="col-lg-2 col-sm-4 col-xs-8">
                 <a class="addButton">
                           <h2 style="margin-top:0px;margin-left:-19px; "><i  class="fa fa-plus-circle" aria-hidden="true" id="addBusinessClass" onclick="addBusinessDetails();"></i></h2>
                   </a>          
                   </div>
</div>
    <input type="hidden" id="type" value="dayClose" />


<div class="row" id="no-more-tables">


  <div class="table-responsive col-lg-12" id="data" style="margin-left:14px;">
                   <div class="col-lg-12">
                    <table border="1"  id="businessTable" style="width:94.99%;margin-top:-11px;" class="tablepr table table-bordered table-hover">
                      <thead style="background-color: #3c8dbc; color: #ffffff">
                        <tr>
                        	<th style="float:center"><div style="width:20px;"><spring:message code="sl.no.label" /></div></th>
                        	<th><spring:message code="business.counter.label"/></th>
                        	<th><spring:message code="businesstask.label"/></th>
                            <th><spring:message code="order.label"/></th>
                            <th><spring:message code="description.label"/></th>
                             <th><spring:message code="printcopy.label"/></th>
                            <th><spring:message code="skip.business.task.label"/></th>
                            <th><spring:message code="action.label"/></th>
                        </tr>
                      </thead>
                      <tbody  style="text-align: center;">
                   
             		   	<c:forEach var="item" items="${outletDayclose.dayCloseChilds}" varStatus="theCount">
		             		   <tr id="dynamicdiv${theCount.count}">
		             		   <td class="slno">${theCount.count}</td>
		             		   <td id="businessCounter${theCount.count}">${item.businessCounter}</td>
			              	   <td id="businessTask${theCount.count}">${item.businessTask}</td>
			                   <td id="sequenceorder${theCount.count}">
			                   <select  style='width:100px;height:25px;text-align:center' ><option value="1" ${item.sequenceOrder == '1' ? 'selected' : ''}>1</option>
			                  	<option value="2" ${item.sequenceOrder == '2' ? 'selected' : ''}>2</option>
			                  	<option value="3" ${item.sequenceOrder == '3' ? 'selected' : ''}>3</option>
			                  	</select> 
			                   </td>
			                   <td id="description${theCount.count}"><textarea id="description${theCount.count}" onblur="criteria(this)" rows=1 style='resize:none;width: 300px;'>${item.description}</textarea> </td>
			                   <td ><c:if test="${item.printCopy == 1}">
                            	<input type="checkbox" id="printcopyChkbox${theCount.count}" checked="checked" style="vertical-align: -2px" class="mon">
                            	</c:if>
                            	<c:if test="${item.printCopy == 0}">
                            		<input type="checkbox" id="printcopyChkbox${theCount.count}" style="vertical-align: -2px" class="mon"  value="0">
                            	</c:if>
                            	</td>
			                  	<td><c:if test="${item.skipBusinessTask == true}">
                            	<input type="checkbox" id="skipbusinesstaskChkbox${theCount.count}" checked="checked" style="vertical-align: -2px" class="mon"  value="1">
                            	</c:if>
                            	<c:if test="${item.skipBusinessTask == false}">
                            		<input type="checkbox" id="skipbusinesstaskChkbox${theCount.count}" style="vertical-align: -2px" class="mon"  value="0">
                            	</c:if>
                            	</td>
			                  	<td id="Del${theCount.count}" ><a href='#' id="Del${theCount.count}" style=' text-decoration: underline;margin-left:3px;' onclick='deleteItem(this);' title='Delete'>Delete</a> <a href='#' id="up" style=' text-decoration: underline;margin-left:3px;' onclick='' title='Delete'>Up</a><a href='#' id="down" style=' text-decoration: underline;margin-left:3px;' onclick='' title='Delete'>Down</a>  </td>
		                  	   </tr>
	              		   </c:forEach>  
					 </tbody>
                   </table>
                </div> 
               </div>






   <br>	<br><br><br>

		<br>
       	  <div class="col-lg-12" style="text-align: center;">
       	  <br><br>
           	<div class="buttons">
       		 <a onclick="validateDayCloseForm('new');" class="btnCls"><font >&nbsp;&nbsp;&nbsp;<spring:message code="submit.label" />&nbsp;&nbsp;&nbsp;</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		 
       		       <c:if test="${sessionScope.role == 'super admin'}"> 
       		 		<a onclick="viewoutletdaysClose('daysClose','daysClose','0','menu');" class="btnCls buttonMargin"><font>&nbsp;&nbsp;<spring:message code="cancel.label" />&nbsp;&nbsp;</font></a>
       		 	</c:if>
       		  <c:forEach var="accessControl" items="${sessionScope.outletManagement}">
                 <c:if test="${accessControl.appDocument == 'DaysClose' && accessControl.read == true}"> 
       		 		<a onclick="viewoutletdaysClose('daysClose','daysClose','0','menu');" class="btnCls buttonMargin"><font>&nbsp;&nbsp;<spring:message code="cancel.label" />&nbsp;&nbsp;</font></a>
       		 	</c:if>
       		 </c:forEach>
         	</div>
        </div>
      </div>
      <br>	
      </div>
   </form>
	</div>
  </div>
 </div>
</section>





<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/timepicker/bootstrap-timepicker.min.js" ></script>     
 <script>
 $(".timepicker").timepicker({
     showInputs: false,
     showMeridian:false,
     showSeconds:true,
     
  });
        </script>





</body>
</html>