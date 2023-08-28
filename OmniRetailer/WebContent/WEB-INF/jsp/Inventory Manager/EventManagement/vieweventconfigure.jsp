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
    padding: 2px 20px;
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
</style>
<script type="text/javascript">

$(document).ready(function(){
	debugger;
	callCalender('Eventstart');
	callCalender('EventEnd');
	callCalender('Date');
	
	var agreement = $("#signatureFile").val();
	
	
	if($("#saleType").val() =="Total Advance")
		$("#Approvalfilebutton").css("display","none");
	
	if($("#DiscountType").val() =="Fixed Rental"){
	$("#discontamountrefernce").css("display","block");
	$("#discontbankrefernce").css("display","block");
	
	
	
	

	
	}
	saletyperestriction();
	replacePlaceHolder();
	displaytaxDesc();
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
			${eventMastersList.eventReference} - Event Details
		</h3>
		
		 <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
           <div id="Success" style="text-align:center;color:blue;font-weight:bold;">${success}</div>
                                	 
		</div>
             <div class="box-body table-responsive" style="pointer-events:none">
             <div class="row">
             
             
             <div class="col-lg-12">
  <div class="col-lg-4"></div>
   <div class="col-lg-4"></div>
    <div class="col-lg-4">
 
             <div class=" col-lg-6" style="padding-left:0px;padding-right: 5px;">
   <%-- <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label style="font-family: Calibri;color: gray;">Status</label>
                        <select class="form-control" id="eventStatus" onchange="">
                             <option value="Active"  ${eventMastersList.eventStatus == 'Active' ? 'selected' : ''}>Active</option>
                             <option value="Disabled"  ${eventMastersList.eventStatus == 'Disabled' ? 'selected' : ''}>Disabled</option>  
							</select> 
                          
                         </div> --%>
                         </div>
                         <div class=" col-lg-6" style="margin-left: 42%;">
                     		<label style="font-family: Calibri;color: gray;">Select DPID</label>
                     		<input type="text" class="form-control"  id="dpid" disabled="disabled" value="${eventMastersList.outletStoreLocation }"/>
                       
	                        <%--  <select class="form-control" id="dpid" onchange="" disabled="disabled">
	                        
                               <c:forEach var="location1" items="${locationsList}">
				                <option value="${location1}" ${location1 == eventMastersList.outletStoreLocation ? 'selected' : ''} id="${location1}" >${location1}</option>
								</c:forEach>
							</select> --%>
                         </div>
             </div>
             </div>
             
             
  <div class="col-lg-12" style="width: 98%;
    margin-top: 30px;">
  <div class="col-lg-4">
                           <div class=" col-lg-12">
  
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label style="font-family: Calibri;color: gray;"><spring:message code="event.name.label"/> <span style="color:red; font-size:2">*</span></label>
                       <input type="text" class="form-control"   id="eventName" value="${eventMastersList.eventName}" style="width:70%"/>
                          
                         </div>
                         </div>
                         
                          <div class=" col-lg-12">
  
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label style="font-family: Calibri;color: gray;"><spring:message code="event.description.label"/></label>
                       <input type="text" class="form-control"  id="eventDescription" value="${eventMastersList.eventDescription}"/>
                          
                         </div>
                         </div>
                         
                          <div class=" col-lg-12">
                          <label style="font-family: Calibri;color: gray;">Event Dates <span style="color:red; font-size:2">*</span></label>
                       <div class=" col-lg-12" style="    padding: 0px;">
                       <div class="col-lg-5" style="padding-left:0px;padding-right: 0px;width:45.666667%;">
                       
                       <div class="input-group" style="border:none !important;">
										
										<input class="form-control" readonly="readonly"
											style="background-color: white;" name="Eventstart"
											id="Eventstart" size="20" type="text"
											value="${eventMastersList.startDateStr}"
											onfocus="callCalender('Eventstart')"
											onclick="callCalender('Eventstart')" placeholder="DD/MM/YYYY" />
								<div class="input-group-addon" style="border:none">
											<i class="fa fa-calendar"></i>
										</div>
									</div>
                          
                         </div>
                          <div class="col-lg-1" style="padding-left:0px;padding-right: 0px;">
                          <label style="font-weight:bold">To</label> 
                          </div>
                         <div class="col-lg-5" style="padding-left:0px;padding-right: 0px;width:45.666667%">
                       <div class="input-group" style="border:none !important">
										
										<input class="form-control" readonly="readonly"
											style="background-color: white;" name="EventEnd"
											id="EventEnd" size="20" type="text"
											value="${eventMastersList.endDateStr}"
											onfocus="callCalender('EventEnd')"
											onclick="callCalender('EventEnd')" placeholder="DD/MM/YYYY" />
								<div class="input-group-addon" style="border:none">
											<i class="fa fa-calendar"></i>
										</div>
									</div>
                          
                         </div>
                         </div>
                         </div>
                         
                          <div class=" col-lg-12" style="margin-top:20px">
  
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label style="font-family: Calibri;color: gray;">ODC Venue Address<span style="color:red; font-size:2">*</span></label>
                       <input type="text" class="form-control"  id="plotNoODC" value="${eventMastersList.odcPlotNumber}" style="width:70%" placeholder="Plot No/Building"/>
                          
                         </div>
                         </div>
                                                   <div class=" col-lg-12">
  
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                       <input type="text" class="form-control"  id="locationODC" value="${eventMastersList.outDoorCateringLocation}" placeholder="Location/Area" />
                          
                         </div>
                         </div>
                         
                         
                          <div class=" col-lg-12">
  
                      <div class="col-lg-6" style="padding-left:0px">
                       <input type="text" class="form-control" id="cityODC"  value="${eventMastersList.odcCity}" placeholder="City"/>
                          
                         </div>
                         <div class="col-lg-6" style="padding-left:0px;padding-right: 0px;">
                       <input type="number" onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57"   min="0" class="form-control"  id="pinCodeODC" value="${eventMastersList.odcPinCode}"  placeholder="Pin Code"/>
                          
                         </div>
                         </div>
                         
                          <div class=" col-lg-12">
  
                      <div class="col-lg-6" style="padding-left:0px;">
                       <input type="number" onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57"   min="0" class="form-control"  id="phoneODC" value="${eventMastersList.odcContactPersoneMobileNumber}" onblur="validatePersonalMobileNumber()"  placeholder="Phone Number"/>
                          
                         </div>
                         <div class="col-lg-6" style="padding-left:0px;padding-right: 0px;">
                       <input type="text" class="form-control"  id="emailODC" value="${eventMastersList.odcContactPersoneEmail}"  placeholder="Email"/>
                          
                         </div>
                         </div>
                         
                          <div class=" col-lg-12">
  
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                       <input type="text" class="form-control"  id="googlemapODC" value="${eventMastersList.odcLocality}"  placeholder="Google Maps Link"/>
                          
                         </div>
                         </div>
                         
                         
                         
                         
  </div>
  <div class="col-lg-4">
      <div class=" col-lg-12">
  
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label style="font-family: Calibri;color: gray;">Customer Address<span style="color:red; font-size:2">*</span></label>
                       <input type="text" class="form-control"  id="firmName" placeholder="Firm/Individual Name" value="${eventMastersList.customerName}" style="width:70%"/>
                          
                         </div>
                         </div>
                                                   <div class=" col-lg-12">
  
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                       <input type="text" class="form-control"  id="location" placeholder="Location/Area"  value="${eventMastersList.customerLocation}"/>
                          
                         </div>
                         </div>
                         
                         
                          <div class=" col-lg-12">
  
                      <div class="col-lg-6" style="padding-left:0px">
                       <input type="text" class="form-control"  id="city"  value="${eventMastersList.customerLocationCity}"  placeholder="City"/>
                          
                         </div>
                         <div class="col-lg-6" style="padding-left:0px;padding-right: 0px;">
                       <input type="number" onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57"   min="0" class="form-control" id="pincode"  value="${eventMastersList.customerPinCode}"  placeholder="Pin Code"/>
                          
                         </div>
                         </div>
                         
                       <div class=" col-lg-12">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                       <input type="text" class="form-control"  id="contactPerson" value="${eventMastersList.customerName}"  placeholder="Contact Person Name"/>
                         </div>
                         </div>
                         
                         
                      <div class=" col-lg-12">
                      <div class="col-lg-6" style="padding-left:0px">
                       <input type="number" onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57"   min="0" class="form-control"  id="phone" value="${eventMastersList.customerMobileNumber}"  onblur="validatePersonalMobileNumber()" placeholder="Phone Number"/>
                          
                         </div>
                         <div class="col-lg-6" style="padding-left:0px;padding-right: 0px;">
                       <input type="text" class="form-control" id="Custemail"  value="${eventMastersList.customerEmail}"  placeholder="Email"/>
                          
                         </div>
                         </div>
                         
                        
                     <div class=" col-lg-12">
                      <div class="col-lg-6" style="padding-left:0px">
                       <input type="text" class="form-control"  id="PANnumber" value="${eventMastersList.customerPanNumber}"  placeholder="PAN Number"/>
                       </div>
                         <div class="col-lg-6" style="padding-left:0px;padding-right: 0px;">
                       <input type="text" class="form-control"   id="GSTnumber" value="${eventMastersList.customerGstNumber}"  placeholder="GST Number"/> 
                      </div>
                     </div>
                           <div class=" col-lg-12" style="margin-bottom:5px">
  
                      <div class="col-lg-5" style="padding-left:0px">
                       <label style="white-space: nowrap;font-family: Calibri;color: gray;font-size: smaller;    font-weight: bold;">Agreement/Approval</label>
                       </div>
                        
                       <div class="col-lg-1" style="padding-left:0px;padding-right:0px">
                       <input type="checkbox" id="aggrement" name="aggrement" value="aggrement" onchange="aggrementUpload();">
                          
                         </div>
                         
                        
                         
                         <div class="col-lg-5" style="padding-left:0px;padding-right: 0px;">
                        
                        		        <div class="fileUpload btn btn-primary browsebutton signatureBtn" style="font-weight: bold;pointer-events:none;background:#757879">
			    			        <span style="font-size:9px;">Upload..............</span>
			    			         <input id="signatureBtn" type="file"  onchange="addNameToTextBox('signature',this);" class="upload">
						             <input type="hidden" id="signature_refId" value=""> 
						               <input type="hidden" id="signatureFile" value="${eventMastersList.doc1}">  
						               <input type="hidden" id="signature_refIdLoad" value="${eventMastersList.agreementDoc}">
						                </div>
						              
                          
                         </div>
                          
                         
                         <c:if test="${eventMastersList.doc1 != '' && eventMastersList.doc1 != null}">
                           <div class="col-lg-1" style="padding-left:0px;padding-right: 0px;pointer-events:all;cursor: pointer;">
                         <img src="${pageContext.request.contextPath}/images/downloadicon.png"
											alt="" style="width: 100px;margin-bottom: 5px;" id="skuMasterImgDownload" onclick="openDoc('1');" />
						<img style="width: 30px;height: 30px;display:none" id="skuMasterImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						
                         </div>
                       
                         </c:if>
                         </div>
                           <div class=" col-lg-12">
  
                      <div class="col-lg-12" style="padding:0px">
                         <select class="form-control" id="eventType" >
                           <option value="" ${eventMastersList.eventType == '' ? 'selected' : ''}>Select Event Type</option>
                         <option value="Corporate events" ${eventMastersList.eventType == 'Corporate events' ? 'selected' : ''}>Corporate events</option>
						<option value="Weddings" ${eventMastersList.eventType == 'Weddings' ? 'selected' : ''}>Weddings</option>
						<option value="Cricket" ${eventMastersList.eventType == 'Cricket' ? 'selected' : ''} >Cricket</option>
						<option value="Sports" ${eventMastersList.eventType == 'Sports' ? 'selected' : ''}>Sports</option>
						<option value="Music shows" ${eventMastersList.eventType == 'Music shows' ? 'selected' : ''} >Music shows</option>
							<option value="Festive events" ${eventMastersList.eventType == 'Festive events' ? 'selected' : ''}>Festive events</option>
						<option value="Spiritual events" ${eventMastersList.eventType == 'Spiritual events' ? 'selected' : ''} >Spiritual events</option>
							<option value="Education institute events" ${eventMastersList.eventType == 'Education institute events' ? 'selected' : ''}>Education institute events</option>
						<option value="Schools" ${eventMastersList.eventType == 'Schools' ? 'selected' : ''} >Schools</option>
							<option value="Weddings" ${eventMastersList.eventType == 'Weddings' ? 'selected' : ''}>Weddings</option>
						<option value="Schools" ${eventMastersList.eventType == 'Schools' ? 'selected' : ''} >Schools</option>
							
	                        </select>
                          
                         </div>
                        
                         </div>
                           <div class=" col-lg-12">
  
                      <div class="col-lg-6" style="padding-left:0px">
                       <select class="form-control" id="DiscountType" onchange="replacePlaceHolder();">
                                    <option value="" ${eventMastersList.discountType == '' ? 'selected' : ''}>Select Discount Type</option>
                           		    <option value="Fixed Rental" ${eventMastersList.discountType == 'Fixed Rental' ? 'selected' : ''}>Fixed Rental</option>
									<option value="Revenue Sharing" ${eventMastersList.discountType == 'Revenue Sharing' ? 'selected' : ''}>Revenue Sharing</option>
									<option value="Discount" ${eventMastersList.discountType == 'Discount' ? 'selected' : ''}>Discount</option>
									<option value="Pizza Free" ${eventMastersList.discountType == 'Pizza Free' ? 'selected' : ''}>Pizza Free</option>
	                           
	                        </select>
                          
                          
                         </div>
                         <div class="col-lg-6" style="padding-left:0px;padding-right: 0px;">
                       
                         <select class="form-control" id="paymentModeDiscount" onchange="appendbankdata();" style="display:none">
						  <option value="">Select Payment Type</option>
						   <c:forEach var="tendersList" items="${tenderDetails}"  varStatus="theCount">
						<option value="${tendersList.tenderName}-${tendersList.modeOfPayment}" >${tendersList.tenderName}</option>
						   </c:forEach>
						</select>  
                       <input type="number" onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57"   min="0" class="form-control"  id="discountValue" value="${eventMastersList.discountAmount}"  placeholder="Discount Value"/>
                       
                         </div>
                         </div>
                         
                          <div class="col-lg-12"  >
                          
                            <div class="col-lg-6" style="padding-left:0px;display:none" id="discontamountrefernce" >
                          
                         
                            <input type="number" onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57"   min="0" class="form-control"  id="discountValue1" value="${eventMastersList.discountAmount}"  placeholder="Discount Value *" onkeyup="paymentmodeRestriction();"/>
                            
                            
                            </div>
                          
                           <div class="col-lg-6" style="padding-left:0px;padding-right: 0px;display:none" id="discontbankrefernce"> 
                          <div class="col-lg-6" style="padding-left:0px;padding-right: 0px;">
                         <input type="text" class="form-control" id="discontreferncebank"  value="${eventMastersList.paymentMode}"  placeholder="Bank *"/>
                          
                          </div>
                          
                          <div class="col-lg-6" style="padding-left:1px;padding-right: 0px;">
                        <input type="text" class="form-control" id="discontrefernceref"  value="${eventMastersList.paymentReference}"  placeholder="Ref No *"/>
                         
                          </div>
                          </div>
                        </div>
                         
                         
                         
                           <div class=" col-lg-12">
  
                      <div class="col-lg-6" style="padding-left:0px">
						<select class="form-control" id="saleType"  onchange="saletyperestriction()">
						 <option value="" ${eventMastersList.saleType == '' ? 'selected' : ''}>Select Sale Type</option>
						<option value="Total Credit" ${eventMastersList.saleType == 'Total Credit' ? 'selected' : ''}>Total Credit</option>
						<option value="Total Advance" ${eventMastersList.saleType == 'Total Advance' ? 'selected' : ''}>Total Advance</option>
						<option value="Partial Credit" ${eventMastersList.saleType == 'Partial Credit' ? 'selected' : ''}>Partial Credit</option>
						</select>                          
                         </div>
                        <div class="col-lg-6" id="Approvalfilebutton" style="padding-left:0px;padding-right: 0px;">
                        <div class="col-lg-10" style="padding-left:0px;padding-right: 0px;" >
                        <div class="fileUpload btn btn-primary browsebutton" style="font-weight: bold;">
			    			        <span style="font-size: 9px;">Upload Approval</span>
			    			         <input id="signature1Btn" type="file"  onchange="addNameToTextBox('signature1',this);" class="upload">
						           <input type="hidden" id="signature1_refId" value=""> 
						               <input type="hidden" id="signature1File" value="${eventMastersList.doc2}"> 
						               <input type="hidden" id="signature1_refIdLoad" value="${eventMastersList.agreementDoc2}">
						              
						               
						           
						            </div>
                          
                         </div>
                        
                         <c:if test="${eventMastersList.doc2 != '' && eventMastersList.doc2 != null}">
                           <div class="col-lg-2" style="padding-left:0px;padding-right: 0px;pointer-events:all;cursor: pointer;">
                         <img src="${pageContext.request.contextPath}/images/downloadicon.png"
											alt="" style="width: 100px;margin-bottom: 5px;" id="skuMasterImg1Download" onclick="openDoc('2');" />
                        
                        
						<img style="width: 30px;height: 30px;display:none" id="skuMasterImg1" src="${pageContext.request.contextPath}/images/circleWait.gif">
						    
                         </div>
                       
                         </c:if>
                         </div>
                         
                         </div>
                           <div class=" col-lg-12" id="paymentDiv">
  
                      <div class="col-lg-6" style="padding-left:0px">
						<select class="form-control" id="paymentMode">
						   <c:forEach var="tendersList" items="${tenderDetails}"  varStatus="theCount">
						<option value="${tendersList.tenderName}-${tendersList.modeOfPayment}-${tendersList.tenderCode}-${tendersList.tenderKey}" ${eventMastersList.paymentMode == tendersList.tenderName ? 'selected' : ''}>${tendersList.tenderName}</option>
						   </c:forEach>
						</select>                          
                         </div>
                         
                        <div class="col-lg-5" style="padding-left:0px;padding-right: 0px;">
                       <input type="number" onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57"   min="0" class="form-control"  id="amount" value="${eventMastersList.totalAmount}"  placeholder="Amount" oninput="LimitAmount()"/>
                        </div>
                          <div class="col-lg-1" style="padding-left:0px;padding-right: 0px;">
                         <img src="${pageContext.request.contextPath}/images/bulewhiteplusicon.png"
											alt="" style="width: 100px;margin-bottom: 5px;" onclick="appendPayments();" />
                         </div>
                         </div>
                         
                         
                         <div class=" col-lg-12 paymentListsData" id="" style="">
                         
                         
                     <c:forEach var="eventspayments" items="${eventMastersPaymentsList}"  varStatus="theCount">
                         <div class="paymentList" id="paymentList${theCount.count}" style="height: 35px;">
                          <div class="col-lg-6" style="padding-left:0px">
						   <input type="text" class="form-control paymentMode"  id="paymentModesAdded${theCount.count}" value="${eventspayments.modeOfPayment}"  placeholder="" readonly="readonly"/>
						                       
                         </div>
                         
                        <div class="col-lg-5" style="padding-left:0px;padding-right: 0px;">
                       <input type="number" onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57"   min="0" class="form-control"  id="amounts${theCount.count}" value="${eventspayments.paidAmount}"  placeholder="" readonly="readonly"/>
                        </div>
                        
                          <input type="hidden" class="form-control"  id="cardTypes${theCount.count}" value="${eventspayments.cardType}"  placeholder="" readonly="readonly"/>
                            <input type="hidden" class="form-control"  id="tenderKeys${theCount.count}" value="${eventspayments.tenderKey}"  placeholder="" readonly="readonly"/>
                            <input type="hidden" class="form-control"  id="tenderCodes${theCount.count}" value="${eventspayments.tenderMode}"  placeholder="" />
                          
                           <div class="col-lg-1" style="padding-left:0px;padding-right: 0px;"> 
                            <img id="Img${theCount.count}"  src="${pageContext.request.contextPath}/images/itemdelete.png" style="width:100%;cursor:pointer;margin-top: 2.5%;" onclick="deletePayments(this);" title="Delete"/>
                       </div>
                        <c:if test = "${fn:containsIgnoreCase(eventspayments.cardType, 'cheque')}">
                       
                       <div class="col-lg-6" style="padding-left:0px;" id="chequeBasedbank${theCount.count}">
                         <input type="text" class="form-control" id="BankName${theCount.count}"  value="${eventspayments.bankName}"  placeholder="Bank *" readonly="readonly"/>
                         </div>
                         
                        <div class="col-lg-5" style="padding-left:0px;padding-right: 0px;" id="chequeBased${theCount.count}">
                        <input type="text" class="form-control" id="Bankrefernceref${theCount.count}"  value="${eventspayments.bankReference}"  placeholder="Ref No *" readonly="readonly"/>
                        </div>
                       </c:if>
                       
                       
                        </div>
                         </c:forEach>
                          
                        </div>
                        
                        
                        
                        
                          <div class=" col-lg-12 " id="Eventduedate" style="display: none;">
                           <div class="input-group" style="border:none !important">
										
										<input class="form-control" readonly="readonly"
											style="background-color: white;" name="Eventdue"
											id="Eventdue" size="20" type="text"
											value="${eventMastersList.dueDateStr}"
											onfocus="callCalender('Eventdue')"
											onclick="callCalender('Eventdue')" placeholder="DD/MM/YYYY" />
								
									</div>
                          
                        </div>
                          
                          
                        
                          <div class=" col-lg-12 " id="paymentListPaymentModeNone" style="display:none">
                          
                           <div class="col-lg-6" style="padding-left:0px">
						   <input type="text" class="form-control "  id="paymentModesAddedPaymentModeNone" value=""  placeholder="" readonly="readonly"/>
						                       
                         </div>
                         
                        <div class="col-lg-5" style="padding-left:0px;padding-right: 0px;">
                       <input type="number" onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57"   min="0" class="form-control"  id="amountsPaymentModeNone" value=""  placeholder=""  readonly="readonly"/>
                        </div>
                        
                          <input type="hidden" class="form-control"  id="cardTypesPaymentModeNone" value=""  placeholder="" />
                            <input type="hidden" class="form-control"  id="tenderKeysPaymentModeNone" value=""  placeholder="" />
                            <input type="hidden" class="form-control"  id="tenderCodesPaymentModeNone" value=""  placeholder="" />
                          
                           <div class="col-lg-1" style="padding-left:0px;padding-right: 0px;">
                             <img id="ImgPaymentModeNone"  src="${pageContext.request.contextPath}/images/itemdelete.png" style="width:100%;cursor:pointer;margin-top: 2.5%;" onclick="deletePayments(this);" title="Delete"/>
                        </div>
                              <div class="col-lg-6" style="padding-left:0px;display:none" id="chequeBasedbankPaymentModeNone">
                         <input type="text" class="form-control" id="BankNamePaymentModeNone"  value=""  placeholder="Bank *"/>
                          
                         </div>
                         
                        <div class="col-lg-5" style="padding-left:0px;padding-right: 0px;display:none" id="chequeBasedPaymentModeNone">
                        
                       
                          
                        <input type="text" class="form-control" id="BankreferncerefPaymentModeNone"  value=""  placeholder="Ref No *"/>
                         
                        
                        
                        </div>
                          
                          
                          </div>
                         
				  </div>
				  
				  
				  
				  <div class="col-lg-4">
				   <div class=" col-lg-12">
				   <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label style="font-family: Calibri;color: gray;">Sales Details<span style="color:red; font-size:2">*</span></label>
                         <input type="text" class="form-control" id="salespersonID" onblur="validatetext('salespersonID')"  value="${eventMastersList.salePerson}"  placeholder="Employee Name * "  autocomplete="off"/>
                        
                         </div>
                         </div>
                         <div class=" col-lg-12">
  
                   <input   type="text" class="form-control" id="leadChannel"  value="${eventMastersList.leadChannel}"  placeholder="Lead Channel"  autocomplete="off"/>

                         </div>
                         <div class=" col-lg-12">
  
                      <div class="col-lg-6" style="padding-left:0px">
                       <input class="form-control" readonly="readonly"
											style="background-color: white;" name="Date"
											id="Date" size="20" type="text"
											value="${eventMastersList.createdDateStr}"
											onfocus="callCalender('Date')"
											onclick="callCalender('Date')" placeholder="DD/MM/YYYY"  />
                          
                         </div>
                         <div class="col-lg-4" style="padding-left:0px;padding-right: 0px;" onchange="displaytaxDesc();">
 <select class="form-control" id="taxpersentage">
                          <option value="">Select Tax %</option>
						 <option value="5" ${eventMastersList.taxPercentage == "5.0" ? 'selected' : ''}  >5%</option>
						  <option value="18" ${eventMastersList.taxPercentage == "18.0" ? 'selected' : ''}  >18%</option>
						 		
						</select>                            
                         </div>
                           <div class="col-lg-1" style="padding-left: 3%">
                         <i class="fa fa-info-circle" aria-hidden="true" id="taxdescempty" title="Tax Percentage" style="cursor: pointer; font-size: large; margin-top: 4px;pinter-events:all;"></i>
                         <i class="fa fa-info-circle" aria-hidden="true" id="taxdesc5" title="5% - ODC at Standalone or within hotel having room tariff is < INR 7500" style="cursor: pointer; font-size: large; margin-top: 4px;display:none;pinter-events:all;"></i>
                          <i class="fa fa-info-circle" aria-hidden="true" id="taxdesc18" title="18% - ODC within hotel having room tariff is >=  INR 7500" style="cursor: pointer; font-size: large; margin-top: 4px;display:none;pinter-events:all;"></i>
                                                  </div>
                         </div>
                         <div class=" col-lg-12">
  
                      <div class="col-lg-6" style="padding-left:0px">
                       <input type="number" onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57"   min="0" class="form-control"  id="manpower" value="${eventMastersList.manPower}"  placeholder="Man power"/>
                          
                         </div>
                         <div class="col-lg-6" style="padding-left:0px;padding-right: 0px;">
                       <input type="number" onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57"   min="0" class="form-control"   id="countersRequired" value="${eventMastersList.countersRequired}"  placeholder="Counters Required*"/>
                          
                         </div>
                         </div>
                       
                         <div class=" col-lg-12">
  
                    <textarea rows="3" cols="3" id="remarks" class="form-control" style="resize: none;" placeholder="Comments" >${eventMastersList.termsAndConditions}</textarea>
                         </div>
                         <div class=" col-lg-12">
                         </div>
                         <div class=" col-lg-12">
                         </div>
                         
                         <div class=" col-lg-12">
  
                      <div class="col-lg-6" style="padding-left:0px">
                       <input type="number" onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57"   min="0" class="form-control"  id="expectedsales"  value="${eventMastersList.expectedSales}"  placeholder="Expected Sale"/>
                          
                         </div>
                         <div class="col-lg-6" style="padding-left:0px;padding-right: 0px;">
                       <input type="number" onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57"   min="0" class="form-control"  id="proft"  value="${eventMastersList.profit}"  placeholder="Profit"/>
                          
                         </div>
                         </div>
                         <div class=" col-lg-12">
                        <div class="col-lg-5" style="padding-left:0px;padding-right: 0px;width: 36%;">
                          <div class="fileUpload btn btn-primary browsebutton" style="font-weight: bold;">
			    			        <span style="font-size: 9px;">Upload P&L..</span>
			    			         <input id="signature2Btn" type="file"  onchange="addNameToTextBox('signature2',this);" class="upload">
						              <input type="hidden" id="signature2_refId" value=""> 
						               <input type="hidden" id="signature2File" value="${eventMastersList.doc3}">  
						               <input type="hidden" id="signature2_refIdLoad" value="${eventMastersList.agreementDoc3}">
						              
						                
						                </div>
						                </div>
						                
                         
                         <c:if test="${eventMastersList.doc3 != '' && eventMastersList.doc3 != null}">
                           <div class="col-lg-1" style="padding-left:0px;padding-right: 0px;pointer-events:all;cursor: pointer;">
                         <img src="${pageContext.request.contextPath}/images/downloadicon.png"
											alt="" style="width: 100px;margin-bottom: 5px;" id="skuMasterImg2Download" onclick="openDoc('3');" />
											
						
						<img style="width: 30px;height: 30px;display:none" id="skuMasterImg2" src="${pageContext.request.contextPath}/images/circleWait.gif">
						
                         </div>
                       
                         </c:if>
                         </div>
						               
                         
  </div>
  
  </div>
  
  
  
  </div>
                    <div class="row" style="text-align: right; margin-right: 25px;margin-top:50px;pointer-events:all">
                    
<%-- 							 <input type="button" class="btnCls" style="padding: 4px 12px; !important" onclick="PrintEventDetails('${eventMastersList.eventReference}','${eventMastersList.eventStatus}','view','');" value="Print" /> 
 --%>														 <input type="button" class="btnCls" style="padding: 4px 12px; !important" onclick="viewEventsManagement('outletEvents','0')" value="Back" /> 
							
						</div>    
                    </div>
                     </div>
                    


<div class="col-lg-8"></div>
                       <div class="col-lg-4" style="padding-right: 0px; text-align: right;" >
            
              </div>
             
              	


  
</div>
</div>
</section>

<input type="hidden" id="eventrefnumber" value="${eventMastersList.eventReference}"> 
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="receiptstock.label" />"/>
</body>
</html>