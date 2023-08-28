<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : inventorymanager/retailoutlets/editstockreceipt.jsp
 * file type		        : JSP
 * description				: The new store form is displayed using this jsp
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
   
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/goodstransfer.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
    
    
    
<!--  added by        :  koti bomminei
      description     :  to ristrict the user from entering special characters     -->


	   
    
    

<script>
$(document).ready(function(){
	focusDiv('Error');
	$('.dataTables_empty').remove();
	callCalender('date');
	var fromLocation =  $("#fromLocation").val();
	  $("#tolocation option[value='"+fromLocation+"']").remove();
	  $("#fromLocation").change(function () {
			$("#tolocation").append('<option value="'+fromLocation+'">'+fromLocation+'</option>');
			fromLocation = $("#fromLocation").val();
		    $("#tolocation option[value='"+fromLocation+"']").remove();
		});
	  $("#date").click(function(){
		   $("#deliveryDateError").html("");
		   $(".Error").html("");
	});
	  $("#fromLocation").keydown(function(){
		   $("#locationError").html("");
		   $(".Error").html("");
	}); 
	  $("#delivered").keydown(function(){
		   $("#deliveredByError").html("");
		   $(".Error").html("");
	}); 
	  
	  
	  
	  
	  $("#tolocation").keydown(function(){
		   $("#tolocationError").html("");
		   $(".Error").html("");
	});
	
	  
	  if($("#defaultstatus").val() == $("#finalStatus").val()){
		  
		  $("#productsList").css("pointer-events", "none");
		  $("#searchItems").css("pointer-events", "none");
		  
		}
	  
});
</script>
<style type="text/css">
#overflowtext{

width : 200px;
overflow: hidden;
text-overflow: ellipsis;
 text-align: left;
