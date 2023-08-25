<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : admin/genericData/newLocation.jsp
 * file type		        : JSP
 * description				: The new location form is displayed using this jsp
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
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/controller.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/masterDataManagement/genericMasters/serviceAreaMaster.js"></script>
	<%-- <script src="${pageContext.request.contextPath}/js/jquery.form-validator.min.js"></script> --%>
	
	<%--  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css"> --%>
<style type="text/css">
	.col-xs-12 {
	 padding: 2% 10%;  
	 }
</style>

<!-- <script  async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDHNN78JQSuDoLAZigF4cTbHgyeduFpVn8&libraries=places&callback=loadMap"></script>
 -->
<script  async defer src="https://maps.googleapis.com/maps/api/js?key=${sessionScope.googleAccessKey}&libraries=places&callback=loadMap"></script>

   <script type="text/javascript">
$(document).ready(function(){
	
	callCalender('startDate');
	callCalender('endDate');
	selectServiceAreaType()
	
// 	  $('input.timepicker').timepicker({});
	
});
</script>

<!--  added by        :  koti bomminei
      description     :  to ristrict the user from entering special characters     -->


</head>
 <body ><!-- Content Header (Page header) -->
<%-- <section class="content-header">
   <h1>
     <spring:message code="generic.data.label" />
     <small><spring:message code="location.master.label" /></small>
    </h1>
      <ol class="breadcrumb">
      	<li><a style="cursor: pointer;" onclick="return viewDashboard('admin');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><spring:message code="generic.data.label" /></li>
       </ol>
 </section> --%>

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">

				<div class="box box-primary" style="padding: ">
                   <div class="box-header" style="text-align: center">
                   <br/>
<%--                    <h3><spring:message code="new.location.label" /></h3> --%>
                   </div><!-- /.box-header -->
                   <!-- form start -->
                     <form id="newLocation" method="post">
                       <div class="box-body">
                       
                       
                       
                       
                       
<div class = "col-lg-10" id="googleMap"  style="height:400px;width:100%">
 
</div>
                       
                       
                       
                       
                       
                       
                       
                       
                       
                       
                       
                       
                       
                       
                      	<div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${err}</div>
                        <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
                      <div class="row">
                         <div class="form-group col-lg-3">
                            <label>Area Code<span style="color:red; font-size:2">*</span></label>
                            <input type="text" onblur="criteria(this)" class="form-control" id="areaCode" name="areaCode" placeholder="<spring:message code="enterAreaCode.label" />" value="${serviceAreaMaster.area_code}" />
                         	<span id="areCodeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                         </div>
                         <div class="form-group col-lg-3">
                            <label><spring:message code="EmployeeForm.address.city" /> </label>
                            <input type="text" onblur="criteria(this)" class="form-control" id="city"  placeholder="<spring:message code="supplier.enter.city.label" />" value="${serviceAreaMaster.city}" />
                        	<span id="areaError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                         </div>
                          <div class="form-group col-lg-3">
                          <label><spring:message code="newarrival.startdate"/></label>
                            <input type="text" class="form-control" id="startDate" name="startDate"  readOnly value="${serviceAreaMaster.startDateStr}" style="background-color: white;"  size="20" type="text" onfocus="callCalender('startDate')" onclick="callCalender('startDate')" placeholder="DD/MM/YYYY">
                         </div>
                         
                          <div class="form-group col-lg-3">
                           <label><spring:message code="priority.label"/></label>
          <input class="form-control" onblur="criteria(this)" type="text" id="priority" value="${serviceAreaMaster.priority}">
                        </div>
                         
                         </div>
						
                      
                       <div class="row">
                          <div class="form-group col-lg-3">
                            <label><spring:message code="area.description.label" /></label>
                          <input type="text" onblur="criteria(this)" id="areaDescription" class="form-control" value="${serviceAreaMaster.area_description}">
                          <span id="areaDescriptionError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                         </div>
                         <div class="form-group col-lg-3">
                             <label><spring:message code="zone.label"/></label>
                              <select class="form-control" id="outletZone" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == serviceAreaMaster.zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
                        </div>
                      
                       <div class="form-group col-lg-3">
                           <label><spring:message code="reports_enddate.label"/></label>
          <input class="form-control calendar_icon"  readonly="readonly"  name="endDate" id="endDate" value="${serviceAreaMaster.endDateStr}"  readOnly style="background-color: white;"  size="20" type="text" onfocus="callCalender('endDate')" onclick="callCalender('endDate')" placeholder="DD/MM/YYYY">
                        </div>
                        
                        
                         <div class="form-group col-lg-3">
                           <label><spring:message code="procurement.status.label"/></label>
