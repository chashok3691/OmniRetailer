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
                 	<script type="text/javascript" src="${pageContext.request.contextPath}/js/eventManagement.js"></script>   
          <script src="https://maps.googleapis.com/maps/api/js?key=${sessionScope.googleAccessKey}&libraries=places&callback=initAutocomplete"
         async defer></script>
</head>
<style>

  select{
       
    }
    option:(first-child) {
        color: #ccc !important;
    }




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
.col-lg1-2{
    width: 20% !important;
}
.form-control {
   /*  height: 24px; */
    padding: 0px 6px;
    margin-bottom:4px;
    }
    
    .calendar_icon {
    background-position: 3px 3px;
    }
   .form-group {
    margin-bottom: 10px;
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
    padding: 2px 31px;
    background: #3c8dbc;
    border: none;
}
.fileUpload {
    position: relative;
    overflow: hidden;
    /* margin: 10px; */
}

.companyimage{
width: 152px;
    /* margin-left: -100%; */
    margin-top: -10%;
    margin-bottom:0px;
    object-fit: contain;
    height: 46px;
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
    padding-left: 10px;
    padding-right: 10px;
    *width: 10%;
  }
   .allignment{
  width: 100%;
  }
  
  .input-group{
  position: relative;
}
.input-group::after{
  content: '*';
  position: absolute;
  top: 3px;
  left: 46px;
  color: #f00
}
</style>
<script type="text/javascript">

$(document).ready(function(){
	debugger;
	callCalender('Eventstart');
	callCalender('EventEnd');
	callCalender('Date');
	callCalender('Eventdue');
	
	 
		});
</script>
<body>


<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12 eventBody">
  <div class="box box-primary">
      <div class="box-header" align="center">
		<h3 class="box-title" style="padding :5px;  border:1px solid  #808080;font-weight: bold;">
			Event Configuration - New
		</h3>
		
		 <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
           <div id="Success" style="text-align:center;color:blue;font-weight:bold;">${success}</div>
                                	 
		</div>
             <div class="box-body table-responsive">
             <div class="row">
             
             
             <div class="col-lg-12">
  <div class="col-lg-4"></div>
   <div class="col-lg-4"></div>
    <div class="col-lg-4">
             <div class=" col-lg-6" style="padding-left:0px;padding-right: 5px;">
  <%--  <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label style="font-family: Calibri;color: gray;">Status</label>
                        <select class="form-control" id="eventStatus" onchange="">
                             <option value="Active" ${eventMasterData.eventStatus == 'Active' ? 'selected' : ''}>Active</option>
                             <option value="Disabled"  ${eventMasterData.eventStatus == 'Disabled' ? 'selected' : ''}>Disabled</option>  
							</select>
                          
                         </div> --%>
                         </div>
                         <div class=" col-lg-6" style="padding-left:5px;padding-right: 0px;">
 
                     		<label style="font-family: Calibri;color: gray;">Select DPID<span style="color:red; font-size:2">*</span></label>
	                      <input   list="brow" id="dpid" placeholder="Search Outlet">
<datalist id="brow">
 <c:forEach var="location1" items="${locationsList}">
 <option value="${location1}" ${location1 == eventMasterData.outletStoreLocation ? 'selected' : ''} id="${location1}" >${location1}</option>
</c:forEach>
  <!-- <option value="Internet Explorer"> -->

