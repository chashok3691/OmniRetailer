<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : vijay
 * file name		        : inventorymanager/retailoutlets/DayWiseStock.jsp
 * file type		        : JSP
 * description				: The new storage system form is displayed using this jsp
 * Written Date				: 21-11-2017
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script> -->
        <!-- DATA TABLES -->
        	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
                 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
<%-- 		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script> --%>
<%-- 		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script> --%>
<%-- 		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script> --%>
</head>
<style>

@media only screen and (max-width:767px){
.table-responsive{
 overflow:hidden;
}
}
@media only screen and (max-width:1440px)  {

   .dataTable1 {
         width: 100%; 
       
         margin-bottom: 15px; 
        overflow-x: auto;
        overflow-y: hidden;
        -webkit-overflow-scrolling: touch;
        -ms-overflow-style: -ms-autohiding-scrollbar;
        border: 1px solid #DDD;
    white-space: nowrap;
    
  }

} 
@media only screen and (max-width:1180px)  {

   .dataTable2 {
         width: 100%; 
       
         margin-bottom: 15px; 
        overflow-x: auto;
        overflow-y: hidden;
        -webkit-overflow-scrolling: touch;
        -ms-overflow-style: -ms-autohiding-scrollbar;
        border: 1px solid #DDD;
       
    white-space: nowrap;
    
  }

} 
.allignment{
  /*    width: 13.3%; */
    padding-right: 0px;
    padding-left: 0px;
}
a.run{
    margin-top: 0px;
    margin-bottom: 0px;
    height: 30px;
    padding-top: 5px;
    padding-bottom: 5px;
    background: #3c8dbc;
    position: relative;
    text-decoration: none;
    color: white;
    display: inline-block;
    cursor: pointer;
    text-align: center;
    width: 100%;
}
a.download{
    display: inline-block;
    /* padding-left: 15px; */
    float: right;
    padding-right: 5px;
    font-size: 22px;
    font-weight: bold;
    cursor: pointer;
    color: grey;
}
a.button{
   position: relative;
    text-decoration: none;
    color: white;
    display: inline-block;
    padding: 7px 10px 29px 10px;
    background: #3c8dbc;
    /* border-radius: 5px; */
    /* box-shadow: 1px 0px 2px #000; */
    cursor: pointer;
    margin-top: 15px;
    height: 23px;
    text-align: center;
    margin-bottom: 15px;
    width: 100%;
}
.col-lg1-2{
    width: 20% !important;
}
.form-control {
  /*   height: 24px; */
    padding: 0px 6px;
    }
    
    .calendar_icon {
    background-position: 3px 3px;
    }
   .form-group {
    margin-bottom: 10px;
    }
	.align
    {
        padding-bottom: 27px !important;
    }
    .searchbutton
    {
        margin-right: 15px;
    }

</style>
<script type="text/javascript">
/*  
 * width: 100%; 
 
 margin-bottom: 15px; 
overflow-x: auto;
overflow-y: hidden;
-webkit-overflow-scrolling: touch;
-ms-overflow-style: -ms-autohiding-scrollbar;
border: 1px solid #DDD;

display: inline-block;
white-space: nowrap;
 */
$(document).ready(function(){
	

	callCalender('fromUserLog');
	callCalender('toUserLog');
	$('#searchCriteria').on('input',function(e){
		if($(this).val().trim()==""){
			viewoutletUserLog('OutletMonitoringUserLog','0');
		}
	});
	
	
	 $('#mySearch').click(function(){
	        var search = $('#searchCriteria').val();
	        return viewoutletUserLog('OutletMonitoringUserLog','0');
	    })
	    $('#searchCriteria').keypress(function(e){
	    
	        if(e.which == 13){//Enter key pressed
	            $('#mySearch').click();//Trigger search button click event
	        }
	    });
	 
	// added to fetch locations based on zone 
	 var zone = $("#outletZone").val();
	 		 if( zone != null && zone !="")
	 			 {
	 			 	searchlocationsBasedOnZoneForDashboard('outletZone','outletLocation','');
	 			 }
	    
	
});
</script>
<body>


