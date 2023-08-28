<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
<script  async defer src="https://maps.googleapis.com/maps/api/js?key=${sessionScope.googleAccessKey}&libraries=places&callback=myMap"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/fleetmaster.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/countriesAndStates.js"></script> --%>
<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/countries.js"></script>
<script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
 	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/controller.js"></script>
	
<script>
function myMap(){
var mapProp= {
  center:new google.maps.LatLng(17.387140,78.491684),
  zoom:5,
};
var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
}
</script>
<style>
.c1{
text-align:center;
}

.btn-primary{
	width:80%;
	background-color: #3c8dbc !important;
	padding: 5px 25px 5px 25px !important;
    font-size: 16px !important;
}

.gps:hover {
	background-color: black;
	padding-top: 5px;
	padding-bottom: 5px;
}

.activeMapSel{
 	 background-color:GREY;
  
}
.modal-backdrop {
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background-color: #000;
}
.modal-backdrop.in {
    filter: alpha(opacity=50);
    opacity: 0 !important;
}
.mapPopDiv
{
    float: right;
    z-index: 100;
    position: absolute;
    right: 15%;
    top: 50px;
    width: 18%;
    padding: 15px;
    display:none;
}

.divClose
{
    width: 24px;
    height: 24px;
    cursor: pointer;
    float: right;
    z-index: 100;
    position: absolute;
    right: -6%;
    top: -30%;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	
	callCalender('dateofPurchase');

});
</script>

</head>
<body>
<section class="content">
<div class="row">
<div class="col-lg-12">
<div class="box box-primary">
      <div class="box-header" align="center">
      
      
               <h3  class="box-title" style="border:1px solid #3d3838;;font-weight: bold;padding:5px">Fleet Master - Edit</h3>
           </div>
        <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -10px">${err}</div>
       	<div id="Success" class="Success" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
           <div class="row">
           <div class="col-lg-12 col-xs-12" style="margin-top: 10px;">
           <div class="col-lg-8 col-xs-4"></div>
           <div class="col-lg-2 col-xs-4">
          <button class="btn btn-primary" style="float: right;" value="submit" onclick="validateFleetMaster('edit');">Submit</button>
          </div>
          <div class="col-lg-2 col-xs-4">
            <button class="btn btn-primary" style="float: left;" value="cancel" onclick="return viewFleetMasterSummaryDetails('WarehouseFleetMaster','0');">Cancel</button>
           </div>
           </div>
           </div>
           
		<div class="box-body table-responsive">
          <div class="row">
              <div class="col-lg1-12 col-lg-12" style="margin-top:5%">
              <div class="col-lg1-3 col-lg-3" >
               <div class="col-lg1-12 col-lg-12" style="margin-bottom: 10px;">
                <label>Transporter Id<span style="color:red; font-size:2">*</span></label>
               <input type="text" id="transporterId" name="transporterId" value="${fleetList.tranporterId}" class="form-control" style="width:75%">
               <span id="transporterIdError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>        
               </div>  
               <div class="col-lg1-12 col-lg-12" style="margin-bottom: 10px;">
                <label>Transporter Name<span style="color:red; font-size:2">*</span></label>
               <input type="text" id="transporterName" name="transporterName" value="${fleetList.transporterName}"  class="form-control" style="width:75%">
                <span id="transporterNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>       
               </div> 
               
               <div class="col-lg1-12 col-lg-12" style="margin-bottom: 10px;">
                <label>GST No<span style="color:red; font-size:2">*</span></label>
               <input type="text" id="gstNo" name="gstNo" class="form-control" value="${fleetList.gstId}" onblur="validateGSTIN();" style="width:75%">
                <span id="gstNoError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>       
               </div> 
               </div>

<div class="col-lg1-3 col-lg-3">
<div class="col-lg1-12 col-lg-12" style="margin-bottom: 10px;">
                <label>Phone<span style="color:red; font-size:2">*</span></label>
               <input type="number" id="phoneNo" name="phoneNo" class="form-control" value="${fleetList.phoneNo}" style="width:75%">
               <span id="phoneNoError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                       
</div>  
<div class="col-lg1-12 col-lg-12" style="margin-bottom: 10px;">
                <label>Email ID<span style="color:red; font-size:2">*</span></label>
               <input type="email" id="emailId" name="emailId" class="form-control" value="${fleetList.userName}" style="width:75%">
               <span id="emailIdError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                       
</div>  

<div class="col-lg1-12 col-lg-12" style="margin-bottom: 10px;">
                <label>PAN Number<span style="color:red; font-size:2">*</span></label>
               <input type="text" id="panNumber" name="panNumber" class="form-control" value="${fleetList.panId}" style="width:75%">
               <span id="panNumberError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                       
</div>  
</div>

<div class="col-lg1-3 col-lg-3">
<div class="col-lg1-12 col-lg-12" style="margin-bottom: 10px;">
                <label>Plot/Building No<span style="color:red; font-size:2">*</span></label>
               <input type="text" id="plotNo" class="form-control"  value="${fleetList.buldingHouseNo}" style="width:75%">
               <span id="plotNoError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                       
