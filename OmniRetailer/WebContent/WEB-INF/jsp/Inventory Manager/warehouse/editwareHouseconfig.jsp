<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah Y
 * file name		        : inventorymanager/warehouse/viewwarehouse
 * file type		        : JSP
 * description				: New warehouse details
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script> -->
        <!-- DATA TABLES -->
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/css/warehouse_configuration.css" rel="stylesheet" type="text/css" />
          <script src="${pageContext.request.contextPath}/js/controller.js"></script>
          	<script type="text/javascript" src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
            <script src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
			<script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
			<script src="${pageContext.request.contextPath}/js/countries.js"></script>
			 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script>
$(document).ready(function(){
	var selectedCountry = $("#selectedCountry").val();
	var selectedState = $("#selectedState").val();
	var id = getCountryIndex(selectedCountry);
	print_country("country");
	print_state('state',id);
	$("#country").val(selectedCountry);
	$("#state").val(selectedState);
	
	if( document.getElementById("isitdistribution") == "true") {
		 document.getElementById("mainwarehouse").disabled = false;
	}

	else {
		 document.getElementById("mainwarehouse").disabled = true;
	   
	}
});
debugger;
var phoneNo = $("#phone").val();
phoneNo = phoneNo.split('-');
if(phoneNo.length == 1)
	$("#phoneNumber").val(phoneNo[0]);
else{
	$("#phoneNumber").val(phoneNo[1]);
} 


$("#mobileNumber").keyup(function(){
	   $("#mobileNumErr").html("");
	   $("#Error").html("");
	   var $th = $(this);
     $th.val( $th.val().replace(/[^0-9]/g, function(str) 
     {  
         return ''; 
      } 
     ));
});
$("#fax").keyup(function(){
	   $("#faxErr").html("");
	   $("#Error").html("");
	   var $th = $(this);
  $th.val( $th.val().replace(/[^0-9]/g, function(str) 
  {  
      return ''; 
   } 
  
  
  ));
  /* if($("#fax").val().lenght>10){
	  $("#faxErr").html("");
  } */
});

//$("#workLocation").val($("#whlocation").val());   // set warehouse location
</script>
<style type="text/css">
.buttons {
	float: right;
	padding-top: 0px;
	margin-right: 4%;
	margin-top:1%;
}
a.button, .list a.button {s
position:relative;
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 5px 10px 5px 10px;
	background: #3c8dbc;

	border-radius: 5px;
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
}

.leftPadding{
padding-left: 0px;
padding-right: 15px;
}
.leftPadding22{
padding-left: 0px;
padding-right: 5px;
}

.form-group {
    margin-bottom: 5px;
}

.buttonMargin {
    margin-left: 5%;
}

</style>   
<style>
label {
 font-weight: normal; }
</style>    
</head>
<body>
 <!-- Content Header (Page header) -->
<!-- Main content -->

				<%-- <section class="content-header">
                    <h1>
                        <spring:message code="warehouse_configuration.label"/>
                    </h1>
                    <ol class="breadcrumb">
                    <li><a href="#" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
                       <li><a href="#" onclick="showWarehouseFlows('warehouse-details')"><spring:message code="warehouse.management.label"/></a></li>
                       <li><a href="#" onclick="getWareHouses('WarehouseConfigurations')"><spring:message code="warehouses.label"/></a></li>
                       <li> <spring:message code="new_warehouse_configuration.label"/></li>
                    </ol>
                </section> --%>
                
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
                                <div class="box-header" style="text-align: center">
                                     <h3 class="box-title" style="padding :5px;  border:1px solid  #808080;">${wareHouse.warehouseId}-<spring:message code="warehouse_details.label" /></h3>
                                </div><!-- /.box-header -->
                                  <form method="POST">
                                <div class="box-body" >
                                	
				                     <div id="Error" style="text-align:right;color:red;font-weight:bold;">${err}</div>
				                     
                         			  <div class="row" style="">
									    <div class="form-group col-lg-12" style="text-align: right;margin-left: -30px;">
								<c:if test="${sessionScope.role == 'super admin'}">
                              <input type="button" id="edit" style="position: relative;" class="btnCls " onclick="showWarehouseConfiguration('edit');" value="&nbsp;&nbsp;&nbsp;<spring:message code="update.label" />&nbsp;&nbsp;&nbsp;" />								</c:if>
								<c:forEach var="accessControl" items="${sessionScope.warehouseManagement}">
	                            	<c:if test="${accessControl.appDocument == 'WarehouseConfigurations' && accessControl.write == true}">
                                  		<input type="button" id="edit" style="position: relative;" class="btnCls " onclick="showWarehouseConfiguration('edit');" value="&nbsp;&nbsp;&nbsp;<spring:message code="update.label" />&nbsp;&nbsp;&nbsp;" />
                                  	</c:if>
                                 </c:forEach>
