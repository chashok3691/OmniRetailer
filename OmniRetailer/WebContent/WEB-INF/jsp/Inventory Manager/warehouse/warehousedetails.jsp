<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah Y
 * file name		        : inventorymanager/warehouse/warehousedetails
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
			<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
			
			
			
			

<script>
$(document).ready(function(){
	
   var phoneNo = $("#mobileNumber").val();
	phoneNo = phoneNo.split('-');
	if(phoneNo.length == 1)
		$("#phoneNumber").val(phoneNo[0]);
	else{
		$("#defaultCountry").val(phoneNo[0]);
		$("#phoneNumber").val(phoneNo[1]);
	}   
	var selectedCountry = $("#selectedCountry").val();
	var selectedState = $("#selectedState").val();
	var id = getCountryIndex(selectedCountry);
	print_country("country");
	print_state('state',id);
	$("#country").val(selectedCountry);
	$("#state").val(selectedState);
	
	
	var isitDistributionCenter = $("#itdistribution").val();
	
	 if( isitDistributionCenter == "true") {
			 document.getElementById("mainwarehouse").disabled = false;
		}

		else {
			 document.getElementById("mainwarehouse").disabled = true;
		   
		}
	
	
	//$("#country").val($("#whcountry").val());
//	print_state('state',104);
	
	//$("#state").val($("#whstate").val());
	
	
});
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
//$("#country").val($("#whcountry").val());   // set warehouse location
//$("#state").val($("#whstate").val());   // set warehouse location





