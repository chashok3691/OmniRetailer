<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : inventorymanager/retailoutlets/newstockreceipt.jsp
 * file type		        : JSP
 * description				: The new store form is displayed using this jsp
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
	//$('.dataTables_empty').remove();
	$(this).scrollTop(0);
	callCalender('date');
	callCalender('issueddate');
	var dateTime = getCurrentDate();
	  var date = dateTime.split(' ');
	  date = date[0].split('/');
	  var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
	  $('#createdDate').val(formatedDate);
	  $("#date").val(formatedDate);
	  
	  var selectedToLocation = $("#tolocation").val();
	  $("#fromLocation option[value='"+selectedToLocation+"']").remove();
	  $("#tolocation").change(function () {
			$("#fromLocation").append('<option value="'+selectedToLocation+'">'+selectedToLocation+'</option>');
			selectedToLocation = $("#tolocation").val();
		    $("#fromLocation option[value='"+selectedToLocation+"']").remove();
		});
	 
	  getLocationChanges('receipt');
	  
});

$("#date").keydown(function(){
	   $("#deliveryDateError").html("");
	   $("#Error").html("");
});

</script>
<style type="text/css">
#overflowtext{

width : 250px;
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
                                <h3><spring:message code="new.stockreceipt.label" /></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form role="form">
                                    <div class="box-body">
                                     <div id="Error" class="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                                      <div id="Error" style="text-align:center;color:blue;font-weight:bold;">${success}</div>
                                    <div class="row">
                                    	<div class="form-group col-lg-2">
                                            <label><spring:message code="date.label" /></label>
	                                        <input class="form-control calendar_icon" value="${stockReceiptDetails.createdDateStr}" readonly="readonly" name="createdDate" id="createdDate" size="20" type="text" />
                                        </div>
                                        <div class="form-group col-lg-1"></div>
                                        <div class="form-group col-lg-2">
                                             <label><spring:message code="delivery_date.label" /> <span style="color:red; font-size:2">*</span></label>
	                                         <input class="form-control calendar_icon" readonly="readonly" style="background-color: white;" name="deliveryDate" id="date" size="20" type="text" value="${stockReceiptDetails.deliveryDate}" onfocus="callCalender('date')" onclick="callCalender('date')" placeholder="DD/MM/YYYY"/>
                                              <span id="deliveryDateError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        <div class="form-group col-lg-1"></div>
                                        <div class="form-group col-lg-2">
                                            <label><spring:message code="location.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="hidden" id="toLocation">
                                             <select class="form-control" name="receipt_location" id="tolocation">
                                             <c:forEach var="location" items="${locationsList}">
												<option value="${location}" ${location == stockReceiptDetails.receipt_location ? 'selected' : ''}>${location}</option>
											</c:forEach>
                                           </select>
                                        </div>
                                         <div class="form-group col-lg-1"></div>
                                         <div class="form-group col-lg-2">
                                            <label><spring:message code="shipped.from.label" /> <span style="color:red; font-size:2">*</span></label>
                                             <select class="form-control" name="shipped_from" id="fromLocation" onchange="getLocationChanges('receipt')">
                                             <c:forEach var="location" items="${allLocationsList}">
												<option value="${location}" ${location == stockReceiptDetails.shipped_from ? 'selected' : ''}>${location}</option>
											</c:forEach>
                                           </select>
                                         <input type="hidden" id="companyType" value="${companyType}">  
                                           
                                        </div> 
                                        </div>
                                         <input type="hidden" id="type" value="receipt" />  
                                    <div class="row">
                                    	 <input type="hidden" id="requestRef" value="${stockReceiptDetails.requestId}">
                                    <div class="form-group col-lg-3">
                                    		<label><spring:message code="goodsissueref.label" /></label>
                                            <input type="text"  onblur="criteria(this)" class="form-control allField searchItems searchBar" value="${stockReceiptDetails.issueReferenceNo}" style="" name="searchIssue" id="searchIssue" placeholder="<spring:message code="goodsissueref.label" />" />
											<div class=services>
										    		<div class="items">
										     			<ul class="matchedStringUl searchIssue" style="width: 89%!important;padding: 0px!important;"></ul>
										   			</div>
												</div>
											<span id="searchIssueError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											<input type="hidden" name="issueRef" id="issueRef" value="${stockReceiptDetails.issueReferenceNo}"  />
                                    	</div>
                                        <div class="form-group col-lg-2">
                                            <label><spring:message code="delivered.by.label" /><span style="color:red; font-size:2">*</span> </label>
                                            <input type="text" onblur="criteria(this)"  class="form-control" name="delivered_by" id="delivered" placeholder='<spring:message code="enter.name.label"/>' value="${stockReceiptDetails.delivered_by}"/>
                                            <span id="deliveredByError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        <div class="form-group col-lg-1"></div>
                                        <div class="form-group col-lg-2">
                                            <label><spring:message code="inspected.label" /> <spring:message code="by.label" /> </label>
                                            <input type="text"  onblur="criteria(this)" class="form-control" name="InspectedBy" id="inspected" placeholder='<spring:message code="enter.name.label"/>' value="${stockReceiptDetails.inspectedBy}"/>
                                            <span id="inspectedByError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        <div class="form-group col-lg-1"></div>
                                        <div class="form-group col-lg-2">
                                            <label><spring:message code="received.label" /> <spring:message code="by.label" /> </label>
                                            <input type="text"  onblur="criteria(this)" class="form-control" id="received" name="Received_by" placeholder='<spring:message code="enter.name.label"/>' value="${stockReceiptDetails.received_by}"/>
                                            <span id="receivedByError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                     </div>
                                     
                                 <div class="row">
                                    <input type="hidden" id="requestRef" value="">
                                     <div class="form-group col-lg-3">
                                         <label>Stock Return Ref</label>
                                            <input type="text"  onblur="criteria(this)" class="form-control allField searchItems searchBar" value="" style="" name="searchReturn" id="searchReturn" placeholder="Stock Return" />
											<div class=services>
										    		<div class="items">
										     			<ul class="matchedStringUl searchReturn" style="width: 89%!important;padding: 0px!important;"></ul>
										   			</div>
												</div>
											<span id="searchIssueError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											<input type="hidden" name="ReturnRef" id="ReturnRef" value=""  />   
                                           
                                            
                                        </div>
                                        
                                        <div class="form-group col-lg-2">
                                            <label><spring:message code="stockreceipt.issueddate.label" /> </label>
                                             <input class="form-control calendar_icon" readonly="readonly" style="background-color: white;" name="deliveryDate" id="issueddate" value="${stockReceiptDetails.issuedDateStr}" size="20" type="text" onfocus="callCalender('issueddate')" onclick="callCalender('issueddate')" placeholder="DD/MM/YYYY"/>
                                            <span id="issueddateError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        <div class="form-group col-lg-1"></div>
                                        <div class="form-group col-lg-2">
                                            <label><spring:message code="stockreceipt.issuedby.label" /> </label>
                                            <input type="text"  onblur="criteria(this)" class="form-control" name="issuedBy" id="issuedBy" placeholder='' value="${stockReceiptDetails.issuedBy}"/>
                                            <span id="issuedByError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                         <div class="form-group col-lg-1"></div>
                                        <div class="form-group col-lg-2">
                                            <label><spring:message code="stockreceipt.shippmentmode.label" /> </label>
                                             <select class="form-control" name="shippmentMode" id="shippmentMode">
												<option value="Road" ${stockReceiptDetails.shipmentMode == Road ? 'selected' : ''} >Road</option>
												<option value="Rail" ${stockReceiptDetails.shipmentMode == Rail ? 'selected' : ''} >Rail</option>
												<option value="Ordinary" ${stockReceiptDetails.shipmentMode == Ordinary ? 'selected' : ''} >Ordinary</option>
												<option value="Express" ${stockReceiptDetails.shipmentMode == Express ? 'selected' : ''} >Express</option>
                                           </select>
                                            <span id="receivedByError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                     </div>
                                     <div class="row">
                                    <input type="hidden" id="requestRef" value="">
                                    <%--  <div class="form-group col-lg-2">
                                            <label><spring:message code="stockreceipt.shippmentref.label" /> <!--  --></label>
                                            <input type="text" onblur="criteria(this)"  class="form-control" name="delivered_by" id="shippmentRef" value="${stockReceiptDetails.shipmentRefNo}" placeholder='<spring:message code="enter.name.label"/>'/>
                                            <span id="shippmentRefError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div> --%>
                                        </div>

                                  
                                   <div class="col-lg-12" style="background: #eee;padding: 10px 0px 10px 0px;">
      									<div class="col-lg-9">
      									
      									<div class="col-lg-9" style="padding-left: 0px;    padding-top: 5px;">
      									  <c:forEach var="previousWorkFlowList" items="${stockReceiptDetails.previousStates}">
      									  <div class="p" style="display:inline-block;"></div>
                                             <span class=" border" style="padding-left: 0px;padding-top: 17px;font-size: 16px;"><img alt="" style="height:30px" src="${pageContext.request.contextPath}/images/workflow_arrow.png">${previousWorkFlowList}
      									
      									</span>
      									
                                             </c:forEach></div>
      									</div>
      									<div class="col-lg-2" style="padding-right: 0px;">
      									<div class="col-lg-12" style="padding-right: 0px;padding-left: 5px;">
      									 <input type="hidden" value="${stockReceiptDetails.status}" id="defaultstatus">
      									<c:choose>
      									<c:when test="${not empty stockReceiptDetails.nextWorkFlowStates}">
      									<label><spring:message code="actionrecquired.label" /></label>
                                            <input type="hidden" value="${stockReceiptDetails.status}" id="defaultstatus">
                                             <select class="form-control" name="shipped_from" id="statusissue">
                                               <c:forEach var="activity" items="${stockReceiptDetails.nextWorkFlowStates}">
                                              <option value="${activity}">${activity}</option>
                                             </c:forEach>
                                              <c:forEach var="nextWorkFlowStates" items="${stockReceiptDetails.nextActivities}">
                                              <option value="${nextWorkFlowStates}">${nextWorkFlowStates}</option>
                                             </c:forEach>
                                           </select>
      									</c:when>
      									<c:when test="${not empty stockReceiptDetails.nextActivities}">
      									<label><spring:message code="actionrecquired.label" /></label>
                                             <select class="form-control" name="shipped_from" id="statusissue">
                                               <c:forEach var="activity" items="${stockReceiptDetails.nextActivities}">
                                              <option value="${activity}">${activity}</option>
                                             </c:forEach>
                                              <c:forEach var="nextWorkFlowStates" items="${stockReceiptDetails.nextWorkFlowStates}">
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
                                  
                                  
                                  
                                  
                                <c:if test="${flowUnder=='warehouse'}">
                                     <div class="col-lg-12" style="background: #eee;padding: 10px 0px 10px 0px;">
      									<div class="col-lg-9">
      									
      									<div class="col-lg-9" style="padding-left: 0px;    padding-top: 5px;">
      									  <div class="p" style="display:inline-block;"></div>
                                             <span class=" border" style="padding-left: 0px;padding-top: 17px;font-size: 16px;"><img alt="" style="height:30px" src="${pageContext.request.contextPath}/images/workflow_arrow.png">${stockReceiptDetails.status} 
      									
      									</span>
      									
                                             </div>
      									</div>
      									</div></c:if>
                                  
                                  
                                  
                                  
                                  
                                    
                                     
                                        <div class="row">
                                       
                                          <div class="form-group col-lg-12" style="text-align:center;margin-bottom: -1.5%;margin-top: 2%;">
                                         <input type="hidden" id="desc"/>
                                         	<input type="text"  class="form-control searchItems searchBar" id="searchItems" placeholder="<spring:message code="search.items.here.label" />"  style="" />
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl receipt" style=""></ul>
								   				</div>
											</div>
  										 </div>
                                         <div class="col-lg-3">
                                         	<div id="triggerEvent"></div>
                                         </div>
                                        </div>
                                        <br>
                                      <div class="table-responsive" style="overflow-x:auto;width:100%">
                                        <table id="productsList" class="table table-bordered table-hover">
                                          <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><div><spring:message code="sl.no.label" /></div></th>
                                            	<th><spring:message code="skuid.label"/></th>
                                            	<th><spring:message code="itemScanCode.label"/></th>
                                                <th><spring:message code="item.desc.label"/></th>
                                                <th><spring:message code="uom.label"/></th>
                                                <th><spring:message code="price.label"/></th>
                                                <th><spring:message code="stockReceipt.reqQty"/></th>
                                                <th><spring:message code="cost"/></th>
                                                <th><spring:message code="stockReceipt.suppliedQty"/></th>
                                                <th><spring:message code="recieved.qty.label"/></th>
                                                <th><spring:message code="stockReceipt.recievedQty"/></th>
                                                <th><spring:message code="stockReceipt.rejectedQty"/></th>
                                                <th><spring:message code="action.label"/></th>
                                            </tr>
                                          </thead>
                                          <tbody style="text-align: center;">
                                             <c:forEach var="item" items="${stockReceiptDetails.reciptDetails}" varStatus="theCount">
                                             <tr id=dynamicdiv${theCount.count}>
                                             	<td class="slno">${theCount.count}</td>
              									<td id="skuID${theCount.count}" >${item.skuId}</td> 
              									<td id="itemScanCode${theCount.count}" class="itemScanCode"  contenteditable='true'>${item.itemScanCode}</td>
              									<input type="hidden" id="skuId${theCount.count}" value="${item.skuId}" />
              									<input type="hidden" id="pluCode${theCount.count}" value="${item.pluCode}"/>
              									<input type="hidden" id="category${theCount.count}" value="${item.category}"/>
              									<input type="hidden" id="brandCode${theCount.count}" value="${item.brand}"/>
              									<input type="hidden" id="productRange${theCount.count}" value="${item.productRange}"/>
              									<input type="hidden" id="measureRange${theCount.count}" value="${item.measurementRange}"/>
              									<input type="hidden" id="color${theCount.count}" value="${item.color}"/>
              									<input type="hidden" id="size${theCount.count}" value="${item.size}"/>
              									<input type="hidden" id="ean${theCount.count}" value="${item.ean}"/>
              								   <input type='hidden' id="trackingRequired${theCount.count}" class="trackingRequired" value="${item.trackingRequired}"/>
              									<input type="hidden" id="utility${theCount.count}" value="${item.utility}"/>
                  							<td  id="Desc${theCount.count}"><div id="overflowtext"> <a href="#" data-toggle="tooltip"  title="${item.description}">${item.description}</a></div></td>    