<%-- 								  	<input type="button" id="edit"  class="btn bg-olive btn-inline" style="margin-left:1%;width: 68px;position: relative;" onclick="cleareStorageSystems('clear');" value="<spring:message code="storage_systems_clear.label" />" />
 --%>								  	<input type="button" class="btnCls buttonMargin" style="position: relative;" onclick="getWareHouses('WarehouseConfigurations','0')" value="<spring:message code="cancel.label" />" />
									</div> 
									</div>  
									<br>   
				                     
				                     <div  class="row">
				                      <input type="hidden" name="storeCode" value=""/>
				                      <input type="hidden" id="whid" value="${wareHouse.warehouseId}"/>
				                     
				                      <div class="form-group col-lg-6">
				                      
				                      <div class="form-group col-lg-4">
				                      <div class="form-group row">
				                      <input type="hidden" name="storeCode" value=""/>
				                      <label style="font-family: Calibri;color: gray;"><spring:message code="location.label" /><span class="requiredField">*</span></label>
                                         
                                         <input  type="text" class="form-control" name="workLocation" id="workLocation"   value="${wareHouse.warehouseLocation}" readonly="readonly"  />
                                         
                                         <%--   <select class="form-control" name="workLocation" id="workLocation" disabled="disabled"> 
                                           
												 <option value="${wareHouse.warehouseLocation}">${wareHouse.warehouseLocation}</option>
											 
										 </select> --%>
										    <span id="locationErr" style="text-align:right;color:red;font-weight:bold;"></span>
				                      </div>
				                      <div class="form-group row">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="new_warehouse_phonenumber.label" /> <span class="requiredField">*</span></label>
                                           <%--  <input type="text" class="form-control" name="mobileNumber" id="mobileNumber" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_phonenumber.label" />" value="${wareHouse.phone_number}"/> --%>
                                             <div class="row" >
                                              <div class="col-lg-5 col-md-4 col-sm-4 col-xs-4">
				                                  	<select class="form-control" style="padding: 6px 8px;" id="defaultCountry" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
				                                  		<option value="${fn:split(wareHouse.phone_number, '-')[0]}">${fn:split(wareHouse.phone_number, '-')[0]}</option>
				                                  		<!-- <option>US</option>
				                                  		<option>GB</option>
				                                  		<option>AU</option> -->
				                                  	</select>
				                                  </div>
				                                  <div class="col-lg-7 col-md-8 col-sm-8 col-xs-8" style="padding: 0px;width: 50%;">
				                                  	<input type="text" class="form-control"   value="" placeholder="<spring:message code="enter.customer_contact_num.label" />" id="phoneNumber" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
				                                  </div>
				                                  <input type="hidden" class="form-control" name="mobileNumber" id="mobileNumber"  value=""/>
				                                   <input type="hidden" id="output" />
				                                    <input type="hidden" class="form-control" name="phone" id="phone"  value="${wareHouse.phone_number}"/>
				                             </div>
                                            <span id="error" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        
                                        <div class="form-group row">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="new_plot_no.label" /> <span class="requiredField">*</span></label>
                                            <input type="text" class="form-control"  name="houseNo" id="houseNo" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_no.label" />" value="${wareHouse.address_1}"/>
                                            <span id="houseNoErr" style="text-align:right;color:red;font-weight:bold;"></span>
                                           
                                        </div>
                                        
                                        <div class="form-group row">
                                             <label style="font-family: Calibri;color: gray;"><spring:message code="locality.label" /> <span class="requiredField">*</span></label>
                                            <input type="text" class="form-control"  name="locality" id=locality value="${wareHouse.locality}" 	placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="locality.label" />" />
                                            <span id="localityErr" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        
                                         <div class="form-group row">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="new_warehouse_country.label" /> <span class="requiredField">*</span></label>
