<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * modified By				: vinay kumar on 19/12/2017
 * file name		        : inventorymanager/retailoutlets/viewoutlet.jsp
 * file type		        : JSP
 * description				: The new store form is displayed using this jsp
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <!DOCTYPE html>
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 -->

<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<link href="${pageContext.request.contextPath}/css/timepicker/bootstrap-timepicker.min.css" rel="stylesheet"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/outlet.js"></script>
	<script src="${pageContext.request.contextPath}/js/demo-compiled.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
<style type="text/css">


.fileUpload input.upload {
    position: absolute;
    top: 0;
    right: 0;
    margin: 0;
    padding: 0;
    font-size: 20px;
    cursor: pointer;
    opacity: 0;
    }

  .browsebutton:hover {
    background: grey !important;
}
.browsebutton {
    font-weight: bold;
    height: 28px;
    border-radius: 0px;
    padding: 2px 17px;
    background: grey;
    border: none;
}
.fileUpload {
    position: relative;
    overflow: hidden;
    /* margin: 10px; */
}

.companyimage{

    /* margin-left: -100%; */
    margin-top: -10%;
    margin-bottom:0px;
    object-fit: contain;
    height: 52px;
}
.col-xs-12 {
	 padding: 2% 25%;
	 }
	 
	 
	 #cbgroup{
	   height:90px;overflow:auto;border:1px solid #e5e6e6;
	 }
	 .checkbox{
	   margin-left:8%;
	 }
	 .buttons {
	/* float: right; */
	padding-top: 0px;
	/* margin-right: 2%; */
	/* margin-top:1%; */
}
a.button, .list a.button {
	position:relative;
	text-decoration: none;
	color: black;
	display: inline-block;
	padding: 5px 10px 5px 10px;
	background: rgb(195,195,195);
	border-radius: 5px;
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
}

@media (min-width: 768px){
  .seven-cols .col-md-1,
  .seven-cols .col-sm-1,
  .seven-cols .col-lg-1  {
    width: 100%;
    *width: 100%;
  }
  .allignment{
  width: 100%;
  }
}
.labelheading{
    background: #ccc;
    padding: 2px 15px 2px 15px;
}
@media (min-width: 992px) {
  .seven-cols .col-md-1,
  .seven-cols .col-sm-1,
  .seven-cols .col-lg-1 {
    width: 10%;
    *width: 10%;
  }
   .allignment{
  width: 100%;
  }
}

/**
 *  The following is not really needed in this case
 *  Only to demonstrate the usage of @media for large screens
 */    
@media (min-width: 1200px) {
  .seven-cols .col-md-1,
  .seven-cols .col-sm-1,
  .seven-cols .col-lg-1 {
    width: 10%;
    *width: 10%;
     padding-left: 10px;
    padding-right: 10px;
  }
   .allignment{
  width: 20%;
  }
}
</style>
<script>
$(document).ready(function(){
	
	
	
});
</script>
</head>
<body>
<!-- Content Header (Page header) -->
<%-- <section class="content-header">
					<h1><spring:message code="outlet.management.label" />
     					<small><p id="heading"><spring:message code="configurations.label" /></p></small>
   					</h1>
                   <ol class="breadcrumb">
                    <li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
                        <li class="active"><spring:message code="outlet.management.label"/></li>
                    </ol>
                </section> --%>