<!--           <input class="form-control" type="text" id="status"> -->
                    <select class="form-control" id="status">
                       <option value="true" ${'true' == serviceAreaMaster.status ? 'selected' : ''}>Active</option>
                      <option value="false"${'false' == serviceAreaMaster.status ? 'selected' : ''}>Inactive</option>
                    </select>
                        </div>
                        
                         <div class="form-group col-lg-3">
                           <label><spring:message code="default.location"/></label>
		             <select class="form-control form-group" id="location" >
		             	<!-- <option value="">ALL</option> -->
		                <c:forEach var="location" items="${locationsList}">
							<option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''} id="${location.locationId}" >${location.locationId}</option>
						</c:forEach>
		            </select>
                    <%-- <select class="form-control" id="defaultLocation">
                       <option><spring:message code="circular.label"/></option>
                      <option><spring:message code="circular.label"/></option>
                    </select> --%>
                        </div>
                        
                         <div class="form-group col-lg-3">
                           <label><spring:message code="area.type"/></label>
                    <select id="AreaTypeId" class="form-control" onchange="changeFunc();">
                       <option value="Outlet">Circular</option>  
                       <option value="Open">Polygon</option>                                           
                    </select>
                        </div>
                        
                         <div class="form-group col-lg-3">
                           <label><spring:message code="radius.label"/></label>
                    <input class="form-control" onblur="criteria(this)" id="radius">                 
                        </div>                                                
                         </div>
                        
                        <!--  <div>
                          <div>
                          
      						 <input type="radio" id="map" name="map" value="map" onchange="selectServiceAreaType()" checked>
      						 
    							  <label for="map">LoadMap</label> 						    		       
					
						      <input type="radio" id="pinid" name="map" value="pinid" onchange="selectServiceAreaType()">
						      <label for="pinid">PinCode</label><br>
						    </div>
						    </div> --> 
						    	 
						    	 
						    <div>	 
						     <div class="radio-group">
                          	  
    						 <span></span>
    						 			    		       
						    </div>
						    <br>
						    </div>	 
						   
						    	 
						    
                                <div class="table-responsive" style="overflow-x:auto;margin-left:2%;margin-right: 2%;">
                         			
                         	<label>
      						 <input type="radio" id="map" name="map" value="map" style="" onchange="selectServiceAreaType()" checked >
      						<b> LoadMap </b>
      						
    						</label> 
                       			
                       			 <div class="row" style="margin-top:5px"> 
									    <div class=" col-lg-3" style="">
                                        <input type="text" id="gpsLatitude" autocomplete="off" placeholder="<spring:message code="enter.lattitude.label" />"  class="form-control" value=""  oninput="this.value = this.value.replace(/(\..*)\./g, '$1');">
                                            <!-- <span id="buildingNameError" style="text-align:right;color:red;font-weight:bold;"></span> -->
                                        </div>
                                        <div class=" col-lg-3" style="">
                                            <input type="text" class="form-control"  class="latitudeValue"  autocomplete="off"  placeholder="<spring:message code="enter.longitude.label" />" id="gpsLongitude" value="" oninput="this.value = this.value.replace(/(\..*)\./g, '$1');" />
                                        </div>
                                        <div class=" col-lg-4" style="">
					                        <input type="text"  id="locationDescription" onblur="criteria(this)" placeholder="location description"  class="form-control">
                                        </div>
                                        
                                        <div class=" col-lg-2 nopadding" style="margin-top: -2px;">
                                        	 <div class="buttons"  style="text-align:right">
		  				                        <a onclick="appendServiceAreaDetails();"  id="addlocation" class="btnCls" style="width: 100%;padding: 4px 12px;"><font size="2px"><spring:message code="addnew.label" /></font></a>
		   			                          </div>
                                        </div>
                                	</div>
                     
                       
                      
                             
             <table id="serviceAreaMasterTable" class="table table-bordered table-hover">
               <thead style="background-color: #3c8dbc; color: #ffffff">
                 <tr>
                 	<th>S.No</th>
                 	 <th><spring:message code="lattitude.label" /></th>
                      <th><spring:message code="longitude.label" /></th>
                      <th><spring:message code="report.description.laabel" /></th>
                     <th><spring:message code="action.label"/></th>
                </tr>
               </thead>
 			<tbody  style="text-align: center;">
 			
 	  <c:forEach items="${serviceAreaMaster.serviceAreaList}" var="serviceAreaMapList" varStatus="theCount">
 		 <tr id="dynamicdiv${theCount.count}">
 			<td >${theCount.count}</td>
 			<input type="hidden" id="sno${theCount.count}" value="${serviceAreaMapList.slNo}">
 			<td><div ><input type='text' onblur="criteria(this)" id="latitude${theCount.count}" value="${serviceAreaMapList.latitude}" style='vertical-align: -2px' ></div>
 			</td>
 			<td><div ><input type='text' onblur="criteria(this)"  id="langitude${theCount.count}" value="${serviceAreaMapList.longitude}"  style='vertical-align: -2px' ></div>
 			</td>
 		     <td><div style="width: 170px;"><input type="text" onblur="criteria(this)" id="description${theCount.count}" value="" style='vertical-align: -2px' ></div>
 			 <td id="Del${theCount.count}" ><img id="Img${theCount.count}" src="${pageContext.request.contextPath}/images/itemdelete.png" style="width:30px;cursor:pointer;" onclick="deleteItem(this);" />
 			</tr>
 			</c:forEach>
 			
 			</tbody>
 			
 		
           </table>
         
           <br/>
         </div>
         
         <br>
         <br>
         <br>
        <div id="pinError" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px"></div>
                
           <div class="table-responsive" style="overflow-x:auto;margin-left:2%;margin-right: 2%;">
                       <label>
						   <input type="radio" id="pinid" name="map" value="pinid"  style="" onchange="selectServiceAreaType()">
						   <b> PinCode </b>
						</label>
						    	
                           <div class="row" style="margin-top:5px"> 
                 
                        
									     <div class=" col-lg-3" style="">
                                        <input type="text" id="pincode" autocomplete="off" placeholder="<spring:message code="enter.pin.label" />"  class="form-control" value=""  oninput="this.value = this.value.replace(/(\..*)\./g, '$1');">
                                        </div>
                                        
                                        <div class=" col-lg-3" style="">
                                        <input type="text" id="areaname" autocomplete="off" placeholder="<spring:message code="enter.area" />"  class="form-control" value=""  oninput="this.value = this.value.replace(/(\..*)\./g, '$1');">
                                      	</div>
                                        <div class=" col-lg-4" style="">
					                        <input type="text"  id="description" onblur="criteria(this)" placeholder="enter description"  class="form-control">
                                        </div>  
                                         <div class=" col-lg-2" style="margin-top: -2px;">
                                     	<div class="buttons" style="text-align:right">
		  				                        <a onclick="appendServiceAreapinDetails();"  id="addpin" class="btnCls" style="width: 100%;padding: 4px 12px;"><font size="2px"><spring:message code="add.label" /></font></a>
		   			                          </div>
                                        </div>                                 
                                        </div>
                                 
                                               
                                                                        
             <table id="serviceAreaMasterpinTable" class="table table-bordered table-hover">
               <thead style="background-color: #3c8dbc; color: #ffffff">
                 <tr>
                 	<th>S.No</th>
                 	<th>PinCode</th>
                 	<th>Area Name</th>
                 	<th>Description</th>
                 	<th>Action</th>
                 	
                  </tr>
               </thead>
 			<tbody  style="text-align: center;">
 			
 			
 			</tbody> 	
 					
 		   </table>         
           </div>           
                    
                       
                       
						 
                       </div><!-- /.box-body -->
                      
						<br>			
						<div class="row" style="text-align: center;">
						 <input type="button" style="" class="btnCls" onclick="createServiceAreaMaster('new');" value="<spring:message code="submit.label" />" />
						  <c:if test="${sessionScope.role == 'super admin'}"> 
						  	<input type="button" class="btnCls buttonMargin" onclick="return viewServiceAreaMaster('serviceAreaMaster','0')" value="<spring:message code="cancel.label" />" />
						  </c:if>
							<input type="button" class="btnCls buttonMargin" style="" onclick="return viewServiceAreaMaster('serviceAreaMaster','0');" value="<spring:message code="cancel.label" />" />
						 
						</div>
					<br/>
                    <div class="box-footer">
                                    
                    </div>
                    
                    
       
                    
                    
   					<input type="hidden" value="${maxRecords}" name="maxRecords" id="maxRecords"/>
                    <input type="hidden" value="${searchName}" id="searchLocation"/>
                    <input type="hidden" value="${searchName}" name="searchCriteria" id="searchCriteria"/>
                                        
                    
             </form>
      </div>

</div>
</div>
</section><!-- /.content -->
<div id="mapid" style="    display: none;"></div>

        

</body>
</html>