</div>  
<div class="col-lg1-12 col-lg-12" style="margin-bottom: 10px;">
                <label>Road/Street Name<span style="color:red; font-size:2">*</span></label>
               <input type="text" id="streetName" name="streetName" value="${fleetList.roadName}" class="form-control" style="width:75%">
              <span id="streetNameError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>      
</div>  

<div class="col-lg1-12 col-lg-12" style="margin-bottom: 10px;">
                <label>State<span style="color:red; font-size:2">*</span></label>
               <select class="form-control" name="state" id="state" style="width: 75%;">
	                                       <option value="" >Select state</option>
	                                        <c:forEach var="states" items="${states.stateMasters}">
	                            			 <option value="${states.stateName}" ${fleetList.state == states.stateName ? 'selected' : ''}>${states.stateName}</option>
	                                        
											</c:forEach>
	                                            </select>
	        <span id="stateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
</div>  
</div>

<div class="col-lg1-3 col-lg-3">
<div class="col-lg1-12 col-lg-12" style="margin-bottom: 10px;">
              
                <label>Location<span style="color:red; font-size:2">*</span></label>
                       
                <select class="form-control" id="fleetLocation"  id="fleetLocation" style="width:75%" value="${fleetList.location}">
		                           	<option value=""><spring:message code="ALL.label"/></option>
									 <c:forEach var="location" items="${locationsList}"> 
									 <option value="${location}" ${fleetList.location == location ? 'selected' : ''}>${location}</option>
								  </c:forEach>
                                  </select>
                                  <span id="locationError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
</div>  

<div class="col-lg1-12 col-lg-12" style="margin-bottom: 10px;">
                <label>City<span style="color:red; font-size:2">*</span></label>
               <input type="text" id="city" name="city" value="${fleetList.city}" class="form-control" style="width:75%">
               <span id="cityError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                       
</div>  

			<div class="col-lg1-12 col-lg-12" style="margin-bottom: 10px;">
                <label>Zip Code<span style="color:red; font-size:2">*</span></label>
               <input type="number" id="zipCode" name="zipCode" class="form-control" value="${fleetList.pinCode}" style="width:75%">
               <span id="zipCodeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                       
			</div>  
</div>
</div>