</datalist> 
                         </div>
             </div>
             </div>
             
             
  <div class="col-lg-12" style="width: 98%;
    margin-top: 30px;">
  <div class="col-lg-4">
                           <div class=" col-lg-12">
  
                       <div class="col-lg-12 " style="padding-left:0px;padding-right: 0px;">
                        <label style="font-family: Calibri;color: gray;"><spring:message code="event.name.label"/> <span style="color:red; font-size:2">*</span></label>
                       <input   type="text" class="form-control"   id="eventName" value="${eventMasterData.eventName}" style="width:70%" onkeypress="return (event.charCode > 47 && event.charCode < 58) || (event.charCode > 64 && 
	event.charCode < 91) || (event.charCode > 96 && event.charCode < 123) || (event.charCode == 32 )"  autocomplete="off" onblur="validatetext('eventName');criteria(this);"/>
                          
                         </div>
                         </div>
                         
                          <div class=" col-lg-12">
  
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label style="font-family: Calibri;color: gray;"><spring:message code="event.description.label"/></label>
                       <input   type="text" class="form-control"  id="eventDescription" value="${eventMasterData.eventDescription}" autocomplete="off" onblur="validatetext('eventDescription')"/>
                          
                         </div>
                         </div>
                         
                          <div class=" col-lg-12">
                          <label style="font-family: Calibri;color: gray;">Event Dates <span style="color:red; font-size:2">*</span></label>
                       <div class=" col-lg-12" style="    padding: 0px;">
                       <div class="col-lg-5" style="padding-left:0px;padding-right: 0px;width:45.666667%;">
                       
                       <div class="input-group" style="border:none !important;">
										
										<input   class="form-control" 
											style="background-color: white;cursor: pointer;" name="Eventstart"
											id="Eventstart" size="20" type="text"
											value="${eventMasterData.startDateStr}"
											onfocus="callCalender('Eventstart')"
											onclick="callCalender('Eventstart')" placeholder="DD/MM/YYYY" />
								
									</div>
                          
                         </div>
                          <div class="col-lg-1" style="padding-left:0px;padding-right: 0px;">
                          <label style="font-weight:bold">To</label> 
                          </div>
                         <div class="col-lg-5" style="padding-left:0px;padding-right: 0px;width:45.666667%">
                      
										
										<input   class="form-control" 
											style="background-color: white;cursor: pointer;" name="EventEnd"
											id="EventEnd" size="20" type="text"
											value="${eventMasterData.endDateStr}"
											onfocus="callCalender('EventEnd')"
											onclick="callCalender('EventEnd')" placeholder="DD/MM/YYYY" />
								
									
                          
                         </div>
                         </div>
                         </div>
                         
                          <div class=" col-lg-12" style="margin-top:20px">
  
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label style="font-family: Calibri;color: gray;">ODC Venue Address<span style="color:red; font-size:2">*</span></label>
                       <input   type="text" class="form-control"  id="plotNoODC" onblur="validatetext('plotNoODC')" value="${eventMasterData.odcPlotNumber}" style="width:70%" placeholder="Plot No/Building *" autocomplete="off"/>
                          
                         </div>
                         </div>
                                                   <div class=" col-lg-12">
  
                       <div class="col-lg-12 input-group" style="padding-left:0px;padding-right: 0px;">
                       <input   type="text" class="form-control"  id="locationODC" onblur="validatetext('locationODC')" value="${eventMasterData.outDoorCateringLocation}" placeholder="Location/Area *"  autocomplete="off"/>
                          
                         </div>
                         </div>
                         
                         
                          <div class=" col-lg-12">
  
                      <div class="col-lg-6" style="padding-left:0px">
                       <input   type="text" class="form-control" id="cityODC" onblur="validatetext('cityODC')"  value="${eventMasterData.odcCity}" placeholder="City *"  autocomplete="off"/>
                          
                         </div>
                         <div class="col-lg-6" style="padding-left:0px;padding-right: 0px;">
                       <input   type="number" class="form-control"  id="pinCodeODC" onblur="validatetext('pinCodeODC')" value="${eventMasterData.odcPinCode}"  placeholder="Pin Code * " onblur="validatePINcode1()"  autocomplete="off"/>
                          
                         </div>
                         </div>
                         
                          <div class=" col-lg-12">
  
                      <div class="col-lg-6" style="padding-left:0px;">
                       <input   type="number" class="form-control"  id="phoneODC" value="${eventMasterData.odcContactPersoneMobileNumber}" onblur="validatePersonalMobileNumber()"  placeholder="Phone Number *"  autocomplete="off"/>
                          
                         </div>
                         <div class="col-lg-6" style="padding-left:0px;padding-right: 0px;">
                       <input   type="text" class="form-control"  id="emailODC" value="${eventMasterData.odcContactPersoneEmail}"  placeholder="Email "  autocomplete="off"/>
                          
                         </div>
                         </div>
                         
                          <div class=" col-lg-12">
  
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                       <input   type="text" class="form-control"  id="googlemapODC" value="${eventMasterData.odcLocality}"  placeholder="Google Maps Link"  autocomplete="off"/>
                          
                         </div>
                         </div>
                         
                         
                         
                         
  </div>
  <div class="col-lg-4">
      <div class=" col-lg-12">
  
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label style="font-family: Calibri;color: gray;">Customer Address<span style="color:red; font-size:2">*</span></label>
                       <input   type="text" class="form-control"  id="firmName" onblur="validatetext('firmName')" placeholder="Customer First Name *" value="${eventMasterData.customerName}" style="width:70%"  autocomplete="off"/>
                          
                         </div>
                         </div>
                                                   <div class=" col-lg-12">
  
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                       <input   type="text" class="form-control"  id="location" onblur="validatetext('location')" placeholder="Location/Area *"  value="${eventMasterData.customerLocation}"  autocomplete="off"/>
                          
                         </div>
                         </div>
                         
                         
                          <div class=" col-lg-12">
  
                      <div class="col-lg-6" style="padding-left:0px">
                       <input   type="text" class="form-control"  id="city"  value="${eventMasterData.customerLocationCity}"  placeholder="City *"  autocomplete="off"/>
                          
                         </div>
                         <div class="col-lg-6" style="padding-left:0px;padding-right: 0px;">
                       <input   type="number" class="form-control" id="pincode"  value="${eventMasterData.customerPinCode}"  placeholder="Pin Code *" onblur="validatePINcode()"  autocomplete="off"/>
                          
                         </div>
                         </div>
                         
                       <div class=" col-lg-12">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                       <input   type="text" class="form-control"  id="contactPerson" onblur="validatetext('contactPerson')" value="${eventMasterData.customerName}"  placeholder="Contact Person Name *"  autocomplete="off"/>
                         </div>
                         </div>
                         
                         
                      <div class=" col-lg-12">
                      <div class="col-lg-6" style="padding-left:0px">
                       <input   type="number" class="form-control"  id="phone" value="${eventMasterData.customerMobileNumber}"  onblur="validatePersonalMobileNumber()" placeholder="Phone Number *"  autocomplete="off"/>
                          
                         </div>
                         <div class="col-lg-6" style="padding-left:0px;padding-right: 0px;">
                       <input   type="text" class="form-control" id="Custemail"  value="${eventMasterData.customerEmail}"  placeholder="Email"  autocomplete="off"/>
                          
                         </div>
                         </div>
                         
                        
                     <div class=" col-lg-12">
                      <div class="col-lg-6" style="padding-left:0px">
                       <input   type="text" class="form-control"  id="PANnumber" value="${eventMasterData.customerPanNumber}"  placeholder="PAN Number " onblur="ValidatePAN()"  autocomplete="off"/>
                       </div>
                         <div class="col-lg-6" style="padding-left:0px;padding-right: 0px;">
                       <input   type="text" class="form-control"   id="GSTnumber" value="${eventMasterData.customerGstNumber}"  placeholder="GST Number " onblur="validateGSTIN();"  autocomplete="off"/> 
                      </div>
                     </div>
                           <div class=" col-lg-12" style="margin-bottom:5px">
  
  
                         <div class="col-lg-6" style="padding:0px"> 
                         <spring:message code="customer.newfeedback.emptyspace" />
                         </div>
                          <div class="col-lg-6" style="padding:0px"> 
                          <label style="font-family: Calibri;color: gray;font-size: smaller;">(Maximum 5MB)<span style="color:red; font-size:2">*</span></label>
                         </div>
                   
                      <div class="col-lg-5" style="padding-left:0px">
                       <label style="white-space: nowrap;font-family: Calibri;color: gray;font-size: smaller;    font-weight: bold;">Agreement/Approval:</label>
                       </div>
                       <div class="col-lg-1" style="padding-left:0px;padding-right:0px">
                       <input   type="checkbox" id="aggrement" name="aggrement" value="aggrement" onchange="aggrementUpload();">
                          
                         </div>
                         
                         <div class="col-lg-5" style="padding-left:0px;padding-right: 0px;">
                        
                        		        <div class="fileUpload btn btn-primary browsebutton signatureBtn" style="font-weight: bold;pointer-events:none;background:#757879">
			    			        <span style="font-size:13px;">Upload.....</span>
			    			         <input   id="signatureBtn" type="file"  onchange="addNameToTextBox('signature',this);FilevalidationsignatureBtn();" class="upload">
						             <input   type="hidden" id="signature_refId" value="${agreementDocId.agreementDocId}"> 
						               <input   type="hidden" id="signatureFile" value="${agreementDoc.agreementDoc}">  
						               
						                </div>
						              
                          
                         </div>
                         <div class="col-lg-1" style="padding-left:0px;padding-right:0px">
                         
								<img style="width: 30px;height: 30px;display: none;margin-left: 25px" id="skuMasterImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						  	
                         </div>
                         
                         </div>
                           <div class=" col-lg-12">
  
                      <div class="col-lg-12" style="padding:0px">
                         <select class="form-control" id="eventType" >
                               <option style="color: lightgray;"  value="" ${'' == eventMasterData.eventType ? 'selected' : ''}>Select Event Type</option>
                           		<option value="Corporate events" ${'Corporate events' == eventMasterData.eventType ? 'selected' : ''}>Corporate events</option>
								<option value="Weddings" ${'Weddings' == eventMasterData.eventType ? 'selected' : ''}>Weddings</option>
								<option value="Cricket" ${'Cricket' == eventMasterData.eventType ? 'selected' : ''}>Cricket</option>
								<option value="Sports" ${'Sports' == eventMasterData.eventType ? 'selected' : ''}>Sports</option>
								<option value="Music shows" ${'Music shows' == eventMasterData.eventType ? 'selected' : ''}>Music shows</option>
								<option value="Festive events" ${'Festive events' == eventMasterData.eventType ? 'selected' : ''}>Festive events</option>
								<option value="Spiritual events" ${'Spiritual events' == eventMasterData.eventType ? 'selected' : ''}>Spiritual events</option>
								<option value="Education institute events" ${'Education institute events' == eventMasterData.eventType ? 'selected' : ''}>Education institute events</option>
								<option value="Schools" ${'Schools' == eventMasterData.eventType ? 'selected' : ''}>Schools</option>
								<option value="Exhibitions" ${'Exhibitions' == eventMasterData.eventType ? 'selected' : ''}>Exhibitions</option>
											 
	                           
	                        </select>
                          
                         </div>
                        
                         </div>
                           <div class=" col-lg-12">
  
                      <div class="col-lg-6" style="padding-left:0px">
                       <select class="form-control" id="DiscountType"  onchange="replacePlaceHolder();">
                              <option style="color: lightgray;"  value="" ${'' == eventMasterData.discountType ? 'selected' : ''}>Select Discount Type</option>
                           		 <option value="Fixed Rental" ${'Fixed Rental' == eventMasterData.discountType ? 'selected' : ''}>Fixed Rental</option>
									<option value="Revenue Sharing" ${'Revenue Sharing' == eventMasterData.discountType ? 'selected' : ''}>Revenue Sharing</option>
									<option value="Discount" ${'Discount' == eventMasterData.discountType ? 'selected' : ''}>Discount</option>
									<option value="Pizza Free" ${'Pizza Free' == eventMasterData.discountType ? 'selected' : ''}>Pizza Free</option>
	                           
	                        </select>
                          
                          
                         </div>
                         <div class="col-lg-6" style="padding-left:0px;padding-right: 0px;">
                       
                       <select class="form-control" id="paymentModeDiscount" onchange="appendbankdata();" style="display:none">
						  <option style="color: lightgray;"  value="">Select Payment Type</option>
						   <c:forEach var="tendersList" items="${tenderDetails}"  varStatus="theCount">
						<option value="${tendersList.tenderName}-${tendersList.modeOfPayment}" >${tendersList.tenderName}</option>
						   </c:forEach>
						</select>  
						