<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
      <div class="box-header" align="center">
		<h3 class="box-title" >
			<spring:message code="usagelog.label" />
		</h3>
		</div><!-- /.box-header -->
             <div class="box-body table-responsive">
             <div class="row" style="
    padding: 15px;
             ">
                <div class="col-lg-11" style=" background: #f4f4f4;    padding: 10px 20px;    width: 88%;">
                  <div class="row">
                         <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="zone.label"/></label>
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZoneForDashboard('outletZone','outletLocation','')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
                         </div>
                      </div>
                      
                      
                      
                        <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="user.label"/></label>
                           <select class="form-control" id="outletUser" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="employee" items="${employeeList}">
								
							        <option value="${employee.email}" ${employee.email == selectedEmployee ? 'selected' : ''}>${employee.firstName}</option>
							       
									</c:forEach>
	                        </select>
                      </div>
                      </div>
                    
                       
                         <div class="col-lg1-2 col-lg-2">
              <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                 		<label><spring:message code="offer_start_date.label"/></label>
                	 	<input class="form-control calendar_icon form-group dateClear" readonly="readonly" value="${startDate}" style="background-color: white;" id="fromUserLog" size="20" type="text" onfocus="callCalender('fromUserLog')" onclick="callCalender('fromUserLog')" placeholder="DD/MM/YYYY" />
	              </div>
	            </div>
	           
                    </div>
                     <div class="row">
                       <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="location.label"/></label>
                           <select class="form-control" id="outletLocation" >
                           		 <option value="all"><spring:message code="ALL.label"/></option>
	                            <c:forEach var="location" items="${locationsList}">
								<c:choose>
								<%--  <c:when test="${flowUnder == 'outlet'}"> --%>
						           <c:when test="${location.description == ''}">
							         <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
							        </c:when>
							        <c:otherwise>
							        <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}-${location.description}</option>
							        </c:otherwise>
							    </c:choose>
									</c:forEach>
	                        </select>
                      </div>
                      </div>
                      
                       <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="app.name.label"/></label>
                           <select class="form-control" id="outletAppName" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                          								
							        <option value="Customer Console" ${'Customer Console'== selectedApp ? 'selected' : ''}>Customer Console</option>
							        <option value="Omni Retailer-outlet" ${'Omni Retailer-outlet'== selectedApp ? 'selected' : ''}>Omni Retailer-outlet</option>
							      
								
	                        </select>
                      </div>
                      </div>
                      
                   
                     
                   
                      <div class="col-lg1-2 col-lg-2">
	               <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="offer_end_date.label"/></label>
	                 	<input class="form-control calendar_icon form-group dateClear" readonly="readonly" value="${endDate}" style="background-color: white;" id="toUserLog" size="20" type="text" onfocus="callCalender('toUserLog')" onclick="callCalender('toUserLog')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div>
                    </div>
                  </div>
                  <div class="col-lg-1" style=" width: 12%;    background: #ccc;">
               
               
               
                  <div class="col-lg-12" style=" border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">
                 
                 
                 
                  <div class="row">
                  <a onclick="viewoutletUserLog('OutletMonitoringUserLog','0');" class="button"><spring:message code="searchbutton.label"/></a>
                  </div>
                  <div class="row">
                  <a onclick="resetForm();" class="button"><spring:message code="clearbutton.label"/></a>
                  </div>
                  </div></div>
             
             </div>
               <div class="row">
                       <div class="col-lg-1 col-xs-2">
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewoutletUserLog('OutletMonitoringUserLog','0')">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
				                      
				                      
				                       <div class="col-lg-11 col-xs-10" style="padding-left:0px;">
                      
                      <div class="wrapper">	 
                      <input type="text"  class="form-control" style="" value="${searchCriteria}" id="searchCriteria" placeholder="<spring:message code="searchUserLogs.label" />" />
							<button id="mySearch" class="searchbutton"></button>
							
							</div>
						<input type="hidden" id="stock" value="${searchName}">
                    </div>
				                      
                  
                  
                    </div>
                    
                    
             
             
                   <div>
                      <div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;">
                     <table id="productstocks" class="table table-bordered table-striped">
                      <thead style="background-color: #3c8dbc; color: #ffffff">
                             <tr>
                                <th  ><div><spring:message code="sl.no.label" /></div></th>
                             	<th ><spring:message code="outletid.label" /></th>