white-space: nowrap;
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
  .p:first-child { 
   border-bottom: none !important;
    width:0% !important; 
    padding-left: 0px !important;
    padding-right: 0px !important;
}
</style>
</head>
<body>
<!-- Content Header (Page header) -->

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
				<div class="box box-primary">
                                <div class="box-header" style="text-align: center">
                                <br/>
                                <h3><spring:message code="edit.stockissue.label" />&nbsp;&nbsp;:&nbsp;&nbsp;${stockIssueDetails.goods_issue_ref_num}</h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form>
                                    <div class="box-body">
                                     <div id="Error" class="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                                      <div id="Suceess" class="Error" style="text-align:center;color:blue;font-weight:bold;">${success}</div>
                                   
                                    <div class="row">
                                                                      <div class="form-group col-lg-2" style="margin-bottom:0px">
                                            <label><spring:message code="date.label" /></label>
	                                        <input class="form-control calendar_icon" readonly="readonly" value="${stockIssueDetails.createdDateStr}" name="createdDate" id="createdDate" size="20" type="text" />
                                        </div>
                                         <div class="form-group col-lg-1" style="margin-bottom:0px"></div>
                                        <div class="form-group col-lg-2" style="margin-bottom:0px">
                                            <label><spring:message code="delivery_date.label" /><span class="requiredField">*</span>/<spring:message code="time.label" /><span class="requiredField">*</span></label>
                                            <input type="text" class="form-control" name="deliveryDate" id="date"  value="${stockIssueDetails.deliveryDate}"/>
                                        </div>
                                         <div class="form-group col-lg-1" style="margin-bottom:0px" ></div>
                                         
                                          
                                      <div class="form-group col-lg-2" style="margin-bottom:0px" >
                                            <label><spring:message code="requested.label" /> <spring:message code="by.label" /></label>
                                            <c:choose>
                                            <c:when test="${flowUnder=='warehouse'}">
                                              <input type="text" class="form-control" id="requested" name="Requested_by"   value="${stockIssueDetails.indentedBy}" />
                                            </c:when>
                                            <c:otherwise>
                                             <input type="text" class="form-control" id="requested" name="Requested_by"   value="${stockIssueDetails.requestedBy}" />
                                            </c:otherwise>
                                            </c:choose>
                                           
                                            <span id="receivedByError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        <div class="form-group col-lg-1" style="margin-bottom:0px"  ></div>
                                    <div class="form-group col-lg-2" style="margin-bottom:0px" >
                                            <label>From Location</label>
                                            <input type="hidden" id = "fromlocation">
                                            <%-- <input type="text" class="form-control" readonly name="shipped_from" id="fromLocation" value="${stockIssueDetails.shipped_from}"/> --%>
                                            <select class="form-control"  name="shipped_from" id="fromLocation">
												<option value="${stockIssueDetails.shipped_from}">${stockIssueDetails.shipped_from}</option>
                                           </select>
                                     </div>
                                     
                                     
                                     
                                     <div class="form-group col-lg-1" style="margin-bottom:0px" ></div>
                                        
                                        
                                        
                                        
                                        
                                         <div class="form-group col-lg-1" style="margin-bottom:0px"></div>
                                        </div>
                                    <div class="row">
                                    	<div class="form-group col-lg-3">
                                            <label><spring:message code="stock.request.ref.label" /></label>
                                             <input type="text" onblur="criteria(this)"   class="form-control allField searchItems searchBar" value="${stockIssueDetails.goods_Request_Ref}" style="background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right" name="searchStockRequest" id="searchStockRequest" placeholder="<spring:message code="stock.request.ref.label" />" />
											<div class=services>
										    		<div class="items">
										     			<ul class="matchedStringUl searchStockRequest" style="width: 89%!important;padding: 0px!important;"></ul>
										   			</div>
												</div>
											<input type="hidden" name="stockRequestRef" id="stockRequestRef" value="${stockIssueDetails.goods_Request_Ref}"  />
                                            <span id="stockRequestRefError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        
                                        
                             <div class="form-group col-lg-2"  style="margin-bottom:0px">
                                        <label><spring:message code="shiper_id.label" /></label>
                                       <input class="form-control"   name="transporter" id="transporter"  type="text" />
                                        <span id="transporterError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        
                              </div>
                                        <div class="form-group col-lg-1" style="margin-bottom:0px"></div>
                                        <div class="form-group col-lg-2" style="margin-bottom:0px">
                                            <label><spring:message code="delivered.by.label" /> <span class="requiredField">*</span></label>
                                            <input type="text" class="form-control" name="delivered_by" id="delivered"  value="${stockIssueDetails.delivered_by}"/>
                                     <span id="deliveredByError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        
                                        </div> 
                                        
                                        <div class="form-group col-lg-1" style="margin-bottom:0px"></div>
                                        <div class="form-group col-lg-2" style="margin-bottom:0px">
                                            <label><spring:message code="tolocation.label" /><span class="requiredField">*</span></label>
                                            <select class="form-control"  name="receipt_location" id="tolocation">
												<option value="${stockIssueDetails.issue_to}">${stockIssueDetails.issue_to}</option>
                                           </select>
                                           <%--  <input type="text" class="form-control" name="receipt_location" id="tolocation" readonly  value="${stockIssueDetails.issue_to}"/> --%>
                                        </div>
                                        
                                       
                                        
                                      
        								</div>
        
         							<div class="row">
                                     <input type="hidden" id="type" value="issue" />
                                     <div class="form-group col-lg-2" >
                                         <label><spring:message code="requestdate.label" />/<spring:message code="time.label" /></label>
                             <input class="form-control"  value=""  name="reqdatetime" id="reqdatetime"  type="text" />
                                        
                                        
                                        </div>
                                   <%--  	<div class="form-group col-lg-3">
                                            <label><spring:message code="requestdate.label" /></label>
	                                        <input class="form-control calendar_icon"  readonly style="background-color: white;" name="requestedDate" id="rdate" size="20" type="text"  />
                                           <span id="requestedDateError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div> --%>
                                <%--      
                                     <div class="form-group col-lg-3">
                                            <label><spring:message code="shipmentrefno.label" /><span class="requiredField">*</span></label>
                                            <input type="text" class="form-control" name="ShipmentRefNo" id="shipmentrefno" readonly value="${stockIssueDetails.shipmentRefNo}"/>
                                            <span id="ByError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div> --%>
                                     
                                    
                                      <div class="form-group col-lg-1" ></div>
                                     <div class="form-group col-lg-2" >
                                                      <label><spring:message code="fromlocation.label" /><span class="requiredField">*</span></label>
                                           
                                            <input type="hidden" id = "fromlocation">
                                             <select class="form-control"  name="shipped_from" id="shipmentMode">
                                          
												<option value="${stockIssueDetails.shipmentMode}" >${stockIssueDetails.shipmentMode}</option>
				
                                           </select>
                                        </div>
                                         <div class="form-group col-lg-1" ></div>
                                          <div class="form-group col-lg-2" >
                                            <label><spring:message code="received.label" /> <spring:message code="by.label" /> </label>
                                            <input type="text" class="form-control" id="received" name="Received_by"  value="${stockIssueDetails.received_by}"/>
                                           <span id="receivedError" style="text-align:right;color:red;font-weight:bold;"></span>
                                       
                                        </div> 
                                        <div class="form-group col-lg-1"></div>
                                  <div class="form-group col-lg-2" style="margin-bottom: 0px;margin-top: 23px;">
                                  <label><spring:message code="customer.newfeedback.emptyspace" /></label>
                               
                               <c:if test="${companyType == 'franchise'}">
                         <span class="blink">Franchise Transfer </span>
                               
				     	</c:if>
                                  </div>
                                     
                                        
                                        
                                        
        								</div>
                                      <c:choose>
									      <c:when test="${flowUnder=='warehouse'}">
                                     <div class="col-lg-12" style="background: #eee;padding: 10px 0px 10px 0px;">
      									<div class="col-lg-9">
      									
      									<div class="col-lg-9" style="padding-left: 0px;    padding-top: 5px;">
      									  <c:forEach var="previousWorkFlowList" items="${stockIssueDetails.previousWorkFlowList}">
      									  <div class="p" style="display:inline-block;"></div>
                                             <span class=" border" style="padding-left: 0px;padding-top: 17px;font-size: 16px;"><img alt="" style="height:30px" src="${pageContext.request.contextPath}/images/workflow_arrow.png">${previousWorkFlowList}
      									
      									</span>
      									
                                             </c:forEach></div>
      									</div>
      									<div class="col-lg-2" style="padding-right: 0px;">
      									<div class="col-lg-12" style="padding-right: 0px;padding-left: 5px;">
      									 <input type="hidden" value="${stockIssueDetails.status}" id="defaultstatus">
      									<c:choose>
      									<c:when test="${not empty stockIssueDetails.nextWorkFlowStates}">
      									<label><spring:message code="actionrecquired.label" /></label>
                                            <input type="hidden" value="${stockIssueDetails.status}" id="defaultstatus">
                                             <select class="form-control" name="shipped_from" id="statusissue">
                                             <option value="">Action Required</option>
                                               <c:forEach var="activity" items="${stockIssueDetails.nextWorkFlowStates}">
                                              <option value="${activity}">${activity}</option>
                                             </c:forEach>
                                              <c:forEach var="nextWorkFlowStates" items="${stockIssueDetails.nextActivities}">
                                              <option value="${nextWorkFlowStates}">${nextWorkFlowStates}</option>
                                             </c:forEach>
                                           </select>
      									</c:when>
      									<c:when test="${not empty stockIssueDetails.nextActivities}">
      									<label><spring:message code="actionrecquired.label" /></label>
                                           
                                             <select class="form-control" name="shipped_from" id="statusissue">
                                             <option value="">Action Required</option>
                                               <c:forEach var="activity" items="${stockIssueDetails.nextActivities}">
                                              <option value="${activity}">${activity}</option>
                                             </c:forEach>
                                              <c:forEach var="nextWorkFlowStates" items="${stockIssueDetails.nextWorkFlowStates}">
                                              <option value="${nextWorkFlowStates}">${nextWorkFlowStates}</option>
                                             </c:forEach>
                                           </select>
      									</c:when>
      									<c:otherwise>
      									 <input type="hidden" value="nostatus" id="nostatus">
      									 <input type="hidden" id="pageType" value="edit" />
      									</c:otherwise>
      									</c:choose>
      									
      									</div>
      									
      									</div>
      									<div class="col-lg-1"></div>
      									</div>
                                     </c:when>
                                     <c:otherwise>
                                           <div class="col-lg-12" style="background: #eee;padding: 10px 0px 10px 0px;">
      									<div class="col-lg-9">
      									
      									<div class="col-lg-9" style="padding-left: 0px;    padding-top: 5px;">
      									  <c:forEach var="previousWorkFlowList" items="${stockIssueDetails.previousStates}">
      									  <div class="p" style="display:inline-block;"></div>
                                             <span class=" border" style="padding-left: 0px;padding-top: 17px;font-size: 16px;"><img alt="" style="height:30px" src="${pageContext.request.contextPath}/images/workflow_arrow.png">${previousWorkFlowList}
      									
      									</span>
      									
                                             </c:forEach></div>
      									</div>
      									<div class="col-lg-2" style="padding-right: 0px;">
      									<div class="col-lg-12" style="padding-right: 0px;padding-left: 5px;">
      									 <input type="hidden" value="${stockIssueDetails.status}" id="defaultstatus">
      									<c:choose>
      									<c:when test="${not empty stockIssueDetails.nextWorkFlowStates}">
      									<label><spring:message code="actionrecquired.label" /></label>
                                            <input type="hidden" value="${stockIssueDetails.status}" id="defaultstatus">
                                             <select class="form-control" name="shipped_from" id="statusissue">
                                               <c:forEach var="activity" items="${stockIssueDetails.nextWorkFlowStates}">
                                              <option value="${activity}">${activity}</option>
                                             </c:forEach>
                                              <c:forEach var="nextWorkFlowStates" items="${stockIssueDetails.nextActivities}">
                                              <option value="${nextWorkFlowStates}">${nextWorkFlowStates}</option>
                                             </c:forEach>
                                           </select>
      									</c:when>
      									<c:when test="${not empty stockIssueDetails.nextActivities}">
      									<label><spring:message code="actionrecquired.label" /></label>
                                           
                                             <select class="form-control" name="shipped_from" id="statusissue">
                                               <c:forEach var="activity" items="${stockIssueDetails.nextActivities}">
                                              <option value="${activity}">${activity}</option>
                                             </c:forEach>
                                              <c:forEach var="nextWorkFlowStates" items="${stockIssueDetails.nextWorkFlowStates}">
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
      									<div class="col-lg-1"></div>
      									</div>
                                     </c:otherwise>
                                     </c:choose>
      									<%-- <div class="row">
      									<div class="col-lg-9">
      									<div class="col-lg-1" style="padding-left: 0px;padding-top: 17px;">
      									<img alt="" style="height:30px" src="${pageContext.request.contextPath}/images/workflow_arrow.png">
      									</div>
      									<div class="col-lg-9" style="padding-left: 0px;    padding-top: 13px;">
      									  <c:forEach var="previousWorkFlowList" items="${stockIssueDetails.previousWorkFlowList}">
      									  <div class="p" style="padding-left: 15px;padding-right:15px;padding-top: 25px;border-bottom: 1px solid #ccc;width:10%;display:inline-block;"></div>
                                             <span class=" border" style="padding-left: 0px;padding-top: 17px;font-size: 16px;">${previousWorkFlowList}
      									
      									</span>
      									
                                             </c:forEach></div>
      									</div>
      									<div class="col-lg-3">
      									 <input type="hidden" value="${stockIssueDetails.status}" id="defaultstatus">
      									<c:choose>
      									<c:when test="${not empty stockIssueDetails.nextActivities}">
      									<label><spring:message code="actionrecquired.label" /></label>
                                            <input type="hidden" value="${stockIssueDetails.status}" id="defaultstatus">
                                             <select class="form-control" name="shipped_from" id="statusissue">
                                             <option value="">Action Required</option>
                                               <c:forEach var="activity" items="${stockIssueDetails.nextActivities}">
                                              <option value="${activity}">${activity}</option>
                                             </c:forEach>
                                              <c:forEach var="nextWorkFlowStates" items="${stockIssueDetails.nextWorkFlowStates}">
                                              <option value="${nextWorkFlowStates}">${nextWorkFlowStates}</option>
                                             </c:forEach>
                                           </select>
      									</c:when>
      									<c:when test="${not empty stockIssueDetails.nextWorkFlowStates}">
      									<label><spring:message code="actionrecquired.label" /></label>
                                           
                                             <select class="form-control" name="shipped_from" id="statusissue">
                                             <option value="">Action Required</option>
                                               <c:forEach var="activity" items="${stockIssueDetails.nextActivities}">
                                              <option value="${activity}">${activity}</option>
                                             </c:forEach>
                                              <c:forEach var="nextWorkFlowStates" items="${stockIssueDetails.nextWorkFlowStates}">
                                              <option value="${nextWorkFlowStates}">${nextWorkFlowStates}</option>
                                             </c:forEach>
                                           </select>
      									</c:when>
      									<c:otherwise>
      									 <input type="hidden" value="nostatus" id="nostatus">
      									</c:otherwise>
      									</c:choose>
      									
      									
      									
      									</div>
      									</div> --%>
      									
                                        <div class="row">
                                         <div class="col-lg-3"></div>
                                         <div class="form-group col-lg-11" style="text-align:center;margin-bottom: -1.5%;margin-top: 1.4%;">
                                         <input type="hidden" id="desc"/>
                                         	<input type="text"  class="form-control searchItemsForIssue searchBar" id="searchItems" placeholder="<spring:message code="search.items.here.label" />"  style="background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right"/>
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl receipt" style=""></ul>
								   				</div>
											</div>
                                            
 									 </div>
 <div class="form-group col-lg-1" style="padding: 0px;padding-top: 25px;margin-bottom: 0px !important;">
											<input type="checkbox" style="vertical-align: -2px" id="searchScan" />
											 &nbsp;&nbsp;Scan
										</div>
                                         <div class="col-lg-3">
                                         	<div id="triggerEvent"></div>
                                         </div>
                                        </div>
                                     
                                      <div class="table-responsive" style="overflow: auto;">
                                           <c:choose>
									      <c:when test="${flowUnder=='warehouse'}">
									        <table id="productsList" class="table table-bordered table-hover">
                                          <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><div ><spring:message code="sl.no.label" /></div></th>
                                            	<th><spring:message code="item.code.label"/></th>
                                            	<th><spring:message code="itemScanCode.label"/></th>
                                            	<th><spring:message code="hsnCode.label" /></th>
                                                <th><spring:message code="item.desc.label"/></th>
                                                <th><spring:message code="uom.label"/></th>
                                                <th><spring:message code="price.label"/></th>
                                                <th><spring:message code="Reqqty.label"/></th>
                                                <th><spring:message code="issued.qty.label"/></th>
                                                <th><spring:message code="actualqty.label"/></th>
                                                <th>Pack Ref</th>
                                                <th><spring:message code="avail.qty.label"/></th>
                                                 <th><spring:message code="sale.value"/></th>
                                                <th><spring:message code="action.label"/></th>
                                            </tr>
                                          </thead>
                                          <tbody style="text-align: center;">
                                            <c:forEach var="item" items="${stockIssueDetails.itemDetails}" varStatus="theCount">
                                              <tr id=dynamicdiv${theCount.count}>
                                              <td class="slno">${theCount.count}</td>
              									<td id="Name${theCount.count}" >${item.skuId}</td>
              									<input type="hidden" id="skuId${theCount.count}" value="${item.skuId}" />
              									<input type="hidden" id="pluCode${theCount.count}" value="${item.pluCode}"/>
              										<input type="hidden" id="category${theCount.count}" value="${item.category}"/>
              									<input type="hidden" id="brandCode${theCount.count}" value="${item.brand}"/>
              									<input type="hidden" id="productRange${theCount.count}" value="${item.productRange}"/>
              										<input type="hidden" id="productBatchNo${theCount.count}" value="${item.batchNumber}"/>
              									<input type="hidden" id="measureRange${theCount.count}" value="${item.measurementRange}"/>
              									<input type="hidden" id="color${theCount.count}" value="${item.color}"/>
              									<input type="hidden" id="size${theCount.count}" value="${item.size}"/>
              									<input type="hidden" id="ean${theCount.count}" value="${item.ean}"/>
              									<input type="hidden" id="utility${theCount.count}" value="${item.utility}"/>
                  								 <input type="hidden" id="trackingRequired${theCount.count}" class="trackingRequired" value="${item.trackingRequired}"/>
                  								<input type="hidden" id="cgsgstAmt${theCount.count}" value="${item.cgstValue/item.quantity}"/>
                  								<input type="hidden" id="taxRate${theCount.count}" value="${item.taxRate}"/>
                  								<input type="hidden" id="availableQtydup${theCount.count}" value="${item.avlQty}"/>
	    			                  			<input type="hidden" id="manufacturedItem${theCount.count}" value="${item.manufactured}"/>
	    			                  		    <input type="hidden" id="mrpPrice${theCount.count}" value="${item.salePrice}"/>
                  								
                  								<td id="itemScanCode${theCount.count}" class="itemScanCode" contenteditable="true" >${item.itemScanCode}</td>
                  								<td id="itemHSNCode${theCount.count}" class="itemHSNCode" >${item.hsnCode}</td>
                 	<td id="Desc${theCount.count}"><div id="overflowtext"> <a href="#" data-toggle="tooltip"  title="${item.description}">${item.description}</a></div></td>    
                  								