<div class="col-lg1-12 col-lg-12" style="margin-top:5%">
              
              <div class="col-lg1-3 col-lg-3" >
               <div class="col-lg1-12 col-lg-12" style="margin-bottom: 10px;">
                <label>Vehicle No</label>
               <input type="text" id="vehicleNo" name="vehicleNo" class="form-control" style="width:75%">
               <span id="vehicleNoError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>     
               </div> 
                
               <div class="col-lg1-12 col-lg-12" style="margin-bottom: 10px;">
                <label>Vehicle Description</label>
               <input type="text" id="vehicleDesc" name="vehicleDesc" class="form-control" style="width:75%">
                <span id="vehicleDescError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>       
               </div> 
               
               <div class="col-lg1-12 col-lg-12" style="margin-bottom: 10px;">
                <label>Date of Purchase</label>
               <!-- <input type="text" id="dateofPurchase" name="dateofPurchase" class="form-control" style="width:75%"> -->
               <input class="form-control calendar_icon " id="dateofPurchase" name="dateofPurchase" value="" style="width:75%;background-color: white;" id="dateofPurchase" size="20" type="text" onfocus="callCalender('dateofPurchase')" onclick="callCalender('dateofPurchase')" placeholder="DD/MM/YYYY" />
                <span id="dateofPurchaseError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>       
               </div> 
               
               <div class="col-lg1-12 col-lg-12" style="margin-bottom: 10px;">
                <label>Outlet/Warehouse</label>
                <select class="form-control" id="warehouseorOutlet">
                   <option value="Outlet">Outlet</option>
                   <option value="Warehouse">Warehouse</option>
                </select> 
                <span id="warehouseorOutletError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>   
               </div> 
               </div>
               
               <div class="col-lg1-3 col-lg-3">
               	<div class="col-lg1-12 col-lg-12" style="margin-bottom: 10px;">
                <label>Vehicle Type</label>
               <input type="text" id="vehicleType" class="form-control" style="width:75%">
               <span id="vehicleTypeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>        
               </div>  
               
                <div class="col-lg1-12 col-lg-12" style="margin-bottom: 10px;">
                <label>Carry Capacity</label>
               <input type="number" id="carryCapacity" class="form-control" style="width:75%">
               <span id="carryCapacityError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
               </div>  
               
               
               <div class="col-lg1-12 col-lg-12" style="margin-bottom: 10px;">
                <label>Vehicle Owner/Driver</label>
               <input type="text" id="vehicleOwner" name="vehicleOwner" class="form-control" style="width:75%">
                <span id="vehicleOwnerError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>       
               </div>  
               
               
               <div class="col-lg1-12 col-lg-12" style="margin-bottom: 10px;">
                <label>Status</label>
              <select class="form-control" id="vehicleStatus" id="vehicleStatus">
               <option value="true" >Active</option>
               <option value="false" >InActive</option>
              </select>
              <span id="vehicleStatusError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
               </div>  
               </div>
               
                <div class="col-lg1-6 col-lg-6" id="googleMap" style="height:250px;">
                 
                </div>
                
                   <div class="col-lg-12 col-xs-12" style="margin-top: 10px;">
                       <div class="col-lg-8 col-xs-4"></div>
                       <div class="col-lg-2 col-xs-4 nopadding">
                       <button class="btn btn-primary" style="float: right;width:70%;padding: 2px 20px !important;margin-right: -45px;" onclick="appendVehicleDetails();">Add</button>
                       </div>
                       <div class="col-lg-2 col-xs-4 nopadding">
                       <button class="btn btn-primary" style="float: right;width:70%;padding: 2px 20px !important;" onclick="resetFormFleet();" >Clear</button>
                       </div>
                       </div>
                       
                       
                      <div class="col-lg-12">
                      
                      <div class="table-responsive" style="padding-left: 15px !important;">
                                        <table id="vehicleList" class="table table-bordered table-striped" style="white-space: nowrap;overflow-x: auto;">
                                        <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th>S no</th>
                      							 <th>Vehicle No</th>
                      							 <th>Description</th>
                    							 <th>Vehicle Type</th>
                  							     <th>Carry Capacity</th>
                     							  <th>Status</th>
                      							 <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                            <c:forEach var="fleetList" items="${fleetList.fleetDetails}" varStatus="theCount">
                                            	<tr id="dynamicdiv${theCount.index+1}">
                                          	    <td class='slno'>${theCount.index+1}</td>
                                          	    <td id="vehicleNo${theCount.index+1}">${fleetList.vehicleNo}</td>
                                          	    <td id="vehicleDescription${theCount.index+1}">${fleetList.vehicledescription}</td>
                                                <td id="vehicleType${theCount.index+1}">${fleetList.vehicleType}</td>
                                                <td id="carryCapacity${theCount.index+1}">${fleetList.vehicleCapacity}</td>
                                                <input type="hidden" id="dateofPurchase${theCount.index+1}" value="${fleetList.mfgDateStr}"/>
                                                <input type="hidden" id="vehicleOwner${theCount.index+1}" value="${fleetList.driverName}"/>
                                                <input type="hidden" id="typeWO${theCount.index+1}" value=""/>
                                                <input type="hidden" id="pricerate${theCount.index+1}" value="${fleetList.priceRate}"/>
                                                <input type="hidden" id="tansporterIdofVH${theCount.index+1}" value="${fleetList.tansporterId}"/>
                                                
                                                <c:choose>
						          	 	<c:when test="${fleetList.vehicleStatus == 'true'}">
							        	<td id="status${theCount.index+1}">Active</td>
							        	</c:when>
							        	<c:otherwise>
							       	 	<td id="status${theCount.index+1}">InActive</td>
							        	</c:otherwise>
							    		</c:choose>
                                                <%-- <td id="status${theCount.index+1}">${fleetList.vehicleStatus}</td> --%>
                                               <td id="Del${theCount.index+1}"><a id="Dele${theCount.index+1}" style="color: #3c8dbc; text-decoration: underline;margin-left:3px;" onclick="deleteItem(this);" title="Delete">Delete</a></td>
                                              
                							</tr>
                                            </c:forEach> 
                                        </tbody>
                                    </table>
                                    </div>
                      
                      </div>
                      
                      <div class="col-lg-12 col-xs-12 nopadding">
                      <div class="col-lg-8 col-xs-4"></div>
                      
                      <div class="col-lg-2 col-xs-4">
                      <button class="btn btn-primary" style="float: right;" value="Submit" onclick="validateFleetMaster('edit');">Submit</button>
                      </div>
                      <div class="col-lg-2 col-xs-4">
                      <button class="btn btn-primary" style="float: right;" value="Submit" onclick="return viewFleetMasterSummaryDetails('WarehouseFleetMaster','0');" >Cancel</button>
                      
                      </div>
                      
                      </div>
                      
                      <%-- <input type="hidden" id="updatedDate" value="${fleetList.updatedDate}">
                      <input type="hidden" id="endDateStr" value="${fleetList.endDateStr}">
                      <input type="hidden" id="startDateStr" value="${fleetList.startDateStr}">
                      <input type="hidden" id="mobileNo" value="${fleetList.mobileNo}">
                      <input type="hidden" id="createdDate" value="${fleetList.createdDate}"> --%>
                      <input type="hidden" id="roleName" value="${fleetList.roleName}">
                       <input type="hidden" id="statusoffleet" value="${fleetList.status}">
                       
                       
</div>
</div>

</div>
</div>
</div>
</div>
</section>
<!-- /.content -->
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
          <input type="hidden" id="selectedCountry" value="${locationDetails.country}"></input>
</body>
</html>