</script>
<style type="text/css">
.buttons {
	float: right;
	padding-top: 0px;
	margin-right: 4%;
	margin-top:1%;
}
a.button, .list a.button {
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
  <input type="hidden" value="${warehouse.country}" id="selectedCountry">
                                <div class="box-header" style="text-align: center">
                                    <h3 class="box-title" style="padding :5px;  border:1px solid  #808080;">${warehouse.warehouseId}-<spring:message code="warehouse_details.label" /></h3>
                                </div><!-- /.box-header -->
                                   <form method="POST">
                                <div class="box-body">
                                	
				                     <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
				                     
				                     
				                     <div  class="row">
				                      
				                      <input type="hidden" name="storeCode" value=""/>
				                      <div class="form-group col-lg-6">
				                     <div class="row">
									    
									  <div class="form-group col-lg-4">
									     <label style="font-family: Calibri;color: gray;"><spring:message code="location.label" /><span class="requiredField">*</span></label>
                                           <select class="form-control" name="workLocation" id="workLocation" onchange="changeLocation()"> 
                                             <c:forEach var="location" items="${locationsList}">
												 <option value="${location}" ${location == warehouse.warehouseLocation ? 'selected' : ''}>${location}</option>
											 </c:forEach>
										 </select>
										    <span id="locationErr" style="text-align:right;color:red;font-weight:bold;"></span>
									  </div>
									   <div class="form-group col-lg-5">
                                          <label style="font-family: Calibri;color: gray;"><spring:message code="new_warehouse_name.label" /> <span class="requiredField">*</span></label>
                                            <input type="text" class="form-control" name="warehouseName" id="warehouseName" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_name.label" />" value="${warehouse.warehouse_name}"/>
                                            <span id="warehouseNameErr" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        </div>
                                        
                                        <div class="row">
                                        <div class="form-group col-lg-4">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="new_warehouse_phonenumber.label" /> <span class="requiredField">*</span></label>
                                           <%--  <input type="text" class="form-control" name="mobileNumber" id="mobileNumber" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_phonenumber.label" />" value="${warehouse.phone_number}"/> --%>
                                             <div class="row">
				                                  <div class="col-lg-4 col-md-4 col-sm-4 col-sxs-4">
				                                  	<select class="form-control" style="padding: 6px 0px;width:130%	" id="defaultCountry" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
				                                  	<option selected="selected">IN</option>
				                                  	<option>US</option>
				                                  	<option>GB</option>
				                                  	<option>AU</option>
				                                  	</select>
				                                  	<!-- <input type="text" onfocus="displayToolTip();" class="form-control" id="defaultCountry" maxlength="2" oninput="this.value = this.value.replace(/[^A-Za-z]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/> -->
				                                  </div>
				                                  <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px">
				                                  	<input type="text" class="form-control" value="${warehouse.phone_number}"  placeholder="<spring:message code="enter.customer_contact_num.label" />" id="phoneNumber" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
				                                  </div>
				                                  <input type="hidden" class="form-control" name="mobileNumber" id="mobileNumber"  value="${warehouse.phone_number}"/>
				                                   <input type="hidden" id="output" />
				                             </div>
                                            <span id="error" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        <div class="form-group col-lg-5">
                                              <label style="font-family: Calibri;color: gray;"><spring:message code="emailid.label" /></label>
                                            <input type="text" class="form-control" name="emailid"  value="${warehouse.email}" id="emailid"  placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="emailid.label" />" value=""/>
                                        </div>  
				                     </div>
				                     
				                     
				                     <div class="row">
                                        <div class="form-group col-lg-4">
                                           
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="new_plot_no.label" /> <span class="requiredField">*</span></label>
                                            <input type="text" class="form-control" name="houseNo" id="houseNo" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_no.label" />" value="${warehouse.address_1}"/>
                                            <span id="houseNoErr" style="text-align:right;color:red;font-weight:bold;"></span>
                                           
                                           
                                           
                                        </div>
                                        <div class="form-group col-lg-8">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="street.name.label" /><span class="requiredField">*</span></label>
                                            <input type="text" class="form-control" name="street" id="street"  placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="street.name.label" />" value="${warehouse.address_2}"/>
                                            <span id="streetErr" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>  
                                        </div>
				                     
				                     
				                    
				                     
				                      <div class="row">
                                        <div class="form-group col-lg-4" style="margin-top:-12px">
                                           
                                             <label style="font-family: Calibri;color: gray;"><spring:message code="locality.label" /> <span class="requiredField">*</span></label>
                                            <input type="text" class="form-control" name="locality" id=locality value="${warehouse.locality}" 	placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="locality.label" />" />
                                            <span id="localityErr" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        <div class="form-group col-lg-8" style="padding:0px;margin-top: -12px">
                                            
                                           <div class="form-group col-lg-4">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="new_warehouse_city.label" /> <span class="requiredField">*</span></label>
                                            <input type="text" class="form-control" name="city" id="city" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_city.label" />" value="${warehouse.city}"/>
                                            <span id="cityErr" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>      
                                             <div class="form-group col-lg-4" >
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="new_warehouse_state.label" /> <span class="requiredField">*</span></label>
                                               <select id ="state" class="form-control" name="state">
    										</select>
    										<input type="hidden" id="selectedState" value="${warehouse.state}"></input>
    			                             <span id="stateErr" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                            
                                             <div class="form-group col-lg-4" >
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="new_warehouse_zip.label" /> <span class="requiredField">*</span></label>
                                            <input type="text" class="form-control" name="zip" id="zip" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_zip.label" />" value="${warehouse.zip}"/>
                                            <span id="zipErr" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        </div>
                                        </div>
                                        
                                          <div class="row">
									    <div class="form-group col-lg-2" style="margin-top:-24px;white-space: nowrap;padding:0px;margin-left:16px">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="gps.longitude.label" /> <span class="requiredField">*</span></label>
                                            <input type="text" class="form-control" value="${warehouse.gpsLongitude}" name="gpsLongitude" id="gpsLongitude" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.storename.label" />" />
                                            <span id="gpsLongitudeError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                         <div class="form-group col-lg-2"></div>
                                        <div class="form-group col-lg-2" style="margin-top:-24px;white-space: nowrap;padding:0px">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="gps.latitude.label" /> <span class="requiredField">*</span></label>
                                             <input type="text" class="form-control" value="${warehouse.gpsLatitude}" name="gpsLatitude" id="gpsLatitude" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.storename.label" />" />
				                            <span id="gpsLatitudeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                      
                                              <div class="form-group col-lg-3" style="margin-top:-24px">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="new_warehouse_country.label" /> <span class="requiredField">*</span></label>
<%--                                             <input type="text" class="form-control" name="country" id="country" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_country.label" />" />
 --%>                                            
                                             <select onchange="print_state('state',this.selectedIndex);" id="country" name ="country" class="form-control" >
                                          
											</select>
											<input type="hidden" id="selectedCountry" value="${warehouse.country}"></input>
											<span id="countryErr" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        </div>
                                        
                                        <div class="row">

                                        
									    <div class="form-group col-lg-3" style="margin-top:-12px">
                                             <label style="font-family: Calibri;color: gray;"><spring:message code="created.date.label" /></label>
                                            <input class="form-control calendar_icon" type="text" value="${warehouse.createdDateStr}" id="CreateDate"  style="background-color: white;" readonly="readonly"  onfocus="callCalender('CreateDate')"  size="20" onclick="callCalender('CreateDate')" placeholder="DD/MM/YYYY" />
                                        	
                                        </div>
                                         <div class="form-group col-lg-1"></div>
                                        <div class="form-group col-lg-3" style="margin-top:-12px">
                                          <label style="font-family: Calibri;color: gray;"><spring:message code="updated.date.label" /> </label>
                                             <input  class="form-control calendar_icon" type="text"  value="${warehouse.updatedDateStr}" id="UpdateDate"  style="background-color: white;" readonly="readonly" onfocus="callCalender('UpdateDate')"  size="20" onclick="callCalender('UpdateDate')"   placeholder="DD/MM/YYYY" />
                                        </div>
                                      
                                            
                                        </div>
                                      
                                        
                                        
                                        
                                        
                                        </div>
                                        
                                        
                                         <div class="form-group col-lg-6">
				                     
				                     <div class="row">
				                                <div class="form-group col-lg-4">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="new_business_type.label" /> <span class="requiredField">*</span></label>
                                            <input type="text" class="form-control" name="warehouseType" id="warehouseType" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_type.label" />" value="${warehouse.warehouse_type}"/>
                                            <span id="warehouseTypeErr" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        
                                         <div class="form-group col-lg-3" style="white-space: nowrap;">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="isit.test.warehouse.label" /> </label>
<%--                                             <input type="text" class="form-control" name="warehouseStatus" id="warehouseStatus" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_status.label" />" />
 --%>                                          <select class="form-control" name="isittestwarehouse" id="isittestwarehouse">
											<option value="true" ${warehouse.testWarehouse == true ? 'selected' : ''}>Yes</option>
		                                  	  <option value="false" ${warehouse.testWarehouse == false ? 'selected' : ''}>No</option>
										</select>
                                           
                                        </div>        
                                         <div class="form-group col-lg-1" ></div> 
                                         <div class="form-group col-lg-4">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="new_warehouse_status.label" /> <span class="requiredField">*</span></label>
<%--                                             <input type="text" class="form-control" name="warehouseStatus" id="warehouseStatus" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_status.label" />" />
 --%>                                            <select class="form-control" name="warehouseStatus" id="warehouseStatus">
                                            <option value="Enable"${'Enable' == warehouse.warehouse_status ? 'selected' : ''}>Enable</option>
                                             <option value="Disable"${'Enable' == warehouse.warehouse_status ? 'selected' : ''}>Disable</option>
                                            </select>
                                            <span id="statusErr" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>         
									</div>
									
									<div class="row">
									 <div class="form-group col-lg-3">
                                             <label style="font-family: Calibri;color: gray;"><spring:message code="pos.enabled.label" /> </label>
<%--                                             <input type="text" class="form-control" name="warehouseStatus" id="warehouseStatus" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_status.label" />" />
 --%>                                           <select class="form-control" name="posenabled" id="posenabled">
											<option value="true" ${warehouse.posEnabled == true ? 'selected' : ''}>Yes</option>
		                                  	  <option value="false" ${warehouse.posEnabled == false ? 'selected' : ''}>No</option>
										</select>
                                           
                                        </div>    
                                        <div class="form-group col-lg-1"></div>   
                                          
                                           <div class="form-group col-lg-3">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="isit.franchise" /> </label>
<%--                                             <input type="text" class="form-control" name="warehouseStatus" id="warehouseStatus" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_status.label" />" />
 --%>                                           <select class="form-control" name="isitfranchise" id="isitfranchise">
											<option value="true" ${warehouse.itFranchise == true ? 'selected' : ''}>Yes</option>
		                                  	  <option value="false" ${warehouse.itFranchise == false ? 'selected' : ''}>No</option>
		                                  	  
										</select>
                                           
                                        </div>      
                                         <div class="form-group col-lg-1"></div>    
                                         
                                         <div class="form-group col-lg-4" style="white-space: nowrap;">
                                             <label style="font-family: Calibri;color: gray;"><spring:message code="isit.distribution.center" /> <span class="requiredField">*</span></label>
<%--                                             <input type="text" class="form-control" name="warehouseStatus" id="warehouseStatus" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_status.label" />" />
 --%>                                            <select class="form-control" name="isitdistribution" id="isitdistribution" onchange="mainwarehousefn(this);">
												<option value="true" ${warehouse.itDistributionCenter == true ? 'selected' : ''}>Yes</option>
		                                  	  <option value="false" ${warehouse.itDistributionCenter == false ? 'selected' : ''}>No</option>
		                                  	  </select>
                                        </div>    
                                                <input type="hidden" id="itdistribution" value="${warehouse.itDistributionCenter}"></input>                          
                                    </div>
									
									<div class="row">
									 <div class="form-group col-lg-4">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="remote.monitaring" /></label>
<%--                                             <input type="text" class="form-control" name="warehouseStatus" id="warehouseStatus" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_status.label" />" />
 --%>                                           <select class="form-control" name="remoteMonitoring" id="remoteMonitoring">
											<option value="true" ${warehouse.remoteMonitoring == true ? 'selected' : ''}>Yes</option>
		                                  	  <option value="false" ${warehouse.remoteMonitoring == false ? 'selected' : ''}>No</option>
										</select>
                                           
                                        </div>        
									  
                                          <div class="form-group col-lg-4" style="white-space: nowrap;">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="Picked.list.enabled" /> </label>
<%--                                             <input type="text" class="form-control" name="warehouseStatus" id="warehouseStatus" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_status.label" />" />
 --%>                                             <select class="form-control" name="Pickedlist" id="Pickedlist">
											<option value="true" ${warehouse.authorizedPicklist == true ? 'selected' : ''}>Yes</option>
		                                  	  <option value="false" ${warehouse.authorizedPicklist == false ? 'selected' : ''}>No</option>
										</select>
                                            
                                        </div>      
                                          <div class="form-group col-lg-4" style="white-space: nowrap;">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="main.warehouse" /> </label>
<%--                                             <input type="text" class="form-control" name="warehouseStatus" id="warehouseStatus" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_status.label" />" />
 --%>                                          <select class="form-control" name="mainwarehouse" id="mainwarehouse" > 
                                           <c:forEach var="location" items="${locationsList}">
												 <option value="${location}" ${location == warehouse.mainWarehouse ? 'selected' : ''}>${location}</option>
											 </c:forEach>
										 </select>
                                            
                                        </div>        
                                        
                                                         
                                    </div>
									
									<div class="row">
									 <div class="form-group col-lg-4">
									  <div class="form-group col-lg-8" style="padding:0px">
                                           <label style="font-family: Calibri;color: gray;"><spring:message code="devices.secured" /></label>
<%--                                             <input type="text" class="form-control" name="warehouseStatus" id="warehouseStatus" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_status.label" />" />
 --%>                                            <select class="form-control" name="devicessecured" id="devicessecured">
										<option value="true" ${warehouse.secured == true ? 'selected' : ''}>Yes</option>
		                                  	  <option value="false" ${warehouse.secured == false ? 'selected' : ''}>No</option>
										</select>
                                           
                                            </div>
                                             
                                            <div class="form-group col-lg-3" style="margin-left:-6px">
                                             <label style="font-family: Calibri;color: gray;">Radius <span class="requiredField"></span></label>
                                          <input type="text" class="form-control " style="width:40px" id="radius" name="radius" value="${warehouse.radius}"> 
                                          
                                        
                                            </div>
                                            
                                            
                                        </div>                    
									 
                                          <div class="form-group col-lg-4" style="white-space: nowrap;">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="Storagesystems.enabled" /></label>
<%--                                             <input type="text" class="form-control" name="warehouseStatus" id="warehouseStatus" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="new_warehouse_status.label" />" />
 --%>                                            <select class="form-control" name="Storagesystemsenabled" id="Storagesystemsenabled">
												<option value="true" ${warehouse.storageSystemEnabled == true ? 'selected' : ''}>Yes</option>
		                                  	  <option value="false" ${warehouse.storageSystemEnabled == false ? 'selected' : ''}>No</option>
										</select>
                                           
                                        </div>      
                                       
                                           
									 <div class="form-group col-lg-4">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="gst.in" /> </label>
                                            <input type="text" class="form-control" name="gstin" id="gstin" value="${warehouse.gstin}"  placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="gst.in" />" />
                                        
                                           
                                        </div>                                     
                                    </div>
				                     
				                     <div class="row" style="margin-left:-16px">
									
									
                                          <div class="form-group col-lg-4" style="white-space: nowrap;padding: 0px;margin-left: 17px;">
                                           
                                            <div class="form-group col-lg-6" style="padding-left: 0px;" >
                                            <div class="bootstrap-timepicker">
                                             <label style="font-family: Calibri;color: gray;"><spring:message code="starttime.label" /></label>
                                           <input type="text" class="form-control timepicker" name="starttime" id="starttime" value="${warehouse.startTimeStr}" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="starttime.label" />" />
                                           
                                        </div>       
                                        </div>
                                        
                                          <div class="form-group col-lg-6" style="padding-left: 0px;">
                                           <div class="bootstrap-timepicker">
                                            <label style="font-family: Calibri;color: gray;"><spring:message code="endtime.label" /></label>
                                             <input type="text" class="form-control timepicker" name="endtime" id="endtime" value="${warehouse.endTimeStr}" placeholder="<spring:message code="warehouse_enter.label" />&nbsp;<spring:message code="endtime.label" />" />
                                         
                                           
                                        </div>              
                                           
                                        </div>       
                                                                         
                                    </div>
				                     
				                     
				                     	</div>
				                     </div>
                                        
                               </div>
                                    
                                    <br>
                                   
                                    
                                                           <div class="row">
									   <div class="form-group col-lg-12" style="margin-top: 10px; margin-bottom: -17px;">
                                         	 <label style="font-weight:bold;" class="labelheading"><spring:message code="stockmanagement.label" /> </label>
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
                                             <input type="radio" name="purchaseOrder" value="true" ${warehouse.purchaseOrder=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="purchaseOrder" value="false" ${warehouse.purchaseOrder=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      
                                      <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 12.9%"> 
                                        <%--  <label><spring:message code="discount.taxation.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="GRN" value="true" ${warehouse.warehouseGrn=='true'?'checked':''}>  <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="GRN"  value="false" ${warehouse.warehouseGrn=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 13.3%"> 
                                        <%--  <label><spring:message code="discount.taxation.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="shipmentReturn" checked value="true" ${warehouse.shipmentReturn=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="shipmentReturn" value="false" ${warehouse.shipmentReturn=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 14.8%"> 
                                         <%-- <label><spring:message code="employee.discounts.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="stockIssue" value="true" ${warehouse.stockIssue=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="stockIssue" value="false" ${warehouse.stockIssue=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                       <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 14.8%"> 
                                     <%--     <label><spring:message code="campaign.pref.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="stockReturn" value="true" ${warehouse.stockReturn=='true'?'checked':''}>  <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="stockReturn" value="false" ${warehouse.stockReturn=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                       <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 14.8%"> 
                                     <%--     <label><spring:message code="campaign.pref.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="stockRequest" value="true" ${warehouse.stockRequest=='true'?'checked':''}>  <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="stockRequest" value="false" ${warehouse.stockRequest=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                       <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 14.8%"> 
                                     <%--     <label><spring:message code="campaign.pref.label" /></label> --%>
                                        <div class="radio">
                                           <label>
                                             <input type="radio" name="stockVerificationType" value="Periodic" ${warehouse.stockVerificationType=='Periodic'?'checked':''}>Periodic
                                           </label>
                                         </div>
                                          <div class="radio">
                                           <label>
                                             <input type="radio" name="stockVerificationType" value="Perpetual" ${warehouse.stockVerificationType=='Perpetual'?'checked':''}>Perpetual </label>
                                          
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="stockVerificationType"  value="Blind Stock Taking" ${warehouse.stockVerificationType=='Blind Stock Taking'?'checked':''}>Blind Stock Taking</label>
                                         
                                         </div>
                                         </td>
                                         <td form-group col-lg-1 col-md-1 col-sm-1" style=""> 
                                     <%--     <label><spring:message code="campaign.pref.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="stockAlerts" value="true" ${warehouse.stockAlerts=='true'?'checked':''}>  <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="stockAlerts" value="false" ${warehouse.stockAlerts=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                         </td>
                                      </tbody>
                                      </table>
                                      </div>
                                    
                                    
                                    <br>
                                    
                                    
                                                           <div class="row">
									   <div class="form-group col-lg-12" style="margin-top: 10px; margin-bottom: -17px;">
                                         	 <label style="font-weight:bold;" class="labelheading"><spring:message code="order.management.label" /> </label>
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
                                             <input type="radio" name="onlineOrders" value="true" ${warehouse.onlineOrder=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="onlineOrders" value="false" ${warehouse.onlineOrder=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      
                                      
											      <td style=" width:13.9%; border-right: 2px solid #ccc;">                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="telephonicOrders" value="true" ${warehouse.telephonicOrder=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="telephonicOrders" value="false" ${warehouse.telephonicOrder=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      
											      <td >                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="billingDelivery" value="true" ${warehouse.billingAndDelivery=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="billingDelivery" value="false" ${warehouse.billingAndDelivery=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      
                                      
                                     
											      </tr>
											      </tbody>
											      
											      </table>
											      </div>
                                      
                                    
                         			 <div class="row" style="margin-top:12px;">
									   <!-- <div class="form-group col-lg-4" style="margin-top:8px;">
									  </div>
									   <div class="form-group col-lg-4"></div> -->
									    <div class="form-group col-lg-12" style="text-align: center;">
                                  		<input type="button" id="edit" style="position: relative;" class="btnCls" onclick="showWarehouseConfiguration('edit');" value="&nbsp;&nbsp;&nbsp;<spring:message code="submit.label" />&nbsp;&nbsp;&nbsp;" />
<%-- 								  	<input type="button" id="edit"  class="btn bg-olive btn-inline" style="margin-left:1%;width: 68px;position: relative;" onclick="cleareStorageSystems('clear');" value="<spring:message code="storage_systems_clear.label" />" />
 --%>								  	
 									 <c:set var="warehouseConfig" value="false"/>
 							<c:if test="${sessionScope.role == 'super admin'}">
 								<input type="button" class="btnCls buttonMargin" style="position: relative;" onclick="getWareHouses('WarehouseConfigurations','0')" value="<spring:message code="cancel.label" />" />
 							</c:if>
                            <c:forEach var="accessControl" items="${sessionScope.warehouseManagement}">
                            		<c:if test="${accessControl.appDocument == 'WarehouseConfigurations' && accessControl.write == true && accessControl.read == true}">
 										<input type="button" class="btnCls buttonMargin" style=" position: relative;" onclick="getWareHouses('WarehouseConfigurations','0')" value="<spring:message code="cancel.label" />" />
 									</c:if>
 							</c:forEach>
									</div> 
									</div>     
								
                                </div><!-- /.box-body -->
                                </form>
                            </div><!-- /.box -->
  					 <input type="hidden" id="selectedState" name="states" value="${warehouse.state}">
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
         
          <input type="hidden" id="whid" value="${warehouse.warehouseId}" />
           <input type="hidden" id="whcountry" value="${warehouse.country}" />
            <input type="hidden" id="whstate" value="${warehouse.state}" />
              <input type="hidden" name="storeCode" value=""/>
       
       
</body>
</html> 