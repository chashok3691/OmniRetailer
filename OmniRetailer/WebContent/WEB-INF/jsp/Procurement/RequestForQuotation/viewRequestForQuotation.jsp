<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri.S
 * file type		        : JSP
 * description				: The newRequestForQuotation form is displayed using this jsp
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 -->

<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

	 <!-- DATA TABLES -->
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/procurement/requestForQuotation.js"></script>
<style type="text/css">
.address-group{
	margin-bottom: 10px;
}
  /* .odd{display:none!important;} */
  .row-fluid-5 {
   width: 100%;
   *zoom: 1;
 }
 .row-fluid-5:before,
 .row-fluid-5:after {
   display: table;
   line-height: 0;
   content: "";
 }
 .row-fluid-5:after {
   clear: both;
 }
 .row-fluid-5 [class*="span"] {
   display: block;
   float: left;
   width: 100%;
   min-height: 30px;
   margin-left: 1.875%;
   *margin-left: 1.875%;

   -webkit-box-sizing: border-box;
      -moz-box-sizing: border-box;
           box-sizing: border-box;
 }
 .h3{
 margin-top: 0px;
 }

 .row-fluid-5 .controls-row [class*="span"] + [class*="span"] {

   margin-left: 1.875%;
 }
 .row-fluid-5 [class*="span"]:first-child{
    margin-left: 0;
 }
 .row-fluid-5 .span2 {
   width: 18.5%;
   *width: 18.5%;
 }
.col-lg1-1{
width:  5.333333%;
}
.col-lg5-5{
width: 45.85%;
}
 /* responsive ONLY */

 @media (max-width: 600px){ /* spans reduce to 100px then go full width */

    .row-fluid-5 [class*="span"]{
    margin-left: 0;
    float: left;
    width: 100%;
    padding: 10px; 
    }
    }
 }
 @media (min-width:1200px) and (max-width:1600px)
{
	.loc{
		padding-left:0%;
	}
}