<%--                                             <input type="text" class="form-control" name="country" id="country" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_country.label" />" />
 --%>                                           
                                          <input  id="country"  name ="country" class="form-control"  value="${wareHouse.country}"   />
  <%-- 
                                             <select  disabled="disabled" id="country"  name ="country" class="form-control" >
                                             <option>${wareHouse.state}</option>
											</select> --%>
											<input type="hidden" id="selectedCountry" value="${wareHouse.country}"></input>
											<span id="countryErr" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        
				                      
				                      </div>
				                      <div class="form-group col-lg-1"></div>
				                      <div class="form-group col-lg-7">
				                      <div class="form-group row">
				                      <div class="col-lg-8 leftPadding">
				                      <label style="font-family: Calibri;color: gray;"><spring:message code="new_warehouse_name.label" /> <span class="requiredField">*</span></label>
                                            <input type="text" class="form-control"  name="warehouseName" id="warehouseName" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_name.label" />" value="${wareHouse.warehouse_name}"/>
                                            <span id="warehouseNameErr" style="text-align:right;color:red;font-weight:bold;"></span>
                                        
				                      </div>
				                      </div>
				                      <div class="form-group row">
				                      <div class="col-lg-8 leftPadding">
                                              <label style="font-family: Calibri;color: gray;"><spring:message code="emailid.label" /></label>
                                            <input type="text" class="form-control"  name="emailid"  value="${wareHouse.email}" id="emailid"  placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="emailid.label" />" value=""/>
                                        </div> 
                                        </div>
				                      
				                      <div class="form-group row">
				                      <div class="col-lg-12 leftPadding">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="street.name.label" /><span class="requiredField">*</span></label>
                                            <input type="text" class="form-control"   name="street" id="street"  placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="street.name.label" />" value="${wareHouse.address_2}"/>
                                            <span id="streetErr" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div> 
                                        </div>
                                        
                                         <div class="form-group row">
				                      <div class="col-lg-12 leftPadding">
                                          <div class="col-lg-4 leftPadding22">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="new_warehouse_city.label" /> <span class="requiredField">*</span></label>
                                            <input type="text" class="form-control"  name="city" id="city" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_city.label" />" value="${wareHouse.city}"/>
                                            <span id="cityErr" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>      
                                            <div class="col-lg-4 leftPadding22">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="new_warehouse_state.label" /> <span class="requiredField">*</span></label>
                                      <input  id ="state" class="form-control" name="state"  value="${wareHouse.state}"   />
                                              <!--  <select id ="state" class="form-control" name="state">
                                               <option>{warehouse.country}</option>
    										</select>
    										 -->
    										 	<input type="hidden" id="selectedState" value="${wareHouse.state}"></input>
    			                             <span id="stateErr" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                            
                                            <div class="col-lg-4" style="padding: 0px;">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="new_warehouse_zip.label" /> <span class="requiredField">*</span></label>
                                            <input type="text" class="form-control"  name="zip" id="zip" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_zip.label" />" value="${wareHouse.zip}"/>
                                            <span id="zipErr" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        </div>
                                        </div>
                                        
                                         <div class="form-group row">
                                         <div class="col-lg-12 leftPadding">
										<div class="col-lg-6 leftPadding22" style="white-space: nowrap;">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="gps.longitude.label" /> <span class="requiredField">*</span></label>
                                            <input type="text" class="form-control"  value="${wareHouse.gpsLongitude}" name="gpsLongitude" id="gpsLongitude" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.storename.label" />" />
                                            <span id="gpsLongitudeError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                       <div class="col-lg-6" style="white-space: nowrap;padding: 0px;">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="gps.latitude.label" /> <span class="requiredField">*</span></label>
                                             <input type="text" class="form-control"  value="${wareHouse.gpsLatitude}" name="gpsLatitude" id="gpsLatitude" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.storename.label" />" />
				                            <span id="gpsLatitudeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                      
                                          </div>   
                                        </div>
                                        </div>
                                        
				                      </div>
				                     
                                    
                                         <div class="form-group col-lg-6">
				                     <div class="form-group col-lg-4">
				                     <div class="form-group row">
				                                <div class="col-lg-11 leftPadding">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="new_business_type.label" /> <span class="requiredField">*</span></label>
                                            <input type="text" class="form-control"  name="warehouseType" id="warehouseType" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_type.label" />" value="${wareHouse.warehouse_type}"/>
                                            <span id="warehouseTypeErr" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        </div>
                                        <div class="form-group row">
                                        <div class="col-lg-7 leftPadding">
                                             <label style="font-family: Calibri;color: gray;"><spring:message code="pos.enabled.label" /> </label>