<%--                   								<td id="Desc${theCount.count}" >${item.description}</td>
 --%>                  								<td id="UOM${theCount.count}" >${item.uom}</td>
                  								<td class='Price' id="Price${theCount.count}" >${item.price}</td>
                  								
                  								<c:choose>
                  								<c:when test="${item.trackingRequired == false}">
                  								<td class='Pack'  id="Pack${theCount.count}">${item.indentQty }</td>
                  								</c:when>
                  								<c:otherwise>
                  								<td class='Pack'  id="Pack${theCount.count}">${item.indentQty }</td>
                  								</c:otherwise>
                  								</c:choose>
                  								
                  								<c:choose>
                  								<c:when test="${item.trackingRequired == false}">
                  								<td id="Supplied${theCount.count}" onBlur='changeIssued(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true' >${item.quantity}</td>
                  								<td class='Received' id="Received${theCount.count}"  contenteditable='true' >${item.actualQty}</td>
                  								<input type="hidden" id="SuppliedOld${theCount.count}" value="${item.quantity}">
                  								<input type="hidden" id="ReceivedOld${theCount.count}" value="${item.actualQty}">
                  								<%-- <td onBlur='changeRejected(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true' id="Rejected${theCount.count}" >${item.rejected}</td> --%>
                  									<td class='packReference' id="packReference${theCount.count}" >${item.packageReference}</td>
                  									
                  									<td  id="availableQty${theCount.count}"  onclick='popupskuQty(${item.skuId})'><a style='text-decoration: underline;cursor: pointer;text-decoration-color: blue;'>${item.avlQty}</a></td>
                  									</c:when>
                  									<c:otherwise>
                  									
                  									<td id="Supplied${theCount.count}" onBlur='changeIssued(this);' onkeypress='return (this.innerText.length < 10)'  >${item.quantity}</td>
                  								<td class='Received' id="Received${theCount.count}" >${item.actualQty}</td>
                  								<td class='packReference' id="packReference${theCount.count}" >${item.packageReference}</td>
                  								<%-- <td onBlur='changeRejected(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true' id="Rejected${theCount.count}" >${item.rejected}</td> --%>
                  									<td  id="availableQty${theCount.count}"  onclick='popupskuQty(${item.skuId})'><a style='text-decoration: underline;cursor: pointer;text-decoration-color: blue;'>${item.avlQty}</a></td>
                  									</c:otherwise>
                  									
                  									</c:choose>
                  									
                  									<td id="Cost${theCount.count}" >${item.cost}</td>
                  								<td id="Del${theCount.count}" ><img id="Img${theCount.count}" src='${pageContext.request.contextPath}/images/itemdelete.png' style='width:30%;cursor:pointer;' onclick='deleteItem(this);' title='Delete ${item.item}'/></td>
                  	   						</tr>
             		   						  
              		   						</c:forEach> 
                                          </tbody>
                                       </table>
									      
									      </c:when>
									      <c:otherwise>
                                        <table id="productsList" class="table table-bordered table-hover">
                                          <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                           	<th><div><spring:message code="sl.no.label" /></div></th>
                                            	<th><spring:message code="item.code.label"/></th>
                                            	<th><spring:message code="itemScanCode.label"/></th>
                                            	<th><spring:message code="hsnCode.label" /></th>
                                                <th><spring:message code="item.desc.label"/></th>
                                                <th><spring:message code="uom.label"/></th>
                                                <th><spring:message code="price.label"/></th>
                                                <th><spring:message code="pack.label"/></th>
                                               <th><spring:message code="issued.qty.label"/></th>
                                                <th><spring:message code="actualqty.label"/></th>
                                                <th><spring:message code="avail.qty.label"/></th>
                                              <th><spring:message code="cost"/></th>
                                                <th><spring:message code="action.label"/></th>
                                            </tr>
                                          </thead>
                                          <tbody style="text-align: center;">
                                             <c:forEach var="item" items="${stockIssueDetails.itemDetails}" varStatus="theCount">
                                              <tr id=dynamicdiv${theCount.count}>
                                              <td class="slno">${theCount.count}</td>
              									<td id="Name${theCount.count}" >${item.item}</td>
              									<input type="hidden" id="skuId${theCount.count}" value="${item.skuId}" />
              									<input type="hidden" id="pluCode${theCount.count}" value="${item.pluCode}"/>
              										<input type="hidden" id="category${theCount.count}" value="${item.category}"/>
              									<input type="hidden" id="brandCode${theCount.count}" value="${item.brand}"/>
              									<input type="hidden" id="productRange${theCount.count}" value="${item.productRange}"/>
              									<input type="hidden" id="productBatchNo${theCount.count}" value="${item.batchNumber}"/>
              									<input type="hidden" id="measureRange${theCount.count}" value="${item.measurementRange}"/>
              										<input type="hidden" id="color${theCount.count}" value="${item.color}"/>
              											<input type="hidden" id="size${theCount.count}" value="${item.size}"/>
              												<input type="hidden" id="ean${theCount.count}" value="${item.ean}"/>
              									<input type="hidden" id="utility${theCount.count}" value="${item.utility}"/>
                  							    <input type='hidden' id="trackingRequired${theCount.count}" class="trackingRequired" value="${item.trackingRequired}"/>
                  							  <input type="hidden" id="mrpPrice${theCount.count}" value="${item.salePrice}"/>
                  							    <td id="itemScanCode${theCount.count}" class="itemScanCode" contenteditable="true" >${item.itemScanCode}</td>
                                                <td id="itemHSNCode${theCount.count}" class="itemHSNCode" >${item.hsnCode}</td>
                  		           	<td  id="Desc${theCount.count}"><div id="overflowtext"> <a href="#" data-toggle="tooltip"  title="${item.description}">${item.description}</a></div></td>    
                  								
