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
       <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/b2bSaleOrders.js"></script>
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
 
 .table{
 margin-bottom: 0px;
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

 .row-fluid-5 .controls-row [class*="span"] + [class*="span"] {

   margin-left: 1.875%;
 }
 .row-fluid-5 [class*="span"]:first-child{
    margin-left: 0;
 }
 .row-fluid-5 .span2 {
   width: 17.5%;
   
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
width: 17.68%
}
}

.h3{
margin-top: 0px;
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
.col-lg2-2{

padding-left: 0px;;
padding-right: 0px;
margin-right: 20px;
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
.btn{
	font-size: 17px;
}

</style>
<script type="text/javascript">

callCalender('tenderOpenDate');
callCalender('tenderCloseDate');
callCalender('startDate');
callCalender('endDate');




	
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
                               
	                                <h3>Edit Sale Quotation</h3>
                               
	                              
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form role="form">
                                    <div class="box-body">
                                      <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 25px;margin-top: -25px">${err}</div>
	        						  <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: -20px">${success}</div>
                                    <div class="row">
                                    <input type="hidden" id="quoteRef" value="${quoteObj[0].quotationRef}">
                                    <input type="hidden" id="outletLocation">
                                     <input type="hidden" class="form-control" readonly="readonly" name="status" id="orderStatus"  value="${quoteObj[0].status}"/>
                                    
                                    <div class="form-group col-lg-4">
                                    <div class="row">
	                                   <div class="form-group col-lg-2 col-xs-2 lbl">
	                                   		<%-- <label><spring:message code="fromlocation.label" /> <span style="color:red; font-size:2">*</span></label> --%>
	                                   </div> 
                                        <div class="form-group col-lg-7 col-xs-8">
                                        <label><spring:message code="fromlocation.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <select class="form-control" id="fromlocation">
 				                            
 				                             <c:forEach var="location" items="${locationsList}">
												<option value="${location.businessActivity}" ${location.locationId == quoteObj[0].fromLocation ? 'selected' : ''} >${location.locationId}</option>
											 </c:forEach>
                                           </select>
                                           <span id="fromlocationError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                                        </div>
                                      </div>
		                                   
		                                 
                                        
		                                 <div class="row">
		                                 <div class="form-group col-lg-2 col-xs-2 lbl"></div>
	                                   		
	                                  
                                        <div class="address-group col-lg-9 col-xs-8">
                                         <label><spring:message code="address.label" /> </label>
                                            <input type="text" class="form-control clearError" id="fromAdderss" value="${quoteObj[0].fromAddress}" placeholder="<spring:message code="company.name.label"/>"/>
                                        </div></div>
                                        <!-- <div class="address-group col-lg-4 col-xs-4 lbl">
                                  		 </div> -->
                                  		 <div class="row">
                                  		  <div class="form-group col-lg-2 col-xs-2 lbl"></div>
                                        <div class="address-group col-lg-9 col-xs-8">
                                            <input type="text" class="form-control clearError" id="fromStreetName" value="${quoteObj[0].fromStreetName}" placeholder="<spring:message code="street.name.label"/>"/>
                                        </div>
                                        </div>
                                        <!-- <div class="address-group col-lg-4 col-xs-4 lbl">
                                  		 </div> -->
                                  		 <div class="row">
                                  		 <div class="form-group col-lg-2 col-xs-2 lbl"></div>
                                        <div class="address-group col-lg-9 col-xs-8">
                                            <input type="text" class="form-control clearError" id="fromLocality" value="${quoteObj[0].fromLocality}" placeholder="<spring:message code="select.location"/>"/>
                                        </div>
                                        </div>
                                       <!--  <div class="address-group col-lg-4 col-xs-4 lbl">
                                  		 </div> -->
                                  		 <div class="row">
                                  		 <div class="form-group col-lg-2 col-xs-2 lbl"></div>
                                        <div class="address-group col-lg-5 col-xs-5">
                                        <input type="text" class="form-control" value="${quoteObj[0].fromCity}" id="fromCity" placeholder="<spring:message code="supplier.city.label"/>">
                                        </div>
                                        <div class="address-group col-lg-5 col-xs-5" style="width: 33%">
                                  		  <input type="text" class="form-control" value="${quoteObj[0].fromState}" id="fromState" placeholder="<spring:message code="state.label"/>">
                                  		 </div>
                                        </div>
                                    
                                  		  <div class="row">
                                  		  <div class="form-group col-lg-2 col-xs-2 lbl"></div>
                                  		  <div class="address-group col-lg-6 col-xs-8">
                                  		  <label>Phone No</label>
                                  		  <input type="text" class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, '');" value="${quoteObj[0].fromPhoneNo}" id="fromContactNum" placeholder="Phone No">
                                  		 </div>
                                     
                                        </div>
                                     
                                        
                                     
                                     </div>
                                     <div class="form-group col-lg-2">
                                     <div class="row">
                                  
                                        <div class="form-group col-lg-9 col-xs-6" style="padding-right: 0px">
                                        
                                        <label>Tender Open Date<span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control calendar_icon clearError" value="${quoteObj[0].tenderOpenDateStr}" id="tenderOpenDate" readonly="readonly"  style="background-color: white;" onfocus="callCalender('tenderOpenDate')" onclick="callCalender('tenderOpenDate')" placeholder="DD/MM/YYYY" />
                                            <span id="createdDateError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                                        </div>
                                        </div>
                                       
                                    <div class="row">
                                   
                                   <div class="form-group col-lg-9 col-xs-6" style="padding-right: 0px">
                                         <label>Tender Close Date<span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control calendar_icon clearError" value="${quoteObj[0].tenderOpenDateStr}" id="tenderCloseDate" readonly="readonly" style="background-color: white;" onfocus="callCalender('tenderCloseDate')" onclick="callCalender('tenderCloseDate')" placeholder="DD/MM/YYYY" />
                                            <span id="lastDateForQuoteStrError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                                        </div>

                                     </div>
                                     <div class="row">
                                  
                                        <div class="form-group col-lg-9 col-xs-6" style="padding-right: 0px">
                                        
                                        <label>Project Start Date <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control calendar_icon clearError" id="startDate" readonly="readonly"  style="background-color: white;" onfocus="callCalender('startDate')" onclick="callCalender('startDate')" value="${quoteObj[0].projectStartDateStr}" placeholder="DD/MM/YYYY" />
                                            <span id="createdDateError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                                        </div>
                                        </div>
                                     
                                    <div class="row">
                                   
                                   <div class="form-group col-lg-9 col-xs-6" style="padding-right: 0px">
                                         <label>Project End Date <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control calendar_icon clearError"  id="endDate" readonly="readonly" style="background-color: white;" onfocus="callCalender('endDate')" onclick="callCalender('endDate')" value="${quoteObj[0].projectEndDateStr}" placeholder="DD/MM/YYYY" />
                                            <span id="lastDateForQuoteStrError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                                        </div>

                                     </div>
                                     
                                     
                                     
                                     <div class="form-group col-lg-4"></div>
                                     
                                     </div>
                                    
                                    <div class="form-group col-lg-4">
                                    <div class="row">
	                                   <div class="form-group col-lg-2 col-xs-2 lbl">
	                                   </div> 
                                        <div class="form-group col-lg-7 col-xs-8">
                                        <label>Customer<span style="color:red; font-size:2">*</span></label>
                                             <input type="text" class="form-control clearError" id="customerId" value="${quoteObj[0].customerId}" placeholder="Customer ID"/>

                                           <span id="fromlocationError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                                        </div>
                                       </div>
		                                   
		                                 
                                        
		                                 <div class="row">
		                                 <div class="form-group col-lg-2 col-xs-2 lbl"></div>
	                                   		
	                                  
                                        <div class="address-group col-lg-9 col-xs-8">
                                         <label><spring:message code="address.label" /> </label>
                                            <input type="text" class="form-control clearError" id="toAddress" value="${quoteObj[0].toAddress}" placeholder="<spring:message code="company.name.label"/>"/>
                                        </div></div>
                                       
                                  		 <div class="row">
                                  		  <div class="form-group col-lg-2 col-xs-2 lbl"></div>
                                        <div class="address-group col-lg-9 col-xs-8">
                                            <input type="text" class="form-control clearError" id="toStreetName" value="${quoteObj[0].toStreetName}" placeholder="<spring:message code="street.name.label"/>"/>
                                        </div>
                                        </div>
                                      
                                  		 <div class="row">
                                  		 <div class="form-group col-lg-2 col-xs-2 lbl"></div>
                                        <div class="address-group col-lg-9 col-xs-8">
                                            <input type="text" class="form-control clearError" id="toLocality" value="${quoteObj[0].toLocality}" placeholder="<spring:message code="select.location"/>"/>
                                        </div>
                                        </div>
                                      
                                  		 <div class="row">
                                  		 <div class="form-group col-lg-2 col-xs-2 lbl"></div>
                                        <div class="address-group col-lg-5 col-xs-5">
                                        <input type="text" class="form-control" value="${quoteObj[0].fromCity}" id="toCity" placeholder="<spring:message code="supplier.city.label"/>">
                                         </div>
                                         <div class="address-group col-lg-5 col-xs-5" style="width: 33%">
                                  		  <input type="text" class="form-control" value="${quoteObj[0].fromState}" id="toState" placeholder="<spring:message code="state.label"/>">
                                  		 </div>
                                    </div>
                                  		  <div class="row">
                                  		  <div class="form-group col-lg-2 col-xs-2 lbl"></div>
                                  		  <div class="address-group col-lg-6 col-xs-8">
                                  		  <label>Customer Phone No<span style="color:red; font-size:2">*</span></label>
                                  		  <input type="text" class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, '');" value="${quoteObj[0].toPhone}" id="toContactNum" placeholder="Phone No">
                                  		 </div>
                                        </div>
                                        
                                        
                                      
                                    
                                  
                                    </div>
                                    
                                    <div class="form-group col-lg-2">
                                   <div class="row">
	                                   
                                        <div class="form-group col-lg-9 col-xs-8">
                                        <label>Customer Name<span style="color:red; font-size:2"></span></label>
                                             <input type="text" class="form-control clearError" id="customerName" value="${quoteObj[0].customerName}" placeholder="Customer Name"/>

                                           <span id="fromlocationError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                                        </div>
                                       </div>
                                     <div class="row">
                                     <div class="form-group col-lg-9 col-xs-6" style="padding-right: 0px">
                                      <label>Tender Ref<span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control calendar_icon clearError"  id="tenderRef"  style="background-color: white;"  value="${quoteObj[0].tenderRef}" placeholder="Tender Ref" />
                                            <span id="lastDateForQuoteStrError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                                           
                                     </div>
                                     </div>
                                     <div class="row">
                                     <div class="form-group col-lg-9 col-xs-6" style="padding-right: 0px">
                                         <label>Deposit Amt<span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control calendar_icon clearError" value="${quoteObj[0].depositAmount}" id="depositAmt"  style="background-color: white;" oninput="this.value = this.value.replace(/[^0-9.]/g, '');" placeholder="Deposit Amt" />
                                            <span id="lastDateForQuoteStrError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                                        
                                     </div>
                                     </div>
                                     
                                     
                                     
                                                                        </div>
                                      </div>
                                     
                                     <div class="row" style="margin-top: 10px">
                                        <div class="col-lg-1 col-lg1-1"></div>
                  <div class="col-lg-11" style="background: #eee;padding: 10px 0px 10px 0px;">
                  
      									<div class="col-lg-9">
      									
      									<div class="col-lg-9" style="padding-left: 0px;    padding-top: 5px;">
      									  <c:forEach var="previousWorkFlowList" items="${quoteObj[0].previousStates}">
      									  <div class="p" style="display:inline-block;"></div>
                                             <span class=" border" style="padding-left: 0px;padding-top: 17px;font-size: 16px;"><img alt="" style="height:30px" src="${pageContext.request.contextPath}/images/workflow_arrow.png">${previousWorkFlowList}
      									
      									</span>
      									
                                             </c:forEach></div>
      									</div>
      									<div class="col-lg-2" style="padding-right: 0px;">
      									<div class="col-lg-12" style="padding-right: 0px;padding-left: 5px;">
      									 <input type="hidden" value="${quoteObj[0].status}" id="defaultstatus">
      									<c:choose>
      									<c:when test="${not empty quoteObj[0].nextWorkFlowStates}">
      									<label><spring:message code="actionrecquired.label" /></label>
                                            <input type="hidden" value="${quoteObj[0].status}" id="defaultstatus">
                                             <select class="form-control" name="shipped_from" id="statusissue">
                                             <option value="">Action Required</option>
                                               <c:forEach var="activity" items="${quoteObj[0].nextWorkFlowStates}">
                                              <option value="${activity}">${activity}</option>
                                             </c:forEach>
                                              <c:forEach var="nextWorkFlowStates" items="${quoteObj[0].nextActivities}">
                                              <option value="${nextWorkFlowStates}">${nextWorkFlowStates}</option>
                                             </c:forEach>
                                           </select>
      									</c:when>
      									<c:when test="${not empty quoteObj[0].nextActivities}">
      									<label><spring:message code="actionrecquired.label" /></label>
                                           
                                             <select class="form-control" name="shipped_from" id="statusissue">
                                             <option value="">Action Required</option>
                                               <c:forEach var="activity" items="${quoteObj[0].nextActivities}">
                                              <option value="${activity}">${activity}</option>
                                             </c:forEach>
                                              <c:forEach var="nextWorkFlowStates" items="${quoteObj[0].nextWorkFlowStates}">
                                              <option value="${nextWorkFlowStates}">${nextWorkFlowStates}</option>
                                             </c:forEach>
                                           </select>
      									</c:when>
      									<c:otherwise>
      									 <input type="hidden" value="nostatus" id="nostatus">
      									</c:otherwise>
      									</c:choose>
      									
      									</div>
      									</div>
      									</div>
      									</div>
      									
                                     
                                     
                                      <div class="row" style="margin-top: 10px">
                                         <div class="col-lg-1 col-lg1-1"></div>
	                                     <div class="col-lg-11" style="padding-right: 1%;text-align:center;">
	                                     		<input type="text"  class="form-control searchItems searchBar" id="searchItems"  placeholder="<spring:message code="search.items.here.label" />"  style="background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
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
                                            	<th><div style="width:45px;border-right-color:#fff "><spring:message code="sl.no.label" /></div></th>
                                            	<th style="border-left: 4px solid #fff"><div style="width: 70px;"><spring:message code="item.code.label"/></div></th>
                                                <th style="border-left: 4px solid #fff"><spring:message code="description1.label"/></th>
                                                <th style="border-left: 4px solid #fff"><spring:message code="uom.label"/></th>
                                                <th style="border-left: 4px solid #fff"><spring:message code="size.label"/></th>
                                                <th style="border-left: 4px solid #fff"><spring:message code="price.label"/></th>
                                                <th style="border-left: 4px solid #fff;width: 10%"><spring:message code="qty.label"/></th>
                                                <th style="border-left: 4px solid #fff"><spring:message code="discount.label"/></th>
                                                  <th style="border-left: 4px solid #fff"><spring:message code="tax.label"/></th>
                                                    <th style="border-left: 4px solid #fff"><spring:message code="Net.cost.label"/></th>
                                                <th style="border-left: 4px solid #fff"><spring:message code="action.label"/></th>
                                           </tr>
                                          </thead>
                                              <tbody style="text-align: center;">
                                              <c:set var="TotalCount" value = "0"> </c:set>
                                              <c:set var="TotalDis" value = "0"> </c:set>
                                              	<c:forEach var="item" items="${quoteObj[0].salesQuotationItems}" varStatus="theCount">
									             		   <tr id="dynamicdiv${theCount.count}">
									             		   		<td class="slno">${theCount.count}</td>
										              			<td id="itemId${theCount.count}">${item.productId}</td>
										                  		<td id="itemDesc${theCount.count}">${item.productName}</td>
										                  		<td id="uom${theCount.count}">${item.uom}</td>
										                  		<td id="size${theCount.count}">${item.size}</td>
										                  		<td id="itemPrice${theCount.count}">${item.mrp}</td>
										                  		<td   onBlur='changeOrderedPack(this);' onkeypress='return (this.innerText.length < 10)'  class="Pack" ><input type="number" id="quantity${theCount.count}" value="${item.quantity}" style="height: 100%;width:100%;text-align:center; border: none;" min="1" maxlength="10"></td>

										                  		<td id="discount${theCount.count}">${item.discount}</td>
										                  		<td id="tax${theCount.count}">${item.tax}</td>
										                  		<c:set var="TotalCount" value = "${ TotalCount + item.tax}"></c:set>
										                  		<c:set var="TotalDis" value = "${ TotalDis + item.discount}"></c:set>
										                  		<td id="cost${theCount.count}">${item.cost}</td>
										                  		<td id="Del${theCount.count}"><img id="Img${theCount.count}" src="${pageContext.request.contextPath}/images/itemdelete.png" style="width:25px;cursor:pointer;" onclick="deleteItemDetails(this);" title="Delete"/></td>
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
                                                
		 <div class="row">
	           <div class="col-lg-8 col-lg8-8"></div>
	            <div class="col-lg-2 col-lg2-2">
	                <label>Sub Total:</label>
				</div>
				
	       		<div class="col-lg-1 col-lg2-2" >
	                <input type="text" id="sub_total" readonly="readonly" value="${quoteObj[0].quotationValue-TotalCount}">
				</div>
	       		
          </div> 
          <div class="row"  style="margin-top: 5px">
	           <div class="col-lg-8 col-lg8-8"></div>
	            <div class="col-lg-2 col-lg2-2">
	                <label>Tax:</label>
				</div>
				
	       		<div class="col-lg-1 col-lg2-2" >
	                <input type="text" id="tax" readonly="readonly" value="${TotalCount}">
				</div>
	       		
          </div> 
          <div class="row"  style="margin-top: 5px">
	           <<div class="col-lg-8 col-lg8-8"></div>
	            <div class="col-lg-2 col-lg2-2">
	                <label>Discounts:</label>
				</div>
				
	       		<div class="col-lg-1 col-lg2-2" >
	                <input type="text" id="discounts" readonly="readonly" value="${TotalDis}">
				</div>
	       		
          </div> 
		
		<div class="row"  style="margin-top: 5px">
	          <div class="col-lg-8 col-lg8-8"></div>
	            <div class="col-lg-2 col-lg2-2">
	                <label>Net Quote Value:</label>
				</div>
				
	       		<div class="col-lg-1 col-lg2-2" >
	                <input type="text" id="net_value" readonly="readonly" value="${quoteObj[0].quotationValue}">
				</div>
	       		
          </div> 
          
          
          
		 <div class="row">
	           <div class="col-lg-1 col-lg1-1"></div>
	            <div class="col-lg-5 col-lg5-5">
	                <label>Sales Terms </label>
				</div>
				
	       		<div class="col-lg-5 col-lg5-5" >
	                <label><spring:message code="shipment.terms.label" /> </label>
				</div>
	       		
          </div>
           <div class="row">
	           <div class="col-lg-1 col-lg1-1"></div>
	            <div class="form-group  col-lg-5 col-lg5-5" >
	                <textarea class="form-control clearError" style="resize: none;" rows="2" id="salesTerms" placeholder="Sales Terms">${quoteObj[0].salesTerms}</textarea>
				</div>
					
	            
				 <div class="form-group  col-lg-5 col-lg5-5" >
                	<textarea class="form-control clearError" style="resize: none;" rows="2" id="shipmentTerms" placeholder="<spring:message code="shipment.terms.label"/>">${quoteObj[0].shipmentTerms}</textarea>
				</div>
          </div>
         
       
	          
        
         
	</div><!-- /.box-body -->
       
	<div class="row" >
	<div class=" col-lg-12" style="">
	 <div class="row">
	 <div class="col-lg-6" style="    padding-right: 0px;">
                   <div class="col-lg-6" style="padding-right: 0px;"></div>
                    <div class="col-lg-3" style=" padding-right: 0px;">
	
       <input type="button" class="btnCls" style="" onclick="createSaleQuotation('','edit');" value="<spring:message code="submit.label" />" />
    </div>
    </div>
   
	 <div class="col-lg-6" style="    padding-right: 0px;">
                 <!--   <div class="col-lg-6" style="padding-right: 0px;"></div> -->
                    <div class="col-lg-3" style=" padding-right: 0px;">
	 <c:if test="${sessionScope.role == 'super admin'}">
		<input type="button" style="" class="btnCls" onclick="showSaleQuotation('saleQuotation','0','clear')" value="<spring:message code="cancel.label" />" />
     </c:if>
     </div>
	  <c:forEach var="accessControl" items="${sessionScope.procurement}">
		<c:if test="${accessControl.appDocument == 'RequestForQuotation' && accessControl.read == true}">   
			<input type="button" style="" class="btnCls" onclick="showSaleQuotation('saleQuotation','0','clear')" value="<spring:message code="cancel.label" />" />
		</c:if>
	</c:forEach>
	</div>
	</div></div></div>
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
		    		 