<%--                                             <input type="text" class="form-control" name="warehouseStatus" id="warehouseStatus" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_status.label" />" />
 --%>                                           <select class="form-control"  name="posenabled" id="posenabled">
												<option value="true" ${wareHouse.posEnabled == true ? 'selected' : ''}>Yes</option>
		                                  	  <option value="false" ${wareHouse.posEnabled == false ? 'selected' : ''}>No</option>
										</select>
                                           
                                         </div>  
                                        </div>
                                        <div class="form-group row">
                                        <div class="col-lg-7 leftPadding">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;"><spring:message code="remote.monitaring" /></label>
<%--                                             <input type="text" class="form-control" name="warehouseStatus" id="warehouseStatus" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_status.label" />" />
 --%>                                           <select class="form-control"  name="remoteMonitoring" id="remoteMonitoring">
												<option value="true" ${wareHouse.remoteMonitoring == true ? 'selected' : ''}>Yes</option>
		                                  	  <option value="false" ${wareHouse.remoteMonitoring == false ? 'selected' : ''}>No</option>
										</select>
                                           
                                         </div>  
                                        </div>
                                          
                                        
                                        <div class="form-group row">
                                        <div class="col-lg-11 nopadding">
									  <div class="col-lg-9 leftPadding22">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;"><spring:message code="devices.secured" /></label>