<%--                   								<td id="Desc${theCount.count}" >${item.description}</td>
 --%>                  								<td id="UOM${theCount.count}" >${item.uOM}</td>
                  								<td class='Price' id="Price${theCount.count}" >${item.price}</td>
                  								
                  								<c:choose>
                  								<c:when test="${item.trackingRequired == false}">
                  								<td class='Pack' onBlur='changePack(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true' id="Pack${theCount.count}" >${item.quantity }</td>
                  								<td id="Supplied${theCount.count}" >${item.quantity}</td>
                  								<td class='Received' id="Received${theCount.count}" >${item.quantity}</td>
                  								<td  id="availableQty${theCount.count}" onclick='popupskuQty(${item.skuId})'><a style='text-decoration: underline;cursor: pointer;text-decoration-color: blue;'>${item.avlQty}</a></td>
                  									
                  									</c:when>
                  									<c:otherwise>
                  									<td class='Pack' onBlur='changePack(this);' onkeypress='return (this.innerText.length < 10)'  id="Pack${theCount.count}" >${item.quantity }</td>
                  								<td id="Supplied${theCount.count}" >${item.quantity}</td>
                  								<td class='Received' id="Received${theCount.count}" >${item.quantity}</td>
                  								<td  id="availableQty${theCount.count}" onclick='popupskuQty(${item.skuId})'><a style='text-decoration: underline;cursor: pointer;text-decoration-color: blue;'>${item.avlQty}</a></td>
                  									
                  									</c:otherwise>
                  									
                  									</c:choose>
                  										<td id="Cost${theCount.count}" >${item.cost}</td>
                  								<td id="Del${theCount.count}" ><img id="Img${theCount.count}" src='${pageContext.request.contextPath}/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItem(this);' title='Delete ${item.item}'/></td>
                  	   						</tr>
             		   						  
              		   						</c:forEach> 
                                            
                                          </tbody>
                                       </table></c:otherwise></c:choose>
                                    </div>
                                
                                    <br/> <br/>
                                    
 <div class="row">
							
							
							
							
							<div class="form-group  col-lg-3" style="margin-left: 54px;">
							
							
							<div class="row" style="text-align: center;">
						<div class="row" style="text-align: center;">
						 <input type="button" style="margin-top: 27px;" class="btnCls " onclick="validateStockIssue('Opened','update','${stockIssueDetails.goods_issue_ref_num}','${stockIssueDetails.id_goods_issue}');" value="Submit" />
						 <c:if test="${stockIssueDetails.status == 'Draft'}">
						 <input type="button" style="margin-top: 27px;" class="btnCls" onclick="validateStockIssue('Draft','update','${stockIssueDetails.goods_issue_ref_num}','${stockIssueDetails.id_goods_issue}');" value="Draft" />
					</c:if>
						<input type="button" style="margin-top: 27px;" class="btnCls" onclick="searchStockIssues('','all','0');" value="<spring:message code="cancel.label" />" />
						</div>
						</div>
						</div>	
							
						
							
								 <div class="form-group  col-lg-4">
                                         <textarea class="form-control" name="remarks" id="remarks" rows="4" style="resize: none;" >${stockIssueDetails.remarks}</textarea>
 								         <span id="remarksError" style="text-align:right;color:red;font-weight:bold;"></span>
 								</div>
 										 
 									<div class="form-group col-lg-4" style="border:1px solid #ccc"> 
 										<div class="form-group col-lg-12" style="margin-bottom: 0px; margin-top: 1%;"> 
 									
 									<div class="form-group col-lg-3"> 
 									<label style=" white-space: nowrap;"><spring:message code="summary.itemcount" /> </label>
 									</div>
 									 <c:set var="qtyissued" value="0"  />
 							 <c:set var="countitem" value="0"  />
 									 
 									 
	              <c:forEach var="summaryList" items="${stockIssueDetails.itemDetails}" varStatus="thecount">
				<c:set var="qtyissued" value="${qtyissued+((summaryList.quantity))}" scope="page" />
								<c:set var="countitem" value="${countitem+1}" scope="page" />
				
				</c:forEach>
 									<div class="form-group col-lg-3" style="padding-right: 0px;">
									<input type="text" readonly="readonly" class="form-control" id="itemcount" name="itemcount"  value="${countitem}" />
								</div>
 									
 									<div class="form-group col-lg-3"> 
							<label style=" white-space: nowrap;"><spring:message code="totalqty.label" /> </label>
							</div>
								<div class="form-group col-lg-3" style="padding-right: 0px;">
								<fmt:formatNumber type="number" maxFractionDigits="2"  var="totalqtyroundoff" value="${qtyissued}" />
									
							<input type="text" readonly="readonly" class="form-control" id="totalQty" name="totalQty"  value="${totalqtyroundoff}" />
						</div>
								</div>
								<div class="form-group col-lg-12" style="margin-bottom: -2%;"> 
								<div class="form-group col-lg-3">
				<label style=" white-space: nowrap;"><spring:message code="discount.label" /> </label>
 
								</div>
								<div class="form-group col-lg-3" style="padding-right: 0px;">
						       <input type="text" readonly="readonly" class="form-control" id="discount" name="discount"  value="0" />
								
								</div>
								<div class="form-group col-lg-3">
								
								<label style=" white-space: nowrap;"><spring:message code="cost.label" /> </label>
								</div>
								
								<div class="form-group col-lg-3" style="padding-right: 0px;">
								 <c:set var="qty" value="0"  />
	              <c:forEach var="summaryList" items="${stockIssueDetails.itemDetails}" varStatus="thecount">
				<c:set var="qty" value="${qty+((summaryList.quantity)*(summaryList.price))}" scope="page" />
				
		<fmt:formatNumber type="number" maxFractionDigits="2"  var="tcost" value="${qty}" /> 
				
				</c:forEach>
							<input type="text" readonly="readonly" class="form-control" id="totalCost" name="totalCost"  value="${tcost}" />
								</div>
								
							</div>
							</div>