<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
				<div class="box box-primary">
                                <div class="box-header" style="text-align: center">
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form method="POST">
                                
                                
                                <div class="row" style="text-align: right;">
						<c:if test="${sessionScope.role == 'super admin'}">
							<input type="button" id="submit" class="btnCls" style="margin-right: 25px"  onclick="validateWareHousePOS('edit');" value='&nbsp;&nbsp;&nbsp;<spring:message code="update.label" />&nbsp;&nbsp;&nbsp;' />
						</c:if>
						 <c:forEach var="accessControl" items="${sessionScope.outletManagement}">
	                       <c:if test="${accessControl.appDocument == 'Configuration' && accessControl.write == true}"> 
						 	<input type="button" id="submit"   class="btnCls" style="margin-right: 2%;"  onclick="validateWareHousePOS('edit');" value='&nbsp;&nbsp;&nbsp;<spring:message code="update.label" />&nbsp;&nbsp;&nbsp;' />
						   </c:if>
						</c:forEach>
						 <!-- <input type="submit" class="btn bg-olive btn-inline" style="margin-left:5%;" onclick="" value="Reset" /> -->
						<input type="button" class="btnCls" style="margin-right: 2%;" onclick="getWareHousespos('${id}','0');" value="<spring:message code="cancel.label" />" />
						</div>
                                
                                   <div class="box-body" style=" opacity: 1.5; ">
                                     <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                                       
                                       
                                									<div class="row">
									 <!--  <div class="form-group col-lg-4"> -->
									    <%--  <input type="hidden" name="storeCode" id="storeCode" value="${wareHouseDetails.storeCode}"/> --%>
									<!--   </div> -->
									  <div class="form-group col-lg-4 allignment">
									     <label><spring:message code="location.label" /></label>
                                          <%--  <select class="form-control" name="location" id="workLocation">
                                             <c:forEach var="location" items="${warehouses}" > 
												 <option value="${wareHouseDetails.location}">${wareHouseDetails.location}</option>
											   
											 </c:forEach>
										 </select> --%>
									 <input type="text" class="form-control" name="workLocation" value="${wareHouseDetails.location}" id="workLocation"  />
										 
									  </div>
									  <div class="col-lg-4">
                        		        <label><spring:message code="authorize.label" /></label>
                        		     <!--   <input id="denominationFile" class="form-control" value="" placeholder="Choose File" disabled="disabled"> -->
                        		       <input type="hidden" id="signature_refId">
                        		          <input type="hidden" id="signatureFile">
                        		      <div class="row">
                        		        <div class="col-lg-2">
                        		        <div class="fileUpload btn btn-primary browsebutton" style="font-weight: bold;">
			    			        <span style="font-size: 15px;">Upload...</span>
			    			         <input id="signatureBtn" type="file" accept=".jpg, .png, .PNG, .gif" onchange="addNameToTextBox('signature',this);" class="upload">
						                </div>
						              </div>
                        		<div class=" col-lg-3 col-sm-3 col-xs-3" style="margin-left: 69px;">
                                    <div class="" title="Signature Image" id="signature_image" style="text-align: center;width:150px;;">
            <%-- <img class="thumbnail companyimage" id="dealBanner_thumbnail" alt="No Image" src="data:image/jpeg;base64,${denominationMasterResponse.denominationImage}" style=""/> --%>
                                      <img class="thumbnail companyimage" id="dealBanner_thumbnail" alt="No Image" src="${wareHouseDetails.signature}">
									  <label class="myFile" id="logo1_label"></label>
								   </div>
                                 </div>        
                        		        </div>
								   </div>
                                        
									</div>
									<div style="background: #eee; padding-left: 15px; padding-right: 15px; padding-top: 10px;">
									<div class="row">
									    <div class="form-group col-lg-4 allignment">
                                            <label><spring:message code="warehouse_name.label" /> <span class="requiredField">*</span></label>
                                            <input type="text"  onblur="criteria(this)" class="form-control" value="${wareHouse.warehouse_name}" readonly="readonly" name="storeName" id="storename"  placeholder="<spring:message code="enter.storename.label" />" />
                                            <span id="storeError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                         <div class="form-group col-lg-4 allignment">
                                            <label><spring:message code="street.label.outlet" /> <span class="requiredField">*</span></label>
                                            <input type="text"  onblur="criteria(this)" class="form-control" value="${wareHouseDetails.street}" name="storeName" id="street" placeholder="<spring:message code="enter.road.street.label" />" />
                                            <span id="streetError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                         <div class="form-group col-lg-4 allignment">
                                            <label><spring:message code="locality.label" /> <span class="requiredField">*</span></label>
                                            <input type="text"  onblur="criteria(this)" class="form-control" value="${wareHouseDetails.locality}" name="storeName" id="locality" placeholder="<spring:message code="enter.locality.label" />" />
                                            <span id="localityErr" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        
                                         <div class="form-group col-lg-4 allignment">
                                            <label><spring:message code="gps.longitude.label" /> <span class="requiredField">*</span></label>
                                            <input type="text"  onblur="criteria(this)" class="form-control" value="${wareHouseDetails.gpsLongitude}" name="gpsLongitude" id="gpsLongitude"  placeholder="<spring:message code="enter.storelocation.label" />" />
                                            <span id="gpsLongitudeError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        
                                        <div class="form-group col-lg-4 allignment">
                                            <label><spring:message code="gps.latitude.label" /> <span class="requiredField">*</span></label>
                                             <input type="text"  onblur="criteria(this)" class="form-control" name="gpsLatitude" value="${wareHouseDetails.gpsLatitude}" id="gpsLatitude" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.storelocation.label" />" />
				                            <span id="gpsLatitudeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                        
                                    </div>
                                    <div class="row">
									   
                                         <div class="form-group col-lg-4 allignment">
                                            <label><spring:message code="category.label" /></label>
                                            <select class="form-control" id="category" >
		                                  		<option value="Restaurant" ${'Restaurant' == wareHouseDetails.category ? 'selected' : ''} >Restaurant</option>
		                                  		<option value="FMCG" ${'FMCG' == wareHouseDetails.category ? 'selected' : ''} >FMCG</option>
		                                  		<option value="Apparel" ${'Apparel' == wareHouseDetails.category ? 'selected' : ''} >Apparel</option>
		                                  		<option value="Hospitality" ${'"Hospitality"' == wareHouseDetails.category ? 'selected' : ''} >Hospitality</option>
		                                  		<option value="Sports" ${'Sports' == wareHouseDetails.category ? 'selected' : ''} >Sports</option>
		                                  		<option value="Body Care" ${'Body Care' == wareHouseDetails.category ? 'selected' : ''} >Body Care</option>
		                                  		<option value="Health" ${'Health' == wareHouseDetails.category ? 'selected' : ''} >Health</option>
		                                  		<option value="White Goods" ${'White Goods' == wareHouseDetails.category ? 'selected' : ''} >White Goods</option>
		                                  	</select>
                                            <span id="categoryError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        <div class="form-group col-lg-4 allignment">
                                            <label><spring:message code="secured.label" /></label>
                                             <div style="width:60%">
                                            <select class="form-control" id="secured" >
		                                  		<option value="true" ${'true' == wareHouseDetails.secured ? 'selected' : ''} >Yes</option>
		                                  		<option value="false" ${'false' == wareHouseDetails.secured ? 'selected' : ''} >No</option>
		                                  			</select></div>
                                            <span id="categoryError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                         <div class="form-group col-lg-4 allignment">
                                         <label><spring:message code="pheriphary.label" /></label>
                                         <div style="width:60%">
                                            <select class="form-control" id="periphery" >
		                                  		<option value="5" ${'5' == wareHouseDetails.periphery ? 'selected' : ''} >5 m</option>
		                                  		<option value="10" ${'10' == wareHouseDetails.periphery ? 'selected' : ''} >10m</option>
		                                  		<option value="20" ${'20' == wareHouseDetails.periphery ? 'selected' : ''} >20m</option>
		                                  		<option value="50" ${'50' == wareHouseDetails.periphery ? 'selected' : ''} >50m</option>
		                                  		<option value="100" ${'100' == wareHouseDetails.periphery ? 'selected' : ''} >100m</option>
		                                  		  	</select></div>
                                            
                                            <span id="categoryError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        
                                        <div class="form-group col-lg-4 allignment">
                                            <label><spring:message code="email.label" /> <span class="requiredField">*</span></label>
                                             <input type="text" class="form-control" name="email" value="${wareHouseDetails.email}" id="emailIDinOutlet"  placeholder="<spring:message code="enter.email.lable"/> "/>
				                            <span id="gpsLatitudeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                         <div class="form-group col-lg-4 allignment">
                                            <label><spring:message code="remote.monitaring" /></label>
                                             <div style="width:60%">
                                            <select class="form-control" id="remoteMonitoring" >
		                                  		<option value="true" ${'true' == wareHouseDetails.remoteMonitoring ? 'selected' : ''} >Yes</option>
		                                  		<option value="false" ${'false' == wareHouseDetails.remoteMonitoring ? 'selected' : ''} >No</option>
		                                  		 	</select></div>
                                            <span id="categoryError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        
                                    </div>
                                    <div class="row">
                                    <div class="form-group col-lg-4 allignment">
                                            <label><spring:message code="phone.label" /> <span class="requiredField">*</span></label>
                                             <div class="row">
				                                  <div class="col-lg-5 col-md-4 col-sm-4 col-xs-4">
				                                  	<select class="form-control" style="padding: 6px 8px;" id="defaultCountry" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
				                                  		 <option >${sessionScope.countryCode}</option>
				                                  		<!-- <option>US</option>
				                                  		<option>GB</option>
				                                  		<option>AU</option> -->
				                                  	</select>
				                                  </div>
				                                  
				                                  <c:set var="dataParts" value="${fn:split(wareHouseDetails.phone, '-')}" />
				                                  
				                                  
				                                  <div class="col-lg-7 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px">
				                                  	<input type="text"  onblur="criteria(this)"class="form-control" placeholder="<spring:message code="supplier.enter.phone.label" />" value="${dataParts[1]}" id="phoneNumber" size="15" onBlur="validateMobileNumber()" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
				                                  </div>
				                                  <input type="hidden" class="form-control" name="phone" id="phone"  value="${wareHouseDetails.phone}"/>
				                                   <input type="hidden" id="output" />
				                                   <input type="hidden" class="form-control" name="whidupdate" id="whidupdate"  value="${wareHouseDetails.warehouseId}" />
				                                   
				                             </div>
				                            <span id="phoneNumberError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                             
                                            
                                            <%-- <input name="phone" type="tel" class="form-control number" pattern="[0-9]{11}" required id="phone" placeholder="<spring:message code="enter.phone.label" />"  />
                                            <span id="phoneError" style="text-align:right;color:red;font-weight:bold;"></span> --%>
                                        </div>
                                        
                                        <div class="form-group col-lg-4 allignment">
                                            <label>Alternate Number</label>
                                            <input type="text" name="fax" value="${wareHouseDetails.fax}" class="form-control number" id="fax" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="Alternate Number" />
                                            <span id="faxError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                    <div class="form-group col-lg-4 allignment">
                                            <label><spring:message code="tollfree.label" /></label>
                                            <input type="number" name="tollFreeNum" value="${wareHouseDetails.tollFreeNum}" class="form-control number" id="tollFreeNum" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.tollfree.label" />" />
                                            <span id="tollFreeNumError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                      <div class="form-group col-lg-2 " style="width:10%;    padding-right: 5px;">
                                         <div class="bootstrap-timepicker">
                                            <label><spring:message code="start.time.label"/> <span class="requiredField">*</span></label>
                                             <div >
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="startTime" id="startTime" value="${wareHouseDetails.startTime}" />
                                                <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
                                            </div><!-- /.input group --></div>
                                        </div><!-- /.form group -->
                                        <span id="startTimeError" style="text-align:right;color:red;font-weight:bold;"></span>
                                      </div>
                                             
                            <!-- time Picker -->
                                    
                                       <div class="form-group col-lg-2 " style="width:10%;    padding-left: 5px;">
                                        <div class="bootstrap-timepicker">
                                            <label><spring:message code="end.time.label"/> <span class="requiredField">*</span></label>
                                             <div >
                                            <div class="input-group">                                            
                                                <input type="text" name="endTime" class="form-control timepicker" id="endTime" value="${wareHouseDetails.endTime}"/>
                                                <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
                                            </div><!-- /.input group --></div>
                                        </div><!-- /.form group -->
                                          <span id="endTimeError" style="text-align:right;color:red;font-weight:bold;"></span>
                                    </div>
                                     <div class="form-group col-lg-4 " style="width:15%;">
                                         <label><spring:message code="minepayamount.label" /> <span class="requiredField">*</span></label>
                                         <input type="text"  onblur="criteria(this)" name="minPayAmount" value="${wareHouseDetails.minPayAmount}" class="form-control" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" required id="amount" placeholder="<spring:message code="amount.label" />" />
                                         <span id="amountError" style="text-align:right;color:red;font-weight:bold;white-space:nowrap"></span>
                                     </div>
                               </div>
                                   <div class="row">
                                    <div class="form-group col-lg-4 allignment">
                                            <label style="white-space: nowrap;"><spring:message code="franchise.company.label" /></label>
                                            <select class="form-control" id="companyOwned" >
												 <option value="franchise" ${wareHouseDetails.companyOwned == franchise ? 'selected' : ''}>Franchise</option>
												 <option value="company" ${wareHouseDetails.companyOwned == company ? 'selected' : ''}>Company Owned</option>
												  <option value="b2c" ${wareHouseDetails.companyOwned == 'b2c' ? 'selected' : ''}>B2C</option>
		                                  		  	</select>
                                        </div>
                                         <div class="form-group col-lg-4 allignment">
                                            <label><spring:message code="stockverification.type" /></label>
                                             <select class="form-control" id="stockVerificationType" >
												 <option value="Periodic" >Periodic</option>
												 <option value="Perpetual" >Perpetual</option>
												  <option value="blind" >Blind stock taking</option>
		                                  		  	</select>
                                        </div>
                                         <div class="form-group col-lg-4 allignment">
                                            <label><spring:message code="zone.label" /></label>
                                            <select class="form-control" id="zoneId" >
		                                  		 <c:forEach var="zoneList" items="${zoneList}">
															<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList.zoneID}" >${zoneList.zoneID}</option>
														</c:forEach>
		                                  		  	</select>
                                            <span id="categoryError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                    <div class="form-group col-lg-4 allignment">
                                            <label>Warehouse ID</label>
                                           <%--  <select class="form-control" id="warehouseId" disabled >
		                                  		   <c:forEach var="location" items="${locationsList}"> 
												 <option value="${location}" ${selectedLocation == location ? 'selected' : ''}>${location}</option>
											 </c:forEach> 
											 <option></option>
		                                  		  	</select> --%>
		                                  		  	<input type="text" readonly="readonly" class="form-control" id="warehouseId" value="${wareHouseDetails.warehouseId}"/>
                                            <span id="categoryError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                         <div class="form-group col-lg-4 " style="width:15%;">
                                         <label><spring:message code="maxcash.label" /> <span class="requiredField">*</span></label>
                                         <input type="text"  name="maximumCashLimit" value="${wareHouseDetails.maximumCashLimit}" class="form-control" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" required id="maximumCashLimit" placeholder="<spring:message code="maxcash.label" />" />
                                         <span id="LimitError" style="text-align:right;color:red;font-weight:bold;white-space:nowrap"></span>
                                     </div>
                                     
                                        </div>
                                          <div class="row">
                                        <div class="form-group col-lg-4 allignment">
                                            <label><spring:message code="gstin.lael" /></label>
                                            <input type="text"  onblur="criteria(this)" name="gstIn" value="${wareHouseDetails.gstIn}" id="gstIn" class="form-control" placeholder="<spring:message code="enter.gstin.no.label"/>" />
                                        </div>
                                        
                                        
                                         <div class="form-group col-lg-2 allignment" style=""> 
                                        <label><spring:message code="dayOpenSynsc.label" /></label>
                                           <div style="width:60%">
                                            <select class="form-control" id="dayStartSync" >
