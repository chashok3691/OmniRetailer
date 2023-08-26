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
       <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
       <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        <!-- DATA TABLES -->
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
          <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
       <%--   <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script> --%>
          <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
          <script type="text/javascript" src="${pageContext.request.contextPath}/js/priceUpdate.js"></script>
          <script src="${pageContext.request.contextPath}/js/outletReports/reports.js"></script>
         
<style type="text/css">
.buttons {
	float: right;
	padding-top: 0px;
	margin-right: 1%;
	margin-top:1%;
}
.iosclosebutton1 {
    width: 100%;
    border: 1px solid #3c8dbc;
    background: #3c8dbc;
    color: #fff;
    font-size: 15px!important;
    padding: 0px 0 0px 0;
    height: 24px!important;
    font-size: 18px;
    letter-spacing: 1px;
    float: right;
}
.list a.button {
position:relative;
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 5px 15px 5px 15px;
	background: #3c8dbc;
	border-radius: 5px;
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
}
a.button{
   position: relative;
    text-decoration: none;
    color: white;
    display: inline-block;
    padding: 7px 10px 32px 10px;
    background: #3c8dbc;
    cursor: pointer;
    margin-top: 15px;
    height: 23px;
    text-align: center;
    margin-bottom: 15px;
    width: 100%;
}
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
.col-lg1-2{
    width: 25% !important;
}
.iosclosebutton {
    width: 25%;
    border: 1px solid #3c8dbc;
    background: #3c8dbc;
    color: #fff;
    font-size: 15px!important;
    padding: 3px 0 4px 0;
    height: 30px!important;
    font-size: 18px;
    letter-spacing: 1px;
    float: right;
}
.iospopup {
    width: 22%!important;
    margin-left:45%;
    margin-top: 0%;
    border-radius: 0;
}
.modal-dialog {
    width: auto;
    margin: 30px auto;
}
.modal-dialog
{
 margin-top: 14.5%;
 }
 .imgWidth
 {
 width:52%;
 height:30px;
 }
 
.billsPopUp
{
	position: relative;
    border: 2px solid gray;
    border-radius: 10px;
    background: #eee;
    min-height: 400px;
    max-height: 500px;
}
.billsPopUpUpArrow
{
	float: right;
    margin-right: 1%;
    font-size: 35px;
    color: gray;
    position: relative;
    margin-top: -2.3%;
    border-bottom: 3px solid lightgrey;
    height: 25px;
    border-bottom-width: 2px;
}
@media (min-width:1400px) and (max-width:1600px)
{
.billsPopUp {
    	margin-left: -20px !important;
}
.modal-dialog
{
 margin-top: 13%;
 }
.billsPopUpUpArrow {
  margin-top: -2% !important;
  border-bottom-width: 3px !important;
 }
   
 }

@media only screen and (max-width:479px)
{
.billsPopUp {
    margin-right: -30px;
    margin-left: -30px;
}
.summaryImg{
		width: auto;
    float: left;
	}
}
@media (min-width: 1200px){
	.summaryBtn{
		margin-top: 3px;
	}
}
@media (min-width: 1200px){
	.summaryImg{
	     width: 50%;
    float: right;
	}
}
.billsPopUp::after {
    content: "";
    position: absolute;
    bottom: 100%;
    right: 1.5%;
    border-width: 14px;
    border-style: solid;
    border-color: transparent transparent #eee transparent;
}
.fa1{
   
        margin-top: -10px;
    font-size: 26px;
        cursor: pointer;
    color: grey;
}
.fa-sort-asc{
margin-top: 5px !important;
}
.modal-header .close {
    margin-top: -9px;
    color: #000;
}

@media (max-width: 900px){
	.searchWidth{
		width: 88% !important;
	}
}

</style> 
<script type="text/javascript">
$(document).ready(function(){
	
	callCalender("startDate");
	callCalender("endDate");
	

});
	
	
	</script>       
</head>
<body>
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
                                <div class="box-body table-responsive">
                                <div class="nav-tabs-custom">
 <ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#home" id="tab_1_SAPonline" style="text-transform: capitalize;">SAP Online</a></li>
  <li><a data-toggle="tab" onclick="" href="#menu1">SAP Offline</a></li>
  <li><a data-toggle="tab" onclick="" href="#menu1">Google API</a></li>
  <li><a data-toggle="tab" onclick="" href="#menu1">Uniware</a></li>
  <li><a data-toggle="tab" onclick="" href="#menu1">LogiNext</a></li>
  <li><a data-toggle="tab" onclick="" href="#menu1">Pharmarack</a></li>
 