<%--          <div class="row">
             <div class="form-group  col-lg-12">
             	<label><spring:message code="remarks.label" /></label>
                <textarea class="form-control" name="remarks" id="remarks"  style="resize: none;" readonly>${stockIssueDetails.remarks}</textarea>
			</div>
        </div>
        <br/>

					<div class="row">
						<div class="col-lg-8"></div>
						<div class="form-group col-lg-3" style="text-align: right;"><label><spring:message code="totalquantity.label" /> </label></div>
						<div class="form-group col-lg-1">
						 <c:set var="qtyissued" value="0"  />
	              <c:forEach var="summaryList" items="${stockIssueDetails.itemDetails}" varStatus="thecount">
				<c:set var="qtyissued" value="${qtyissued+((summaryList.quantity))}" scope="page" />
				</c:forEach>
							<input type="text" readonly="readonly" class="form-control" id="totalQty" name="totalQty"  value="${qtyissued}" />
						</div>
					</div>
					<div class="row">
						<div class="col-lg-8"></div>
						<div class="form-group col-lg-3" style="text-align: right;"><label><spring:message code="cost.label" /> </label></div>
						<div class="form-group col-lg-1">
						  <c:set var="qty" value="0"  />
	              <c:forEach var="summaryList" items="${stockIssueDetails.itemDetails}" varStatus="thecount">
				<c:set var="qty" value="${qty+((summaryList.quantity)*(summaryList.price))}" scope="page" />
				</c:forEach>
							<input type="text" readonly="readonly" class="form-control" id="totalCost" name="totalCost"  value="${qty}" />
						</div>
					</div> --%>
						</div>
                                 
                                 
                                    <!--added by manasa  -->
                                        <input type="hidden" id="whreturnflag" value="1">     
                              <input type="hidden" id="operation" value="${operation}">
        <input type="hidden" id="outletZone" value="${stockIssueObj.zoneId}">
       <input type="hidden" id="from" value="${stockIssueObj.startDate}">
        <input type="hidden" id="to" value="${stockIssueObj.endDate}">
        <input type="hidden" id="fromlocation" value="${stockIssueObj.outletLocation}">
         <input type="hidden" id="itemwise" value="">
         <input type="hidden" id="warehouselocation" value="${stockIssueObj.shipped_from}">
      <input type="hidden" id="allIssuedStocks" value="${stockIssueObj.searchCriteria}">
       <%--  <input type="hidden" id="warehouseLocation" value="${stockReceiptObj.endDate}"> --%>    
          
            <!--//..added by manasa  -->  
                                        
                                      <%-- <div class="row">
								<div class="col-lg-4"></div>
								<div class="col-lg-4">
									<div class="form-group col-lg-6">
										<label><spring:message code="totalquantity.label" />:
										</label> <label id="totalQty">${stockIssueDetails.issue_total_qty}</label>
									</div>
									<div class="form-group col-lg-6">
										<label><spring:message code="cost.label" />: </label> <label
											id="totalCost">${stockIssueDetails.issue_total}</label>
									</div>
								</div>
								<div class="col-lg-4"></div>
							</div> --%>
                                  
   <!-- COMPOSE MESSAGE MODAL -->
         <div class="modal fade popup-display" id="items-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content" style="width: fit-content;">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" style="text-align: center;"><spring:message code="select.products.label" /></h4>
                    </div>
             <form action="#" method="post">
                 <div class="modal-body">
                  <div class="box-body table-responsive">
                     <table id="itemsList" class="table table-bordered table-hover">
                       <thead style="background-color: #3c8dbc; color: #ffffff">
                         <tr>
                             <th><spring:message code="item.desc.label"/></th>
                              <th>Batch Number</th>
                              <th>Expiry Date</th>
                                <th>Qty</th>
                             <th><spring:message code="price.label"/></th>
                              <th>MRP</th>
                              <th><spring:message code="color.label"/></th>
                              <th><spring:message code="size.label"/></th>
                            
                         </tr>
                       </thead>
                       <tbody style="text-align: center;">
			 			</tbody>
                    </table>
                 </div>
              </div>
             </form> 
         </div><!-- /.modal-content -->
     </div><!-- /.modal-dialog -->
 </div><!-- /.modal -->                                         
                                        
               <div class="modal fade popup-display" id="locationqty" tabindex="-1" role="dialog" aria-hidden="true">
          <div class="modal-dialog" style="margin-left: 35%;margin-top: 10%;">
                <div class="modal-content iospopupp" style="width: 100% !important;height: 200px;overflow: auto">
                    <div class="modal-header" style="background:#a1dbf1;border-top: 1px solid #333; border-bottom: 1px solid #333;">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="margin-top: -14px;margin-right: -10px;">&times;</button>
                        <%-- <h4 class="modal-title" style="text-align: center;"><spring:message code="select.products.label" /></h4> --%>
                    </div>
             <form>
             <div class="modal-body" style="padding-bottom: 0px;padding-right: 0px;">
              <div class="box-body ">
             <div class="row">
             <div style="margin-bottom: 10px;">
			<label style="width:49%;font-weight: bold;text-decoration: underline;">Location<span style="text-align:right;float: right;">&nbsp; &nbsp; : &nbsp; &nbsp;</span></label>
			<label style="width:49%;font-weight: bold;text-decoration: underline;">Quantity</label>
			</div>
            <div id="location5">
		
			</div> 
			<div style="margin-top: 10px;">
			<label style="width:49%;font-weight: bold;text-decoration: overline;">Total<span style="text-align:right;float: right;">&nbsp; &nbsp; : &nbsp; &nbsp;</span></label>
			<label style="width:49%;font-weight: bold;text-decoration: overline;padding-left: 5px;" id="QtyTotalValueId"></label>
			</div>  
            </div>          
            </div>   
             </div>
             </form> 
              </div>
          </div>
          </div>                                 
                                    </div><!-- /.box-body -->
								<input type="hidden" id="flowUnder" value="${flowUnder}">  	
								<input type="hidden" id="flowType" value="issue">  
								<input type="hidden" id="finalStatus" value="${stockIssueDetails.finalStatus}">  	
								
						
						
					
									<br/>
                                    <div class="box-footer">
                                     <!--    <button type="submit" class="btn btn-primary">Submit</button> -->
                                    </div>
                                    
                                </form>
                            </div>

</div>
</div>
</section><!-- /.content -->
  <!-- InputMask -->
      <%--   <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script>
<!-- DATA TABES SCRIPT -->
      	<script type="text/javascript">
		$(function() {
			 $("#date").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"}); 
		});
	</script>  --%>
       
</body>
</html>
		    		 