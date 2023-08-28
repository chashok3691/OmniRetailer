<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Manasa
 * file name		        : Inventory Manager/DaysOpen/viewSpecificDayOpenDetails.jsp
 * file type		        : JSP
 * description				: The day open details is displayed using this jsp
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
	<script src="${pageContext.request.contextPath}/js/outletNotification.js"></script>
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
margin-left:-50px;
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
	<script type="text/javascript">
$(document).ready(function(){
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
            <%--  <h3><spring:message code="day.open.label" /></h3>  --%>
        </div>
        
		 <form id="newDepartment">
		 
            <div class="box-body">
            	<div class="row">
	              <div id="Error" style="text-align:center;color:red;font-weight:bold;margin-top: -5px;">${err}</div>
	               <div id="Error" style="text-align:center;color:blue;font-weight:bold;margin-top: -5px;">${success}</div>
	            </div>
	            <br>
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
                                 <select class="form-control" name="location" id="outletLocation" disabled="disabled">
                                   <c:forEach var="location" items="${workLocationsList}"> 
									 <option value="${location}" ${location == outletDayOpenresponse.outletLocation ? 'selected' : ''}>${location}</option>
								  </c:forEach>
							    </select>
		                                 </div> 
		                                 
                                     </div>
                                      
                                    <div class="row">
                               <div class="address-group col-lg-10 col-xs-9 " style="margin-left:20px;white-space:nowrap">
		                                   <label><spring:message code="business.counter.label" /></label>
                                          <div class="form-group col-lg-12" style="padding-left:0px;">
                                          
                                             <select class="form-control" name="shipped_from" id="businessCounter" disabled="disabled">
                                             <c:forEach var="counter" items="${counterDetails}">
												 <option value="${counter}" ${counter == outletDayOpenresponse.businessCounter ? 'selected' : ''}>${counter}</option>
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
		
	</div>
	 -->
	
			
			<div class="container col-lg-12" style="margin-top: -127px;padding-left:35px;white-space:nowrap;
    margin-left: 286px; box-sizing: border-box;">
		<label style="margin-top:22px;margin-left:-38px;float:left;margin-right:3px;">StartTime</label>
	    <label style="margin-top:64px;margin-left:-59px;float:left">EndTime</label>
			<div class="form-group col-lg-2 rowpadding">
                                    
                                    <div class="row">
                                    
                                     <div class=" col-lg-5 col-sm-4" style="padding-right: 0px;padding-left: 25px">
<input type="checkbox" style="
    vertical-align: -3px;
    width: 25px;
    height: 15px;" checked><label><spring:message code="import.Select_Week_Days.Mon.label" /></label>&nbsp;	
    </div>	
                                    
                                    
                                    </div>
                                    
                                    
                                  
                                 <div class=" form-group col-lg-11">
                                            <div class=" bootstrap-timepicker">
                                           
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="start_time" id="mondayStartTime" value="${outletDayOpenresponse.monStartTimeStr}" disabled="disabled"/>
                                              <!--  <div class="input-group-addon" style="width:20px;">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>  -->
                                            </div><!-- /.input group -->
                                        </div><!-- /.form group -->
                                        <span id="mondayStartTimeError" style="text-align:right;color:red;font-weight:bold;"></span>
                                         </div>
                                    <div class="row">
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                               <div class="address-group col-lg-11 col-xs-10 ">
		                                     <%-- <label class="control-label" style="float:left;"><spring:message code="start.time.label"/> </label> --%>
                                            <div class="form-group col-lg-12">
                                            <div class="bootstrap-timepicker">
                                            
                                            <div class="input-group">                                            
                                                  <input type="text" class="form-control timepicker" name="start_time" id="mondayEndTime" value="${outletDayOpenresponse.monEndTimeStr}" disabled="disabled"/>
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
    height: 15px;" checked><label><spring:message code="import.Select_Week_Days.Tue.label" /></label>&nbsp;	
    </div>	
                                    
                                    
                                    </div>
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                  <div class="row">
                                 
                                      <div class="address-group col-lg-11 col-xs-10 ">
		                                     
                                            <div class="form-group col-lg-12">
                                            <div class="bootstrap-timepicker">
                                            
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="start_time" id="tuesdayStartTime" value="${outletDayOpenresponse.tueStartTimeStr} " disabled="disabled"/>
                                                <!-- <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div> -->
                                            </div><!-- /.input group -->
                                    
                                 
                                    
                                        </div>
			
			</div>
		                                 </div> 
		                                 
                                     </div>
                                      
                                    <div class="row">
                               <div class="address-group col-lg-11 col-xs-10 ">
		                                   
                                            <div class="form-group col-lg-12">
                                            <div class="bootstrap-timepicker">
                                            
                                            <div class="input-group">                                            
                                                 <input type="text" class="form-control timepicker" name="start_time" id="tuesdayEndTime" value="${outletDayOpenresponse.tueEndTimeStr}" disabled="disabled"/>
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
    height: 15px;" checked><label><spring:message code="import.Select_Week_Days.Wed.label" /></label>	
    </div>	
                                    
                                    
                                    </div>
                                    
                                    
                                    
                                    
                                    
                                  <div class="row">
                                 
                                      <div class="address-group col-lg-11 col-xs-10 ">
		                                     
                                            <div class="form-group col-lg-12">
                                            <div class="bootstrap-timepicker">
                                            
                                            <div class="input-group">                                            
                                                  <input type="text" class="form-control timepicker" name="start_time" id="wednesdayStartTime" value="${outletDayOpenresponse.wedStartTimeStr}" disabled="disabled"/>
                                               <!--  <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div> -->
                                            </div><!-- /.input group -->
                                    
                                 
                                    
                                        </div>
			
			</div>
		                                 </div> 
		                                 
                                     </div>
                                      
                                    <div class="row">
                               <div class="address-group col-lg-11 col-xs-10 ">
		                                   
                                            <div class="form-group col-lg-12">
                                            <div class="bootstrap-timepicker">
                                            
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="start_time" id="wednesdayEndTime" value="${outletDayOpenresponse.wedEndTimeStr}" disabled="disabled"/>
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
    height: 15px;" checked><label style="
    width: 25px;
    height: 15px;" ><spring:message code="import.Select_Week_Days.Thu.label" /></label>	
    </div>	
                                    
                                    
                                    </div>
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                  <div class="row">
                                 
                                      <div class="address-group col-lg-12 col-xs-10 ">
		                                     
                                            <div class="form-group col-lg-11">
                                            <div class="bootstrap-timepicker">
                                            
                                            <div class="input-group">                                            
                                                 <input type="text" class="form-control timepicker" name="start_time" id="thursdayStartTime" value="${outletDayOpenresponse.thuStartTimeStr}" disabled="disabled"/>
                                               <!--  <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div> -->
                                            </div><!-- /.input group -->
                                    
                                 
                                    
                                        </div>
			
			</div>
		                                 </div> 
		                                 
                                     </div>
                                      
                                    <div class="row">
                               <div class="address-group col-lg-11 col-xs-10 ">
		                                   
                                            <div class="form-group col-lg-12">
                                            <div class="bootstrap-timepicker">
                                            
                                            <div class="input-group">                                            
                                               <input type="text" class="form-control timepicker" name="start_time" id="thursdayEndTime" value="${outletDayOpenresponse.thuEndTimeStr}" disabled="disabled"/>
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
    height: 15px;" checked><label style="
    width: 25px;
    height: 15px;" ><spring:message code="import.Select_Week_Days.Fri.label" /></label>	
    </div>	
                                    
                                    
                                    </div>
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                  <div class="row">
                                 
                                      <div class="address-group col-lg-11 col-xs-10 ">
		                                     
                                            <div class="form-group col-lg-12">
                                            <div class="bootstrap-timepicker">
                                            
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="start_time" id="fridayStartTime" value="${outletDayOpenresponse.friStartTimeStr}" disabled="disabled"/>
                                               <!--  <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div> -->
                                            </div><!-- /.input group -->
                                    
                                 
                                    
                                        </div>
			
			</div>
		                                 </div> 
		                                 
                                     </div>
                                      
                                    <div class="row">
                               <div class="address-group col-lg-11 col-xs-10 ">
		                                   
                                            <div class="form-group col-lg-12">
                                            <div class="bootstrap-timepicker">
                                            
                                            <div class="input-group">                                            
                                               <input type="text" class="form-control timepicker" name="start_time" id="fridayEndTime" value="${outletDayOpenresponse.friEndTimeStr}" disabled="disabled"/>
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
    height: 15px;" checked><label><spring:message code="import.Select_Week_Days.Sat.label" /></label>	
    </div>	
                                    
                                    
                                    </div>
                                    
                                  <div class="row">
                                 
                                      <div class="address-group col-lg-11 col-xs-10 ">
		                                     
                                            <div class="form-group col-lg-12">
                                            <div class="bootstrap-timepicker">
                                            
                                            <div class="input-group">                                            
                                                  <input type="text" class="form-control timepicker" name="start_time" id="saturdayStartTime" value="${outletDayOpenresponse.satStartTimeStr}" disabled="disabled"/>
                                              <!--   <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div> -->
                                            </div><!-- /.input group -->
                                    
                                 
                                    
                                        </div>
			
			</div>
		                                 </div> 
		                                 
                                     </div>
                                      
                                    <div class="row">
                               <div class="address-group col-lg-11 col-xs-10 ">
		                                   
                                            <div class="form-group col-lg-12">
                                            <div class="bootstrap-timepicker">
                                            
                                            <div class="input-group">                                            
                                                 <input type="text" style="" class="form-control timepicker" name="start_time" id="saturdayEndTime" value="${outletDayOpenresponse.satEndTimeStr}" disabled="disabled"/>
                                                <!-- <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div> -->
                                            </div><!-- /.input group -->
                                    
                                 
                                    
                                        </div>
			
			</div>

		                                 </div>
                                       
			
			
			
			
			                      
			                        
			                        
			 </div></div>

</div>
</div>

</div>





<%-- 
<div class="row col-lg-12">
<div class="form-group col-lg-3" style="margin-left:18px;margin-top:4px;">
                                            
                                             <select class="form-control" name="businessDetails" id="businessDetails">
                                           
												<option><spring:message code="outlet.configuration.label" /></option>
											    <option><spring:message code="billingcounters.label" /></option>
                                               <option><spring:message code="taxation.label" /></option>
                                               <option><spring:message code="shiftmanagement" /></option>
                                               <option><spring:message code="billingandpayment.label" /></option>
                                               <option><spring:message code="inventoryManagement.label" /></option>
                                               <option><spring:message code="outlethealth.label" /></option>
                                               <option><spring:message code="notification.label" /></option>
                                                
                                           </select>
                                        </div>

 <div class="col-lg-2 col-sm-4 col-xs-8">
                 <a class="addButton" ">
                           <h2 style="margin-top:0px;margin-left:-19px; "><i  class="fa fa-plus-circle" aria-hidden="true" onclick="addBusinessDetails();"></i></h2>
                   </a>          
                   </div>
</div>
 --%>


<div class="row" id="no-more-tables">


  <div class="table-responsive col-lg-12" id="data" style="margin-left:14px;">
                   <div class="col-lg-12">
                    <table border="1"  id="businessTable" style="width:97.99%;margin-top:-11px;%" class="tablepr table table-bordered table-hover">
                      <thead style="background-color: #3c8dbc; color: #ffffff">
                        <tr>
                        	<th><div style="width:20px;"><spring:message code="sl.no.label" /></div></th>
                        	<th><spring:message code="business.counter.label"/></th>
                        	<th><spring:message code="businesstask.label"/></th>
                            <th><spring:message code="order.label"/></th>
                            <th><spring:message code="description.label"/></th>
                             <th><spring:message code="printcopy.label"/></th>
                              <th><spring:message code="skip.business.task.label"/></th>
                           
                        </tr>
                      </thead>
                      <tbody  style="text-align: center;">
             		   	<c:forEach var="item" items="${outletDayOpenresponse.dayOpenChilds}" varStatus="theCount">
		             		   <tr id="dynamicdiv${theCount.count}">
		             		   <td class="slno">${theCount.count}</td>
			              			 <td id="businessCounter${theCount.count}">${item.businessCounter} </td>
			              			<td><textarea id="businessTask${theCount.count}" rows=1 style='resize:none;width: 100px;'>${item.businessTask}</textarea></td>
			                  		<td> <select  style='width:100px;height:25px;text-align:center' id="sequenceorder${theCount.count}"><option value="1" ${item.sequenceOrder == '1' ? 'selected' : ''}>1</option>
			                  		<option value="2" ${item.sequenceOrder == '2' ? 'selected' : ''}>2</option>
			                  		<option value="3" ${item.sequenceOrder == '3' ? 'selected' : ''}>3</option>
			                  		</select> </td>
			                  		<td><textarea id="description${theCount.count}" rows=1 style='resize:none;width: 300px;'>${item.description}</textarea></td>
			                  		<td><c:if test="${item.printCopy == true}">
                            		<input type="checkbox" id="printcopyChkbox${theCount.count}" checked="checked" style="vertical-align: -2px" class="mon">
                            	</c:if>
                            	<c:if test="${item.printCopy == false}">
                            		<input type="checkbox" id="printcopyChkbox${theCount.count}" style="vertical-align: -2px" class="mon">
                            	</c:if></td>
                            	
                            	<td>
			                  		<c:if test="${item.skipBusinessTask == true}">
                            		<input type="checkbox" id="skipbusinesstaskChkbox${theCount.count}" checked="checked" style="vertical-align: -2px" class="mon">
                            	</c:if>
                            	<c:if test="${item.skipBusinessTask == false}">
                            		<input type="checkbox" id="skipbusinesstaskChkbox${theCount.count}" style="vertical-align: -2px" class="mon">
                            	</c:if></td>
                            	
                            	
			                  		<%-- <td id="Del${theCount.count}" ><a href='' id="Del${theCount.count}"  style=' text-decoration: underline;margin-left:3px;' onclick='deleteItem(this);' title='Delete'>Delete</a> </td> --%>
		                  	   </tr>
	              		   </c:forEach>  
					 </tbody>
                   </table>
                </div> 
               </div>






   <br><br>





 
			
		<br>
       	  <div class="col-lg-12" style="text-align: center;">
       	  <br><br>
           	<div class="buttons">
       		 	 <c:if test="${sessionScope.role == 'super admin'}"> 
       		 	 <a onclick="viewoutletdaysOpen('daysOpen','daysOpen','0','menu');" class="btnCls"><font>&nbsp;&nbsp;<spring:message code="cancel.label" />&nbsp;&nbsp;</font></a>
       		 	 </c:if>
       		  <c:forEach var="accessControl" items="${sessionScope.outletManagement}">
                 <c:if test="${accessControl.appDocument == 'DaysOpen' && accessControl.read == true}"> 
       		 		<a onclick="viewoutletdaysOpen('daysOpen','daysOpen','0','menu');" class="btnCls"><font>&nbsp;&nbsp;<spring:message code="cancel.label" />&nbsp;&nbsp;</font></a>
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