<%--                                             <input type="text" class="form-control" name="warehouseStatus" id="warehouseStatus" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_status.label" />" />
 --%>                                            <select class="form-control" name="devicessecured" disabled="disabled" id="devicessecured">
												<option value="true" ${wareHouse.secured == true ? 'selected' : ''}>Yes</option>
		                                  	  <option value="false" ${wareHouse.secured == false ? 'selected' : ''}>No</option>
										</select>
                                          </div>
                                          <div class="col-lg-3" style="padding: 0px;">
                                          <label style="font-family: Calibri;color: gray;">Radius <span class="requiredField"></span></label>
                                          <input type="text" class="form-control " disabled="disabled" style="width:40px" id="radius" name="radius" value="${wareHouse.radius}"  >
                                          
                                            </div>
                                        </div> 
                                        </div>  
                                        <div class="form-group row">
                                          <div class="col-lg-11 nopadding" style="white-space: nowrap;">
                                            <div class="col-lg-6 leftPadding22">
                                             <div class="bootstrap-timepicker">
                                             <label style="font-family: Calibri;color: gray;"><spring:message code="starttime.label" /></label>
                                           <input type="text" class="form-control timepicker"  name="starttime" id="starttime" value="${wareHouse.startTimeStr}" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="starttime.label" />" />
                                           
                                        </div>    
                                        </div>
                                          <div class="col-lg-6" style="padding: 0px;">
                                            <div class="bootstrap-timepicker">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="endtime.label" /></label>
                                             <input type="text" class="form-control timepicker"  name="endtime" id="endtime" value="${wareHouse.endTimeStr}" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="endtime.label" />" />
                                         
                                           
                                        </div>        
                                        </div>       
                                    </div>
                                    </div>
				                 </div>
				                     
				                     <div class="form-group col-lg-4">
				                     <div class="form-group row">
				                     <div class="col-lg-6 leftPadding" style="white-space: nowrap;">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="isit.test.warehouse.label" /> </label>
<%--                                             <input type="text" class="form-control" name="warehouseStatus" id="warehouseStatus" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_status.label" />" />
 --%>                                          <select class="form-control"   name="isittestwarehouse" id="isittestwarehouse">
											<option value="true" ${wareHouse.testWarehouse == true ? 'selected' : ''}>Yes</option>
		                                  	  <option value="false" ${wareHouse.testWarehouse == false ? 'selected' : ''}>No</option>
										</select>
                                           
                                        </div>
                                        </div>
                                        <div class="form-group row">
                                        <div class="col-lg-6 leftPadding">
                                            <label style="font-family: Calibri;color: gray;white-space: nowrap;"><spring:message code="isit.franchise" /> </label>
<%--                                             <input type="text" class="form-control" name="warehouseStatus" id="warehouseStatus" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_status.label" />" />
 --%>                                           <select class="form-control"   name="isitfranchise" id="isitfranchise">
												<option value="true" ${wareHouse.itFranchise == true ? 'selected' : ''}>Yes</option>
		                                  	  <option value="false" ${wareHouse.itFranchise== false ? 'selected' : ''}>No</option>
		                                  	 
										</select>
										 <input type="hidden" value="${wareHouse.itFranchise}">
                                          </div> 
                                        </div> 
                                        <div class="form-group row">
                                           <div class="col-lg-6 leftPadding" style="white-space: nowrap;">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="Picked.list.enabled" /> </label>
<%--                                             <input type="text" class="form-control" name="warehouseStatus" id="warehouseStatus" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_status.label" />" />
 --%>                                             <select class="form-control"  name="Pickedlist" id="Pickedlist">
												<option value="true" ${wareHouse.authorizedPicklist == true ? 'selected' : ''}>Yes</option>
		                                  	  <option value="false" ${wareHouse.authorizedPicklist == false ? 'selected' : ''}>No</option>
										</select>
                                            </div>
                                        </div>  
                                         <div class="form-group row">
                                        <div class="col-lg-10 leftPadding" style="white-space: nowrap;">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="Storagesystems.enabled" /></label>
<%--                                             <input type="text" class="form-control" name="warehouseStatus" id="warehouseStatus" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_status.label" />" />
 --%>                                            <select class="form-control"  name="Storagesystemsenabled" id="Storagesystemsenabled">
												<option value="true" ${wareHouse.storageSystemEnabled == true ? 'selected' : ''}>Yes</option>
		                                  	  <option value="false" ${wareHouse.storageSystemEnabled == false ? 'selected' : ''}>No</option>
										</select>
                                           
                                          </div> 
                                        </div> 
                                        <div class="form-group row"> 
                                         <div class="col-lg-10 leftPadding" style="">
                                             <label style="font-family: Calibri;color: gray;"><spring:message code="created.date.label" /></label>
                                            <input class="form-control calendar_icon"  type="text" value="${wareHouse.createdDateStr}" id="CreateDate"  onfocus="callCalender('CreateDate')"  size="20" onclick="callCalender('CreateDate')" placeholder="DD/MM/YYYY" />
                                        	
                                        </div>	
                                        </div>
                                         
				                     </div>
				                     <div class="form-group col-lg-4">
				                     <div class="form-group row">
				                     <div class="col-lg-11 leftPadding">
                                           <label style="font-family: Calibri;color: gray;"><spring:message code="new_warehouse_status.label" /> <span class="requiredField">*</span></label>