<%--                                             	<option value="true" ${'true' == wareHouseDetails.remoteMonitoring ? 'selected' : ''} >Yes</option> --%>
<%-- 		                                  		<option value="false" ${'false' == wareHouseDetails.remoteMonitoring ? 'selected' : ''} >No</option> --%>
                                              <option value="true" ${wareHouseDetails.dayStartSync == true ? 'selected' : ''}>Yes</option>
		                                  	  <option value="false" ${wareHouseDetails.dayStartSync == false ? 'selected' : ''}>No</option>
		                                	</select>
                                         </div>
                                      </div>
                                       <div class="form-group col-lg-2 allignment">
                                         <label><spring:message code="virtualstore.label" /></label>
                                          <div style="width:60%">
                                          <select class="form-control" id="isVirtualStore" >
                                              <option value="true" ${wareHouseDetails.isVirtualStore == true ? 'selected' : ''}>Yes</option>
		                                  	  <option value="false" ${wareHouseDetails.isVirtualStore == false ? 'selected' : ''}>No</option>
		                                	</select>
		                                	</div>
                                       </div>
                                        <div class="form-group col-lg-2 allignment">
                                        <label><spring:message code="inventory.mgmt.label" /></label>
                                         <div style="width:60%">
                                         <select class="form-control" id="isInventoryRequired" >
                                              <option value="true" ${wareHouseDetails.isInventoryRequired == true ? 'selected' : ''}>Yes</option>
		                                  	  <option value="false" ${wareHouseDetails.isInventoryRequired == false ? 'selected' : ''}>No</option>
		                                	</select>
		                                	</div>
                                        </div>
                                        
                                        <div class="form-group col-lg-4 allignment">
                                            <label><spring:message code="leadtime.label" /></label>
                                             <div style="width:60%">
                                            <select class="form-control" id="leadTime" >
		                                  	<c:forEach begin="1" end="30" varStatus="loop">
		                                  		 <option value="${loop.index}" ${loop.index == wareHouseDetails.leadTime ? 'selected' : ''}>${loop.index}</option>
											</c:forEach>
		                                  		  	</select></div>
                                            <span id="categoryError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                         
                                       
                                          
                               </div>
                               
                               
                                <div class="row">
                                <div class="form-group col-lg-2 allignment">
									<label><spring:message code="created.date.label" /></label>
                                           <input class="form-control calendar_icon" disabled="disabled" readonly="readonly" style="background-color: white;" value="${wareHouseDetails.createdDateStr}" name="createddate" id="createddate" size="20" type="text" onfocus="callCalender('createddate')" onclick="callCalender('createddate')" placeholder="DD/MM/YYYY"/>
									<span id="orderDateError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
                                
                                
                                <div class="form-group col-lg-2 allignment">
									<label><spring:message code="updated.date.label" /></label>
                                           <input class="form-control calendar_icon" readonly="readonly" style="background-color: white;" name="updatedddate" value="${wareHouseDetails.updatedDateStr}" id="updatedddate" size="20" type="text" onfocus="callCalender('updatedddate')" onclick="callCalender('updatedddate')" placeholder="DD/MM/YYYY"/>
                                       
									<span id="orderDateError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
								
								
								
								 <div class="form-group col-lg-2 allignment">
                                         <label><spring:message code="session.timeout.label" /></label>
                                         <div style="width:60%">
                                         <div class="bootstrap-timepicker">
                                            
                                            <div class="input-group">   
                                          <input type="text" name="timeOutStr" value='00:00:00' id="timeOutStr" class="form-control timepicker"  />
                                         
                                         </div>
                                         </div>
                                         </div>
                                         </div>
                                
                                
                                <div class="form-group col-lg-2 allignment">
									<label><spring:message code="suspend.Reason.label" /></label>
                                           <input class="form-control calendar_icon"  style="background-color: white;" name="suspendReason"  id="suspendReason" size="20" type="text"  value="${wareHouseDetails.suspendReason}"/>
                                       
								</div>
								
                                </div>
                                
                               
                               
                               </div>
                                       
                                       
									
								
                               <br>
                                 <div class="row">
									   <div class="form-group col-lg-12" style="margin-top: 10px;margin-bottom: -17px;">
                                         	 <label style="font-weight:bold;" class="labelheading">Warehouse Options</label>
                                         	 <hr style="margin-top: 1px;">
                                         </div>
                                      </div>
                                   <div class="row seven-cols" style="padding-left:15px;">
                                   
                                   <table class="table" style="margin-bottom: 0px; width:99%">
											    <thead style="background-color: #ececec !important; color: #ffffff ">
											      <tr>
											        <th><label>Warehouse Type</label></th>
											        <th>  <label><spring:message code="offlinemode.label" /></label></th>
											        <th><label><spring:message code="mobilesecurity.label" /></label></th>
											        <th> <label><spring:message code="offlinedata.timeout" /></label></th>
											        <th> <label><spring:message code="onlinrorders.label" /></label></th>
											        <th> <label><spring:message code="telephonicorders.label" /></label></th>
											        <th><label><spring:message code="attendance.enabled" /></label></th>
											        <th> <label>Warehouse Status</label></th>
											        <th style="width:9%"> <label><spring:message code="bill.id.label" /></label></th>
											      </tr>
											    </thead> 
											    <tbody>
											    
											    <tr>
                                   <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 9.6%;"> 
                                        <%--  <label><spring:message code="outlet.type.label" /></label> --%>
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="outletType" value="fixed" ${wareHouseDetails.outletType=='fixed'?'checked':''}> <spring:message code="fixed.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="outletType" value="mobile" ${wareHouseDetails.outletType=='mobile'?'checked':''}> <spring:message code="mobile.label"/>
                                                </label>
                                            </div>
                                        </td>
                                    <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 10.12%;">
                                     <%--  <label><spring:message code="offlinemode.label" /></label> --%>
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="offlineMode" value="true" ${wareHouseDetails.offlineMode=='true'?'checked':''}> <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="offlineMode" value="false" ${wareHouseDetails.offlineMode=='false'?'checked':''}> <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                     </td>
                                      <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc; width: 12.1%;"> 
                                       <%--   <label><spring:message code="mobilesecurity.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="mobileSecurity" value="true" ${wareHouseDetails.mobileSecurity=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="mobileSecurity" value="false" ${wareHouseDetails.mobileSecurity=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                   	<td class="form-group col-lg-1 col-md-1 col-sm-1" style="width:14%;border-right: 2px solid #ccc;width: 12.5%;"> 
                                        <%--  <label><spring:message code="offlinedata.timeout" /></label> --%>
                                            <div class="row">
                                                 <div class="form-group col-lg-10 ">
                                            <select class="form-control" id="offLineDataTimedOutDays"style="margin-top: 5px;" >
                                            <option value="">Days</option>
		                                  	<c:forEach begin="1" end="30" varStatus="loop">
		                                  		 <option value="${loop.index}" ${loop.index == wareHouseDetails.offLineDataTimedOutDays ? 'selected' : ''}>${loop.index}</option>
											</c:forEach>
		                                  		  	</select>
                                            <span id="categoryError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                            </div>
                                            <div class="row">
                                                  <div class="col-lg-10 ">
                                            <select class="form-control" id="offLineDataTimedOutHours" >
                                            <option value="">Hours</option>
		                                  	<c:forEach begin="1" end="24" varStatus="loop">
		                                  		 <option value="${loop.index}" ${loop.index == wareHouseDetails.offLineDataTimedOutHours ? 'selected' : ''}>${loop.index}</option>
											</c:forEach>
		                                  		  	</select>
                                            <span id="categoryError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                            </div>
                                        </td>
                                    <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 10.9%;">
                                     <%--  <label><spring:message code="onlinrorders.label" /></label> --%>
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="onlineOrders" value="true" ${wareHouseDetails.onlineOrders=='true'?'checked':''}> <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="onlineOrders" value="false" ${wareHouseDetails.onlineOrders=='false'?'checked':''}> <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                     </td>
                                      <td class="form-group col-lg-1 col-md-1 col-sm-1" style="  border-right: 2px solid #ccc;width: 9.25%;"> 
                                       <%--   <label><spring:message code="telephonicorders.label" /></label> --%>
                                          <div class="radio">
                                           <label>
                                             <input type="radio" name="telephonicOrders" value="true" ${wareHouseDetails.telephonicOrders=='true'?'checked':''}><spring:message code="yes.label" />                                          
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="telephonicOrders" value="false" ${wareHouseDetails.telephonicOrders=='false'?'checked':''}><spring:message code="no.label" /></label>
                                         </div>
                                      </td>
                                      <td class="form-group col-lg-1 col-md-1 col-sm-1" style="    width: 15.2%;border-right: 2px solid #ccc;"> 
                                       <%--   <label><spring:message code="attendance.enabled" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="attendanceEnabled" value="true" ${wareHouseDetails.attendanceEnabled=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="attendanceEnabled" value="false" ${wareHouseDetails.attendanceEnabled=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                   <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc; width: 10.47%;"> 
                                        <%--  <label><spring:message code="outlet.status.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="storeStatus" value="1" ${wareHouseDetails.outletStatus=='true'?'checked':''}> <spring:message code="enable.label"/>                                           
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="storeStatus" value="0" ${wareHouseDetails.outletStatus=='false'?'checked':''}><spring:message code="disable.label"/></label>
                                         </div>
                                      </td>
                                      
                                      
                                      
                                      
                                         <td class="form-group col-lg-1 col-md-1 col-sm-1" style=" width: 0%;"> 
                                        <%--  <label><spring:message code="bill.id.label" /></label> --%>
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="billId" value="true" ${wareHouseDetails.billId=='true'?'checked':''}> <spring:message code="custom.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="billId" value="false" ${wareHouseDetails.billId=='false'?'checked':''}> <spring:message code="default.label"/>
                                                </label>
                                            </div>
                                        </td>
                                        </tr>
                                        </tbody>
                                      
                                      </table>
                                   </div>
                                   
                                   <br>
                                   <div class="row seven-cols" style="padding-left:15px;">
                                                                <table class="table" style="margin-bottom: 0px; width:23.9%">
											    <thead style="background-color: #ececec !important; color: #ffffff ">
											      <tr>
											      <th> <label ><spring:message code="masterflag.label" /></label></th>
											      <th><label><spring:message code="testStore.label" /></label></th>
											      <th><label><spring:message code="hybrid.mode.label" /></label></th>
											       <!--  added by vasudev -->
											       <th><label><spring:message code="dayOpenMandatory.label" /></label></th>
											      </tr>
											      </thead>
											      
											      <tbody>
											      <tr>
											      
                                      <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 8.2%;"> 
                                        <%--  <label ><spring:message code="masterflag.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="masterflag" value="true" ${wareHouseDetails.masterFlag=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="masterflag" value="false" ${wareHouseDetails.masterFlag=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      
                                      
                                      
                                        <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width:7.2%;"> 
                                         <%-- <label><spring:message code="testStore.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="teststore" value="true" ${wareHouseDetails.testStore=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="teststore" value="false" ${wareHouseDetails.testStore=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      
                                      <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 8.3%;"> 
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="hybrid_mode" value="true" ${wareHouseDetails.hybrid_mode=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="hybrid_mode" value="false" ${wareHouseDetails.hybrid_mode=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      
                                      
                                      <td class="form-group col-lg-1 col-md-1 col-sm-1" > 
                                        
    								<%-- Added by vasudeva Reddy --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="dayOpenMandatory" value="true" ${wareHouseDetails.dayOpenMandatory=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="dayOpenMandatory" value="false" ${wareHouseDetails.dayOpenMandatory=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      
                                          <%-- <div class="form-group col-lg-1 col-md-1 col-sm-1" style="width:14%;border-right: 2px solid #ccc;"> 
                                        <label><spring:message code="dayOpenSynsc.label" /></label>
                                            <div class="row">
                                                 <div class="form-group col-lg-10 ">
                                            <select class="form-control" id="dayStartSync" >
                                            
                                            	<option value="true" ${'true' == wareHouseDetails.remoteMonitoring ? 'selected' : ''} >Yes</option>
		                                  		<option value="false" ${'false' == wareHouseDetails.remoteMonitoring ? 'selected' : ''} >No</option>
                                            <option value="true" ${wareHouseDetails.dayStartSync==true?'selected':''}> <spring:message code="yes.label"/></option>
		                                  	  <option value="false" ${wareHouseDetails.dayStartSync==false?'selected':''}> <spring:message code="no.label"/></option>
		                                  		  	</select>
                                            
                                        </div>
                                        </div>   
                                      
                                      </div> --%>
                                         </tr>
                                         </tbody>
                                         </table>
                                         
                                      </div>
                                   
                                   
                                   
                               <br>
                               
                                             <div class="row">
									   <div class="form-group col-lg-12" style="margin-top: 10px;margin-bottom: -17px;">
                                         	 <label style="font-weight:bold;" class="labelheading"><spring:message code="discount.options.label" /> </label>
                                         	 <hr style="margin-top: 1px;">
                                         </div>
                                      </div>
                                       <div class="row seven-cols" style="padding-left:15px;">
                                       <table class="table" style="margin-bottom: 0px; width:70%">
											    <thead style="background-color: #ececec !important; color: #ffffff ">
											      <tr>
											      <th> <label><spring:message code="manual.discounts.label" /></label></th>
											      <th> <label><spring:message code="discount.options.label" /></label></th>
											       <th> <label><spring:message code="discount.taxation.label" /></label></th>
											      <th>  <label><spring:message code="employee.discounts.label" /></label></th>
											      <th>    <label><spring:message code="campaign.pref.label" /></label></th>
											      
                                       </tr>
                                       </thead>
                                      <tbody>
                                      <tr>
                                       
                                        <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 13.3%;"> 
                                         <%-- <label><spring:message code="manual.discounts.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="manualDiscounts" value="true" ${wareHouseDetails.manualDiscounts=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="manualDiscounts" value="false" ${wareHouseDetails.manualDiscounts=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      
                                      <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 12.9%"> 
                                        <%--  <label><spring:message code="discount.taxation.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="discountCalculatedOn" value="Original Price" ${wareHouseDetails.discountCalculatedOn=='Original Price'?'checked':''}> <spring:message code="original.price.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="discountCalculatedOn" value="Discounted Price" ${wareHouseDetails.discountCalculatedOn=='Discounted Price'?'checked':''}><spring:message code="discountedprice.label"/></label>
                                         </div>
                                      </td>
                                      
                                      <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 13.3%"> 
                                        <%--  <label><spring:message code="discount.taxation.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="discountTaxation" value="Inclusive" ${wareHouseDetails.discountTaxation=='Inclusive'?'checked':''}> <spring:message code="procurement.shipmentCost.inclusive"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="discountTaxation" value="Exclusive" ${wareHouseDetails.discountTaxation=='Exclusive'?'checked':''}><spring:message code="procurement.shipmentCost.exclusive"/></label>
                                         </div>
                                      </td>
                                      
                                      <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 14.8%"> 
                                         <%-- <label><spring:message code="employee.discounts.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="employeeDiscounts" value="true" ${wareHouseDetails.employeeDiscounts=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="employeeDiscounts" value="false" ${wareHouseDetails.employeeDiscounts=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                       <td class="form-group col-lg-1 col-md-1 col-sm-1" style=""> 
                                         <%-- <label><spring:message code="campaign.pref.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="latestCampaigns" value="true" ${wareHouseDetails.latestCampaigns=='true'?'checked':''}> <spring:message code="latest.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="latestCampaigns" value="false" ${wareHouseDetails.latestCampaigns=='false'?'checked':''}><spring:message code="recent.label"/></label>
                                         </div>
                                      </td>
                                      </tr>
                                      </tbody>
                                      </table>
                                      </div>
                                        <br>
                                
                                          
                                       <div class="row">
									   <div class="form-group col-lg-12" style="margin-top: 10px; margin-bottom: -17px;">
                                         	 <label style="font-weight:bold;" class="labelheading"><spring:message code="business.options.label" /> </label>
                                         	 <hr style="margin-top: 1px;">
                                         </div>
                                      </div>
                                       <div class="row seven-cols" style="padding-left:15px;">
                                        <table class="table" style="margin-bottom: 0px; width:40%">
											    <thead style="background-color: #ececec !important; color: #ffffff ">
											      <tr>
												     
												      <th><label><spring:message code="rounding.recquired.label" /></label></th>
												      <th> <label><spring:message code="Products.menu.label" /></label></th>
												      <th style="width:12.1%"> <label>Zero Stock Billing</label></th>
											      </tr>
											      </thead>
											   
                                        
                                       <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc; width:6.3%;"> 
                                        
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="roundingRequired" value="true" ${wareHouseDetails.roundingRequired=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="roundingRequired" value="false" ${wareHouseDetails.roundingRequired=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc; width:6.3%;"> 
                                          
                                         <div class="radio">
                                           <label><input type="radio" name="productsMenu" value="true" ${wareHouseDetails.productsMenu=='true'?'checked':''}><spring:message code="yes.label" /></label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="productsMenu" value="false" ${wareHouseDetails.productsMenu=='false'?'checked':''}><spring:message code="no.label" /></label>
                                         </div>
                                      </td>
                                      <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc; width:6.3%;"> 
 
                                         <div class="radio">
                                           <label><input type="radio" name="zeroStock" value="true" ${wareHouseDetails.zeroStock=='true'?'checked':''}><spring:message code="yes.label" /></label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="zeroStock" value="false" ${wareHouseDetails.zeroStock=='false'?'checked':''}><spring:message code="no.label" /></label>
                                         </div>
                                      </td>
                                         </table>
                                      </div>
                                        <br>
                                        
                                        
                                      
                                      <!--new flags  -->
                                        
                                        
                                        <br>
                                    <div class="row">
									   <div class="form-group col-lg-12" style="margin-top: 10px; margin-bottom: 0px;margin-bottom: -17px;">
                                         	 <label style="font-weight:bold;" class="labelheading"><spring:message code="billing.options.label" /> </label>
                                         	 <hr style="margin-top: 1px;">
                                         </div>
                                      </div>
                                    <div class="row seven-cols" style="padding-left:15px;">
                                
                                 <table class="table" style="margin-bottom: 0px; width:99%">
											    <thead style="background-color: #ececec !important; color: #ffffff ">
											      <tr>
												      <th> <label><spring:message code="printing.label" /></label></th>
												      <th> <label><spring:message code="doordeliveryorders.label" /></label></th>
										              <th> <label><spring:message code="requiredcustomer.number.label" /></label></th>
												      <th><label><spring:message code="foodcoupons.label" /></label></th>
												      <th><label><spring:message code="remotebilling.label" /></label></th>
												      <th  style="width: 14%;"><label><spring:message code="returns.label" /></label></th>
												      <th><label><spring:message code="credit.note.label" /></label></th>
												       <th><label><spring:message code="creditnote.expirydays.label" /></label></th>
												      
												      <th style="width: 14%;"><label><spring:message code="exchanges.label" /></label></th>
												      <th> <label><spring:message code="exchangemode.label" /></label></th>
												    
											      </tr>
											      </thead>
											    
                                
                                      <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc; width:6.3%;"> 
                                         <%-- <label><spring:message code="printing.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="printing" value="true" ${wareHouseDetails.printing=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="printing" value="false" ${wareHouseDetails.printing=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                   	<td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc; width:9.17%;"> 
                                       <%--   <label><spring:message code="doordeliveryorders.label" /></label> --%>
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="doorDelivery" value="true" ${wareHouseDetails.doorDelivery=='true'?'checked':''} > <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="doorDelivery" value="false"  ${wareHouseDetails.doorDelivery=='false'?'checked':''} > <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                        </td>
                                        
                                           <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc; width:9.17%;"> 
                                       <%--   <label><spring:message code="doordeliveryorders.label" /></label> --%>
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="customerNo" value="true" ${wareHouseDetails.requiredCustomerNumber=='true'?'checked':''}> <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="customerNo" value="false" ${wareHouseDetails.requiredCustomerNumber=='false'?'checked':''}> <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                        </td>
                                        
                                           <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc; width:9.5%;"> 
                                         <%-- <label><spring:message code="foodcoupons.label" /></label> --%>
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="foodCoupons" value="true" ${wareHouseDetails.foodCoupons=='true'?'checked':''}> <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="foodCoupons" value="false" ${wareHouseDetails.foodCoupons=='false'?'checked':''}> <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                        </td>
                                    <td class="form-group col-lg-1 col-md-1 col-sm-1" style="width:9.69%;border-right: 2px solid #ccc;">
                                     <%--  <label><spring:message code="remotebilling.label" /></label> --%>
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="remoteBilling" value="true" ${wareHouseDetails.remoteBilling=='true'?'checked':''}> <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="remoteBilling" value="false" ${wareHouseDetails.remoteBilling=='false'?'checked':''}> <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                     </td>
                                    <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 13.9%">
                                      <%-- <label><spring:message code="returns.label" /></label> --%>
                                           <div class="form-group col-lg-1 col-md-1 col-sm-1" style="">
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="returns" value="true" ${wareHouseDetails.returns=='true'?'checked':''}> <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="returns" value="false" ${wareHouseDetails.returns=='false'?'checked':''}> <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                          </div>  
                                            <div class="form-group col-lg-7 col-md-5 col-sm-5" style="padding-left:0px;margin-left:32px">   
                                             <select class="form-control" id="returnDays" style="margin-top: 5px;padding:0px" >
<!--                                            <option>Days</option> -->
		                                  	<c:forEach begin="0" end="100" varStatus="loop">
		                                  		 <option value="${loop.index}" ${loop.index == wareHouseDetails.returnAllowDays ? 'selected' : ''}>${loop.index}</option>
											</c:forEach>
		                                    </select>
                                           </div>
                                     </td>
                                      <td class="form-group col-lg-1 col-md-1 col-sm-1" style=" width:8.50%;border-right: 2px solid #ccc;"> 
                                      <%--    <label><spring:message code="credit.note.label" /></label> --%>
                                          <div class="radio">
                                           <label>
                                             <input type="radio" name="returnMode" value="cash" ${wareHouseDetails.returnMode=='cash'?'checked':''}><spring:message code="cash.label" />                                          
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="returnMode" value="creditNote" ${wareHouseDetails.returnMode=='creditNote'?'checked':''}><spring:message code="creditnote.label" /></label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="returnMode" value="both" ${wareHouseDetails.returnMode=='both'?'checked':''}><spring:message code="both.label" /></label>
                                         </div>
                                      </td>
                                      
                                      <td style=" width:13.9%; border-right: 2px solid #ccc;"> 
<!--                                        <div class="form-group col-lg-1 col-md-1 col-sm-1"style="border-right: 2px solid #ccc; width:15.00%;">  -->
                                         <label><spring:message code="bill_cancel_reason.label" /></label>
                                       
                                       
                                           <select class="form-control" id="expiryDays" style="margin-top: 5px;" >
		                                  	<c:forEach begin="0" end="30" varStatus="loop">
		                                  		 <option value="${loop.index}" ${loop.index == wareHouseDetails.creditNoteExpiryDays ? 'selected' : ''}>${loop.index}</option>
											</c:forEach>
		                                    </select>
                                        </td>
                                        
                                      <td class="form-group col-lg-1 col-md-1 col-sm-1" style=" width:13.9%; border-right: 2px solid #ccc;"> 
                                       <%--   <label><spring:message code="exchanges.label" /></label> --%>
                                         <div class="form-group col-lg-1 col-md-1 col-sm-1" style=" ">
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="exchanges" value="true" ${wareHouseDetails.exchange=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="exchanges" value="false" ${wareHouseDetails.exchange=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                          </div>
                                         
                                           <div class="form-group col-lg-7 col-md-7 col-sm-7" style="padding-left:0px;margin-left:32px">   
                                             <select class="form-control" id="exchangeDays" style="margin-top: 5px;padding:0px" >
                                           
		                                  	<c:forEach begin="0" end="100" varStatus="loop">
		                                  		 <option value="${loop.index}" ${loop.index == wareHouseDetails.exchangeAllowDays ? 'selected' : ''}>${loop.index}</option>
											</c:forEach>
		                                    </select>
                                           </div> 
                                         
                                      </td>
                                     
                                       <td > 
                                       <%--   <label><spring:message code="exchangemode.label" /></label> --%>
                                          <div class="radio">
                                           <label>
                                             <input type="radio" name="exchangeMode" value="cash" ${wareHouseDetails.exchangeMode=='cash'?'checked':''}><spring:message code="cash.label" />                                          
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="exchangeMode" value="creditNote" ${wareHouseDetails.exchangeMode=='creditNote'?'checked':''}><spring:message code="creditnote.label" /></label>
                                         </div>
                                          <div class="radio">
                                           <label><input type="radio" name="exchangeMode" value="both" ${wareHouseDetails.exchangeMode=='both'?'checked':''}><spring:message code="both.label" /></label>
                                         </div>
                                      </td>
                                       
                                      
                                        </table>
                                      </div>
                                      
                                      <br>
                                     <!--added by manasa  -->
                                      
                                       <div class="row seven-cols" style="padding-left:15px;">
                                 <table class="table" style="margin-bottom: 0px; width:62%">
											    <thead style="background-color: #ececec !important; color: #ffffff ">
											      <tr>
											        <th><label><spring:message code="salesperson.label" /></label></th>
												      <th> <label><spring:message code="barcodetype.label" /></label></th>
											      <th> <label ><spring:message code="enforce_denominations.label" /></label></th>
											      <th><label><spring:message code="enforce_void_items_reason.label" /></label></th>
											      <th><label><spring:message code="bill_cancel_reason.label" /></label></th>
											     <th><label>Bill Cancel Allowed Days</label></th>
											      <th><label><spring:message code="edit.price.label" /></label></th>
											      <th> <label><spring:message code="card.info.lable" /></label></th>
											      <th> <label><spring:message code="offline.duplicate.bill.label" /></label></th>
											      </tr>
											      </thead>
											   
											         <tbody>
											     <tr>
											     
											     <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc; width:10.2%;"> 
                                         <%-- <label><spring:message code="salesperson.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="employeeSaleId" value="true" ${wareHouseDetails.employeeSaleId=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="employeeSaleId" value="false" ${wareHouseDetails.employeeSaleId=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                       <td class="form-group col-lg-1 col-md-1 col-sm-1" style=" width:13.9%; border-right: 2px solid #ccc;"> 
                                        <%--  <label><spring:message code="barcodetype.label" /></label> --%>
                                          <div class="radio">
                                           <label>
                                             <input type="radio" name="barcodeType" value="skuId" ${wareHouseDetails.barcodeType=='skuId'?'checked':''}><spring:message code="skuid.label" />                                          
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="barcodeType" value="Ean" ${wareHouseDetails.barcodeType=='Ean'?'checked':''}><spring:message code="ean.label" /></label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="barcodeType" value="both" ${wareHouseDetails.barcodeType=='both'?'checked':''}><spring:message code="both.label" /></label>
                                         </div>
                                      </td>
                                      
											     <td style=" width:13.9%; border-right: 2px solid #ccc;"> 
											     
                                        <%--  <label><spring:message code="enforce_denominations.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="enforcedenominations" value="true" ${wareHouseDetails.enforceDenominations=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="enforcedenominations" value="false" ${wareHouseDetails.enforceDenominations=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      
                                      <td style=" width:13.9%; border-right: 2px solid #ccc;"> 
                                      
<!--                                         <div class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc; width:11.8%">  -->
                                       <%--   <label><spring:message code="enforce_void_items_reason.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="enforcevoiditems" value="true" ${wareHouseDetails.enforceVoidItemsReason=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="enforcevoiditems" value="false" ${wareHouseDetails.enforceVoidItemsReason=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      
                                      <td style=" width:13.9%; border-right: 2px solid #ccc;"> 
<!--                                         <div class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc; width:11.6%;">  -->
                                        <%--  <label><spring:message code="bill_cancel_reason.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="billcancel" value="true" ${wareHouseDetails.enforceBillCancelReason=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="billcancel" value="false" ${wareHouseDetails.enforceBillCancelReason=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      <td style=" width:13.9%; border-right: 2px solid #ccc;"> 
<!--                                        <div class="form-group col-lg-1 col-md-1 col-sm-1"style="border-right: 2px solid #ccc; width:15.00%;">  -->
                                        <%--  <label><spring:message code="bill_cancel_reason.label" /></label> --%>
                                       
                                        <div class="row">
                                                 <div class="form-group col-lg-9">
                                           <select class="form-control" id="cancelDays" style="margin-top: 5px;" >
		                                  	<c:forEach begin="0" end="30" varStatus="loop">
		                                  		 <option value="${loop.index}" ${loop.index == wareHouseDetails.cancelAllowDays ? 'selected' : ''}>${loop.index}</option>
											</c:forEach>
		                                    </select>
                                        </div>
                                            </div>
                                         <%-- <div class=" col-lg-9 col-md-7 col-sm-7" style="">   
                                             <select class="form-control" id="cancelDays" style="margin-top: 5px;" >
                                           
		                                  	<c:forEach begin="0" end="30" varStatus="loop">
		                                  		 <option value="${loop.index}" ${loop.index == wareHouseDetails.cancelAllowDays ? 'selected' : ''}>${loop.index}</option>
											</c:forEach>
		                                    </select>
                                           </div>  --%>
                                      </td>
                                      
                                      
                                      
                                      <td style=" width:13.9%; border-right: 2px solid #ccc;"> 
<!--                                        <div class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc; width:6.93%;">  -->
                                         <%-- <label><spring:message code="edit.price.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="editprice" value="true" ${wareHouseDetails.editPrice=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="editprice" value="false" ${wareHouseDetails.editPrice=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      <td style=" width:13.9%; border-right: 2px solid #ccc;"> 
<!--                                         <div class="form-group col-lg-1 col-md-1 col-sm-1" style="">  -->
                                         <%-- <label><spring:message code="card.info.lable" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="cardinfo" value="true"  ${wareHouseDetails.cardInfo=='true'?'checked':''} > <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="cardinfo" value="false"  ${wareHouseDetails.cardInfo=='false'?'checked':''} ><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      
                                      <td style=" width:13.9%; border-right: 2px solid #ccc;">                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="offlineDuplicateBill" value="true" ${wareHouseDetails.offlineDuplicateBill=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="offlineDuplicateBill" value="false" ${wareHouseDetails.offlineDuplicateBill=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      
                                     

                                      
                                      
                             </tr> 
                             </tbody>     
                             </table> 
                             <br>
                             
                              <div class="row seven-cols" style="padding-left:15px;">
                                 <table class="table" style="margin-bottom: 0px; width:24%">
											    <thead style="background-color: #ececec !important; color: #ffffff ">
											    <tr>
											    
											 <th> <label><spring:message code="counter.otp.label" /></label></th>
											 <th> <label>Draft Bill Allow Days</label></th>
											    <th> <label>Return Bill Ref</label></th>
											   <!--  <th> <label>Stock Sale Allow Days</label></th> -->
											    <th> <label>Sales FTP</label></th>
											     <th> <label>FTP Server</label></th>
											      <th> <label>User ID Credentials</label></th>
											    </tr>
											  
											    </thead>
											    <tbody>
											    <tr>
											    
											    <td  style=" border-right: 2px solid #ccc;">                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="counterOTP" value="true" ${wareHouseDetails.counterOTP=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="counterOTP" value="false" ${wareHouseDetails.counterOTP=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      
                               
                               
                               <td style=" width:13.9%; border-right: 2px solid #ccc;">                                        <%--  <label><spring:message code="bill_cancel_reason.label" /></label> --%>
                                        <div class="row">
                                                 <div class="form-group col-lg-10 ">
                                           <select class="form-control" id="draftAllowDays" style="margin-top: 5px;" >
		                                  	<c:forEach begin="0" end="30" varStatus="loop">
		                                  		 <option value="${loop.index}" ${loop.index == wareHouseDetails.draftAllowDays ? 'selected' : ''}>${loop.index}</option>
											</c:forEach>
		                                    </select>
                                        </div>
                                            </div>
                                      </td>
											    
											     <td  style=" border-right: 2px solid #ccc;">                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="returnBillRefRequired" value="true" ${wareHouseDetails.returnBillRefRequired=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="returnBillRefRequired" value="false" ${wareHouseDetails.returnBillRefRequired=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      
                                     <%--   <td style=" width:13.9%; border-right: 2px solid #ccc;">                                         <label><spring:message code="bill_cancel_reason.label" /></label>
                                        <div class="row">
                                                 <div class="form-group col-lg-10 ">
                                           <select class="form-control" id="stockSaleAllowDays" style="margin-top: 5px;" >
		                                  	<c:forEach begin="0" end="30" varStatus="loop">
		                                  		 <option value="${loop.index}" ${loop.index == wareHouseDetails.stockSaleAllowDays ? 'selected' : ''}>${loop.index}</option>
											</c:forEach>
		                                    </select>
                                        </div>
                                            </div>
                                      </td> --%>
                                      <!--Sales FTP  -->
                                       <td style=" width:13.9%; border-right: 2px solid #ccc;">                                        
                                       <div class="radio">
                                           <label>
                                             <input type="radio" name="salesFTP" value="true" ${wareHouseDetails.ftpUploadRequired=='true'?'checked':''}> <spring:message code="yes.label" />
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="salesFTP" value="false" ${wareHouseDetails.ftpUploadRequired=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      <td style=" width:13.9%; border-right: 2px solid #ccc;">                                        
                                        <div class="radio">
                                           <label>
                                             <input type="text" name="ftpIp" id="ftpIp" value="${wareHouseDetails.ftpServer}" placeholder="IP Address" 
                                                 style="padding-left: 5px;width: 135px;"/>
                                           </label>
                                         </div>
                                          <div class="radio">
                                           <label>
                                             <input type="text" name="ftpPort" id="ftpPort" value="${wareHouseDetails.ftpPort}" placeholder="Port" 
                                                 style="padding-left: 5px;width: 70px;"/>
                                           </label>
                                         </div>
                                      </td>
                                       <td style=" width:13.9%; border-right: 2px solid #ccc;">                                        
                                        <div class="radio">
                                           <label>
                                             <input type="text" name="ftpUserId" id="ftpUserId" value="${wareHouseDetails.userId}" placeholder="User ID" 
                                                 style="padding-left: 5px;width: 150px;"/>
                                           </label>
                                         </div>
                                          <div class="radio">
                                           <label>
                                             <input type="text" name="ftpPasword" id="ftpPasword" value="${wareHouseDetails.password}" placeholder="Password" 
                                                 style="padding-left: 5px;width: 140px;"/>
                                           </label>
                                         </div>
                                      </td>
                                      
                                      
                                      
											    </tr>
											    </tbody>
											    </table>
											    </div>
											    
											    
											    
					
											    
											    
										
 <div class="row seven-cols" style="padding-left:15px;">
                                 <table class="table" style="margin-bottom: 0px; width:24%">
											    <thead style="background-color: #ececec !important; color: #ffffff ">
											      <tr>
		                           <th> <label><spring:message code="creditNote.Multiple.Claims.label" /></label></th>
									 <th> <label>Bill OTP</label></th>		     
											      </tr>
											      </thead>
											      
											      <tbody>
											      <tr>
                                    <td style=" width:13.9%; border-right: 2px solid #ccc;">                                        
                                   <div class="radio">
                                          <label>
                                             <input type="radio" name="creditNoteMultipleClaims" value="true" ${wareHouseDetails.creditNoteMultipleClaims=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                          <div class="radio">
                                           <label><input type="radio" name="creditNoteMultipleClaims" value="false" ${wareHouseDetails.creditNoteMultipleClaims=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>   
                                         
								
                                     <td style=" width:13.9%; border-right: 2px solid #ccc;">                                         
                                   <div class="radio">
                                           <label>
                                             <input type="radio" name="billOtp" value="true" ${wareHouseDetails.billOtp=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="billOtp" value="false" ${wareHouseDetails.billOtp=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>   
											      </tr>
                                         
											      </tbody>
								      </table>  
											        </div>	
											    
											    
											
							</div>
                                     
                                      
                            <!--/..added by manasa  -->       
                                   
                                
                                   
                                   
                                  <%--  
                                        <div class="row">
									   <div class="form-group col-lg-12" style="margin-top: 10px; margin-bottom: 0px;">
                                         	 <label style="font-weight:bold;"><spring:message code="facility.options.label" /> </label>
                                         	 <hr style="margin-top: 1px;">
                                         </div>
                                      </div>
                                        <div class="row" >
									   <div class="col-lg-12" id="data">
                                          <table id="buildingtable" class="table table-bordered table-hover">
                                            <thead style="background-color: #3c8dbc; color: #ffffff">
                                             <tr>
                                            	<th><spring:message code="building.name.label"/></th>
                                                <th><spring:message code="businessCategory.label"/></th>
                                                <th><spring:message code="no.of.levels.label"/></th>
                                                <th><spring:message code="order.remarks.label"/></th>
                                                <th><spring:message code="EmployeeForm.action"/></th>
                                             </tr>
                                            </thead>
                                            <tbody style="text-align: center;">
                                            	<c:forEach var="facility" items="${wareHouseDetails.facilitiesInfo}" varStatus="theCount">
                                            		<tr id='dynamicdiv${theCount.count}' style='margin-top:5px;'>
                                            		<td id='buildingName${theCount.count}'>${facility.buildingName}</td>
													<td id='facilityCategory${theCount.count}'>${facility.businessCategory}</td>
													<td id='noOfLevels${theCount.count}'>${facility.levels}</td>
													<td><textarea id='remarks${theCount.count}' readonly="readonly" rows=1 style='resize:none;width: 300px;'>${facility.remarks}</textarea></td>
													<!-- <td id='Del"+ len +"' ><img id='Img"+ len +"' src='"+contextPath+"/images/itemdelete.png' style='width:25px;cursor:pointer;' onclick='deleteItem(this);' title='Delete'/></td> -->
													</tr>
                                            	</c:forEach>
                                            </tbody>
                                          </table>
                                       </div>
                                    </div> --%>
                                            
                                       	
                                       	 <input type="hidden" id="type" value="${type}">
                                    </div><!-- /.box-body -->
									
						<div class="row" style="text-align: right;">
						 <c:if test="${sessionScope.role == 'super admin'}">
							<input type="button" id="submit" class="btnCls" style="margin-right: 25px"  onclick="validateWareHousePOS('edit');" value='&nbsp;&nbsp;&nbsp;<spring:message code="update.label" />&nbsp;&nbsp;&nbsp;' />
						</c:if>
						 <c:forEach var="accessControl" items="${sessionScope.outletManagement}">
	                       <c:if test="${accessControl.appDocument == 'Configuration' && accessControl.write == true}"> 
						 	<input type="button" id="submit"   class="btnCls" style="margin-right: 2%;"  onclick="validateWareHousePOS('edit');" value='&nbsp;&nbsp;&nbsp;<spring:message code="update.label" />&nbsp;&nbsp;&nbsp;' />
						   </c:if>
						</c:forEach>
						 <!-- <input type="submit" class="btn bg-olive btn-inline" style="margin-left:5%;" onclick="" value="Reset" /> -->
						<input type="button" class="btnCls" style="margin-right: 2%;" onclick="getWareHousespos('${id}','0');" value="<spring:message code="cancel.label" />" />
						</div>
					
				
									<br/>
                                    <div class="box-footer">
                                    
                                    </div>
                                 
                                     
                                </form>
                               
                            </div>

</div>
</div>
</section><!-- /.content -->
 <script>
  //Timepicker
/*   $(".timepicker").timepicker({
      showInputs: false
  });
 */
  </script>
</body>
</html>