</ul>

<div class="box-body">
 <div class="col-lg-11" style=" background: #f4f4f4;    padding: 23px 20px;    width: 88%;">
 
                                <div class="row">
                                   <div class="col-lg-3">
                                      <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                                        <label><spring:message code="zone.label"/></label>
                                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZoneForDashboard('outletZone','priceoutletLocation','')">
                           		              <option value=""><spring:message code="ALL.label"/></option>
	                                         <c:forEach var="zoneList" items="${zoneList}">
													<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}">${zoneList.zoneID}</option>
												</c:forEach>
	                                        </select>
                                      </div>
                                   </div>
                                   <div class="col-lg-3">
                                     <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                                       <label>Upload/Download</label>
                                        <select class="form-control" id="uploadDownload">
                                        <option value=""><spring:message code="ALL.label"/></option>
                           		           <option value="Upload" >Upload</option>
                                           <option value="Download" >Download</option>
	                                       
	                                    </select>
                                     </div>
                                  </div>
                   
                                <div class="col-lg-3">  
                                </div>
                                
                                <div class="col-lg-3">
	 <div class="col-lg-12 col-xs-8 col-sm-12 col-md-12" style="padding-left: 0px;">
	 <label>Start Date</label>
	 <input class="form-control calendar_icon " value="${startDate}" style="background-color: white;" id="startDate" size="20" type="text" onfocus="callCalender('startDate')" onclick="callCalender('startDate')" placeholder="DD/MM/YYYY" />
	                  </div>
	 			</div>
                                  
                            </div>
                            
                            <div class="row">
                               <div class="col-lg-3">
                                  <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                                    <label><spring:message code="location.label"/></label>
                                      
							           <select class="form-control" id="location" onchange="return changeInfoBasedOnLocation(this.options[this.selectedIndex].value,'${flowLocation}');">
								               <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="location" items="${allLocationsList}">
							    <option value="${location}" ${location == selectedLocation ? 'selected' : ''}>${location}</option>
							  
						 		</c:forEach>
							    </select>
							           
                                  </div>
                               </div>
                                <div class="col-lg-3">  
                                
           <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
            <label><spring:message code="billing_counter.label" /></label>
            <select class="form-control" name="counterId" id="counter">
               <option value=""><spring:message code="ALL.label"/></option>
               <c:forEach var="counter" items="${countersList}">
            	 <option value="${counter}"${counter == counterName ? 'selected' : ''}>${counter}</option>
 	           </c:forEach>
	             <c:forEach var="countersList" items="${counterDetails.warehouseCountersList}">
				<option value="${countersList.counterName}" ${countersList.counterName == counterName ? 'selected' : ''} id="${countersList.counterName}" >${countersList.counterName}</option>
			</c:forEach>
            </select>
            <span id="counterError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
            <input type="hidden" id="flowLocation" value="${flowLocation}">
            </div>
            </div>                               
                               
                                <div class="col-lg-3">  
                                </div>
                                
                                 <div class="col-lg-3">
                               <div class="col-lg-12 col-xs-8 col-sm-12 col-md-12" style="padding-left: 0px;">
	 							<label>End Date</label>
	                    <input class="form-control calendar_icon " value="${endDate}" style="background-color: white;" id="endDate" size="20" type="text" onfocus="callCalender('endDate')" onclick="callCalender('endDate')" placeholder="DD/MM/YYYY" />
	                </div>
	                </div>
	                
                    </div>
                  </div>
                  <div class="col-lg-1 searchWidth" style="width: 12%;background: #ccc;">
                               <div class="col-lg-12" style="    border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">
                                  <div class="row">
                                    <a onclick="viewIntegrationDashboard('integrationMonitoring','0');" class="button"><spring:message code="searchbutton.label" /></a>
                                  </div>
                                 <div class="row">
                                    <a type="button" style="margin-top: 18px"  onclick="resetForm();" class="button" ><spring:message code="clearbutton.label"/></a>
                                 </div>
                              </div>
                            </div>
                            
                            
                            <div class="row">
                           	<div class="col-lg-12">
                           
                             <div class="row" style=" margin-top: 1%;">
                              <div class="col-lg-10">
                            <div id="successMsg" class="Success" style="text-align: center;color: blue;font-size: 2;font-weight: bold;">${successMsg}</div>
                            <div id="ErrorMSg" class="Success" style="text-align: center;color: red;font-size: 2;font-weight: bold;">${errorMsg}</div>
                              
                              </div>
                                 <div class="col-lg-2" style="padding-right: 0px;">
							 <input type="button" style="padding-left: 0px; margin-left: -9%;" class="btn bg-olive btn-inline addBtn" onclick="allBillPushtoSAPfromID('${IntegrationList.store_location}','0');" value="Reload All Locations">
								           </div>
                            </div>
                           <div style="overflow: auto;">         
                          <table id="integrationDashboard"  class="table table-bordered table-striped" >
                              <thead style="background-color: #3c8dbc; color: #ffffff">
                               <tr>
                             	 <th><div style=""><spring:message code="sl.no.label" /></div></th>
                             	 <th>Location</th>
                             	 <th>Counter Name</th>
                             	 <th>Date</th>
                             	 <th>Total Bills</th>
                             	 <th>Uploaded Bills</th>
                             	 <th>Pending Bills</th>
                             	 <th>SAP Status</th>
                             	 <th>Error</th>
                                 <th style="width:70px">Action</th>
                             </tr>
                         </thead>
                         <tbody style="text-align: center;">
                          	
                       <c:forEach var="IntegrationList" items="${intMonitorDetails}" varStatus="thecount">
									<tr>
										<td>${thecount.index+index}</td>
										<td>${IntegrationList.store_location}</td>
										<td>${IntegrationList.counterId}</td>
										<td>${IntegrationList.business_date_str}</td>
										<td>${IntegrationList.totalBills}</td>
										<td>${IntegrationList.uploadedBills}</td>
										<td>${IntegrationList.pendingBills}</td> 
										<td>${IntegrationList.sapStatus}</td>
										<td></td>
										<td>
										<a style="color: #2e7ea7 !important; cursor: pointer;" onclick="billPushtoSAPfromID('integrationMonitoring','0','${IntegrationList.store_location}','${IntegrationList.business_date_str}','${IntegrationList.counterId}');">Reload</a>
										</td>
									</tr>
								</c:forEach>
                         </tbody>
                     </table>
                     </div>
                     </div>
                     </div>
                     
                     <!-- Pagination -->
                     
                     <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}"> 
              		<div class="form-group col-lg-6 col-xs-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewIntegrationDashboard('integrationMonitoring','${totalValue}');">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6 col-xs-6 " style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewIntegrationDashboard('integrationMonitoring','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-maxRecords <= 0}">
              		<div class="form-group col-lg-6 col-xs-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-6 col-xs-6 " style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewIntegrationDashboard('integrationMonitoring','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewIntegrationDashboard('integrationMonitoring','${totalValue}');">
              	</div> 
              	</c:if>
             
				<div class="col-lg-6 col-xs-6" style="float:right;">
              	<div class="col-lg-8 col-xs-4" style="text-align: right;padding-right: 0px;margin-top: 2px;font-size: 16px;"><spring:message code="pages.label" /></div>
              	<div class="col-lg-2 col-xs-4" style="padding-right: 0px;">
              		<select class="form-control" id="pagination">
              		<c:set var="totalRecords" value="${totalRecords+1}"></c:set>
              	<c:forEach var="i" begin="0" end="${totalRecords}">
              	<c:if test="${(totalRecords)>0}">
              		<option value="${(i*maxRecords)}" ${index-1 == i*maxRecords ? 'selected' : ''}> ${i+1}</option>
              		<c:set var="totalRecords" value="${totalRecords-maxRecords}"></c:set>
              	</c:if>
				</c:forEach>
					</select>
              	
              	</div>
              		<div class="col-lg-2 col-xs-4" style="padding-right: 0px;"> 
              		  <input type="button" onclick="viewIntegrationDashboard('integrationMonitoring',document.getElementById('pagination').value);" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
             
				</div>
              </div>
              
                     
                     </div><!-- box-body -->
</div>

</div>
</div>
</div>
</div>
</section>

<!-- DATA TABES SCRIPT -->
    	<script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
         <!-- page script -->
        <script type="text/javascript">
            $(function() {
               // $("#example1").dataTable();
                $('#integrationDashboard').dataTable({
                    "bPaginate": false,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": false,
                    "bInfo": false,
                    "bAutoWidth": true
                });
            });
        </script>
        
</body>
</html>