<%--                                             <input type="text" class="form-control" name="warehouseStatus" id="warehouseStatus" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_status.label" />" />
 --%>                                            <select class="form-control"  name="warehouseStatus" id="warehouseStatus">
                                            <option value="Enable"${wareHouse.warehouse_status == true ? 'selected' : ''}>Enable</option>
                                             <option value="Disable"${wareHouse.warehouse_status == false ? 'selected' : ''}>Disable</option>
                                            </select>
                                            <span id="statusErr" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div> 
				                     </div>
				                     <div class="form-group row">
				                      <div class="col-lg-11 leftPadding" style="white-space: nowrap;">
                                             <label style="font-family: Calibri;color: gray;"><spring:message code="isit.distribution.center" /> <span class="requiredField">*</span></label>
<%--                                             <input type="text" class="form-control" name="warehouseStatus" id="warehouseStatus" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_status.label" />" />
 --%>                                            <select class="form-control"  onchange="mainwarehousefn(this);" name="isitdistribution" id="isitdistribution">
												<option value="true" ${wareHouse.itDistributionCenter == true ? 'selected' : ''}>Yes</option>
		                                  	  <option value="false" ${wareHouse.itDistributionCenter == false ? 'selected' : ''}>No</option>
										</select>
                                        </div>          
									</div>
									<div class="row">
									<div class="form-group col-lg-11 leftPadding" style="white-space: nowrap;">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="main.warehouse" /> </label>