@media  (min-width:1400px) and (max-width:1440px){
.col-lg2-2{
width: 18.55%
}
}
@media  (min-width:768px) and (max-width:1400px){
.col-lg2-2{
width: 18%
}
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
.buttons {
	float: left;
	padding-top: 0px;
/* 	margin-right: 2%; */
	margin-top:1px;
}
.table{
 margin-bottom: 0px;
 }

.col-lg2-2{

padding-left: 0px;;
padding-right: 0px;
margin-right: 25px;
}
a.button, .list a.button {
position:relative;
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 3.6px 10px 2.8px 10px;
	/* border-radius: 5px; */
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
	font-weight: normal; 
    background-color: rgb(128,128,128);
}
@media (min-width:1200px) and (max-width:1600px)
{
	.lbl{
		text-align:right;
		padding-right: 0px;
	}
}
@media only screen and (max-width:1200px)
{
.lbl{
		text-align:left;
	}
}
/* .btn{
	font-size: 17px;
}
 */</style>
<script type="text/javascript">
$(document).ready(function(){
	
	 if($("#createdDate").val() == ""){
		var dateTime = getCurrentDate();
		var date = dateTime.split(' ');
		date = date[0].split('/');
		var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
		$('#createdDate').val(formatedDate);
	 }
	  if($("#createdDate").val() != ""){
		  var createdDate = $("#createdDate").val();
		  createdDate = createdDate.split(' ');
		  $("#createdDate").val(createdDate[0]);
	  }
	  if($("#lastDateForQuoteStr").val() != ""){
		  var dueDate = $("#lastDateForQuoteStr").val();
		  dueDate = dueDate.split(' ');
		  $("#lastDateForQuoteStr").val(dueDate[0]);
	  }
	  callCalender("createdDate");
	callCalender("lastDateForQuoteStr");
	setLocationsDivContent();
var selectedSuppliers = $("#selectedSuppliers").val();
$("#suppliers").val(selectedSuppliers.split(','));
if($("#fromCompany").val() == ""){
	 $("#Error").html("Please save your Profile Settings under Customer Settings Menu");
}
focusDiv('Error');
});
</script>
</head>
<body>
<!-- Content Header (Page header) -->

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
				<div class="box box-primary">
                                <div class="box-header" style="text-align: center">
                              
                                <c:if test="${type == 'new'}">
	                                <h3><spring:message code="new.requestforQuotation.label" /></h3>
                                </c:if>
                                <c:if test="${type != 'new'}">
	                                <h3><spring:message code="quote.ref.label" /> - ${quoteObj.quoteRef}</h3>
                                </c:if>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form role="form">
                                    <div class="box-body">
                                      <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 25px;margin-top: -25px">${err}</div>
	        						  <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
                                    <div class="row">
                                    <input type="hidden" id="quoteRef" value="${quoteObj.quoteRef}">
                                    <input type="hidden" id="outletLocation">
                                    <div class="form-group col-lg-4">
                                    <div class="row">
	                                   <div class="form-group col-lg-2 col-xs-2 lbl">
	                                   		<%-- <label><spring:message code="fromlocation.label" /> <span style="color:red; font-size:2">*</span></label> --%>
	                                   </div> 
                                        <div class="form-group col-lg-7 col-xs-8">
                                        <label><spring:message code="fromlocation.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <select class="form-control" id="fromlocation" onchange="getLocationDetails()" disabled="disabled">
 				                             <option value="">-- Select --</option>
 				                             <c:forEach var="location" items="${locationsList}">
												<option value="${location}" ${location == quoteObj.fromLocation ? 'selected' : ''} >${location}</option>
											 </c:forEach>
                                           </select>
                                           <span id="fromlocationError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                                        </div>
                                        <!--  <div class="form-group col-lg-2 lbl"><span></span>
                                     </div>  --></div>
		                                   
		                                 
                                         <%-- <div class="address-group col-lg-3 col-xs-3 lbl">
		                                   <label><spring:message code="repeatSupply.label" />Repeat Supply </label>
		                                    <select class="form-control" id="" onchange="">
		                                   <option value="" ></option>
		                                   </select>
		                                 </div> --%>
		                                 <div class="row">
		                                 <div class="form-group col-lg-2 col-xs-2 lbl"></div>
	                                   		
	                                  
                                        <div class="address-group col-lg-9 col-xs-8">
                                         <label><spring:message code="address.label" /> </label>
                                            <input type="text" class="form-control clearError"  id="fromCompany" readonly="readonly" value="${sessionScope.businessName}" placeholder="<spring:message code="company.name.label"/>"/>
                                        </div></div>
                                        <!-- <div class="address-group col-lg-4 col-xs-4 lbl">
                                  		 </div> -->
                                  		 <div class="row">
                                  		  <div class="form-group col-lg-2 col-xs-2 lbl"></div>
                                        <div class="address-group col-lg-9 col-xs-8">
                                            <input type="text" class="form-control clearError" readonly="readonly" value="${quoteObj.fromAddressStreet}" placeholder="<spring:message code="street.name.label"/>"/>
                                        </div>
                                        </div>
                                        <!-- <div class="address-group col-lg-4 col-xs-4 lbl">
                                  		 </div> -->
                                  		 <div class="row">
                                  		 <div class="form-group col-lg-2 col-xs-2 lbl"></div>
                                        <div class="address-group col-lg-9 col-xs-8">
                                            <input type="text" class="form-control clearError" readonly="readonly" value="${quoteObj.fromAddressLocality}" placeholder="<spring:message code="select.location"/>"/>
                                        </div>
                                        </div>
                                       <!--  <div class="address-group col-lg-4 col-xs-4 lbl">
                                  		 </div> -->
                                  		 <div class="row">
                                  		 <div class="form-group col-lg-2 col-xs-2 lbl"></div>
                                        <div class="address-group col-lg-6 col-xs-8">
                                         <input type="text" readonly="readonly" class="form-control" value="${quoteObj.fromCity}" id="fromCity">
                                        <%--  <select class="form-control" id="fromCity" onchange="" disabled="disabled">
                                         <option> <spring:message code="supplier.city.label"/> </option>

                                         </select> --%>
                                           <%--  <input type="text" class="form-control clearError" id="fromCity" value="${quoteObj.fromCity}" placeholder="<spring:message code="supplier.city.label"/>"/> --%>
                                        </div></div>
                                       <!--  <div class="address-group col-lg-4 col-xs-4 lbl">
                                  		 </div> -->
                                  		  <div class="row">
                                  		  <div class="form-group col-lg-2 col-xs-2 lbl"></div>
                                  		  <div class="address-group col-lg-6 col-xs-8">
                                  		  <input type="text" class="form-control" readonly="readonly" value="${quoteObj.fromState}" id="fromState">
                                  		   <%-- <select class="form-control" id="fromState" onchange="" disabled="disabled">
                                         <option > <spring:message code="state.label"/></option>

                                         </select> --%></div>
                                       <%--  <div class="address-group col-lg-6 col-xs-8">
                                            <input type="text" class="formcontrol clearError" id="fromState" value="${quoteObj.fromState}" placeholder="<spring:message code="state.label"/>"/>
                                        </div> --%>
                                        </div>
                                        <input type="hidden" id="fromCountry" value="${quoteObj.fromCountry}">
                                        <input type="hidden" id="fromContactNum" value="${quoteObj.fromContactNum}">
                                        <input type="hidden" id="fromEmail" value="${quoteObj.fromEmail}">
                                        <input type="hidden" id="fromZipCode" value="${quoteObj.fromZipCode}">
                                        
                                       <%--  <div class="form-group col-lg-4 col-xs-4 lbl">
                                   <label><spring:message code="prepared.by.label" /> </label>
                                   </div>
                                        <div class="form-group col-lg-8 col-xs-8">
                                            <input type="text" class="form-control clearError" id="preparedBy" value="${quoteObj.preparedBy}"/>
                                        </div> --%>
                                     </div>
                                     <!--  <div class="form-group col-lg-1"></div> -->
                                     <div class="form-group col-lg-2">
                                     <div class="row">
                                      <div class="address-group col-lg-9 col-xs-7 ">
		                                   <label><%-- <spring:message code="procurement.repeatSupply.label" /> --%>Repeat Supply </label>
		                                    <select class="form-control" id="repeatSupply" onchange="" disabled="disabled">
		                                    <option value="">-- Select --</option>
		                                    <option value=true ${quoteObj.repeatSupply==true? 'selected' : ''}><spring:message code="yes.label" /></option>
		                                    <option  value=false ${quoteObj.repeatSupply==false? 'selected' : '' }><spring:message code="no.label" /></option>
		                                    
		                                   </select>
		                                 </div> 
                                     </div>
                                     <div class="row">
                                      <div class="address-group col-lg-9 col-xs-7 ">
		                                   <label> <spring:message code="procurement.repeatPeriod.label" /> </label>
		                                    <select class="form-control" id="repeatPeriod" onchange="" disabled="disabled">
		                                    <option value="">-- Select --</option>
		                                   <option value="Daily" ${quoteObj.repeatPeriod=='Daily'? 'selected' : ''}><spring:message code="import.Daily.label" /></option>
		                                    <option value="Weekly" ${quoteObj.repeatPeriod=='Weekly'? 'selected' : ''}><spring:message code="import.Weekly.label" /></option>
		                                   
		                                   <option value="Monthly" ${quoteObj.repeatPeriod=='Monthly'? 'selected' : ''}><spring:message code="import.Monthly.label"/></option>
		                                   </select>
		                                 </div> 
                                     </div>
                                      <div class="row">
                                      <div class="address-group col-lg-10 col-xs-7 ">
		                                   <label> <spring:message code="procurement.shipmentMode.label" />  </label>
		                                   <select class="form-control" name="shipping_mode" id="shipping_mode" disabled="disabled">
		                                    <option value="">-- Select --</option>
                           <option value="Rail" ${'Rail' == quoteObj.shipmentMode ? 'selected' : ''}>Rail</option>
                           <option value="Flight" ${'Flight' == quoteObj.shipmentMode ? 'selected' : ''}>Flight</option>
                           <option value="Express" ${'Express' == quoteObj.shipmentMode ? 'selected' : ''}>Express</option>
                           <option value="Ordinary" ${'Ordinary' == quoteObj.shipmentMode ? 'selected' : ''}>Ordinary</option>
                        </select>
		                                 </div> 
                                     </div>
                                     <div class="form-group col-lg-4"></div>
                                     <div class="row">
                                     <div class="address-group col-lg-10 col-xs-6 ">
                                     <div class="address-group col-lg-12 col-xs-6 " style="border: 1px solid rgba(192, 192, 192, 0.25);">
                                     <label style="text-decoration: underline"><spring:message code="procurement.taxInclusive.label" /> </label>
                                     <div class="address-group col-lg-11 col-xs-12 ">
                                     <div class="row">
                                     
                                     <c:choose>
                                     <c:when test="${quoteObj.taxInclusive==true }">
                                     <div class="radio-inline">
                                     <input type="radio" checked="checked" name="tax" disabled="disabled" id="radioYes">Yes<!--  <spring:message code="procurement.taxInclusive.yes" />-->
                                      </div>
                                     </c:when>
                                     <c:otherwise>
                                     <div class="radio-inline">
                                     <input type="radio" disabled="disabled" name="tax" id="radioYes">Yes<!--  <spring:message code="procurement.taxInclusive.yes" />-->
                                      </div>
                                     </c:otherwise>
                                     
                                     </c:choose>
                                      
                                      </div></div>
                                      <div class="address-group col-lg-12 col-xs-12 ">
                                       <div class="row">
                                       
                                       <c:choose>
                                       <c:when  test="${quoteObj.taxInclusive==false}">
                                       <div class="radio-inline">
                                       <input type="radio" disabled="disabled" name="tax" checked="checked" id="radioNo">No<!--<spring:message code="procurement.taxInclusive.no" />  -->
                                       </div>
                                       </c:when>
                                       <c:otherwise>
                                       <div class="radio-inline">
                                       <input type="radio" disabled="disabled" name="tax" id="radioNo">No<!--<spring:message code="procurement.taxInclusive.no" />  -->
                                       </div>
                                       </c:otherwise>
                                       </c:choose>
                                    
                                    </div></div>
                                     </div>
                                     <%--  --%>
                                     </div>
                                     </div>
                                     </div>
                                     <div class="form-group col-lg-4">
                                     <%-- <div class="form-group col-lg-4 col-xs-4 lbl">
                                   <label><spring:message code="date.label" />  <span style="color:red; font-size:2">*</span></label>
                                   </div> --%>
                                                                           
                                        <div class="row">
                                         
                                        <div class="form-group col-lg-11 col-xs-9">
                                         <label><spring:message code="product.secondary.supplier.label" />  <span style="color:red; font-size:2">*</span></label>
                                           <select class="form-control" id="suppliers" onchange="clearError()" multiple="multiple" style="height: 141px; " disabled="disabled">
		                                        <c:forEach var="supplier" items="${supplierList}">
													<option value="${supplier.supplierCode}">${supplier.firmName}</option>
												</c:forEach>
                                        	</select>
                                        	<input type="hidden" id="selectedSuppliers" value="${quoteSuppliers}">
                                        </div></div>                                       <%--  
                                        <div class="form-group col-lg-4 col-xs-4 lbl">
                                   <label><spring:message code="due.date.label" />  <span style="color:red; font-size:2">*</span></label>
                                   </div> --%>
                                   <div class="form-group col-lg-3"></div>
                                    <div class="row">
                                        <div class="address-group col-lg-10 col-xs-6 ">
                                        <div class="address-group col-lg-6 col-xs-6 " style=" margin-top: -4px; border: 1px solid rgba(192, 192, 192, 0.25);">
                                     <label style="text-decoration: underline"><spring:message code="procurement.shipmentCost.label" /> </label>
                                     <div class="address-group col-lg-12 col-xs-12 ">
                                     <div class="row">
                                      <c:choose>
                                     <c:when test="${quoteObj.shipment=='inclusive'}">
                                     <div class="radio-inline">
                                     <input type="radio" disabled="disabled" checked="checked" name="cost" id="inclusive"><spring:message code="procurement.shipmentCost.inclusive" /> 
                                      </div>
                                      </c:when>
                                      <c:otherwise>
                                      <div class="radio-inline">
                                     <input type="radio"  name="cost" disabled="disabled" id="inclusive"><spring:message code="procurement.shipmentCost.inclusive" /> 
                                      </div>
                                      </c:otherwise>
                                      </c:choose>
                                      </div></div>
                                      <div class="address-group col-lg-12 col-xs-12 ">
                                     <div class="row">
                                      <c:choose>
                                     <c:when test="${quoteObj.shipment=='exclusive'}">
                                     <div class="radio-inline">
                                     <input type="radio" disabled="disabled" checked="checked" name="cost" id="exclusive" ><spring:message code="procurement.shipmentCost.exclusive" />
                                      </div>
                                     </c:when>
                                     <c:otherwise>
                                     <div class="radio-inline">
                                     <input type="radio" name="cost" disabled="disabled" id="exclusive" ><spring:message code="procurement.shipmentCost.exclusive" />
                                      </div>
                                     </c:otherwise>
                                     </c:choose>
                                     </div></div>
                                      
                                      </div>
                                      <%-- <div class="col-lg-2" style="padding-left: 0px;padding-top: 17px;">
      									<img alt="" style="height:30px" src="${pageContext.request.contextPath}/images/workflow_arrow.png">
      									</div>
      									
      									<div class="col-lg-3" style=" margin-right: -10px; /* padding-right: 0px; */ margin-left: -10px; padding-top: 17px; padding-left: 0px;font-size: 17px;">
      									 submitted<!--current activity  -->
                                        </div>
                                        
                                        <div class="col-lg-2" style="margin-left: -7px;padding-right: 0px;/* padding-left: 0px; */padding-top: 17px;">
      									<img alt="" style="height: 21px;" src="/OmniRetailer/images/workflow_arrow.png">
      									</div> --%>
      									
                                      </div>
                                     
                                     </div>
                                     </div>
                                     <div class="form-group col-lg-2">
                                   <div class="row">
                                   
                                        <div class="form-group col-lg-9 col-xs-6" style="padding-right: 0px">
                                        <label><spring:message code="date.label" />  <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control calendar_icon clearError" id="createdDate" readonly="readonly" disabled="disabled" style="background-color: white;" onfocus="callCalender('createdDate')" onclick="callCalender('createdDate')" value="${quoteObj.createdDateStr}" placeholder="DD/MM/YYYY" />
                                            <span id="createdDateError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                                        </div>
                                        </div>
                                       <%--  <div class="form-group col-lg-4 col-xs-4 lbl">
                                   <label><spring:message code="product.secondary.supplier.label" />  <span style="color:red; font-size:2">*</span></label>
                                   </div> --%>
                                    <div class="row">
                                    
                                   <div class="form-group col-lg-9 col-xs-6" style="padding-right: 0px">
                                         <label><spring:message code="due.date.label" />  <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control calendar_icon clearError" disabled="disabled" id="lastDateForQuoteStr" readonly="readonly" style="background-color: white;" onfocus="callCalender('lastDateForQuoteStr')" onclick="callCalender('lastDateForQuoteStr')" value="${quoteObj.lastDateForQuoteStr}" placeholder="DD/MM/YYYY" />
                                            <span id="lastDateForQuoteStrError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                                        </div>

                                     </div>
                                     
                                    <!--  <br>
                                     <br>
                                     <br>
                                     <div class="col-lg-3" style=" margin-right: 10px; /* margin-left: -55px; */padding-top: 25px;margin-left: -80px;/* padding-left: 0px; */ font-size: 17px;">cancelled</div>

                                     <div class="col-lg-4" style="margin-left: -3px;padding-right: 0px;/* padding-left: 14px; */padding-top: 28px;">
      									<img alt="" style="height: 23px;" src="/OmniRetailer/images/workflow_arrow.png">
      									</div>
                                     <div class="col-lg-3" style=" margin-left: -1px; padding-top: 25px; padding-left: 0px; /* font-weight: 700; */ font-size: 600;font-size: 17px">Requested</div> -->
                                      </div>
                                      </div>
                                      
                                     <c:if test="${type != 'new'}">
                                   
                                    	<div class="col-lg-12" style="background: #eee;padding: 10px 0px 10px 0px;    margin-bottom: 25px;margin-top: 30px;">
      									<div class="col-lg-9">
      									
      									<div class="col-lg-9" style="padding-left: 0px;    padding-top: 5px;">
      									  <c:forEach var="previousWorkFlowList" items="${quoteObj.previousStates}">
      									  <div class="p" style="display:inline-block;"></div>
                                             <span class=" border" style="padding-left: 0px;padding-top: 17px;font-size: 16px;"><img alt="" style="height:30px" src="${pageContext.request.contextPath}/images/workflow_arrow.png">${previousWorkFlowList}
      									
      									</span>
      									
                                             </c:forEach></div>
      									</div>
      									
      									<div class="col-lg-1"></div>
      									</div>
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                   <!--    <div class="col-lg-2" style="padding-left: 0px;padding-right: 0px">
                                     <p style="font-size: 18px;"> ${quoteObj.status}</p>
                                      </div>
                                      
                                      
                                      <c:forEach var="nextActivities" items="${quoteObj.nextActivities}" >
                                      <div class="col-lg-1" style="padding-left: 0px">
                                      <img alt="" style="height:30px" src="${pageContext.request.contextPath}/images/workflow_arrow.png">
                                      </div>
                                      <div class="col-lg-2" style="padding-left: 0px;padding-right: 0px">
                                     <p style="font-size: 18px;"> ${nextActivities}</p>
                                      </div>
                                      
                                      </c:forEach>
                                       -->
                                    
                                      </c:if>
                                      
                                      <div class="row" style="margin-top: 10px">
                                         <div class="col-lg-1 col-lg1-1"></div>
	                                     <div class="col-lg-11" style="padding-right: 1%;text-align:center;">
	                                     		<input type="text"  class="form-control searchItems" id="searchItems"  placeholder="<spring:message code="search.items.here.label" />"  style="height:30PX;text-align:center;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
												<div class="services">
										    		<div class="items">
										     			<ul class="matchedStringUl apparel" style=""></ul>
										   			</div>
												</div>
	                                     </div>
                                      </div>
                                      <input type="hidden" id="desc">
                                         <div class="row">
                                          <div class="col-lg-1 col-lg1-1 "></div>
                                     <div class=" col-lg-11" style="padding-right: 1%;">
                                      <div class="table-responsive" style="">
                                        <table id="productsList" class="table table-bordered table-hover">
                                          <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><div style="width:45px;"><spring:message code="sl.no.label" /></div></th>
                                            	<th style="border-left: 4px solid #fff"><div style="width: 70px;"><spring:message code="item.code.label"/></div></th>
                                                <th style="border-left: 4px solid #fff"><spring:message code="description1.label"/></th>
                                                <th style="border-left: 4px solid #fff"><spring:message code="uom.label"/></th>
                                            <%--  <th><spring:message code="price.label"/></th>  --%>
                                              <th style="border-left: 4px solid #fff"><spring:message code="procurement.demandForcast.label"/></th> 
                                                 <th style="border-left: 4px solid #fff;width: 8%"><spring:message code="minqty.label"/></th>
                                                <th style="border-left: 4px solid #fff;width: 10%"><spring:message code="qty.label"/></th>
                                                <th style="border-left: 4px solid #fff"><spring:message code="EmployeeForm.remarks"/></th>
                                              <%--   <th><spring:message code="action.label"/></th> --%>
                                           </tr>
                                          </thead>
                                              <tbody style="text-align: center;">
                                              		<c:forEach var="item" items="${quoteObj.itemsList}" varStatus="theCount">
									             		   <tr id="dynamicdiv${theCount.count}">
									             		   		<td class="slno">${theCount.count}</td>
										              			<td id="itemId${theCount.count}">${item.itemId}</td>
										              			<input type="hidden" id="skuId${theCount.count}" value="${item.skuId}" />
										              			<input type='hidden' id='pluCode${theCount.count}' value='${item.pluCode}'/>
														 		<input type='hidden' id='itemPrice${theCount.count}' value='${item.price}'/>
														 		<input type='hidden' id='make${theCount.count}' value='${item.make}'/>
														 		<input type='hidden' id='model${theCount.count}' value='${item.model}'/>
														 		<input type='hidden' id='color${theCount.count}' value='${item.color}'/>
														 		<input type='hidden' id='size${theCount.count}' value='${item.size}'/>
										                  		<td id="itemDesc${theCount.count}">${item.itemDescription}</td>
<!-- 										                  		<td>-</td> -->
										                  		<td id="uom${theCount.count}">${item.unitOfMeasurement}</td>
										                  		<td   onkeypress='return (this.innerText.length < 10)' ><input type="number" id="demand${theCount.count}" readonly="readonly"  value="${item.demandForecast}" style="height: 100%;width:100%;text-align:center; border: none;"></td>
										                  		<td   onkeypress='return (this.innerText.length < 10)'  ><input  id="minquantity${theCount.count}" readonly="readonly" type="number" value="${item.minQty}" style="height: 100%;border: none;text-align: center;width: 100%"></td>
										                  		<td   onBlur='changeOrderedPack(this);' onkeypress='return (this.innerText.length < 10)'  class="Pack"><input type="number" readonly="readonly" id="quantity${theCount.count}"  value="${item.quantity}" style="height: 100%;width:100%;text-align:center; border: none;"></td>
										                  		
										                  		
										                  		<td><textarea id="remarks${theCount.count}" readonly="readonly" rows=1 style='resize:none;width: 250px;'>${item.remarks}</textarea></td>
										                  		<%-- <td id="Del${theCount.count}"><img id="Img${theCount.count}" src="${pageContext.request.contextPath}/images/itemdelete.png" style="width:25px;cursor:pointer;" onclick="deleteItemDetails(this);" title="Delete"/></td> --%>
									                  	   </tr>
								              	 </c:forEach> 
											 </tbody>
                                       </table>
                                    </div>
                                    </div>
                                     </div>
                                    
                                   
									<br>
									<br>
									<br>              
									<div class="col-lg-1 col-lg1-1"></div>
									<div class="col-lg-11" style="padding-right: 0px;padding-left: 2px;margin-bottom: 5px;">
									<div class="col-lg-2" style="  height: 30px; padding-left: 0px; background-color: #3C8DBC;">
                                      <label style=" color: white; margin:  5px;"><spring:message code="procurement.shipmentLocations"/></label>
                                      </div>
            <div class="col-lg-10" style="height: 30px;background-color: #F1F1F1;border-top: 1px solid #C0C0C0;border-bottom: 1px solid #C0C0C0;border-right: 1px solid #C0C0C0"><label style=" margin-top: 5px;"><spring:message code="procurement.shipmentLocations.description"/></label></div>
									</div>
	     	<!-- <div class="col-lg-11 loc" ><input type="text" value="" disabled="disabled" style="background-color: #3c8dbc;color: #fff" placeholder="Shipment Locations" ></div> -->                      
             <div class="row">
           <div class="form-group col-lg-1 col-lg1-1"></div>
			<div class="form-group col-lg-3 col-xs-8" style="padding-right: 0px">
			<%-- 	<label><spring:message code="shipment.locations.and.quantities.label" /></label> --%>
				<select class="form-control" id="deliveryLocation" disabled="disabled" >
					<c:forEach var="location" items="${locationsList}">
												<option value="${location}" ${location == quoteObj.fromLocation ? 'selected' : ''} >${location}</option>
				 </c:forEach>
				</select>
			</div>
			<div class="form-group col-lg-2 col-xs-4" >
				<div class="buttons" style="">
					<a onclick=""  class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>
				</div>
			</div>
			<div class="form-group col-lg-4 col-xs-12" id="locationAddError" style="text-align: center;color: red;font-size: 2;font-weight: bold;"></div>
		</div>
		
		<div id="locations" style="display: none;">
		<div class="row">
			<div class="col-lg-1 col-lg1-1"></div>
			<div class="col-lg-11 loc" >
				<div class="row-fluid-5 locationRow" id="locations0">
					<div class="col-lg-2 col-lg2-2" >
						<label><spring:message code="location.label" /> <span style="color:red; font-size:2">*</span></label> 
						<input type="text" readonly="readonly" class="form-control addedLocation" id="location0" />
					</div>
					<div class="col-lg-2 col-lg2-2" >
						<label><spring:message code="shipment_street.label" /> <span style="color:red; font-size:2">*</span></label>
						<input type="text" readonly="readonly"  class="form-control" id="street0" />
					</div>
					<div class="col-lg-2 col-lg2-2" >
						<label><spring:message code="area.label" /> <span style="color:red; font-size:2">*</span></label>
						<input type="text" readonly="readonly"  class="form-control" id="area0"  />
					</div>
					<div class="col-lg-2 col-lg2-2" >
						<label><spring:message code="shipment_city.label" /> <span style="color:red; font-size:2">*</span></label> 
						<input type="text" readonly="readonly" class="form-control" id="city0" />
					</div>
					<input type="hidden" id="pin0">
					<input type="hidden" id="state0">
					<input type="hidden" id="country0">
					<div class="form-group span2" style="padding-top: 18px;">
						<div class="buttons" style="float: right;">
							<a onclick="" id="popup0" class="button" style="text-align: center;"><font size="2px"><spring:message code="shipments.label" /></font></a>
						</div>
						<%-- <span style="width: 60px;margin-left: 15px;">
							<img id="img0" src="${pageContext.request.contextPath}/images/itemdelete1.png" style="width: 24px;cursor: pointer;padding-top: 1px;" onclick="deleteDiv(this)">
						</span> --%>
					</div>
					<div id="relatedItemsDiv0" style="display: none;"><table id="relatedItemsTable0"><tbody></tbody></table></div>
				</div>
			</div>
			<div class="col-lg-1"></div>
		</div>
		</div>
		<div class="locationsAdded">
			 <c:forEach var="item" items="${quoteObj.selectedLocationList}" varStatus="theCount">
			 <div class="row">
			<div class="col-lg-1 col-lg1-1"></div>
			<div class="col-lg-11 loc" >
			 	<div class="row-fluid-5 locationRow" id="locations${theCount.count}">
				<div class="col-lg-2 col-lg2-2" >
					<label><spring:message code="location.label" /> <span style="color:red; font-size:2">*</span></label> 
					<input type="text" readonly="readonly" value="${item.locationId}" class="form-control addedLocation" id="location${theCount.count}" />
				</div>
				<div class="col-lg-2 col-lg2-2" >
					<label><spring:message code="shipment_street.label" /> <span style="color:red; font-size:2">*</span></label>
					<input type="text" readonly="readonly" value="${item.address}" class="form-control" id="street${theCount.count}" />
				</div>
				<div class="col-lg-2 col-lg2-2" >
					<label><spring:message code="area.label" /> <span style="color:red; font-size:2">*</span></label>
					<input type="text" readonly="readonly" value="${item.area}" class="form-control" id="area${theCount.count}"  />
				</div>
				<div class="col-lg-2 col-lg2-2" style="margin-right: 0px">
					<label><spring:message code="shipment_city.label" /> <span style="color:red; font-size:2">*</span></label> 
					<input type="text" readonly="readonly" value="${item.city}" class="form-control" id="city${theCount.count}" />
				</div>
				<input type="hidden" id="pin${theCount.count}" value="${item.pin}">
				<input type="hidden" id="state${theCount.count}" value="${item.state}">
				<input type="hidden" id="country${theCount.count}" value="${item.country}">
				<div class="form-group span2" style="padding-top: 18px;margin-left: 0px">
					<div class="buttons" style="margin-left: 25px ;float: right;">
						<a onclick="" id="popup${theCount.count}" class="button" style="width:110px;text-align: center;"><font size="2px"><spring:message code="shipments.label" /></font></a>
					</div>
					<%-- <span style="width: 60px;margin-left: 20px;">
						<img id="img${theCount.count}" src="${pageContext.request.contextPath}/images/itemdelete1.png" style="width: 24px;cursor: pointer;padding-top: 1px;" onclick="deleteDiv(this)">
					</span> --%>
				</div>
				<div id="relatedItemsDiv${theCount.count}" style="display: none;"><table id="relatedItemsTable${theCount.count}"><tbody>
					<c:set var="poCount" value="1"></c:set>
					 <c:forEach var="poLoc" items="${quoteObj.shipmentLocationsList}" >
						 <c:if test="${item.locationId == poLoc.shipmentLocation}">
								<tr id="selected_${poCount}" style='margin-top:5px;'>
									<td class="selecetedSlno_">${poCount}</td>
									<td id="selectedItemId_${poCount}">${poLoc.skuId}</td>
									<input type='hidden' id='selectedSkuId_${poCount}' value="${poLoc.skuId}" />
									<td id='selectedItemDesc_${poCount}'>${poLoc.itemDescription}</td>
									<td id="selectedUom${theCount.count}">${poLoc.unitOfMeasurement}</td>
									<td id='selectedQuantity_${poCount}' class='selectedPack ${poLoc.skuId}' onBlur='changeSelectedPack(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true'>${poLoc.quantity}</td>
									<td><textarea id="selectedRemarks_${theCount.count}" readonly="readonly" disabled="disabled" rows=1 style='resize:none;width: 200px;'>${poLoc.remarks}</textarea></td>
									<%-- <td id='selectedDel_${poCount}' ><img id='selectedImg_${poCount}' src="${pageContext.request.contextPath}/images/itemdelete.png" style='width:25px;cursor:pointer;' onclick='deleteSelectedItemDetails(this);' title='Delete ${poLoc.skuId}'/></td> --%>
									<c:set var="poCount" value="${poCount + 1}" />
								</tr>
						 </c:if>
					</c:forEach>
				</tbody></table></div>
			</div>
			</div>
			<div class="col-lg-1"></div>
		</div>
			 </c:forEach>
		</div>
		<br>
		 <div class="row">
	           	<div class="col-lg-1 col-lg1-1 lbl">
	       		</div>
	            <div class="col-lg-5 col-lg5-5">
	                <label><spring:message code="purchase.terms.label" /> </label>
				</div>
				
	       		<div class="col-lg-5 col-lg5-5" >
	                <label><spring:message code="shipment.terms.label" /> </label>
				</div>
	       		
          </div>
           <div class="row">
	           	<div class="form-group col-lg-1 col-lg1-1 lbl">
	       		</div>
	            <div class="form-group  col-lg-5 col-lg5-5" >
	                <textarea class="form-control clearError" readonly="readonly" style="resize: none;" rows="2" id="purchaseTerms" placeholder="<spring:message code="purchase.terms.label"/>">${quoteObj.purchaseTerms}</textarea>
				</div>
					
	            
				 <div class="form-group  col-lg-5 col-lg5-5" >
                	<textarea class="form-control clearError" readonly="readonly" style="resize: none;" rows="2" id="shipmentTerms" placeholder="<spring:message code="shipment.terms.label"/>">${quoteObj.shipmentTerms}</textarea>
				</div>
          </div>
         
       
       <!--added by manasa  -->
       <input type="hidden" id="outletLocation" value="${skuObj.fromLocation}">
   <input type="hidden" id="from" value="${skuObj.startDate}">
     <input type="hidden" id="to" value="${skuObj.endDate}">
     <input type="hidden" id="rfqSearch" value="${skuObj.searchCriteria}">
       
	           <%-- 	<div class="col-lg-1 col-lg1-1">
	       		</div>
	            <div class="col-lg-5" >
	                <label><spring:message code="shipment.terms.label" /> </label>
				</div>
         --%>
          
               <!--  <div class="form-group col-lg-1 col-lg1-1 lbl">
       			</div> -->
               
        
         <div class="row">
	           	<div class="col-lg-1 col-lg1-1">
	       		</div>
	       		 <div class="col-lg-5 col-lg5-5">
	                <label><spring:message code="procurement.payment.instructions.label" /> </label>
				</div>
				
	            <div class="col-lg-5 col-lg5-5">
	                <label><spring:message code="special.instructions.label" /> </label>
				</div>
          </div>
          <div class="row">
                <div class="form-group col-lg-1 col-lg1-1 lbl">
       			</div>
       			<div class="form-group  col-lg-5 col-lg5-5">
                	<textarea class="form-control clearError" readonly="readonly" style="resize: none;" rows="2" id="specialInstructions" placeholder="<spring:message code="procurement.payment.instructions.label"/>"><%-- ${quoteObj.specialInstructions} --%></textarea>
				</div>
				
                <div class="form-group  col-lg-5 col-lg5-5">
                	<textarea class="form-control clearError" readonly="readonly" style="resize: none;" rows="2" id="specialInstructions" placeholder="<spring:message code="special.instructions.label"/>">${quoteObj.specialInstructions}</textarea>
				</div>
         </div>
	</div><!-- /.box-body -->
<!-- COMPOSE MESSAGE MODAL -->
       <div id="triggerEvent"></div>
       <div class="modal fade popup-display" id="selected-items-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content" style="width: 125%;">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <%-- <h4 class="modal-title" style="text-align: center;"><spring:message code="select.products.label" /></h4> --%>
                    </div>
                 <div class="modal-body">
                  <div class="box-body table-responsive">
                  	<input type='hidden' id='selectedLocationId' >
                     <table id="selectedItemsList" class="table table-bordered table-hover">
                       <thead style="background-color: #3c8dbc; color: #ffffff">
                         <tr>
                             <th><div style="width:45px;"><spring:message code="sl.no.label" /></div></th>
							 <th style="border-left: 4px solid #fff"><div style="width: 70px;"><spring:message code="item.name.label" /></div></th>
							 <th style="border-left: 4px solid #fff"><spring:message code="item.desc.label" /></th>
							 <th style="border-left: 4px solid #fff"><spring:message code="uom.label"/></th>
							<%--  <th><spring:message code="price.label" /></th> --%>
							 <th style="border-left: 4px solid #fff"><spring:message code="pack.label" /></th>
							 <%-- <th><spring:message code="cost" /></th> --%>
							 <th style="border-left: 4px solid #fff"><spring:message code="EmployeeForm.remarks"/></th>
							 <th style="border-left: 4px solid #fff"><spring:message code="action.label"/></th>
                         </tr>
                       </thead>
                       <tbody style="text-align: center;">
			 			</tbody>
                    </table>
                 </div>
                 <div class="row" style="text-align: center;">
                 		<input type="button" id="saveSelection"  class="btn bg-olive btn-inline btnCls" style="margin-left:1%;margin-right:1%;width: 85px;" onclick="saveSelectedSkus();" value="<spring:message code="save.label" />" />
						<!-- <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button> -->
						<input type="button" id="cancelSelection" class="btn bg-olive btn-inline btnCls" style="margin-right: 1%;margin-left: 25px;width: 85px" data-dismiss="modal" aria-hidden="true" value="<spring:message code="cancel.label" />" />
                 </div>
              </div>
         </div><!-- /.modal-content -->
     </div><!-- /.modal-dialog -->

 </div><!-- /.modal -->
	<div class="row" style="text-align: center;">
		<c:if test="${sessionScope.role == 'super admin'}">
		 <c:forEach var="activity" items="${quoteObj.nextActivities}">
		 	<input type="button" style="margin-right:1%;" class="btn bg-olive btn-inline btnCls" onclick="validateRequestForQuotation('${activity}','edit');" value="${activity}" />
		 </c:forEach>
	  </c:if>
	  <c:if test="${sessionScope.role != 'super admin'}">
			 <c:forEach var="activity" items="${quoteObj.nextActivities}">
			 	<c:forEach var="accessControl" items="${sessionScope.procurementActivity}">
			 		<c:if test="${accessControl.appDocument == 'RequestForQuotation' && activity == accessControl.appDocumentActivity}">
					 	<input type="button" style="margin-right:1%;" class="btn bg-olive btn-inline btnCls" onclick="validateRequestForQuotation('${activity}','edit');" value="${activity}" />
			 		</c:if>
    				</c:forEach> 
			 </c:forEach>
      </c:if>
	<%-- 	<c:forEach var="activity" items="${quoteObj.nextActivities}">									
		 	<input type="button" style="margin-right:1%;width: 80px;position: relative;" class="btn bg-olive btn-inline" onclick="validateRequestForQuotation('${activity}','edit');" value="${activity}" />
		 </c:forEach> --%>
		<input type="button" class="btn bg-olive btn-inline btnCls" onclick="viewRequestForQuotation('rqstForQutation','0');" style="margin-left: 25px;" value="<spring:message code="cancel.label" />" />
	</div>
	<br/>
        <div class="box-footer"> </div>
    </form>
</div>

</div>
</div>
</section><!-- /.content -->

        <script type="text/javascript">
            $(function() {
               /* $('#productsList').dataTable({
                    "bPaginate": false,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": false,
                    "bInfo": false,
                    "bAutoWidth": false
                }); */
             });
        </script>
</body>
</html>
		    		 