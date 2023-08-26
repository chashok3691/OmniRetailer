<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Manasa
 * file name		        : MasterDataManagement/OutletMasters/viewStockUpdate
 * file type		        : JSP
 * description				: The sku  details table is displayed using this jsp
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
         <script type="text/javascript" src="${pageContext.request.contextPath}/js/fleetmaster.js"></script>
         
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
    /* border-radius: 5px; */
    /* box-shadow: 1px 0px 2px #000; */
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
  /*   margin-right:2%; */
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
      /*   margin-right:2% !important; */
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
    /* left: 50%; */
    right: 1.5%;
    /* margin-left: 9px; */
    border-width: 14px;
    border-style: solid;
    border-color: transparent transparent #eee transparent;
}
.fa1{
   /*    border: 1px solid grey;
    border-radius: 50%;
    width: 29px;
    text-align: center;
    height: 28px; */
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
    /* border: 1px solid #000; */
}
</style> 
<script type="text/javascript">
$(document).ready(function(){
	callCalender('from');
	callCalender('to');
	

	$('#searchFleets').on('input',function(e){
		if($(this).val().trim()==""){
			viewFleetMasterSummaryDetails('WarehouseFleetMaster','0');
		}
	});
	
	$('#mySearch').click(function(){
	    var search = $('#searchFleets').val();
	    return viewFleetMasterSummaryDetails('WarehouseFleetMaster','0');
	})
	$('#searchFleets').keypress(function(e){
	    if(e.which == 13){//Enter key pressed
	        $('#mySearch').click();//Trigger search button click event
	    }
	});	
	
});
	
	function criteria(str) {

	    var x = $(str).val();
	    if (x.includes("'") || x.includes("/") || x.includes("(")  || x.includes(")") || x.includes("|") || x.includes("$") || x.includes("\n") || x.includes("~") || x.includes("`") || x.includes("!") || x.includes("%") || x.includes('"') ||   x.includes("<") || x.includes(">")  || x.includes("*") || x.includes("#") || x.includes(":") ||  x.includes(";")  || x.includes("{") || x.includes("}") || x.includes("[") ||  x.includes("]") || x.includes("=") || x.includes("+") || x.includes("^") || x.includes("?")|| x.includes("@") ){
	    
	            alert("Special characters are not allowed!");
	            x=$(str).val().replace(/['&~%/\\#!]/g,' ');
	    /*   x=$(str).val(""); */

	    }
	     $(str).val(x.trim());
	}
	</script>       
</head>
<body>
 <!-- Content Header (Page header) -->


<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
  <div class="box box-primary">
   <div class="box-header" align="center">
               <h3  class="box-title" style="border:1px solid #3d3838;;font-weight: bold;padding:5px">Fleet Master-Summary</h3>
           </div>
               <br>
               <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -10px">${err}</div>
  
                      <div class="box-body table-responsive">
                          
		                   <div class="col-lg-11" style=" background: #f4f4f4;padding: 23px 20px;width: 88%;">
                                <div class="row">
                                   <div class="col-lg1-2 col-lg-2">
                                      <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                                        <label><spring:message code="zone.label"/></label>
                                           <select class="form-control" id="warehouseZone" onchange="searchlocationsBasedOnZoneForDashboard('outletZone','priceoutletLocation','')">
                           		              <option value=""><spring:message code="ALL.label"/></option>
	                                         <c:forEach var="zoneList" items="${zoneList}">
													<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}">${zoneList.zoneID}</option>
												</c:forEach>
	                                        </select>
                                      </div>
                                   </div>
                                    <div class="col-lg1-2 col-lg-2">  
              						<div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
            						<label>Status</label>
            						<select class="form-control" name="status" id="status" style="">
                                                   <option value="true" >Active</option>
                                                   <option value="false" >InActive</option>
                                                  
				                        	  </select>
				                        	 
 									</div>
	 </div>
	 
	   <div class="col-lg1-2 col-lg-2"> </div>
	 <div class="col-lg1-2 col-lg-2">
	 <label>Start Date</label>
	 <div class="col-lg-12 col-xs-8 col-sm-12 col-md-12" style="padding-left: 0px;">
	                    <input class="form-control calendar_icon " readonly="readonly" value="" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
	                  </div>
                      
	 
	 </div>
<input type="hidden" id="sd" value="${startDate}">
<input type="hidden" id="ed" value="${endDate}">
                            </div>
                            <div class="row">
                               <div class="col-lg1-2 col-lg-2">
                                  <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                                    <label><spring:message code="location.label"/></label>
                                      <input type="hidden" id="tolocation" value="${selectedLocation }">
							           <select class="form-control" id="warehouseLocation" >
								               <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="location" items="${locationsList}">
							    <option value="${location}" ${location == selectedLocation ? 'selected' : ''}>${location}</option>
							  
						 		</c:forEach>
							    </select>
                                  </div>
                               </div>
                               
                               <div class="col-lg1-2 col-lg-2">  </div>
                               
                                <div class="col-lg1-2 col-lg-2">  </div>
                                <div class="col-lg1-2 col-lg-2">
                                <input type="hidden" id="sd" value="${startDate}">
			                    <input type="hidden" id="ed" value="${endDate}">
	 							<label>End Date</label>
                               <div class="col-lg-12 col-xs-8 col-sm-12 col-md-12" style="padding-left: 0px;">
	                    <input class="form-control calendar_icon " readonly="readonly" value="" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
	                </div>
	                
	                </div>
	                
                             
                           
                    </div>
                  </div>
                  
                            <div class="col-lg-1" style="    width: 12%;    background: #ccc;">
                               <div class="col-lg-12" style="    border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">
                                  <div class="row">
                                    <a onclick="viewFleetMasterSummaryDetails('WarehouseFleetMaster','0');" class="button"><spring:message code="searchbutton.label" /></a>
                                  </div>
                                 <div class="row">
                                    <a type="button" style="margin-top: 18px"  onclick="resetFormFleet();" class="button" ><spring:message code="clearbutton.label"/></a>
                                 </div>
                              </div>
                            </div>
                  
                               <div class="col-lg-12">
                                <br>
                               </div>
									    <div class="row">
									      <div class="col-lg-1 col-xs-2" style="margin-top: 0px;">
								                <select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewFleetMasterSummaryDetails('WarehouseFleetMaster','0');">
								               		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
								               		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
								               		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
								              		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
								               	 </select>
								           </div>
				                       <div class="col-lg-10 col-xs-8" style="margin-left: -15px;">
                                          <div class="wrapper">	 
                                                 <input type="text"  class="form-control" style="" value="${searchName}" id="searchFleets" placeholder="Search Fleets" />
							                      <button id="mySearch" class="searchbutton"></button>
							              </div>
						                         <input type="hidden" id="UpdateSearch" value="${searchName}">
                                       </div>
                                       
                                       
                                       	<div class="col-lg-1" style="padding-left: 0px;margin-left:15px;">
								                <input type="button" style="" class="btn bg-olive btn-inline  addBtn" onclick="newWarehouseFleetMaster('WarehouseFleetMaster','0');" value="Add New">
								          </div>
					                </div>
					       <div style="overflow: auto;">         
                          <table id=""  class="table table-bordered table-striped" >
                              <thead style="background-color: #3c8dbc; color: #ffffff">
                               <tr>
                             	 <th><div style=""><spring:message code="sl.no.label" /></div></th>
                             	 <th>Transporter Id</th>
                             	 <th>Transporter Name</th>
                             	 <th>Created Date</th>
                             	 <th>Location</th>
                             	 <th>Contact No</th>
                             	 <th>No of Vehicles</th>
                             	 <th>GST No</th>
                             	 <th>Email ID</th>
                                 <th>Status</th>
                                 <th style="width:70px">Action</th>
                             </tr>
                         </thead>
                         <tbody style="text-align: center;">
                         <c:forEach var="fleetList" items="${fleetList}" varStatus="thecount">
									<tr>
									    <%-- <c:if test="${sessionScope.role == 'super admin'}"> 
									 	<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value="${batchList.batch_id }" /></td>
									  </c:if> 
									   <c:forEach var="accessControl" items="${sessionScope.dataManagement}">
                           				<c:if test="${accessControl.appDocument == 'BatchOperations' && accessControl.write == true}"> 
											<td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value="${batchList.batch_id }" /></td>
										</c:if>
									</c:forEach> --%>    
										<td>${thecount.index+index}</td>
										<td>${fleetList.tranporterId}</td>
										<td>${fleetList.transporterName}</td>
										<td>${fleetList.createdDate}</td>
										<td>${fleetList.location}</td>
										<td>${fleetList.phoneNo}</td>
										<td>${fleetList.noofrec}</td> 
										<td>${fleetList.gstId}</td>
										<td>${fleetList.userName}</td>
										<c:choose>
										
						          	 	<c:when test="${fleetList.status == 'true'}">
							        	<td>Active</td>
							        	</c:when>
							        	<c:otherwise>
							       	 	<td>InActive</td>
							        	</c:otherwise>
							    		</c:choose>
							    		
										<%-- <td>${fleetList.status}</td> --%>
										 <td>
											<a style="color: #2e7ea7 !important; cursor: pointer;" onclick="return viewFleetMasterDetails('${fleetList.tranporterId}','view')">View</a>&nbsp;&nbsp;&nbsp;
										  <%-- <c:if test="${sessionScope.role == 'super admin'}">   --%>
											<a style="color: #2e7ea7 !important; cursor: pointer;" onclick="return viewFleetMasterDetails('${fleetList.tranporterId}','edit')">Edit</a>
										 <%--  </c:if>   --%>
										  <%-- <c:forEach var="accessControl" items="${sessionScope.dataManagement}">
                            				<c:if test="${accessControl.appDocument == 'BatchOperations' && accessControl.write == true}"> --%> 
												<%-- <a style="color: #2e7ea7 !important; cursor: pointer;" onclick="return viewEditBatchOperation('${batchList.batch_id}','edit')">Edit</a> --%>
											<%-- </c:if>
										</c:forEach>  --%>
										</td> 
									</tr>
								</c:forEach>
                         </tbody>
                     </table></div>
                     </div>
                       <div class="panel-group" id="accordion">
                         <div class="col-lg-12" style="">
                         </div>
                      </div>
                      <div class="panel-group" id="accordion">
                        <input type="hidden" id="flowUnder" value="${flowUnder}">
                       <div class="row" style="margin-right:0%;margin-left: 0.1%;">
              	          <c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		          <div class="form-group col-lg-6" style="text-align: left;">
              		                <input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		                <input type="button" class='paginationButton' value="&#62;" onclick="viewFleetMasterSummaryDetails('WarehouseFleetMaster','${totalValue}');">
              	              </div>									
                       	</c:if>
                       	<c:if test="${totalValue == totalRecords}">
              			   <c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		          <input type="button" class='paginationButton' value="&#60;" onclick="return viewFleetMasterSummaryDetails('WarehouseFleetMaster','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} 
              		          <input type="button" class='paginationButton' value="&#62;" >
              		        </div>
              			  </c:if>
              			<c:if test="${totalValue-maxRecords <= 0}">
              		      <div class="form-group col-lg-6" style="text-align: left;">
              		       <input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		       <input type="button" class='paginationButton' value="&#62;" >
              	          </div>
              	        </c:if>
              	       </c:if>
              	    <c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		   <div class="form-group col-lg-6" style="text-align: left;">
              		      <input type="button" class='paginationButton' value="&#60;" onclick="return viewFleetMasterSummaryDetails('WarehouseFleetMaster','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} .
              		      <input type="button" class='paginationButton' value="&#62;" onclick="viewFleetMasterSummaryDetails('WarehouseFleetMaster','${totalValue}')">
              	         </div> 
              	      </c:if>
              	
              	   <div class="col-lg-6" style="text-align: right;"> 
                       <div class="col-lg-8" style="text-align: right;padding-right: 0px;margin-top: 2px;font-size: 16px;"><spring:message code="pages.label" /></div>
              	          <div class="col-lg-2" style="padding-right: 0px;">
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
              		<div class="col-lg-2" style="padding-right: 0px;">
              		  <input type="button" onclick="viewFleetMasterSummaryDetails('WarehouseFleetMaster',document.getElementById('pagination').value)" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
             
				</div>
              	
              </div>    
              	
              </div>  
              	
                 </div>
                              
                 <!-- /.box-body -->
             </div><!-- /.box -->
  
</div>
  <div id="triggerEvent"></div>
  
		
    <!-- COMPOSE MESSAGE MODAL -->
    
   
</section><!-- /.content -->
		<!-- DATA TABES SCRIPT -->
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
         <!-- page script -->
        <script type="text/javascript">
            $(function() {
            	// $("#example1").dataTable();
                $('#example1').dataTable({
                    "bPaginate": false,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": false,
                    "bInfo": false,
                    "bAutoWidth": true
                });
            });
        </script>
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="sku.label" />"/>
           <input type="hidden" id="err" value="${err}" />
</body>
</html>