<%--                   								<td id="Desc${theCount.count}" >${item.description}</td>
 --%>                  								<td id="UOM${theCount.count}" >${item.uom}</td>
                  								<td class='Price' id="Price${theCount.count}" >${item.price}</td>
                  								
                  								<c:choose>
                  								<c:when test="${item.trackingRequired == false}">
                  								<td class='Pack' onBlur='changePack(this);' contenteditable='true' onkeypress='return (this.innerText.length < 10)' contenteditable='true' id="Pack${theCount.count}" >${item.quantity }</td>
                  								</c:when>
                  								<c:otherwise>
                  								<td class='Pack' onBlur='changePack(this);'  onkeypress='return (this.innerText.length < 10)'  id="Pack${theCount.count}" >${item.quantity }</td>
                  								</c:otherwise>
                  								</c:choose>
                  								<td id="Cost${theCount.count}" >${item.cost}</td>
                  								  <c:choose>
                  								<c:when test="${item.trackingRequired == false}">
                  								<td id="Supplied${theCount.count}" onBlur='changeSuppliedPack(this);' contenteditable='true'>${item.supplied }</td>
                  								<td id="weighted${theCount.count}"  contenteditable='false'>${item.supplied}</td>
                  								<td class='Received' onBlur='changeReceivedPack(this);' id="Received${theCount.count}" contenteditable='true'>${item.recieved}</td>
                  								<td class='Rejected' onBlur='changeRejected(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true' id="Rejected${theCount.count}" >${item.rejected}</td>
                  							</c:when>
                  							<c:otherwise>
                  							<td id="Supplied${theCount.count}" onBlur='changeSuppliedPack(this);' >${item.supplied }</td>
                  								<td id="weighted${theCount.count}" >${item.supplied}</td>
                  								<td class='Received' onBlur='changeReceivedPack(this);' id="Received${theCount.count}" >${item.recieved}</td>
                  								<td class='Rejected' onBlur='changeRejected(this);' onkeypress='return (this.innerText.length < 10)'  id="Rejected${theCount.count}" >${item.rejected}</td>
                  							</c:otherwise>
                  							</c:choose>
                  							
                  								<td id="Del${theCount.count}" ><img id="Img${theCount.count}" src='${pageContext.request.contextPath}/images/itemdelete.png' style='width:20px;cursor:pointer;' onclick='deleteItem(this);' title='Delete ${item.item}'/></td>
                  	   						</tr>
                  	   						
              		   						</c:forEach> 
                                            
                                          </tbody>
                                       </table>
                                    </div>
                                
                                    <br/> <br/>
                                    
                                    
                                    
                                    <!--added by manasa  -->
                              <input type="hidden" id="operation" value="${operation}">
                       <input type="hidden" id="outletCategory" value="${stockReceiptObj.category}">
   <input type="hidden" id="outletBrandId" value="${stockReceiptObj.brand}">
    <input type="hidden" id="outletLocation" value=""> 
      <input type="hidden" id="outletSubcategory" value="${stockReceiptObj.subCategory}">
       <%-- <input type="hidden" id="outletDepartmentId" value="${skuObj.department}">
        <input type="hidden" id="outletSupplierId" value="${skuObj.supplierName}">  --%>
        <input type="hidden" id="outletZone" value="${stockReceiptObj.zoneId}">
       <input type="hidden" id="from" value="${stockReceiptObj.startDate}">
        <input type="hidden" id="to" value="${stockReceiptObj.endDate}"> 
         <input type="hidden" id="stockReceipts" value="${stockReceiptObj.searchCriteria}"> 
           <%-- <input type="hidden" id="maxRecords" value="${stockReceiptObj.maxRecords}"> --%>   
            <!--//..added by manasa  -->  
                                    
                                     <div class="row">
                                        
                                         <div class="form-group  col-lg-12">
                                         	<label><spring:message code="remarks.label" /></label>
                                            <textarea class="form-control"  onblur="criteria(this)" name="remarks" id="remarks" rows="2" style="resize: none;" placeholder="<spring:message code="enter.remarks.label" />" >${stockReceiptDetails.remarks}</textarea>
 										 </div>
                                        <!--  <div class="col-lg-3"></div> -->
                                        </div>
                                        <br/>
					
					
				<%-- 	<div class="row">
								<div class="col-lg-8"></div>
								<div class="form-group col-lg-3" style="text-align: right;"><label><spring:message code="stockrecipt.totalreceived" /> </label></div>
								<div class="form-group col-lg-1">
									<input type="text" readonly="readonly" class="form-control" id="totalReceived" name="totalReceived"  value="${stockReceiptDetails.receipt_total_qty}" />
								</div>
							</div>
							<div class="row">
								<div class="col-lg-8"></div>
								<div class="form-group col-lg-3" style="text-align: right;"><label><spring:message code="stockrecipt.totalrejected" /> </label></div>
								<div class="form-group col-lg-1">
									<input type="text" readonly="readonly" class="form-control" id="totalRejected" name="totalRejected"  value="${stockReceiptDetails.receipt_total_qty}" />
								</div>
							</div> --%>
					
					
					<div class="row">
						<div class="col-lg-8"></div>
						<div class="form-group col-lg-3" style="text-align: right;"><label><spring:message code="totalquantity.label" /> </label></div>
						<div class="form-group col-lg-1">
							<input type="text" readonly="readonly" class="form-control" id="totalQty" name="totalQty"  value="${stockReceiptDetails.receipt_total_qty}" />
						</div>
					</div>
					<div class="row">
						<div class="col-lg-8"></div>
						<div class="form-group col-lg-3" style="text-align: right;"><label><spring:message code="cost.label" /> </label></div>
						<div class="form-group col-lg-1">
							<input type="text" readonly="readonly" class="form-control" id="totalCost" name="totalCost"  value="${stockReceiptDetails.receipt_total}" />
						</div>
					</div>
					
                                  
  <!-- COMPOSE MESSAGE MODAL -->
         <div class="modal fade popup-display" id="items-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content" style="width: fit-content;">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" style="text-align: center;"><spring:message code="choose.a.price.label" /></h4>
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
                                        
                              <input type="hidden" id="flowUnder" value="${flowUnder}">
                                       
                                    </div><!-- /.box-body -->
									
						<div class="row" style="text-align: center;">
						<input type="button" class="btnCls" style="margin-right:10%;" onclick="validateStockReceipt('Draft','new','','');" value="<spring:message code="save.label" />" />						<%-- <input type="button" class="btnCls" style="margin-left:15px;" onclick="validateStockReceipt('Draft','update','${stockReceiptDetails.goods_receipt_ref_num}','${stockReceiptDetails.id_goods_receipt}');" value="<spring:message code="save.label" />" /> --%>
			
						 <input type="button" class="btnCls" style="" onclick="validateStockReceipt('Received','new','','');" value="Submit" />		
						<c:if test="${sessionScope.role != 'super admin' && flowUnder == 'outlet'}">
		           		<c:forEach var="accessControl" items="${sessionScope.outletGoodsTransfer}">
		                	<c:if test="${accessControl.appSubDocument == 'OutletStockReceipt' && accessControl.write == true && accessControl.read == true}">
		                		<input type="button" class="btnCls " style="margin-right:10%;" onclick="searchStockReceipts('','all','0');" value="<spring:message code="cancel.label" />" />
		                	</c:if>
		                </c:forEach>
		             </c:if>
					<c:if test="${sessionScope.role == 'super admin' && flowUnder == 'outlet'}">
		                		<input type="button" class="btnCls " style="margin-right:10%;" onclick="searchStockReceipts('','all','0');" value="<spring:message code="cancel.label" />" />
		             </c:if>
					
					
					
					<c:if test="${sessionScope.role != 'super admin' && flowUnder == 'warehouse'}">
		           	   <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
		                	<c:if test="${accessControl.appSubDocument == 'WarehouseStockReceipt' && accessControl.write == true}">
		                	<input type="button" class="btnCls " style="margin-right:10%;" onclick="searchStockReceipts('','all','0');" value="<spring:message code="cancel.label" />" />
		                	</c:if>
		                </c:forEach>
		             </c:if> 
					
					
						<%-- <input type="button" class="btnCls buttonMargin"  onclick="viewAllStockReceipts('','all','0');" value="<spring:message code="cancel.label" />" /> --%>
						</div>
						
					
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
       <%--  <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script>
<!-- DATA TABES SCRIPT -->
      	<script type="text/javascript">
		$(function() {
			 $("#date").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"}); 
		});
	</script> --%>
        
</body>
</html>
		    		 