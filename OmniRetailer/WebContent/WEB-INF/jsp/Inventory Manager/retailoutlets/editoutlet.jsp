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
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/outlet.js"></script>
	<%-- <script src="${pageContext.request.contextPath}/js/demo-compiled.js"></script> --%>
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
.labelheading{
    background: #ccc;
    padding: 2px 15px 2px 15px;
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
	//callCalender('startDate');
	focusDiv('Error');
/* 	focusDiv('Success'); */
	callCalender('createddate')
	callCalender('updatedddate')
	
	/* var dateTime = getCurrentDate();
	  var date = dateTime.split(' ');
	  date = date[0].split('/');
	  var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
	//  $('#date').val(formatedDate);
	 $('#createddate').val(formatedDate); */
	 // $('#updatedddate').val(formatedDate);
	 
	/* var dateTime = getCurrentDate();
	  var date = dateTime.split(' ');
	  date = date[0].split('/');
	  var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
	//  $('#date').val(formatedDate);
	  $('#createddate').val(formatedDate);
	  $('#updatedddate').val(formatedDate);
	 */
//	displayTablesForView();
 var phoneNo = $("#phone").val();
	phoneNo = phoneNo.split('-');
	if(phoneNo.length == 1)
		$("#phoneNumber").val(phoneNo[0]);
	else{
		/* $("#defaultCountry").val(phoneNo[0]); */
		$("#phoneNumber").val(phoneNo[1]);
	} 
	
	$("#phoneNumber").keydown(function(){
		   $("#phoneNumberError").html("");
		   $("#Error").html("");
	 });
	
	
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
                               <h3><spring:message code="edit.store.label" /></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form method="POST">
                                   <div class="box-body">
                                     <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${err}</div>
	        						 <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
                                       
                                       <div class="row" style="text-align: right;">
						              <input type="button" id="submit" class="btnCls" style="margin-right:25px" onclick="validateOutlet('edit');" value="&nbsp;&nbsp;<spring:message code="submit.label" />&nbsp;&nbsp;" />
						             <!-- <input type="submit" class="btn bg-olive btn-inline" style="margin-left:5%;" onclick="" value="Reset" /> -->
						             <input type="button" class="btnCls "  style="margin-right:2%" onclick="viewConfigurations('outletConfigurations','0');" value="<spring:message code="cancel.label" />" />
						            </div>
                                       
                                        <c:forEach var="outletDetails" items="${storeDetailsList}">
									<div class="row">
									 <input type="hidden" name="storeCode" id="storeCode" value="${outletDetails.storeCode}"/>
									 <%--  <div class="form-group col-lg-4">
									    <input type="hidden" name="storeCode" value="${outletDetails.storeCode}"/>
									  </div> --%>
									  <div class="form-group col-lg-3">
									     <label><spring:message code="location.label" /></label>
                                         <input type="text" readonly="readonly" class="form-control" name="location" id="workLocation" value="${outletDetails.locationId}" />
									  </div>
									   
									   <div class="form-group col-lg-5">
									  <label><spring:message code="organisation.name.label" /></label>
									   <input type="text"  value="${outletDetails.companyName}" class="form-control"  name="organizationName" id="organizationName" placeholder="<spring:message code="enter.organization.name" />" />
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
                        		<div class=" col-lg-7 col-sm-5 col-xs-5" style="margin-left: 69px;height:20px">
                                    <div class="" title="Signature Image" id="signature_image" style="text-align: center;width:150px;height:60px;">
            <%-- <img class="thumbnail companyimage" id="dealBanner_thumbnail" alt="No Image" src="data:image/jpeg;base64,${denominationMasterResponse.denominationImage}" style=""/> --%>
                                      <img class="thumbnail companyimage" id="dealBanner_thumbnail" alt="No Image" src="${outletDetails.signature}">
									  <label class="myFile" id="logo1_label"></label>
								   </div>
                                 </div>        
                        		        </div>
								   </div>
									   
									   
									</div>
										<div style="background: #eee; padding-left: 15px; padding-right: 15px; padding-top: 10px;">
											<div class="row">
									    <div class="form-group col-lg-4 allignment">
                                            <label><spring:message code="storename.label" /> <span class="requiredField">*</span></label>
                                            <input type="text" class="form-control" value="${outletDetails.storeName}" name="storeName" id="storename" placeholder="<spring:message code="enter.storename.label" />" />
                                            <span id="storeError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                         <div class="form-group col-lg-4 allignment">
                                            <label><spring:message code="street.label.outlet" /> <span class="requiredField">*</span></label>
                                            <input type="text" onblur="criteriaSlashes(this)" class="form-control" value="${outletDetails.street}" name="storeName" id="street" placeholder="" />
                                            <span id="storeError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                         <div class="form-group col-lg-4 allignment">
                                            <label><spring:message code="locality.label" /> <span class="requiredField">*</span></label>
                                            <input type="text" class="form-control" value="${outletDetails.locality}" name="storeName" id="locality" placeholder="" />
                                            <span id="storeError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        
                                         <div class="form-group col-lg-4 allignment">
                                            <label><spring:message code="gps.longitude.label" /> <span class="requiredField">*</span></label>
                                            <input type="text" class="form-control" value="${outletDetails.gpsLongitude}" name="gpsLongitude" id="gpsLongitude" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"  placeholder="<spring:message code="enter.storelocation.label" />" />
                                            <span id="gpsLongitudeError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        
                                        <div class="form-group col-lg-4 allignment">
                                            <label><spring:message code="gps.latitude.label" /> <span class="requiredField">*</span></label>
                                             <input type="text" class="form-control" name="gpsLatitude" value="${outletDetails.gpsLatitude}" id="gpsLatitude" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="" />
				                            <span id="gpsLatitudeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                        
                                    </div>
                                    <div class="row">
									   
                                         <div class="form-group col-lg-4 allignment">
                                            <label><spring:message code="category.label" /></label>
                                            <select class="form-control" id="category" >
		                                  		<option value="Hotel" ${'Hotel' == outletDetails.category ? 'selected' : ''} >Hotel</option>
		                                  		<option value="Restaurant" ${'Restaurant' == outletDetails.category ? 'selected' : ''} >Restaurant</option>
		                                  		<option value="FMCG" ${'FMCG' == outletDetails.category ? 'selected' : ''} >FMCG</option>
		                                  		<option value="Apparel" ${'Apparel' == outletDetails.category ? 'selected' : ''} >Apparel</option>
		                                  		<option value="Hospitality" ${'"Hospitality"' == outletDetails.category ? 'selected' : ''} >Hospitality</option>
		                                  		<option value="Sports" ${'Sports' == outletDetails.category ? 'selected' : ''} >Sports</option>
		                                  	    <option value="Body Care" ${'Body Care' == outletDetails.category ? 'selected' : ''} >Body Care</option>
		                                  		<option value="Health" ${'Health' == outletDetails.category ? 'selected' : ''} >Health</option>
		                                  		<option value="White Goods" ${'White Goods' == outletDetails.category ? 'selected' : ''} >White Goods</option>
		                                  	
		                                  	</select>
                                            <span id="categoryError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        <div class="form-group col-lg-4 allignment">
                                            <label><spring:message code="secured.label" /></label>
                                             <div style="width:60%">
                                            <select class="form-control" id="secured" >
		                                  		<option value="true" ${'true' == outletDetails.secured ? 'selected' : ''} >Yes</option>
		                                  		<option value="false" ${'false' == outletDetails.secured ? 'selected' : ''} >No</option>
		                                  			</select></div>
                                            <span id="categoryError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                         <div class="form-group col-lg-4 allignment">
                                         <label><spring:message code="pheriphary.label" /></label>
                                         <div style="width:60%">
                                            <select class="form-control" id="periphery" >
		                                  		<option value="5" ${'5' == outletDetails.periphery ? 'selected' : ''} >5 m</option>
		                                  		<option value="10" ${'10' == outletDetails.periphery ? 'selected' : ''} >10m</option>
		                                  		<option value="20" ${'20' == outletDetails.periphery ? 'selected' : ''} >20m</option>
		                                  		<option value="50" ${'50' == outletDetails.periphery ? 'selected' : ''} >50m</option>
		                                  		<option value="100" ${'100' == outletDetails.periphery ? 'selected' : ''} >100m</option>
		                                  		  	</select></div>
                                            
                                            <span id="categoryError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        
                                        <div class="form-group col-lg-4 allignment">
                                            <label><spring:message code="email.label" /> <span class="requiredField">*</span></label>
                                             <input type="text" class="form-control" name="email" value="${outletDetails.email}" id="emailIDinOutlet"  />
				                            <span id="gpsLatitudeError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                         <div class="form-group col-lg-4 allignment">
                                            <label><spring:message code="remote.monitaring" /></label>
                                             <div style="width:60%">
                                            <select class="form-control" id="remoteMonitoring" >
		                                  		<option value="true" ${'true' == outletDetails.remoteMonitoring ? 'selected' : ''} >Yes</option>
		                                  		<option value="false" ${'false' == outletDetails.remoteMonitoring ? 'selected' : ''} >No</option>
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
				                                  		
				                                  		<option value="${fn:split(outletDetails.phone, '-')[0]}">${fn:split(outletDetails.phone, '-')[0]}</option>
				                                  		 <option value="${sessionScope.countryCode}" >${sessionScope.countryCode}</option>
				                                  	</select>
				                                  </div>
				                                  <div class="col-lg-7 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px">
				                                  	<input type="text" class="form-control" placeholder="<spring:message code="supplier.enter.phone.label" />" id="phoneNumber" size="15" maxlength="15" onBlur="validateMobileNumber()" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
				                                  </div>
				                                  <input type="hidden" class="form-control" name="phone" id="phone"  value="${outletDetails.phone}"/>
				                                   <input type="hidden" id="output" />
				                             </div>
				                            <!-- <span id="error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> -->
                               <span id="phoneNumberError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                            
                                            <%-- <input name="phone" type="tel" class="form-control number" pattern="[0-9]{11}" required id="phone" placeholder="<spring:message code="enter.phone.label" />"  />
                                            <span id="phoneError" style="text-align:right;color:red;font-weight:bold;"></span> --%>
                                        </div>
                                        
                                        <div class="form-group col-lg-4 allignment">
                                            <label>Alternate Number</label>
                                            <input type="text" name="fax" value="${outletDetails.fax}" class="form-control number" id="fax" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.fax.label" />" />
                                            <span id="faxError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                    <div class="form-group col-lg-4 allignment">
                                            <label><spring:message code="tollfree.label" /></label>
                                            <input type="number" name="tollFreeNum" value="${outletDetails.tollFreeNum}" class="form-control number" id="tollFreeNum" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="enter.tollfree.label" />" />
                                            <span id="tollFreeNumError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                      <div class="form-group col-lg-4 " style="width:10%;    padding-right: 5px;">
                                         <div class="bootstrap-timepicker">
                                            <label><spring:message code="start.time.label"/> <span class="requiredField">*</span></label>
                                             <div >
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="startTime" id="startTime" value="${outletDetails.startTime}" />
                                                <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
                                            </div><!-- /.input group --></div>
                                        </div><!-- /.form group -->
                                        <span id="startTimeError" style="text-align:right;color:red;font-weight:bold;"></span>
                                      </div>
                                             
                            <!-- time Picker -->
                                    
                                       <div class="form-group col-lg-4 " style="width:10%;    padding-left: 5px;">
                                        <div class="bootstrap-timepicker">
                                            <label><spring:message code="end.time.label"/> <span class="requiredField">*</span></label>
                                             <div >
                                            <div class="input-group">                                            
                                                <input type="text" name="endTime" class="form-control timepicker" id="endTime" value="${outletDetails.endTime}"/>
                                                <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
                                            </div><!-- /.input group --></div>
                                        </div><!-- /.form group -->
                                          <span id="endTimeError" style="text-align:right;color:red;font-weight:bold;"></span>
                                    </div>
                                     <div class="form-group col-lg-4 " style="width:15%">
                                         <label><spring:message code="minepayamount.label" /> <span class="requiredField">*</span></label>
                                         <input type="text" name="minPayAmount" value="${outletDetails.minPayAmount}" class="form-control" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" required id="amount" placeholder="<spring:message code="amount.label" />" />
                                         <span id="amountError" style="text-align:right;color:red;font-weight:bold;"></span>
                                     </div>
                               </div>
                                   <div class="row">
                                    <div class="form-group col-lg-4 allignment">
                                            <label style="white-space: nowrap;"><spring:message code="franchise.company.label" /></label>
                                            
                                            <select class="form-control" id="companyOwned" >
												 <option value="franchise" ${outletDetails.companyOwned == 'franchise' ? 'selected' : ''}>Franchise</option>
												 <option value="company" ${outletDetails.companyOwned == 'company' ? 'selected' : ''}>Company Owned</option>
		                                  		  <option value="b2c" ${outletDetails.companyOwned == 'b2c' ? 'selected' : ''}>B2C</option>
		                                  		  	</select>
                                        </div>
                                         <div class="form-group col-lg-4 allignment">
                                            <label><spring:message code="stockverification.type" /></label>
                                             <select class="form-control" id="stockVerificationType" >
												 <option value="Periodic" ${outletDetails.stockVerificationType == 'Periodic' ? 'selected' : ''}>Periodic</option>
												 <option value="Perpetual" ${outletDetails.stockVerificationType == 'Perpetual' ? 'selected' : ''}>Perpetual</option>
												  <option value="blind" ${outletDetails.stockVerificationType == 'blind' ? 'selected' : ''}>Blind stock taking</option>
		                                  		  	</select>
                                        </div>
                                         <div class="form-group col-lg-4 allignment">
                                            <label><spring:message code="zone.label" /></label>
                                            
                                            <select class="form-control" id="zoneId" >
                                                   
		                                  		 <c:forEach var="zoneList" items="${zoneList}">
		                                  		 
															<option value="${zoneList.zoneID}" ${zoneList.zoneID == outletDetails.zoneId ? 'selected' : ''} id="${zoneList.zoneID}" >${zoneList.zoneID}</option>
														</c:forEach>
		                                  		  	</select>
                                            <span id="categoryError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                    <div class="form-group col-lg-4 allignment">
                                            <label><spring:message code="warehouse.label" /></label>
                                            <select class="form-control" id="warehouseId" >
		                                  		 <c:forEach var="warehouselocationsList" items="${warehouselocationsList}"> 
												 <option value="${warehouselocationsList}" ${outletDetails.warehouseId == warehouselocationsList ? 'selected' : ''}>${warehouselocationsList}</option>
											 </c:forEach>
		                                  		  	</select>
                                            <span id="categoryError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        
                                         <div class="form-group col-lg-2 " style="width:10%;    padding-left: 5px;">
                                        <label><spring:message code="maxcash.label" /> <span class="requiredField">*</span></label>
                                         <input type="text"  name="maximumCashLimit" value="${outletDetails.maximumCashLimit}" class="form-control" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" required id="maximumCashLimit" placeholder="<spring:message code="maxcash.label" />" />
                                         <span id="LimitError" style="text-align:right;color:red;font-weight:bold;white-space:nowrap"></span>
                                    </div>
                                    <div class="form-group col-lg-2 " style="width:10%;    padding-left: 5px;">
                                        <label><spring:message code="max_bill.label" /> <span class="requiredField">*</span></label>
                                         <input type="text"  name="b2cMaxValue" value="${outletDetails.b2cMaxValue}" class="form-control" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" required id="b2cMaxValue" placeholder="<spring:message code="max_bill.label" />" />
                                         <span id="LimitError" style="text-align:right;color:red;font-weight:bold;white-space:nowrap"></span>
                                    </div>
                                    
                                        <div class="form-group col-lg-4 allignment">
                                            <label><spring:message code="gstin.lael" /></label>
                                            <input type="text" name="gstIn" value="${outletDetails.gstIn}" id="gstIn" class="form-control"  />
                                                                                   </div>
                                                           
                                       <div class="form-group col-lg-2 allignment" style=""> 
                                        <label><spring:message code="dayOpenSynsc.label" /></label>
                                           <div style="width:60%">
                                            <select class="form-control" id="dayStartSync" >
                                            
<%--                                             	<option value="true" ${'true' == outletDetails.remoteMonitoring ? 'selected' : ''} >Yes</option> --%>
<%-- 		                                  		<option value="false" ${'false' == outletDetails.remoteMonitoring ? 'selected' : ''} >No</option> --%>
                                             <option value="true" ${outletDetails.dayStartSync==true?'selected':''}> <spring:message code="yes.label"/></option>
		                                  	  <option value="false" ${outletDetails.dayStartSync==false?'selected':''}> <spring:message code="no.label"/></option>
		                                  	
		                                	</select>
                                         </div>
                                      </div>
                                        <div class="form-group col-lg-2 allignment">
                                         <label><spring:message code="virtualstore.label" /></label>
                                          <div style="width:60%">
                                          <select class="form-control" id="isVirtualStore" >
                                              <option value="true" ${outletDetails.isVirtualStore == true ? 'selected' : ''}>Yes</option>
		                                  	  <option value="false" ${outletDetails.isVirtualStore == false ? 'selected' : ''}>No</option>
		                                	</select>
		                                	</div>
                                       </div>
                                        <div class="form-group col-lg-2 allignment">
                                        <label><spring:message code="inventory.mgmt.label" /></label>
                                         <div style="width:60%">
                                         <select class="form-control" id="isInventoryRequired" >
                                              <option value="true" ${outletDetails.isInventoryRequired == true ? 'selected' : ''}>Yes</option>
		                                  	  <option value="false" ${outletDetails.isInventoryRequired == false ? 'selected' : ''}>No</option>
		                                	</select>
		                                	</div>
                                        </div>
                                        
                                        <div class="form-group col-lg-4 allignment">
                                            <label><spring:message code="leadtime.label" /></label>
                                             <div style="width:60%">
                                            <select class="form-control" id="leadTime" >
		                                  	<c:forEach begin="1" end="30" varStatus="loop">
		                                  		 <option value="${loop.index}" ${loop.index == outletDetails.leadTime ? 'selected' : ''}>${loop.index}</option>
											</c:forEach>
		                                  		  	</select></div>
                                            <span id="categoryError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        
                                         
                                         
                                
                             
                                       <%--   
                                         <div class="form-group col-lg-2 col-lg2-2">
                                           <label><spring:message code="created.date.label" /> <!-- <span class="requiredField">*</span> --></label>
                                        	<div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <!-- <input type="text" name="startDate" id="startDate" required class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/> -->
                                            <input class="form-control" readonly="readonly" style="background-color: white;" name="startDate" id="startDate" size="20" type="text" onfocus="callCalender('startDate')" onclick="callCalender('startDate')" placeholder="DD/MM/YYYY"/>
                                        </div><!-- /.input group -->
                                       <!--  <span id="startDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span> -->
                                         </div> --%>
                                       
                               </div>
                               
                                <div class="row">        
                                <div class="form-group col-lg-2 allignment">
									<label><spring:message code="created.date.label" /></label>
                                           <input class="form-control calendar_icon" disabled="disabled"  style="background-color: white;" name="createddate" value="${outletDetails.createdDatestr}" id="createddate" size="20" type="text" onfocus="callCalender('createddate')" onclick="callCalender('createddate')" placeholder="DD/MM/YYYY"/>
									<span id="orderDateError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
                                
                                
                                <div class="form-group col-lg-2 allignment">
									<label><spring:message code="updated.date.label" /></label>
                                           <input class="form-control calendar_icon"  readonly="readonly" style="background-color: white;" name="updatedddate"  value="${outletDetails.updatedDatestr}" id="updatedddate" size="20" type="text" onfocus="callCalender('updatedddate')" onclick="callCalender('updatedddate')" placeholder="DD/MM/YYYY"/>
									<span id="orderDateError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
								<div class="form-group col-lg-2 allignment">
                                         <label><spring:message code="session.timeout.label" /></label>
                                         <div  style="width:60%">
                                         <div class="bootstrap-timepicker">
                                            
                                            <div class="input-group">  
                                          <input type="text" name="timeOutStr" value="${outletDetails.timeOutStr}" id="timeOutStr" class="form-control timepicker"  />
                                         </div>
                                         </div>
                                         </div>
                                         </div>
								 
								 <div class="form-group col-lg-2 allignment">
									<label><spring:message code="suspend.Reason.label" /></label>
                                           <input class="form-control calendar_icon"  style="background-color: white;" value="${outletDetails.suspendReason}"  name="suspendReason"  id="suspendReason" size="20" type="text"  />
                                       
								</div>
								
								<div class="form-group col-lg-2 allignment">
                                   <label>FSSAI Number</label>
                                     <input class="form-control"  style="background-color: white;" name="fssaiNumber"  id="fssaiNumber" value="${outletDetails.fssaiNumber}" size="20" type="text"  />
                                       
                                </div>
                                     
                            </div>   
                               
                               </div>
                               <br>
                                    <div class="row">
									   <div class="form-group col-lg-12" style="margin-top: 10px;margin-bottom: -17px;">
                                         	 <label style="font-weight:bold;" class="labelheading"><spring:message code="outlet.options.label" /> </label>
                                         	 <hr style="margin-top: 1px;">
                                         </div>
                                      </div>
                                   <div class="row seven-cols" style="padding-left:15px;">
                                   
                                   <table class="table" style="margin-bottom: 0px; width:99%">
											    <thead style="background-color: #ececec !important; color: #ffffff ">
											      <tr>
											        <th><label><spring:message code="outlet.type.label" /></label></th>
											        <th>  <label><spring:message code="offlinemode.label" /></label></th>
											        <th><label><spring:message code="mobilesecurity.label" /></label></th>
											        <th> <label><spring:message code="offlinedata.timeout" /></label></th>
											        <th> <label><spring:message code="onlinrorders.label" /></label></th>
											        <th> <label><spring:message code="telephonicorders.label" /></label></th>
											        <th><label><spring:message code="attendance.enabled" /></label></th>
											        <th> <label><spring:message code="outlet.status.label" /></label></th>
											        <th style="width:9%"> <label><spring:message code="bill.id.label" /></label></th>
											      </tr>
											  </thead>
											  <tbody>
											  <tr>
											    
                                   <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 9.6%;"> 
                                        <%--  <label><spring:message code="outlet.type.label" /></label> --%>
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="outletType" value="fixed" ${outletDetails.outletType=='fixed'?'checked':''}> <spring:message code="fixed.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="outletType" value="mobile" ${outletDetails.outletType=='mobile'?'checked':''}> <spring:message code="mobile.label"/>
                                                </label>
                                            </div>
                                        </td>
                                    <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 10.12%;">
                                     <%--  <label><spring:message code="offlinemode.label" /></label> --%>
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="offlineMode" value="true" ${outletDetails.offlineMode=='true'?'checked':''}> <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="offlineMode" value="false" ${outletDetails.offlineMode=='false'?'checked':''}> <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                     </td>
                                      <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc; width: 12.1%;"> 
                                       <%--   <label><spring:message code="mobilesecurity.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="mobileSecurity" value="true" ${outletDetails.mobileSecurity=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="mobileSecurity" value="false" ${outletDetails.mobileSecurity=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                   	<td class="form-group col-lg-1 col-md-1 col-sm-1" style="width:14%;border-right: 2px solid #ccc;width: 12.5%;"> 
                                        <%--  <label><spring:message code="offlinedata.timeout" /></label> --%>
                                            <div class="row">
                                                 <div class="form-group col-lg-10 ">
                                            <select class="form-control" id="offLineDataTimedOutDays"style="margin-top: 5px;" >
                                            <option value="">Days</option>
		                                  	<c:forEach begin="1" end="30" varStatus="loop">
		                                  		 <option value="${loop.index}" ${loop.index == outletDetails.offLineDataTimedOutDays ? 'selected' : ''}>${loop.index}</option>
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
		                                  		 <option value="${loop.index}" ${loop.index == outletDetails.offLineDataTimedOutHours ? 'selected' : ''}>${loop.index}</option>
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
                                                   <input type="radio" name="onlineOrders" value="true" ${outletDetails.onlineOrders=='true'?'checked':''}> <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="onlineOrders" value="false" ${outletDetails.onlineOrders=='false'?'checked':''}> <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                     </td>
                                      <td class="form-group col-lg-1 col-md-1 col-sm-1" style="  border-right: 2px solid #ccc;width: 9.25%;"> 
                                       <%--   <label><spring:message code="telephonicorders.label" /></label> --%>
                                          <div class="radio">
                                           <label>
                                             <input type="radio" name="telephonicOrders" value="true" ${outletDetails.telephonicOrders=='true'?'checked':''}><spring:message code="yes.label" />                                          
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="telephonicOrders" value="false" ${outletDetails.telephonicOrders=='false'?'checked':''}><spring:message code="no.label" /></label>
                                         </div>
                                      </td>
                                      <td class="form-group col-lg-1 col-md-1 col-sm-1" style="    width: 15.2%;border-right: 2px solid #ccc;"> 
                                       <%--   <label><spring:message code="attendance.enabled" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="attendanceEnabled" value="true" ${outletDetails.attendanceEnabled=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="attendanceEnabled" value="false" ${outletDetails.attendanceEnabled=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                   <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc; width: 10.47%;"> 
                                        <%--  <label><spring:message code="outlet.status.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="storeStatus" value="1" ${outletDetails.storeStatus=='1'?'checked':''}> <spring:message code="enable.label"/>                                           
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="storeStatus" value="0" ${outletDetails.storeStatus=='0'?'checked':''}><spring:message code="disable.label"/></label>
                                         </div>
                                      </td>
                                      
                                      
                                      
                                      
                                         <td class="form-group col-lg-1 col-md-1 col-sm-1" style=" width: 0%;"> 
                                        <%--  <label><spring:message code="bill.id.label" /></label> --%>
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="billId" value="true" ${outletDetails.billId=='true'?'checked':''}> <spring:message code="custom.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="billId" value="false" ${outletDetails.billId=='false'?'checked':''}> <spring:message code="default.label"/>
                                                </label>
                                            </div>
                                        </td>
                                      </tr>
                                      </tbody>
                                      </table>
                                   </div>
                                   
                                   <br>
                                   <div class="row seven-cols" style="padding-left:15px;">
                                                                <table class="table" style="margin-bottom: 0px; width:98.8%">
											    <thead style="background-color: #ececec !important; color: #ffffff ">
											      <tr>
											      <th> <label ><spring:message code="masterflag.label" /></label></th>
											      <th><label><spring:message code="testStore.label" /></label></th>
											      <th><label><spring:message code="hybrid.mode.label" /></label></th>
											       <!--  added by vasudev -->
											       <th><label><spring:message code="dayOpenMandatory.label" /></label></th>
											    <th><label>Minimum Order Value</label></th>
											       <th><label>Credit Note OTP</label></th>
											        <th><label>All Store Return Bill</label></th>
											     <th><label>Shift Report Mandatory</label></th>
											    
											      </tr>
											      </thead>
											     
											     <tbody>
											     <tr>
                                      <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 8.2%;"> 
                                        <%--  <label ><spring:message code="masterflag.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="masterflag" value="true" ${outletDetails.masterFlag=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="masterflag" value="false" ${outletDetails.masterFlag=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      
                                      
                                      
                                        <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 7.2%;"> 
                                         <%-- <label><spring:message code="testStore.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="teststore" value="true" ${outletDetails.testStore=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="teststore" value="false" ${outletDetails.testStore=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      
                                      <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 8.3%;"> 
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="hybrid_mode" value="true" ${outletDetails.hybrid_mode=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="hybrid_mode" value="false" ${outletDetails.hybrid_mode=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      
                                        <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 8.3%;"> 
                                        
    								<%-- Added by vasudeva Reddy --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="dayOpenMandatory" value="true" ${outletDetails.dayOpenMandatory=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="dayOpenMandatory" value="false" ${outletDetails.dayOpenMandatory=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                          <%-- <div class="form-group col-lg-1 col-md-1 col-sm-1" style="width:14%;border-right: 2px solid #ccc;"> 
                                        <label><spring:message code="dayOpenSynsc.label" /></label>
                                            <div class="row">
                                                 <div class="form-group col-lg-10 ">
                                            <select class="form-control" id="dayStartSync" >
                                            
                                            	<option value="true" ${'true' == outletDetails.remoteMonitoring ? 'selected' : ''} >Yes</option>
		                                  		<option value="false" ${'false' == outletDetails.remoteMonitoring ? 'selected' : ''} >No</option>
                                            <option value="true" ${outletDetails.dayStartSync==true?'selected':''}> <spring:message code="yes.label"/></option>
		                                  	  <option value="false" ${outletDetails.dayStartSync==false?'selected':''}> <spring:message code="no.label"/></option>
		                                  		  	</select>
                                            
                                        </div>
                                        </div>   
                                      
                                      </div> --%>
                                      
                                        <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 8.2%"> 
                                        
                                         <div class="radio">
                                           <label>
                                             <input type="text" name="minimumOrderValue" id="minimumOrderValue" value="${outletDetails.minimumOrderValue}" placeholder="" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
                                                 style="padding-left: 5px;width: 100px;"/>
                                           </label>
                                         </div>
                                         </td>
                                         
                                         
                                       <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 8.3%;"> 
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="creditNoteOtp" value="true" ${outletDetails.creditNoteOtp=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="creditNoteOtp" value="false" ${outletDetails.creditNoteOtp=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                         
                                      
                                      <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 8.2%;"> 
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="allStoreReturnBill" value="true" ${outletDetails.allStoreReturnBill=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="allStoreReturnBill" value="false" ${outletDetails.allStoreReturnBill=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      
                                       <td class="form-group col-lg-1 col-md-1 col-sm-1" > 
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="shiftReportMandatory" id="shiftReportMandatory" value="true" ${outletDetails.shiftReportMandatory=='true' ?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="shiftReportMandatory" id="shiftReportMandatory" value="false" ${outletDetails.shiftReportMandatory=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      
                                      
                                         </tr>
                                         </tbody>
                                         </table>
                                         
                                      </div>
                                      <br>
                                      
                                      
                                      <div class="row seven-cols" style="padding-left:15px;">
                                   <table class="table" style="margin-bottom: 0px; width:13.8%">
											    <thead style="background-color: #ececec !important; color: #ffffff ">
											      <tr>
											      
											     <th><label>POS Stock Display</label></th>
											      <th><label>Bill OTP</label></th>
											      <th><label>Expected Delivery Time</label></th>
											      </tr>
											      </thead>
											      
											      <tbody>
											      <tr>
											     
                                    
                                      
                                       <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 8.2%;"> 
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="posStockDisplay" id="posStockDisplay" value="true" ${outletDetails.posStockDisplay=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="posStockDisplay" id="posStockDisplay" value="false" ${outletDetails.posStockDisplay=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      
                                      <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 8.2%;"> 
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="billOtp" id="billOtp" value="true" ${outletDetails.billOtp=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="billOtp" id="billOtp" value="false" ${outletDetails.billOtp=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      
                                      <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 8.2%"> 
                                        
                                         <div class="radio">
                                           <label>
                                             <input type="text" name="expectedDeliveryTime" id="expectedDeliveryTime" value="${outletDetails.expectedDeliveryTime}" placeholder="" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"
                                                 style="padding-left: 5px;width: 100px;"/>
                                           </label>
                                         </div>
                                         </td>
                                      
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
                                             <input type="radio" name="manualDiscounts" value="true" ${outletDetails.manualDiscounts=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="manualDiscounts" value="false" ${outletDetails.manualDiscounts=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      
                                      <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 12.9%"> 
                                        <%--  <label><spring:message code="discount.taxation.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="discountCalculatedOn" value="Original Price" ${outletDetails.discountCalculatedOn=='Original Price'?'checked':''}> <spring:message code="original.price.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label style="white-space: nowrap;"><input type="radio" name="discountCalculatedOn" value="Discounted Price" ${outletDetails.discountCalculatedOn=='Discounted Price'?'checked':''}><spring:message code="discountedprice.label"/></label>
                                         </div>
                                      </td>
                                      <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 13.3%"> 
                                        <%--  <label><spring:message code="discount.taxation.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="discountTaxation" value="Inclusive" ${outletDetails.discountTaxation=='Inclusive'?'checked':''}> <spring:message code="procurement.shipmentCost.inclusive"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="discountTaxation" value="Exclusive" ${outletDetails.discountTaxation=='Exclusive'?'checked':''}><spring:message code="procurement.shipmentCost.exclusive"/></label>
                                         </div>
                                      </td>
                                      <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 14.8%"> 
                                         <%-- <label><spring:message code="employee.discounts.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="employeeDiscounts" value="true" ${outletDetails.employeeDiscounts=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="employeeDiscounts" value="false" ${outletDetails.employeeDiscounts=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                       <td class="form-group col-lg-1 col-md-1 col-sm-1" style=""> 
                                         <%-- <label><spring:message code="campaign.pref.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="latestCampaigns" value="true" ${outletDetails.latestCampaigns=='true'?'checked':''}> <spring:message code="latest.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="latestCampaigns" value="false" ${outletDetails.latestCampaigns=='false'?'checked':''}><spring:message code="recent.label"/></label>
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
                                       
            								  <table class="table" style="margin-bottom: 0px; width:99%">
											    <thead style="background-color: #ececec !important; color: #ffffff ">
											      <tr>
												      <th> <label><spring:message code="outlet.indent.label" /></label></th>
												      <th><label><spring:message code="outlet.issue.label" /></label></th>
												      <th> <label><spring:message code="outlet.receipt.label" /></label></th>
												      <th><label><spring:message code="outlet.return.label" /></label></th>
												      <th> <label><spring:message code="outlet.grn.label" /></label></th>
												      <th><label><spring:message code="rounding.recquired.label" /></label></th>
												      <th> <label><spring:message code="Products.menu.label" /></label></th>
												      <th style="width:12.1%"> <label>Zero Stock Billing</label></th>
											      </tr>
											      </thead>
											                            
                                       <tbody>
                                       <tr>
                                       
                                        <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 12.6%"> 
                                         <%-- <label><spring:message code="outlet.indent.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="stockRequest" value="true" ${outletDetails.stockRequest=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="stockRequest" value="false" ${outletDetails.stockRequest=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      
                                      <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 11.2%"> 
                                        <%--  <label><spring:message code="outlet.issue.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="stockIssue" value="true" ${outletDetails.stockIssue=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="stockIssue" value="false" ${outletDetails.stockIssue=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 13.1%"> 
                                        <%--  <label><spring:message code="outlet.receipt.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="stockReciept" value="true" ${outletDetails.stockReciept=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="stockReciept" value="false" ${outletDetails.stockReciept=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 12.56%"> 
                                        <%--  <label><spring:message code="outlet.return.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="stockReturn" value="true" ${outletDetails.stockReturn=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="stockReturn" value="false" ${outletDetails.stockReturn=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      
                                         <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 5.9%"> 
                                         <%-- <label><spring:message code="outlet.grn.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="outletGrn" value="true" ${outletDetails.outletGrn=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="outletGrn" value="false" ${outletDetails.outletGrn=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                       <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 17.56%"> 
                                         <%-- <label><spring:message code="rounding.recquired.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="roundingRequired" value="true" ${outletDetails.roundingRequired=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="roundingRequired" value="false" ${outletDetails.roundingRequired=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                        <td class="form-group col-lg-1 col-md-1 col-sm-1"  style="border-right: 2px solid #ccc;width: 14.23%"> 
                                        <%--  <label><spring:message code="Products.menu.label" /></label> --%>
                                          
                                         <div class="radio">
                                           <label><input type="radio" name="productsMenu" value="true" ${outletDetails.productsMenu=='true'?'checked':''}><spring:message code="yes.label" /></label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="productsMenu" value="false" ${outletDetails.productsMenu=='false'?'checked':''}><spring:message code="no.label" /></label>
                                         </div>
                                      </td>
                                        <td class="form-group col-lg-1 col-md-1 col-sm-1" > 
                                        <!--  <label>Zero Billing</label> -->
                                          
                                         <div class="radio">
                                           <label><input type="radio" name="zeroStock" value="true" ${outletDetails.zeroStock=='true'?'checked':''}><spring:message code="yes.label" /></label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="zeroStock" value="false" ${outletDetails.zeroStock=='false'?'checked':''}><spring:message code="no.label" /></label>
                                         </div>
                                      </td>
                                      </tr>
                                      </tbody>
                                       </table>   
                                      </div>
                                      <br>
                                      <!--new flags  -->
                                       <div class="row seven-cols" style="padding-left:15px;">
                                       
            								  <table class="table" style="margin-bottom: 0px; width:30%">
											    <thead style="background-color: #ececec !important; color: #ffffff ">
											      <tr>
												      <th><label>Multiple Stock Receipts</label></th>
												      <th><label>Stock Maintain Days</label></th>
											      </tr>
											      </thead>
											                            
                                       <tbody>
                                       <tr>
                                       
                                        <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 12.6%"> 
                                         
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="multipleStockReceipts" value="true" ${outletDetails.multipleStockReceipts=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="multipleStockReceipts" value="false" ${outletDetails.multipleStockReceipts=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      
                                      <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 11.2%"> 
                                        
                                         <div class="radio">
                                           <label>
                                             <input type="text" name="stockMaintainDays" id="stockMaintainDays" value="${outletDetails.stockMaintainDays}" placeholder="Days" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" style="padding-left: 5px;width: 100px;"/>
                                           </label>
                                         </div>
                                         
                                      </td>
                                      </tr>
                                      </tbody>
                                       </table>   
                                      </div>
                                      
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
												      <th style="width: 14%;"><label><spring:message code="returns.label" /></label></th>
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
                                             <input type="radio" name="printing" value="true" ${outletDetails.printing=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="printing" value="false" ${outletDetails.printing=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                   	<td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc; width:9.17%;"> 
                                       <%--   <label><spring:message code="doordeliveryorders.label" /></label> --%>
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="doorDelivery" value="true" ${outletDetails.dooorDelivery=='true'?'checked':''}> <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="doorDelivery" value="false" ${outletDetails.dooorDelivery=='false'?'checked':''}> <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                        </td>
                                        
                                        
                                         	<td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc; width:9.17%;"> 
                                       <%--   <label><spring:message code="doordeliveryorders.label" /></label> --%>
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="customerNo" value="true" ${outletDetails.requiredCustomerNumber=='true'?'checked':''}> <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="customerNo" value="false" ${outletDetails.requiredCustomerNumber=='false'?'checked':''}> <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                        </td>
                                        
                                        
                                        	
                                           <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc; width:9.5%;"> 
                                         <%-- <label><spring:message code="foodcoupons.label" /></label> --%>
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="foodCoupons" value="true" ${outletDetails.foodCoupons=='true'?'checked':''}> <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="foodCoupons" value="false" ${outletDetails.foodCoupons=='false'?'checked':''}> <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                        </td>
                                    <td class="form-group col-lg-1 col-md-1 col-sm-1" style="width:9.69%;border-right: 2px solid #ccc;">
                                     <%--  <label><spring:message code="remotebilling.label" /></label> --%>
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="remoteBilling" value="true" ${outletDetails.remoteBilling=='true'?'checked':''}> <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="remoteBilling" value="false" ${outletDetails.remoteBilling=='false'?'checked':''}> <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                     </td>
                                    <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc;width: 13.9%">
                                      <%-- <label><spring:message code="returns.label" /></label> --%>
                                          
                                          <div class="form-group col-lg-1 col-md-1 col-sm-1" style="">
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="returns" value="true" ${outletDetails.returns=='true'?'checked':''}> <spring:message code="yes.label"/>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                   <input type="radio" name="returns" value="false" ${outletDetails.returns=='false'?'checked':''}> <spring:message code="no.label"/>
                                                </label>
                                            </div>
                                            </div>
                                            
                                             <div class="form-group col-lg-7 col-md-5 col-sm-5" style="padding-left:0px;margin-left:32px">   
                                             <select class="form-control" id="returnDays" style="margin-top: 5px;padding:0px" >
<!--                                            <option>Days</option> -->
		                                  	<c:forEach begin="0" end="100" varStatus="loop">
		                                  		 <option value="${loop.index}" ${loop.index == outletDetails.returnAllowDays ? 'selected' : ''}>${loop.index}</option>
											</c:forEach>
		                                    </select>
                                           </div> 
                                     </td>
                                      <td class="form-group col-lg-1 col-md-1 col-sm-1" style=" width:8.50%;border-right: 2px solid #ccc;"> 
                                      <%--    <label><spring:message code="credit.note.label" /></label> --%>
                                          <div class="radio">
                                           <label>
                                             <input type="radio" name="returnMode" value="cash" ${outletDetails.returnMode=='cash'?'checked':''}><spring:message code="cash.label" />                                          
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="returnMode" value="creditNote" ${outletDetails.returnMode=='creditNote'?'checked':''}><spring:message code="creditnote.label" /></label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="returnMode" value="both" ${outletDetails.returnMode=='both'?'checked':''}><spring:message code="both.label" /></label>
                                         </div>
                                      </td>
                                      
                                      
                                      <td style=" width:13.9%; border-right: 2px solid #ccc;"> 
<!--                                        <div class="form-group col-lg-1 col-md-1 col-sm-1"style="border-right: 2px solid #ccc; width:15.00%;">  -->
                                        
                                         <input type="text" class="form-control" id="expiryDays" value="${outletDetails.creditNoteExpiryDays}" id="expiryDays"  />
                                       
                                        </td>
                                      
                                      
                                      <td class="form-group col-lg-1 col-md-1 col-sm-1" style=" width:13.9%; border-right: 2px solid #ccc;"> 
                                       <%--   <label><spring:message code="exchanges.label" /></label> --%>
                                         <div class="form-group col-lg-1 col-md-1 col-sm-1" style=" ">
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="exchanges" value="true" ${outletDetails.exchange=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="exchanges" value="false" ${outletDetails.exchange=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                        </div> 
                                         
                                           <div class="form-group col-lg-7 col-md-7 col-sm-7" style="padding-left:0px;margin-left:32px">   
                                             <select class="form-control" id="exchangeDays" style="margin-top: 5px;padding:0px;" >
		                                  	<c:forEach begin="0" end="100" varStatus="loop">
		                                  		 <option value="${loop.index}" ${loop.index == outletDetails.exchangeAllowDays ? 'selected' : ''}>${loop.index}</option>
											</c:forEach>
		                                    </select>
                                           </div> 
                                         
                                         
                                      </td>
                                       <td> 
                                       <%--   <label><spring:message code="exchangemode.label" /></label> --%>
                                          <div class="radio">
                                           <label>
                                             <input type="radio" name="exchangeMode" value="cash" ${outletDetails.exchangeMode=='cash'?'checked':''}><spring:message code="cash.label" />                                          
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="exchangeMode" value="creditNote" ${outletDetails.exchangeMode=='creditNote'?'checked':''}><spring:message code="creditnote.label" /></label>
                                         </div>
                                          <div class="radio">
                                           <label><input type="radio" name="exchangeMode" value="both" ${outletDetails.exchangeMode=='both'?'checked':''}><spring:message code="both.label" /></label>
                                         </div>
                                      </td>
                                      
                                       </table>
                                      </div>
                                      <br>
                                     <!--added by manasa  -->
                                      
                                       <div class="row seven-cols" style="padding-left:15px;">
                                 <table class="table" style="margin-bottom: 0px; width:99%">
											    <thead style="background-color: #ececec !important; color: #ffffff ">
											      <tr>
											      <th><label>Sales Person Required</label></th>
												   <th> <label><spring:message code="barcodetype.label" /></label></th>
											      <th> <label ><spring:message code="enforce_denominations.label" /></label></th>
											      <th><label><spring:message code="enforce_void_items_reason.label" /></label></th>
											      <th><label><spring:message code="bill_cancel_reason.label" /></label></th>
											       <th><label>Bill Cancel Allowed Days</label></th>
											      <th><label><spring:message code="edit.price.label" /></label></th>
											      <th><label><spring:message code="card.info.lable" /></label></th>
											      
											      </tr>
											      </thead>
											      <tbody>
											     <tr>
											     
											      <td class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc; width:8.52%;"> 
                                         <%-- <label><spring:message code="salesperson.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="employeeSaleId" value="true" ${outletDetails.employeeSaleId=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="employeeSaleId" value="false" ${outletDetails.employeeSaleId=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                       <td class="form-group col-lg-1 col-md-1 col-sm-1" style=" width:13.9%; border-right: 2px solid #ccc;" > 
                                        <%--  <label><spring:message code="barcodetype.label" /></label> --%>
                                          <div class="radio">
                                           <label>
                                             <input type="radio" name="barcodeType" value="skuId" ${outletDetails.barcodeType=='skuId'?'checked':''}><spring:message code="skuid.label" />                                          
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="barcodeType" value="Ean" ${outletDetails.barcodeType=='Ean'?'checked':''}><spring:message code="ean.label" /></label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="barcodeType" value="both" ${outletDetails.barcodeType=='both'?'checked':''}><spring:message code="both.label" /></label>
                                         </div>
                                      </td>
                                      
											     <td style=" width:13.9%; border-right: 2px solid #ccc;"> 
											     
                                        <%--  <label><spring:message code="enforce_denominations.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="enforcedenominations" value="true" ${outletDetails.enforceDenominations=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="enforcedenominations" value="false" ${outletDetails.enforceDenominations=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      
                                      <td style=" width:13.9%; border-right: 2px solid #ccc;"> 
                                      
<!--                                         <div class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc; width:11.8%">  -->
                                       <%--   <label><spring:message code="enforce_void_items_reason.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="enforcevoiditems" value="true" ${outletDetails.enforceVoidItemsReason=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="enforcevoiditems" value="false" ${outletDetails.enforceVoidItemsReason=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      
                                      <td style=" width:13.9%; border-right: 2px solid #ccc;"> 
<!--                                         <div class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc; width:11.6%;">  -->
                                        <%--  <label><spring:message code="bill_cancel_reason.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="billcancel" value="true" ${outletDetails.enforceBillCancelReason=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="billcancel" value="false" ${outletDetails.enforceBillCancelReason=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      <td style=" width:13.9%; border-right: 2px solid #ccc;"> 
<!--                                        <div class="form-group col-lg-1 col-md-1 col-sm-1"style="border-right: 2px solid #ccc; width:15.00%;">  -->
                                        <%--  <label><spring:message code="bill_cancel_reason.label" /></label> --%>
                                       
                                        <div class="row">
                                                 <div class="form-group col-lg-9">
                                           <select class="form-control" id="cancelDays" style="margin-top: 5px;" >
		                                  	<c:forEach begin="0" end="30" varStatus="loop">
		                                  		 <option value="${loop.index}" ${loop.index == outletDetails.cancelAllowDays ? 'selected' : ''}>${loop.index}</option>
											</c:forEach>
		                                    </select>
                                        </div>
                                            </div>
                                         <%-- <div class=" col-lg-9 col-md-7 col-sm-7" style="">   
                                             <select class="form-control" id="cancelDays" style="margin-top: 5px;" >
                                           
		                                  	<c:forEach begin="0" end="30" varStatus="loop">
		                                  		 <option value="${loop.index}" ${loop.index == outletDetails.cancelAllowDays ? 'selected' : ''}>${loop.index}</option>
											</c:forEach>
		                                    </select>
                                           </div>  --%>
                                      </td>
                                      
                                      
                                      
                                      <td style=" width:13.9%; border-right: 2px solid #ccc;"> 
<!--                                        <div class="form-group col-lg-1 col-md-1 col-sm-1" style="border-right: 2px solid #ccc; width:6.93%;">  -->
                                         <%-- <label><spring:message code="edit.price.label" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="editprice" value="true" ${outletDetails.editPrice=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="editprice" value="false" ${outletDetails.editPrice=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      <td> 
<!--                                         <div class="form-group col-lg-1 col-md-1 col-sm-1" style="">  -->
                                         <%-- <label><spring:message code="card.info.lable" /></label> --%>
                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="cardinfo" value="true" ${outletDetails.cardinfo=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="cardinfo" value="false" ${outletDetails.cardinfo=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      
                                     
                                     
                      
                             </tr> </tbody>      </table>   
                    
                    <br>
                       <div class="row seven-cols" style="padding-left:15px;">
                                 <table class="table" style="margin-bottom: 0px; width:97.7%">
                                 <thead style="background-color:#ececec !important; color:#ffffff ">
                                 <tr>
                                 <th> <label><spring:message code="counter.otp.label" /></label></th>
											       <th> <label>Draft Bill Allow Days</label></th>
											        <th> <label>Return Bill Ref</label></th>
											        <th> <label>Stock Sale Allow Days</label></th>
											        <th> <label>Sales FTP</label></th>
											        <th> <label>FTP Server</label></th>
											         <th> <label>User ID Credentials</label></th>
											      </tr>
									
											      </thead>
											      
											      <tbody>
											      
											      
											      <tr>
											      <div class="">
											      <td style=" border-right: 2px solid #ccc;">                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="counterOTP" value="true" ${outletDetails.counterOTP=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="counterOTP" value="false" ${outletDetails.counterOTP=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      
                                      
                                         
                                      <td style=" width:13.9%; border-right: 2px solid #ccc;">                                        <%--  <label><spring:message code="bill_cancel_reason.label" /></label> --%>
                                        <div class="row">
                                                 <div class="form-group col-lg-10 ">
                                           <select class="form-control" id="draftAllowDays" style="margin-top: 5px;" >
		                                  	<c:forEach begin="0" end="30" varStatus="loop">
		                                  		 <option value="${loop.index}" ${loop.index == outletDetails.draftAllowDays ? 'selected' : ''}>${loop.index}</option>
											</c:forEach>
		                                    </select>
                                        </div>
                                            </div>
                                      </td>
                                      
                                      <td style=" border-right: 2px solid #ccc;">                                         <div class="radio">
                                           <label>
                                             <input type="radio" name="returnBillRefRequired" value="true" ${outletDetails.returnBillRefRequired=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="returnBillRefRequired" value="false" ${outletDetails.returnBillRefRequired=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      
                                       <td style=" width:13.9%; border-right: 2px solid #ccc;">                                        <%--  <label><spring:message code="bill_cancel_reason.label" /></label> --%>
                                        <div class="row">
                                                 <div class="form-group col-lg-10 ">
                                           <select class="form-control" id="stockSaleAllowDays" style="margin-top: 5px;" >
		                                  	<c:forEach begin="0" end="30" varStatus="loop">
		                                  		 <option value="${loop.index}" ${loop.index == outletDetails.stockSaleAllowDays ? 'selected' : ''}>${loop.index}</option>
											</c:forEach>
		                                    </select>
                                        </div>
                                            </div>
                                      </td>
                                      
                                      <!--Sales FTP  -->
                                       <td style=" width:13.9%; border-right: 2px solid #ccc;">                                        
                                       <div class="radio">
                                           <label>
                                             <input type="radio" name="salesFTP" value="true" ${outletDetails.ftpUploadRequired=='true'?'checked':''}> <spring:message code="yes.label" />
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="salesFTP" value="false" ${outletDetails.ftpUploadRequired=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
                                      <td style=" width:13.9%; border-right: 2px solid #ccc;">                                        
                                        <div class="radio">
                                           <label>
                                             <input type="text" name="ftpIp" id="ftpIp" value="${outletDetails.ftpServer}" placeholder="IP Address" 
                                                 style="padding-left: 5px;width: 135px;"/>
                                           </label>
                                         </div>
                                          <div class="radio">
                                           <label>
                                             <input type="text" name="ftpPort" id="ftpPort" value="${outletDetails.ftpPort}" placeholder="Port" 
                                                 style="padding-left: 5px;width: 70px;"/>
                                           </label>
                                         </div>
                                      </td>
                                       <td>                                        
                                        <div class="radio">
                                           <label>
                                             <input type="text" name="ftpUserId" id="ftpUserId" value="${outletDetails.userId}" placeholder="User ID" 
                                                 style="padding-left: 5px;width: 150px;"/>
                                           </label>
                                         </div>
                                          <div class="radio">
                                           <label>
                                             <input type="text" name="ftpPasword" id="ftpPasword" value="${outletDetails.password}" placeholder="Password" 
                                                 style="padding-left: 5px;width: 140px;"/>
                                           </label>
                                         </div>
                                      </td>
                                      
                </div>
											      
											      
											      
											      
											      
											      </tr>
											      
											      </tbody>
                                 
                                 </table>
                                 </div>
                                 <br>
                                 
                                   <div class="row seven-cols" style="padding-left:15px;">
                                 <table class="table" style="margin-bottom: 0px; width:20%">
											    <thead style="background-color: #ececec !important; color: #ffffff ">
											      <tr>
											      <th><label><spring:message code="offline.duplicate.bill.label" /></label></th>
											      <th><label><spring:message code="creditNote.Multiple.Claims.label" /></label></th>
											      <th><label>Price List Count</label></th>
											      </tr>
											      </thead>
											      
											      <tbody>
											      <tr>
											      
											      
											      <td style=" width:13.9%; border-right: 2px solid #ccc;"> 
<div class="radio">
                                           <label>
                                             <input type="radio" name="offlineDuplicateBill" value="true" ${outletDetails.offlineDuplicateBill=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="offlineDuplicateBill" value="false" ${outletDetails.offlineDuplicateBill=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>
											      
											      <td style=" width:13.9%; border-right: 2px solid #ccc;">                                         
                                   <div class="radio">
                                           <label>
                                             <input type="radio" name="creditNoteMultipleClaims" value="true" ${outletDetails.creditNoteMultipleClaims=='true'?'checked':''}> <spring:message code="yes.label"/>
                                           </label>
                                         </div>
                                         <div class="radio">
                                           <label><input type="radio" name="creditNoteMultipleClaims" value="false" ${outletDetails.creditNoteMultipleClaims=='false'?'checked':''}><spring:message code="no.label"/></label>
                                         </div>
                                      </td>   
										 <td style=" width:13.9%; border-right: 2px solid #ccc;">                                         
                                   <div class="radio">
                                           <input type="number" name="priceListCount" id="priceListCount" value="${outletDetails.priceListCount}">
                                         </div>
                                      </td> 	  
											      
                                      
											      </tr>
											      </tbody>
											      
											      </table>
											      </div>
                                 
                    </div> 
                                      
                                
                                        <div class="row">
									   <div class="form-group col-lg-12" style="margin-top: 50px; margin-bottom: 0px;">
                                         	 <label style="font-weight:bold;"><spring:message code="facility.options.label" /> </label>
                                         	 <hr style="margin-top: 1px;">
                                         </div>
                                      </div>
                                      <div class="row">
									    <div class=" col-lg-3">
                                            <label><spring:message code="building.name.label" /> <span class="requiredField">*</span></label>
                                            <input type="text" onblur="criteriaSlashes(this)" class="form-control" name="buildingName" id="buildingName" />
                                            <span id="buildingNameError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        <div class=" col-lg-3">
                                            <label><spring:message code="businessCategory.label" /></label>
                                            <select class="form-control" id="facilityCategory" >
		                                  		<option selected="selected">Outlet</option>
		                                  		<option>Warehouse</option>
		                                  		<option>Restaurant</option>
		                                  		<option>Hospitality</option>
		                                  		<option>Consultancy</option>
		                                  		<option>Pharmacy</option>
		                                  		<option>Labs</option>
		                                  	</select>
                                            <span id="facilityCategoryError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        <div class=" col-lg-3">
                                           <label><spring:message code="no.of.levels.label"/><span class="requiredField">*</span></label>
					                        <input type="text" name="noOfLevels" id="noOfLevels" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" class="form-control">
			                                <span id="noOfLevelsError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        
                                        <div class=" col-lg-3" style="margin-top: 17px;padding: 0px;margin-bottom: 5px;">
                                        	<div class="buttons">
								       			 <a onclick="addBuildingDetails();" class="button"><font size="2px">&nbsp;&nbsp;&nbsp;<spring:message code="add.label" />&nbsp;&nbsp;&nbsp;</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								         	</div>
                                        </div>
                                    </div>   
                                    
                                        <div class="row" >
                                   		<!-- <div class="form-group col-lg-1"></div> -->
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
                                            	<c:forEach var="facility" items="${outletDetails.facilitiesInfo}" varStatus="theCount">
                                            		<tr id='dynamicdiv${theCount.count}' style='margin-top:5px;'>
                                            		<td id='buildingName${theCount.count}'>${facility.buildingName}</td>
													<td id='facilityCategory${theCount.count}'>${facility.businessCategory}</td>
													<td id='noOfLevels${theCount.count}' onBlur='changeLevel(this);' onkeypress='return (this.innerText.length < 3)' contenteditable='true'>${facility.levels}</td>
													<td><textarea id='remarks${theCount.count}' rows=1 style='resize:none;width: 300px;'>${facility.remarks}</textarea></td>
													<td id='Del${theCount.count}' ><img id='Img${theCount.count}' src='${pageContext.request.contextPath}/images/itemdelete.png' style='width:25px;cursor:pointer;' onclick='deleteItem(this);' title='Delete'/></td>
													</tr>
                                            	</c:forEach>
                                            </tbody>
                                          </table>
                                       </div>
                                    </div>
                                         
                                         <div class="row" >
                                    <div class="col-lg-12" >
                                     <label><spring:message code="billing.terms.conditions"/></label><br>
                                     <textarea class="form-control" width="100%" style="width: 100%; height: 100px;resize:none;" id="instructions">${outletDetails.instructions}</textarea>
                                    </div>
                                    </div> 
                                       
                                       	</c:forEach>
                                       	 <input type="hidden" id="type" value="${type}">
                                    </div><!-- /.box-body -->
									
						<div class="row" style="text-align: right;">
						 <input type="button" id="submit" class="btnCls" style="margin-right:25px" onclick="validateOutlet('edit');" value="&nbsp;&nbsp;<spring:message code="submit.label" />&nbsp;&nbsp;" />
						 <!-- <input type="submit" class="btn bg-olive btn-inline" style="margin-left:5%;" onclick="" value="Reset" /> -->
						<input type="button" class="btnCls "  style="margin-right:2%" onclick="viewConfigurations('outletConfigurations','0');" value="<spring:message code="cancel.label" />" />
						</div>
					
				
									<br/>
                                    <div class="box-footer">
                                    
                                    </div>
                                 
                                     
                                </form>
                               
                            </div>

</div>
</div>
</section><!-- /.content -->
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/timepicker/bootstrap-timepicker.min.js" ></script>
 <script>
  //Timepicker
  $(".timepicker").timepicker({
      showInputs: false,
      showMeridian:false,
      showSeconds:true,
  });
  </script>
</body>
</html>