<%--                                             <input type="text" class="form-control" name="warehouseStatus" id="warehouseStatus" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_status.label" />" />
 --%>                      <input  type="text" class="form-control" name="workLocation" id="workLocation"   value="${wareHouse.mainWarehouse}"   />
 
                                         </div>   
                                        </div>  
                                        <div class="form-group row">
									     <div class="col-lg-11 leftPadding">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="gst.in" /> </label>
                                            <input type="text" class="form-control" name="gstin" id="gstin" value="${wareHouse.gstin}" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="gst.in" />" />
                                           
                                        </div>     
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-lg-11 leftPadding" style="">
                                          <label style="font-family: Calibri;color: gray;"><spring:message code="updated.date.label" /> </label>
                                             <input  class="form-control calendar_icon" type="text"   value="${wareHouse.updatedDateStr}" id="UpdateDate"  onfocus="callCalender('UpdateDate')"  size="20" onclick="callCalender('UpdateDate')"   placeholder="DD/MM/YYYY" />
                                        </div>
                                        </div>
                                        
									</div>
								                           
                                    </div>
                                   
                               </div>
                                    
                                    <br>
                                   
                                    
                                          <div class="row">
									   <div class="form-group col-lg-12" style="margin-top: 10px; margin-bottom: -17px;">
                                         	 <label style="font-weight:bold;" class="labelheading"><spring:message code="stockmanagement.label" /> Options </label>
                                         	 <hr style="margin-top: 1px;">
                                         </div>
                                      </div>
                                       <div class="row seven-cols" style="padding-left:15px;">
                                       
                                        <table class="table" style="margin-bottom: 0px; width:70%">
											    <thead style="background-color: #ececec !important; color: #ffffff ">
											      <tr>
											      <th> <label><spring:message code="purchase.order.label" /></label></th>
											      <th> <label><spring:message code="outlet.grn.label" /></label></th>
											       <th> <label><spring:message code="shipment.return.label" /></label></th>
											      <th>  <label><spring:message code="warehouse.stockissue.label" /></label></th>
											      <th>    <label><spring:message code="warehouse.stockreturn.label" /></label></th>
											       <th> <label><spring:message code="stock.request.label" /></label></th>
											      <th>  <label><spring:message code="stockverification.type" /></label></th>
											      <th>    <label><spring:message code="stock.alerts.label" /></label></th>
											      
											      
											     
                                       </tr>
                                       </thead>
                                       <tbody>
                                        <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 13.3%;"> 
                                        <%--  <label><spring:message code="manual.discounts.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="purchaseOrder" value="true" ${wareHouse.purchaseOrder=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="purchaseOrder" value="false" ${wareHouse.purchaseOrder=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      
                                      <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 12.9%"> 
                                        <%--  <label><spring:message code="discount.taxation.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="GRN" value="true" ${wareHouse.warehouseGrn=='true'?'checked':''}><spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="GRN"  value="false" ${wareHouse.warehouseGrn=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 13.3%"> 
                                        <%--  <label><spring:message code="discount.taxation.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="shipmentReturn" checked value="true" ${wareHouse.shipmentReturn=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="shipmentReturn" value="false" ${wareHouse.shipmentReturn=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 14.8%"> 
                                         <%-- <label><spring:message code="employee.discounts.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="stockIssue" value="true" ${wareHouse.stockIssue=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="stockIssue" value="false" ${wareHouse.stockIssue=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                       <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 14.8%"> 
                                     <%--     <label><spring:message code="campaign.pref.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="stockReturn" value="true" ${wareHouse.stockReturn=='true'?'checked':''}>  <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="stockReturn" value="false" ${wareHouse.stockReturn=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                       <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 14.8%"> 
                                     <%--     <label><spring:message code="campaign.pref.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="stockRequest" value="true" ${wareHouse.stockRequest=='true'?'checked':''}>  <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="stockRequest" value="false" ${wareHouse.stockRequest=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                       <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 14.8%"> 
                                     <%--     <label><spring:message code="campaign.pref.label" /></label> --%>
                                        <div class="radio">
                                           <label>
                                             <input type="radio" name="stockVerificationType" value="Periodic" ${wareHouse.stockVerificationType=='Periodic'?'checked':''}>Periodic</label>
                                         </div>
                                          <div class="radio">
                                           <label>
                                             <input type="radio" name="stockVerificationType" value="Perpetual" ${wareHouse.stockVerificationType=='Perpetual'?'checked':''}>Perpetual</label>
                                          
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="stockVerificationType"  value="Blind Stock Taking" ${wareHouse.stockVerificationType=='Blind Stock Taking'?'checked':''}>Blind Stock Taking</label>
                                         
                                         </div>
                                         </td>
                                         <td form-group col-lg-1 col-md-1 col-sm-1" style=""> 
                                     <%--     <label><spring:message code="campaign.pref.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="stockAlerts" value="true" ${wareHouse.stockAlerts=='true'?'checked':''}>  <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="stockAlerts" value="false" ${wareHouse.stockAlerts=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                         </td>
                                      </tbody>
                                      </table>
                                      </div>
                                    
                                    
                                    <br>
                                    
                                    
                                                           <div class="row">
									   <div class="form-group col-lg-12" style="margin-top: 10px; margin-bottom: -17px;">
                                         	 <label style="font-weight:bold;" class="labelheading"><spring:message code="order.management.label" /> Options </label>
                                         	 <hr style="margin-top: 1px;">
                                         </div>
                                      </div>
                                    
                                     <div class="row seven-cols" style="padding-left:15px;">
                                 <table class="table" style="margin-bottom: 0px; width:24%">
											    <thead style="background-color: #ececec !important; color: #ffffff ">
											      <tr>
											      <th> <label ><spring:message code="onlinrorders.label" /></label></th>
											      <th> <label ><spring:message code="telephonic.orders.label" /></label></th>
											       <th> <label ><spring:message code="billing.delivery.label" /></label></th>
											      
											      </tr>
											      </thead>
											      
											      <tbody>
											      <tr>
											      <td style=" width:13.9%; border-right: 2px solid #ccc;">                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="onlineOrders" value="true" ${wareHouse.onlineOrder=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="onlineOrders" value="false" ${wareHouse.onlineOrder=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      
                                      
											      <td style=" width:13.9%; border-right: 2px solid #ccc;">                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="telephonicOrders" value="true" ${wareHouse.telephonicOrder=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="telephonicOrders" value="false" ${wareHouse.telephonicOrder=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      
											      <td >                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="billingDelivery" value="true" ${wareHouse.billingAndDelivery=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="billingDelivery" value="false" ${wareHouse.billingAndDelivery=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      
                                      
                                     
											      </tr>
											      </tbody>
											      
											      </table>
											      </div>
                                                       
                               
                                    
                                    <br>
                         			  <div class="row" style="margin-top:12px;">
									    <div class="form-group col-lg-12" style="text-align: right;margin-left: -30px;">
								<c:if test="${sessionScope.role == 'super admin'}">
                              <input type="button" id="edit" style="position: relative;" class="btnCls " onclick="showWarehouseConfiguration('edit');" value="&nbsp;&nbsp;&nbsp;<spring:message code="update.label" />&nbsp;&nbsp;&nbsp;" />								</c:if>
								<c:forEach var="accessControl" items="${sessionScope.warehouseManagement}">
	                            	<c:if test="${accessControl.appDocument == 'WarehouseConfigurations' && accessControl.write == true}">
                                  		<input type="button" id="edit" style="position: relative;" class="btnCls " onclick="showWarehouseConfiguration('edit');" value="&nbsp;&nbsp;&nbsp;<spring:message code="update.label" />&nbsp;&nbsp;&nbsp;" />
                                  	</c:if>
                                 </c:forEach>
<%-- 								  	<input type="button" id="edit"  class="btn bg-olive btn-inline" style="margin-left:1%;width: 68px;position: relative;" onclick="cleareStorageSystems('clear');" value="<spring:message code="storage_systems_clear.label" />" />
 --%>								  	<input type="button" class="btnCls buttonMargin" style="position: relative;" onclick="getWareHouses('WarehouseConfigurations','0')" value="<spring:message code="cancel.label" />" />
									</div> 
									</div>     
                                </div><!-- /.box-body -->
                                </form>
                            </div><!-- /.box -->
  					 <input type="hidden" id="selectedState" name="states" value="${wareHouse.state}">
</div>
</div>
</section><!-- /.content -->
		<!-- DATA TABES SCRIPT -->
      <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script> 
        <script src="${pageContext.request.contextPath}/js/warehouse_configuration.js" type="text/javascript"></script>
         <!-- page script -->
        <script type="text/javascript">
           /*  $(function() {
                $("#example1").dataTable();
                $('#example2').dataTable({
                    "bPaginate": true,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": true,
                    "bInfo": true,
                    "bAutoWidth": false
                });
            }); */
           /*  $('#resizable')
            .draggable()
            .resizable(); */
        </script> 
      
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="store.label" />"/>
        
       <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/timepicker/bootstrap-timepicker.min.js" ></script>
           <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDHNN78JQSuDoLAZigF4cTbHgyeduFpVn8&libraries=places&callback=initAutocomplete"
         async defer></script>  
        <script>
        //Timepicker
  $(".timepicker").timepicker({
      showInputs: false,
      showMeridian:false,
      showSeconds:true,
      
  });
        </script>
       <input type="hidden" id="deleteActionLabel" value="<spring:message code="store.label" />"/>
         <input type="hidden" id="whlocation" value="${wareHouse.warehouseLocation}" />
</body>
</html>