<%--                              	<th ><spring:message code="username.label" /></th> --%>
                             	<th ><spring:message code="supplier.emailId.label" /></th>
                             	<th ><spring:message code="counter_id.label" /></th>
                             		<th><spring:message code="counter_deviceId.label" /></th>
                             	<th ><spring:message code="shift.id.label" /></th>
                             	<th ><spring:message code="version.activatedOn.label" /></th>
                             	<th ><spring:message code="starttime.label" /></th>
                             	<th ><spring:message code="role.label" /></th>
                             	<th ><spring:message code="app.name.label" /></th>
                             	<th ><spring:message code="version.label"/></th>
                             	                             	<%-- <th><spring:message code="outletlocation.label" /></th> --%>
                             	<th>Activity</th>
                                 </tr>
                               
                           
                         </thead>
                         <c:set var ="totalQuantity" value="0"/>
                          <c:set var ="stockValue" value="0"/>
                         <tbody style="text-align: center;">
                            <c:forEach var="userlogdetails" items="${userlogdetails}" varStatus="theCount">
                         	 <tr>
                         	 <td>${theCount.count + index-1}</td>
                         	 <td>${userlogdetails.store_location}</td>
                         	 <td>${userlogdetails.email_id}</td>
                         	 <td>${userlogdetails.counter_id}</td>
                         	  <td>${userlogdetails.device_id}</td>
                         	 <td>${userlogdetails.shift_id}</td>
                         	 <td>${userlogdetails.version_activated_on_str}</td>
                         	<%--   <td>${userlogdetails.storeLocation}</td> --%>
                         	 <td>${userlogdetails.login_transaction_time_str}</td>
                         	  <td>${userlogdetails.role_name}</td>
                         	 <td>${userlogdetails.app_name}</td>
                         	  <td>${userlogdetails.version_id}</td>
                         	 <td>${userlogdetails.activity}</td>
                         	
							</tr>
						</c:forEach>                        	
                         </tbody>
                     </table>
                     </div>
                     </div>



          <%--     <div class="row" style="padding-top:2px;">
              
              	<c:if test="${index == 0 && totalRecords >10 && maxRecords != totalRecords}">
              		<div class="form-group col-lg-6" >
              		<input type="button" class='paginationButton' value="&#60;" onclick="" > ${index+1} - ${index+maxRecords} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewoutletSynchStatus('outletSynchStatus','${index+maxRecords}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${index+1 == totalRecords}">
              			<c:if test="${index+1-maxRecords >0}">
              				<div class="form-group col-lg-6" >
              		<input type="button" class='paginationButton' value="&#60;" onclick="viewoutletSynchStatus('outletSynchStatus','${index+maxRecords}')"> ${index+1} - ${index+maxRecords} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${index+1 - maxRecords <= 0 && maxRecords == totalRecords}">
              		<div class="form-group col-lg-6">
              		<input type="button" class='paginationButton' value="&#60;"> ${index+1} - ${index+maxRecords} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index > 0  &&  index+maxRecords <= totalRecords } " >
              		<div class="form-group col-lg-6" >
              		<input type="button" class='paginationButton' value="&#60;" onclick="viewoutletSynchStatus('outletSynchStatus','${index-maxRecords}')"> ${index+1} - ${index+maxRecords} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewoutletSynchStatus('outletSynchStatus','${index+maxRecords}')">
              	</div> 
              	</c:if>
              
              	<div class="col-lg-6" style=" padding-left: 0px;"> 
              	<div class="col-lg-2" style=" padding-left: 0px;  ">
              		<select class="form-control" id="pagination">
              		<c:set var="totalRecords" value="${totalRecords}"></c:set>
              	<c:forEach var="i" begin="0" end="${totalRecords}">
              	<c:if test="${(totalRecords)>0}">
              		<option value="${(i*maxRecords)}" ${index-1 == i*maxRecords ? 'selected' : ''}> ${i+1}</option>
              		<c:set var="totalRecords" value="${totalRecords-maxRecords}"></c:set>
              		
              	</c:if>
				</c:forEach>
					</select>
              	
              	</div>
              	<div class="col-lg-2">
              		
              		  <input type="button" onclick="viewoutletSynchStatus('outletSynchStatus',document.getElementById('pagination').value);" class="btn bg-olive btn-inline addBtn" value="GO">
              		
				</div>
							
				
               </div>
              </div>    
          --%>
          
         <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewoutletUserLog('OutletMonitoringUserLog','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewoutletUserLog('OutletMonitoringUserLog','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-10 <= 0}">
              		<div class="form-group col-lg-2" >
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
           	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewoutletUserLog('OutletMonitoringUserLog','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewoutletUserLog('OutletMonitoringUserLog','${totalValue}')">
              	</div> 
              	</c:if>
              	<div class="form-group col-lg-4"></div>
              	<div class="col-lg-6" style="text-align: right;"> 
              	<div class="col-lg-8" style="text-align: right;padding-right: 0px;margin-top: 2px;font-size: 16px;"><spring:message code="pages.label" /></div>
              	<div class="col-lg-2" style="padding-right: 0px;">
              		<select class="form-control" id="pagination">
              		<c:set var="totalRecords" value="${totalRecords}"></c:set>
              	<c:forEach var="i" begin="0" end="${totalRecords}">
              	<c:if test="${(totalRecords)>0}">
              		<option value="${(i*maxRecords)}" ${index == i*maxRecords ? 'selected' : ''}> ${i+1}</option>
              		<c:set var="totalRecords" value="${totalRecords-maxRecords}"></c:set>
              	</c:if>
				</c:forEach>
					</select>
              	
              	</div>
              		<div class="col-lg-2" style="padding-right: 0px;">
              		  <input type="button" onclick="viewoutletUserLog('OutletMonitoringUserLog',document.getElementById('pagination').value)" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
				</div>
              </div>    
          
            </div><!-- /.box-body -->
        </div><!-- /.box -->

</div>

</section>
 <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript">
          $(function() {
                $("#productstocks").dataTable({
       			  "bPaginate": false,
                  "bLengthChange": false,
                  "bFilter": false,
                  "bSort": false,
                  "bInfo": false,
                  "bAutoWidth": false,
                 
    			});
            }); 
        </script>
<%--        // <input type="hidden" id="deleteActionLabel" value="<spring:message code="receiptstock.label" />"/> --%>
</body>
</html>