<%-- 				        <input   type="number" onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57"   min="0" class="form-control"  id="discountValue" value="${eventMasterData}"  placeholder="Discount Value *"  autocomplete="off" />
 --%>						     
                                             <input type="number" min="0"  step="any" class="form-control"  id="discountValue" onblur="setTwoNumberDecimal(this);percentageRestriction();" value="${eventMastersList.discountAmount}"  placeholder="Discount Value"/>

                       
                         </div>
                         
                        
                         </div>
                         
                          <div class="col-lg-12"  >
                          
                            <div class="col-lg-6" style="padding-left:0px;display:none" id="discontamountrefernce" >
                            <input   type="number" onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57"   min="0" class="form-control"  id="discountValue1" value="${eventMasterData}"  placeholder="Rental value *"  onblur="paymentmodeRestriction();LimitAmountDiscount();"
 autocomplete="off"/>
                            
                            
                            </div>
                          
                           <div class="col-lg-6" style="padding-left:0px;padding-right: 0px;display:none" id="discontbankrefernce"> 
                          <div class="col-lg-6" style="padding-left:0px;padding-right: 0px;">
                         <input   type="text" class="form-control" id="discontreferncebank"  value="${eventMasterData.paymentMode}"  placeholder="Bank *" onkeyup="paymentmodeRestriction();"  autocomplete="off"/>
                          
                          </div>
                          
                          <div class="col-lg-6" style="padding-left:1px;padding-right: 0px;">
                        <input   type="text" class="form-control" id="discontrefernceref"  value="${eventMasterData.paymentReference}"  placeholder="Ref No *" onkeyup="paymentmodeRestriction();"  autocomplete="off"/>
                         
                          </div>
                          </div>
                        </div>
                         
                         
                         
                           <div class=" col-lg-12">
                            <div class="col-lg-6" style="padding:0px"> 
                         <spring:message code="customer.newfeedback.emptyspace" />
                         </div>
                          <div class="col-lg-6" style="padding:0px"> 
                          <label style="font-family: Calibri;color: gray;font-size: smaller;" id="maxsize">(Maximum 5MB)<span style="color:red; font-size:2">*</span></label>
                         </div>
  
                      <div class="col-lg-6" style="padding-left:0px">
						<select class="form-control" id="saleType"  onchange="saletyperestriction()">
						  <option style="color: lightgray;"  value="" ${'' == eventMasterData.saleType ? 'selected' : ''}>Select Sale Type</option>
						<option value="Total Credit" ${'Total Credit' == eventMasterData.saleType ? 'selected' : ''}>Total Credit</option>
						<option value="Total Advance" ${'Total Advance' == eventMasterData.saleType ? 'selected' : ''}>Total Advance</option>
						<option value="Partial Credit" ${'Partial Credit' == eventMasterData.saleType ? 'selected' : ''}>Partial Credit</option>
						</select>                          
                         </div>
                        <div class="col-lg-6" id="Approvalfilebutton" style="padding-left:0px;padding-right: 0px;">
                       
                        <div class="col-lg-10" style="padding-left:0px;padding-right: 0px;" id="Approvalfilebutton">
                        <div class="fileUpload btn btn-primary browsebutton" style="font-weight: bold;">
			    			        <span style="font-size: 9px;">Upload Approval</span>
			    			         <input   id="signature1Btn" type="file"  onchange="addNameToTextBox('signature1',this);Filevalidationsignature1Btn();" class="upload">
						           <input   type="hidden" id="signature1_refId" value="${eventMasterData.agreementDoc2Id}"> 
						               <input   type="hidden" id="signature1File" value="${eventMasterData.agreementDoc3}">  
						               
						           
						            </div>
                          
                         </div>
                          <div class="col-lg-2" style="padding-left:0px;padding-right:0px">
                         
								<img style="width: 30px;height: 30px;margin-left: 25px;display: none" id="skuMasterImg1" src="${pageContext.request.contextPath}/images/circleWait.gif">
						  	 
                         </div>
                         </div>
                         </div>
                           <div class=" col-lg-12" id="paymentDiv">
  
                      <div class="col-lg-6" style="padding-left:0px">
						<select class="form-control" id="paymentMode">
						  <option style="color: lightgray;"  value="">Select Payment Type</option>
						   <c:forEach var="tendersList" items="${tenderDetails}"  varStatus="theCount">
						<option value="${tendersList.tenderName}-${tendersList.modeOfPayment}" >${tendersList.tenderName}</option>
						   </c:forEach>
						</select>                          
                         </div>
                         
                        <div class="col-lg-5" style="padding-left:0px;padding-right: 0px;">
                       <input   type="number" class="form-control"  onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57"   min="0" id="amount" value=""  placeholder="Amount" oninput="LimitAmount()"  autocomplete="off"/>
                        </div>
                          <div class="col-lg-1" style="padding-left:0px;padding-right: 0px;">
                         <img src="${pageContext.request.contextPath}/images/bulewhiteplusicon.png"
											alt="" style="width: 100px;margin-bottom: 5px;" onclick="appendPayments();" />
                         </div>
                         
                         
                         
                         </div>
                         
                        <div class=" col-lg-12 paymentListsData" id="" style="">
                          
                        </div>
                        
                        
                        <div class=" col-lg-12 " id="Eventduedate" style="display: none;">
                           <div class="input-group" style="border:none !important">
										
										<input   class="form-control" 
											style="background-color: white;cursor: pointer;" name="Eventdue"
											id="Eventdue" size="20" type="text"
											value="${eventMasterData.dueDateStr}"
											onfocus="callCalender('Eventdue')"
											onclick="callCalender('Eventdue')" placeholder="DD/MM/YYYY" />
								
									</div>
                          
                        </div>
                        
                          
                          
                        
                          <div class=" col-lg-12 " id="paymentListPaymentModeNone" style="display:none">
                          
                           <div class="col-lg-6" style="padding-left:0px">
						   <input   type="text" class="form-control "  id="paymentModesAddedPaymentModeNone" value=""  placeholder="" readonly="readonly"  autocomplete="off"/>
						                       
                         </div>
                         
                        <div class="col-lg-5" style="padding-left:0px;padding-right: 0px;">
                       <input   type="number" class="form-control"  id="amountsPaymentModeNone" value=""  placeholder="" readonly="readonly"  autocomplete="off"/>
                        </div>
                        
                          <input   type="hidden" class="form-control"  id="cardTypesPaymentModeNone" value=""  placeholder="" />
                          <input   type="hidden" class="form-control"  id="tenderKeysPaymentModeNone" value=""  placeholder="" />
                          <input   type="hidden" class="form-control"  id="tenderCodesPaymentModeNone" value=""  placeholder="" />
                     
                       <div class="col-lg-1" style="padding-left:0px;padding-right: 0px;">
                        <img id="ImgPaymentModeNone"  src="${pageContext.request.contextPath}/images/itemdelete.png" style="width:100%;cursor:pointer;margin-top: 8px;" onclick="deletePayments(this);" title="Delete"/>
                          </div>
                      <div class="col-lg-6" style="padding-left:0px;display:none" id="chequeBasedbankPaymentModeNone">
                         <input   type="text" class="form-control" id="BankNamePaymentModeNone"  value=""  placeholder="Bank *"  autocomplete="off"/>
                          
                         </div>
                         
                        <div class="col-lg-5" style="padding-left:0px;padding-right: 0px;display:none" id="chequeBasedPaymentModeNone">
                        
                        <input   type="text" class="form-control" id="BankreferncerefPaymentModeNone"  value=""  placeholder="Ref No *"  autocomplete="off"/>
                        
                        </div>
                     
                     
                     
                     
                    
                          </div>
				  </div>
				  <div class="col-lg-4">
				   <div class=" col-lg-12">
				   <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label style="font-family: Calibri;color: gray;">Sales Details<span style="color:red; font-size:2">*</span></label>
                       <input type="text" class="form-control" id="salespersonID" onblur="validatetext('salespersonID')"  value="${sessionScope.firstName}"  placeholder="Employee Name * "  autocomplete="off"/>
                        
                        
                         </div>
                         </div>
                         <div class=" col-lg-12">
                          <input   type="text" class="form-control" id="leadChannel" onblur="validatetext('leadChannel')"  value=""  placeholder="Lead Channel"  autocomplete="off"/>
  
                     
                         </div>
                         <div class=" col-lg-12">
  
                      <div class="col-lg-6" style="padding-left:0px">
                       <input   class="form-control" 
											style="background-color: white;cursor: pointer;" name="Date"
											id="Date" size="20" type="text"
											value="${eventMasterData.createdDateStr}"
											onfocus="callCalender('Date')"
											onclick="callCalender('Date')" placeholder="DD/MM/YYYY"  />
                          
                         </div>
                         <div class="col-lg-4" style="padding-left:0px;padding-right: 0px;">
                        
                         <select class="form-control" id="taxpersentage" onchange="displaytaxDesc();">
                          <option value="">Select Tax %</option>
						 <option value="5" ${eventMasterData.taxPercentage == "5.0" ? 'selected' : ''}  >5%</option>
						  <option value="18" ${eventMasterData.taxPercentage == "18.0" ? 'selected' : ''}  >18%</option>
						 		
						</select>   
                          
                         </div>
                           <div class="col-lg-1" style="padding-left: 3%">
                         <i class="fa fa-info-circle" aria-hidden="true" id="taxdescempty" title="Tax Percentage" style="cursor: pointer; font-size: large; margin-top: 4px;"></i>
                         <i class="fa fa-info-circle" aria-hidden="true" id="taxdesc5" title="5% - ODC at Standalone or within hotel having room tariff is < INR 7500" style="cursor: pointer; font-size: large; margin-top: 4px;display:none"></i>
                          <i class="fa fa-info-circle" aria-hidden="true" id="taxdesc18" title="18% - ODC within hotel having room tariff is >=  INR 7500" style="cursor: pointer; font-size: large; margin-top: 4px;display:none"></i>
                         
                         </div>
                         </div>
                         <div class=" col-lg-12">
  
                      <div class="col-lg-6" style="padding-left:0px">
                       <input   type="number" class="form-control" onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57"   min="0"  id="manpower" value="${eventMasterData.manPower}"  placeholder="Man power *"  autocomplete="off"/>
                          
                         </div>
                         <div class="col-lg-6" style="padding-left:0px;padding-right: 0px;">
                       <input   type="number" class="form-control" onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57"   min="0"   id="countersRequired" value="${eventMasterData.countersRequired}"  placeholder="Counters Required *"  autocomplete="off"/>
                          
                         </div>
                         </div>
                       
                         <div class=" col-lg-12">
  
                        <textarea rows="3" cols="3" id="remarks" onblur="validatetext('remarks')" class="form-control" style="resize: none;" placeholder="Comments">${eventMasterData.termsAndConditions}</textarea>
                         </div>
                         <div class=" col-lg-12">
                         </div>
                         <div class=" col-lg-12">
                         </div>
                         
                         <div class=" col-lg-12">
  
                      <div class="col-lg-6" style="padding-left:0px">
                       <input   type="number" class="form-control" onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57"   min="0"  id="expectedsales"  value="${eventMasterData.expectedSales}"  placeholder="Expected Sale *"  autocomplete="off"/>
                          
                         </div>
                         <div class="col-lg-6" style="padding-left:0px;padding-right: 0px;">
                       <input   type="number" class="form-control" onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57"   min="0" id="proft"  value="${eventMasterData.profit}"  placeholder="Profit *"  autocomplete="off" onblur="profitrestrict()"/>
                          
                         </div>
                         </div>
                         <div class=" col-lg-12">
                         
                          <div class="col-lg-12" style="padding:0px"> 
                          <label style="font-family: Calibri;color: gray;font-size: smaller;">(Maximum 5MB)<span style="color:red; font-size:2">*</span></label>
                         </div>
                          
                          <div class="col-lg-5" style="padding-left:0px;padding-right:0px">
                          <div class="fileUpload btn btn-primary browsebutton" style="font-weight: bold;">
			    			        <span style="font-size: 10px;">Upload P&L</span>
			    			         <input   id="signature2Btn" type="file"  onchange="addNameToTextBox('signature2',this);" class="upload">
						              <input   type="hidden" id="signature2_refId" value="${eventMasterData.agreementDoc3Id}"> 
						               <input   type="hidden" id="signature2File" value="${eventMasterData.agreementDoc3}">  
						                </div>
						                </div>
						                 <div class="col-lg-1" style="padding-left:0px;padding-right:0px">
                         
                         <img style="width: 30px;height: 30px;margin-left: 15px" id="pandltestexcel"  onclick="downloadPandLtemplate('${sessionScope.customerId}')"  src="${pageContext.request.contextPath}/images/xlsblue.png">
								<img style="width: 30px;height: 30px;display: none;margin-left: 15px" id="skuMasterImg2" src="${pageContext.request.contextPath}/images/circleWait.gif">
						  	
                         </div>
                           <div class="col-lg-6" style="padding:0px"> 
                         </div>
						                </div>
                         
  </div>
  
  </div>
  
  
  
  </div>
                    <div class="row" style="text-align: right; margin-right: 25px;margin-top:50px">
							
							 <input   type="button" class="btnCls" style="padding: 4px 12px; !important" onclick="validateEventManagement('draft')" value="Save" /> 
							
							 <c:forEach var="accessControl" items="${sessionScope.eventmanagementActivity}" varStatus="theCount">
	<c:if test="${accessControl.appDocument == 'EventConfigure' && accessControl.appDocumentActivity == 'Submitted' && accessControl.activityRead == true}"> 
<input   type="button" class="btnCls" style="padding: 4px 12px; !important" onclick="validateEventManagement('new')" value="<spring:message code="submit.label" />" />   
 </c:if>
	</c:forEach>	
					
							 <input   type="button" class="btnCls" style="padding: 4px 12px; !important" onclick="viewEventsManagement('outletEvents','0')" value="Back" /> 
							 
							
						</div>    
                    </div>
                     </div>
                    


<div class="col-lg-8"></div>
                       <div class="col-lg-4" style="padding-right: 0px; text-align: right;" >
            
              </div>
             
              	


  
</div>
</div>
</section>
        <input   type="hidden" id="deleteActionLabel" value="<spring:message code="receiptstock.label" />"/>
</body>
</html>