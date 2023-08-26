<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Koti Bommineni
 * file name		        : Reports/OutletReports/OutletSalesReports/eventReport.jsp
 * file type		        : JSP
 * description				: The new events Report displayed using this jsp
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
	
	
	$('#mySearch').click(function(){
	    return viewEventsReport('eventsReport','0','outlet');
	})
	$('#searchEvent').keypress(function(e){
	    if(e.which == 13){//Enter key pressed
	        $('#mySearch').click();//Trigger search button click event
	    }
	});
	
	$('#searchEvent').on('input',function(e){
	    if($(this).val().trim()==""){
	    	viewEventsReport('eventsReport','0','outlet');
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
			Events Summary - Report
		</h3>
		
		 <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
           <div id="Success" style="text-align:center;color:blue;font-weight:bold;">${success}</div>
                                	 
		</div><!-- /.box-header -->
             <div class="box-body table-responsive">
                         <div class="col-lg-11" style="background: #d9d9d9;    padding: 10px 20px;    width: 88%;">
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
                  <a onclick="viewEventsReport('eventsReport','0','outlet');" class="button"><spring:message code="searchbutton.label"/></a>
                  </div>
                  <div class="row">
                  <a onclick="resetForm();" class="button"><spring:message code="clearbutton.label"/></a>
                  </div>
                  </div></div>
                    <div class="row">
                     <div class="col-lg-3" style="padding-left:15px;">
                 <%--    <label><spring:message code="startprice.label"/></label> --%>
                    
                      </div>
                     
                       <div class="col-lg-1">
                      
                      </div>
                        
                       <div class="col-lg-3">
                     
                      </div>
                     <div class="col-lg-3">
                      
                      </div>
                    
                    </div>
                    <br>
                    <br>
                    <div class="row">
                       <div class="col-lg-1 col-xs-2">
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange=";">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
				                      
				                     
                    
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
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="viewEventsReport('eventsReport','0','outlet','true');" value="Save">
								          <input type="hidden" id="eventsReport" value="${saveReport}">
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
                                                <th>Event ID</th>
                             	                <th><spring:message code="event.name.label" /></th>
                             	                <th>Date</th>
                                                <th>Stroe Location (DPID)</th>
                                                <th>Zone/Region</th>
                                                <th>Total Bills</th>
                                                <th>Sold Qty</th>
                                                <th>Cash Total</th>
                                                <th>Card Total</th>
                                                <th>UPI Total</th>
                                                <th>Credit Note Issue</th>
                                                <th>Exchange Amount</th>
                                                <th>Sodexo Total</th>
                                                <th>Ticket Total</th>
                                                <th>Loyalty Claim</th>
                                                <th>Credit Note Radeem</th>
                                                 <th>Discount</th>
                                                <th>CGST</th>
                                                <th>SGST</th>
                                                <th>Total Tax</th>
                                                <th>GIFT Vouchers</th>
                                                <th>Coupons</th>
                                                <th>Others Amount</th>
                                                <th>Credits Amount</th>
                                                <th>Credits Sales</th>
                                                <th>Day Turnover</th>
                                                <th>Net Sales</th>
                                                <th>Gross Amount</th>
                                                <th>Total Sales</th>

                             </tr>
                         </thead>
                         <tbody style="text-align: center;">
                            <c:forEach var="eventsReportlist" items="${eventReportList}"  varStatus="theCount">
                         	 <tr>
								<td>${theCount.index + index}</td>
                             	<td>${eventsReportlist.eventId}</td>
                         	 	<td>${eventsReportlist.eventName}</td>
                             	<td>${eventsReportlist.date}</td>
                             	<td>${eventsReportlist.storeLocation}</td>
                         	 	<td>${eventsReportlist.zoneId}</td>
                             	<td>${eventsReportlist.totalBills}</td>
                             	<td>${eventsReportlist.soldQty}</td>
                             	<td>${eventsReportlist.cashTotal}</td>
                             	<td>${eventsReportlist.cardTotal}</td>
                                <td>${eventsReportlist.upiTotal}</td>
                                <td>${eventsReportlist.returnedAmt}</td>
                                <td>${eventsReportlist.exchangedAmt}</td>
                                <td>${eventsReportlist.sodexTotal}</td>
                                <td>${eventsReportlist.ticketTotal}</td>
                                <td>${eventsReportlist.loyaltyTotal}</td>
                                <td>${eventsReportlist.creditTotal}</td>
                                <td>${eventsReportlist.discount}</td>
                                <td>${eventsReportlist.cgst}</td>
                                <td>${eventsReportlist.sgst}</td>
                                <td>${eventsReportlist.taxAmt}</td>
                                <td>${eventsReportlist.vouchersTotal}</td>
                                <td>${eventsReportlist.couponsTotal}</td>
                                <td>${eventsReportlist.othersAmt}</td>
                                <td>${eventsReportlist.creditsAmt}</td>
                                <td>${eventsReportlist.creditBillsAmt}</td>
                                <td>${eventsReportlist.dayTurnOverAmt}</td>
                                <td>${eventsReportlist.netSales}</td>
                                <td>${eventsReportlist.grossAmount}</td>
                                <td>${eventsReportlist.totalSales}</td>
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
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewEventsReport('eventsReport','${totalValue}','outlet');">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewEventsReport('eventsReport','${index - 11}','outlet');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewEventsReport('eventsReport','${index - 11}','outlet');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="return viewEventsReport('eventsReport','${totalValue}','outlet');">
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
              		  <input type="button" onclick="viewEventsReport('eventsReport',document.getElementById('pagination').value,'outlet');" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
             
				</div>
              	
              </div>    
              	
              </div>    
				<input type="hidden" id="printeventsReportURL" value="${printUrl}">

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
                  "bAutoWidth": false
    			});
            });
        </script>
        
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="receiptstock.label" />"/>
</body>
</html>