<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Koti Bommineni
 * file name		        : inventorymanager/packagingandprocessing/packagingandprocessingsummary.jsp
 * file type		        : JSP
 * description				: The new storage system form is displayed using this jsp
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
		<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
	
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
         	<script type="text/javascript" src="${pageContext.request.contextPath}/js/eventManagement.js"></script>   

</head>
<style>
.allignment{
   /*   width: 13.3%; */
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
.{
    width: 20% !important;
}
.form-control {
   /*  height: 24px; */
    padding: 0px 6px;
    }
    
    .calendar_icon {
    background-position: 3px 3px;
    }
   .form-group {
    margin-bottom: 10px;
}
</style>
<script type="text/javascript">

$(document).ready(function(){
	debugger;
	callCalender('from');
	callCalender('to');
	openMenu("storedetails", "ulstoredetails",0);
	activeMenu("outletEvents");	 
	
	
	
	
	$('#mySearch').click(function(){
	    return viewEventsManagement('outletEvents','0')
	})
	$('#searchEvent').keypress(function(e){
	    if(e.which == 13){//Enter key pressed
	        $('#mySearch').click();//Trigger search button click event
	    }
	});
	
	$('#searchEvent').on('input',function(e){
	    if($(this).val().trim()==""){
	    	viewEventsManagement('outletEvents','0')
	    }
	}); 
		});
		
/* $('#searchEvent').on('input',function(e){
    var searchEvent = $('#searchEvent').val();
    if(searchEvent == "" || searchEvent.length >= 3)
    return viewEventsManagement('outletEvents','0');
}) */	






</script>
<body>


<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
      <div class="box-header" align="center">
		<h3 class="box-title" style="padding :5px;  border:1px solid  #808080;font-weight: bold;">
			Events Summary
		</h3>
		
		 <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
           <div id="Success" style="text-align:center;color:blue;font-weight:bold;">${success}</div>
                                	 
		</div><!-- /.box-header -->
             <div class="box-body table-responsive">
                         <div class="col-lg-11" style="background: #d9d9d9;    padding: 10px 20px;    width: 88%;
    ">
                  <div class="row">
                         <div class=" col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="zone.label"/></label>
                          
                           <select class="form-control" id="outletZone" style=" cursor: pointer;"><!-- onchange="searchlocationsBasedOnZoneForDashboard('outletZone','outletLocation','warehouse')" -->
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == selectedzone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
	                        
                         </div>
                      </div>
                      <div class=" col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label>Event Type</label>
                           <select class="form-control" id="eventTypeSummary" style=" cursor: pointer;">
								
								 <option value="" ${'' == selectedeventType ? 'selected' : ''}><spring:message code="ALL.label"/></option>
                           		<option value="Corporate events" ${'Corporate events' == selectedeventType ? 'selected' : ''}>Corporate events</option>
								<option value="Weddings" ${'Weddings' == selectedeventType ? 'selected' : ''}>Weddings</option>
								<option value="Cricket" ${'Cricket' == selectedeventType ? 'selected' : ''}>Cricket</option>
								<option value="Sports" ${'Sports' == selectedeventType ? 'selected' : ''}>Sports</option>
								<option value="Music shows" ${'Music shows' == selectedeventType ? 'selected' : ''}>Music shows</option>
								<option value="Festive events" ${'Festive events' == selectedeventType ? 'selected' : ''}>Festive events</option>
								<option value="Spiritual events" ${'Spiritual events' == selectedeventType ? 'selected' : ''}>Spiritual events</option>
								<option value="Education institute events" ${'Education institute events' == selectedeventType ? 'selected' : ''}>Education institute events</option>
								<option value="Schools" ${'Schools' == selectedeventType ? 'selected' : ''}>Schools</option>
								<option value="Exhibitions" ${'Exhibitions' == selectedeventType ? 'selected' : ''}>Exhibitions</option>
											
								
								
										 
										
	                        </select>
                      </div>
                      </div>
                    <div class=" col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label>Sales Person</label>
                           <select class="form-control" id="salesPersonSummary" style=" cursor: pointer;">
                           		 <option value=""><spring:message code="ALL.label"/></option>
                           		
                           		<c:forEach var="employees" items="${employeeList}">
                           		<c:if test = "${fn:containsIgnoreCase(employees.department, 'sales')}">
                           		
									<option value="${employees.firstName}" ${employees.firstName == selectedsalesPerson ? 'selected' : ''}  >${employees.firstName}</option>
						 		</c:if>
						 		</c:forEach>
                           		
                           		 
	                        </select>
                      </div>
                      </div>
                     <div class=" col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                          
                      </div>
                      </div>
                       
                         <div class=" col-lg-2">
              <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                 		<label><spring:message code="offer_start_date.label"/></label>
                	 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${selectedstartDate}" style="background-color: white;cursor: pointer;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
	              </div>
	            </div>
	           
                    </div>
                     <div class="row">
                       <div class=" col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="location.label"/></label>
                           <select class="form-control" id="outletLocationSummary" style=" cursor: pointer;">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="location1" items="${locationsList}">
				                <option value="${location1}" ${location1 == selectedlocation ? 'selected' : ''} id="${location1}" >${location1}</option>
								</c:forEach>
	                        </select>
                      </div>
                      </div>
                   
                       <div class=" col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label>Status</label>
                           <select class="form-control" id="eventstatusSummary" style=" cursor: pointer;">
                           		<option value="" ${selectedstatus == '' ? 'selected' : ''}>ALL</option>
                           		 <option value="Draft" ${selectedstatus == 'Draft' ? 'selected' : ''}>Draft</option>
                           		 <option value="Submitted" ${selectedstatus == 'Submitted' ? 'selected' : ''}>Submitted</option>
                           		 <option value="Approved" ${selectedstatus == 'Approved' ? 'selected' : ''}>Approved</option>
                           		  <option value="Rejected" ${selectedstatus == 'Rejected' ? 'selected' : ''}>Rejected</option>
                           		 <option value="Cancelled" ${selectedstatus == 'Cancelled' ? 'selected' : ''}>Cancelled</option>
                           		 <option value="Closed" ${selectedstatus == 'Closed' ? 'selected' : ''}>Closed</option>
	                           
	                        </select>
                      </div>
                      </div>
                       <div class=" col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           
                      </div>
                      </div>
                        <div class=" col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           
                      </div>
                      </div>
                      <div class=" col-lg-2">
	               <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="offer_end_date.label"/></label>
	                 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${selectedendDate}" style="background-color: white;cursor: pointer;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div>
                    </div>
                  </div>
                  <div class="col-lg-1" style="    width: 12%;    background: #a9a9a9;">
                  <div class="col-lg-12" style="    border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">
                  <div class="row">
                  <a onclick="viewEventsManagement('outletEvents','0')" class="button"><spring:message code="searchbutton.label"/></a>
                  </div>
                  <div class="row">
                  <a onclick="resetForm();" class="button"><spring:message code="clearbutton.label"/></a>
                  </div>
                  </div></div>
               <%--      <div class="row">
                     <div class="col-lg-3" style="padding-left:15px;">
                    <label><spring:message code="startprice.label"/></label>
                    
                      </div>
                     
                       <div class="col-lg-1">
                      
                      </div>
                        
                       <div class="col-lg-3">
                     
                      </div>
                     <div class="col-lg-3">
                      
                      </div>
                    
                    </div>
                    <br> --%>
                    
                    
                             <div class="row" style="margin-top: 13%;">
                     <div class="col-lg-8" style="padding-left:15px;">
                
                      </div>
                      
                    <div class="col-lg-4 nopadding">
                      <div class="col-lg-12">
                     <div class="col-lg-4"  style="padding-right: 0%;">
                      Location
                      
                      <select class="form-control" id="outletLocation" style=" ">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="location1" items="${locationsList}">
				                <option value="${location1}" ${location1 == loadLocation ? 'selected' : ''} id="${location1}" >${location1}</option>
								</c:forEach>
	                        </select>
                     </div>
                     
                      <div class="col-lg-4"  style="padding-right: 0%;">
                       <label>Load Type</label>
                           <select class="form-control" onclick="selectloadType();"  var="loadType" id="loadBtnType" style=" cursor: pointer;">
                           		 <option value="Menu" selected>Menu</option>
                           		 <option value="Inventory">Inventory</option>
	                        </select>
                     </div>
                     
                     <div class="col-lg-4" style="padding-right: 1%;">
                       <label></label>
                     
                           <input type="button" style="" class="btn bg-olive btn-inline  addBtn" id="loadMenu" onclick="loadMenu();" value="Load...">
                            <input type="button" style="display: none;" class="btn bg-olive btn-inline  addBtn" id="loadInventory" onclick="loadInventory();" value="Load...">
                     </div>   
                     
                     
				  </div> 
                    </div>
                    </div>
                  
                    
                    
                    
                    
                    <br>
                    <div class="row" style="margin-top: -1%;">
                       <div class="col-lg-1 col-xs-2">
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewEventsManagement('outletEvents','0')">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
				                      
				                      <!--added by manasa  -->
				                      <%-- <div class="col-lg-10 col-xs-9" style="padding-left:0px;">
                      	 
                   
                    <input type="text" class="form-control" value="${selectedsearchName}" id="searchEvent" placeholder="Search Event" style="height:30PX;background:url(/OmniRetailer/images/search.png) no-repeat;background-position:right;">
                   
                   <div class="services">
						    				<div class="items">
						     				<ul class="matchedStringUl searchEventsSummary" style=""></ul>
						   					</div>
										</div>
                    </div> --%>
                    
                    <div class="col-lg-10 col-xs-9 " style="margin-left: -17px; margin-right: 14px;">
                                                     <div class="wrapper">
                                                               <input type="text"  class="form-control" style="" value="${selectedsearchName}" id="searchEvent" placeholder="Search Event" />
                                                                                        <button id="mySearch" class="searchbutton"></button>
                                                                                        <!-- <div class="services">
                                                                                            <div class="items">
                                                                                                     <ul class="matchedStringUl searchBills" style=""></ul>
                                                                                                   </div>
                                                                                        </div> -->
                                                                                <%-- <input type="hidden" id="bill" value="${searchName}"> --%>
                                                    </div>
													</div>  
				                      
                   
                  
                  <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="newEventManagement('new')" value="<spring:message code="addnew.label" />">
								           </div>
								            
                  
                  
                 
                        
                    </div>
                  
                 
                   <div>
                     <div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;">
                   
                     <table id="productstocks" class="table table-bordered table-striped" style="    margin-top: 1px !important;">
                      <thead style="background-color: #3c8dbc; color: #ffffff">
                             <tr>
                              <c:if test="${sessionScope.role == 'super admin'}"> 
                                             	<th style="width: 40px" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                                             </c:if>
                             	                <th><spring:message code="s.no.label" /></th>
                             	                <th><spring:message code="event.name.label" /></th>
                                                <th><spring:message code="created.date.label" /></th>
                                                <th><spring:message code="updated.date.label" /></th>
                                                <th>Start Date</th>
                                                <th>End Date</th>
                                               
                                                <th><spring:message code="event.id.label" /></th>
                                                <th><spring:message code="event.dpid.label" /></th>
                                                <th><spring:message code="event.location.label" /></th>
                                                <th><spring:message code="status.label" /></th>
                                               
                                                <th><spring:message code="salesperson.label" /></th>
                                                 <th>Type</th>
                                                  <th><spring:message code="counters.label" /></th>
                                                <th><spring:message code="EmployeeForm.action" /></th>

                             </tr>
                         </thead>
                         <tbody style="text-align: center;">
                            <c:forEach var="eventslist" items="${eventMastersList}"  varStatus="theCount">
                         	 <tr>
								 <td>${theCount.index + index}</td>
                         	 	<td>${eventslist.eventName}</td>
                         	 	<td>${eventslist.createdDateStr}</td>
                             	<td>${eventslist.updatedDateStr}</td>
                             	<td>${eventslist.startDateStr}</td>
                             	<td>${eventslist.endDateStr}</td>
                             	<td >${eventslist.eventReference}</td>
                             	<td>${eventslist.outletStoreLocation}</td>
                             	<td>${eventslist.outDoorCateringLocation}</td>
                                 <td>${eventslist.workflowStatus}</td>
                                <td>${eventslist.salePerson}</td>
                                <td>${eventslist.eventType}</td>
                                <td>${eventslist.countersRequired}</td>
                                 <td>
                                 <c:set var="editcount" value='0'></c:set>
                                 <c:set var="viewcount" value='0'></c:set>
                                <c:forEach var="accessControl" items="${sessionScope.outletManagement}">
	                            	<c:if test="${accessControl.appSubflow == 'Event' && accessControl.read == true}">
	                          <c:set var="viewcount" value='${viewcount+1}'></c:set>
	                          <c:if test="${viewcount == 1}">
                             <a style="color:#2e7ea7 !important;" onclick="viewEditEventManagement('${eventslist.eventReference}','view')" href="#" >View</a>                          			
                                       </c:if>
                                        </c:if>
                          	</c:forEach>
                          
                          &nbsp;&nbsp;&nbsp;
                                   <c:forEach var="accessControl" items="${sessionScope.outletManagement}">
	                            	<c:if test="${accessControl.appSubflow == 'Event' && accessControl.write == true}"> 
                                  <c:set var="editcount" value='${editcount+1}'></c:set>
                                   <c:if test="${editcount == 1}">
                                    <c:forEach var="location1" items="${locationsList}">
                                     <c:if test="${location1 == eventslist.outletStoreLocation}">
                                  <a style="color:#2e7ea7 !important;" onclick="viewEditEventManagement('${eventslist.eventReference}','edit')" href="#" >Edit</a>
				                </c:if>
								</c:forEach>
                                   
                                   
                                   
                          			</c:if>
                          			</c:if>
                          	</c:forEach>
                          
                                 
                                               
                                 </td>
                             </tr>
                            </c:forEach>
                           
                         </tbody>
                     </table>
                    </div>
                     </div>


<div class="col-lg-8"></div>
                       <div class="col-lg-4" style="padding-right: 0px; text-align: right;" >
            
              </div>
              <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewEventsManagement('outletEvents','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewEventsManagement('outletEvents','${index - 11}')"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-maxRecords <= 0}">
              		<div class="form-group col-lg-2" >
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-2">  
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewEventsManagement('outletEvents','${index - 11}')"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="return viewEventsManagement('outletEvents','${totalValue}')">
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
              		<option value="${(i*maxRecords)}" ${index-1 == i*maxRecords ? 'selected' : ''}> ${i+1}</option>
              		<c:set var="totalRecords" value="${totalRecords-maxRecords}"></c:set>
              	</c:if>
				</c:forEach>
					</select>
              	
              	</div>
              		<div class="col-lg-2" style="padding-right: 0px;">  
              		  <input type="button" onclick="viewEventsManagement('outletEvents',document.getElementById('pagination').value)" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
             
				</div>
              	
              </div>    
              	
              </div>    


                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
  
</div>
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
                  "bAutoWidth": false
    			});
            });
        </script>
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="receiptstock.label" />"/>
</body>
</html>