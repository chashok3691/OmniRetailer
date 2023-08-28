<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : inventorymanager/retailoutlets/newstockissue.jsp
 * file type		        : JSP
 * description				: The new store form is displayed using this jsp
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/excelReader/excelreader.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
    
    
    <!--  added by        :  koti bomminei
      description     :  to ristrict the user from entering special characters     -->


	
	 
    
<script>
$(document).ready(function(){
	/* $('.dataTables_empty').remove(); */
	callCalender('date');
debugger
	var dateTime = getCurrentDate();
	  var date = dateTime.split(' ');
	  date = date[0].split('/');
	  var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
	//  $('#date').val(formatedDate);
	  $('#createdDate').val(formatedDate);
	  $('#date').val(formatedDate);
	  
	  var fromLocation =  $("#fromLocation").val();
	  $("#tolocation option[value='"+fromLocation+"']").remove();
	  $("#fromLocation").change(function () {
			$("#tolocation").append('<option value="'+fromLocation+'">'+fromLocation+'</option>');
			fromLocation = $("#fromLocation").val();
		    $("#tolocation option[value='"+fromLocation+"']").remove();
		    //getStoreslist();
		    getLocationChanges('issue');
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
	 
	    	 
	  focusDiv('Error');
   	 
	  getLocationChanges('issue');
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

@-webkit-keyframes blinker {
  from {opacity: 1.0;}
  to {opacity: 0.0;}
}
.blink{
	text-decoration: blink;
	-webkit-animation-name: blinker;
	-webkit-animation-duration: 0.5s;
	-webkit-animation-iteration-count:infinite;
	-webkit-animation-timing-function:ease-in-out;
	-webkit-animation-direction: alternate;
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
                                <h3 class="box-title" style="padding :5px;  border:1px solid  #808080;"><spring:message code="new.stockissue.label"/></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form role="form">
                                    <div class="box-body">
                                     <div id="Error" class="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                                    <div id="Success"  style="text-align: center;color: blue;font-size: 2;font-weight: bold;">${success}</div>
                                    <div class="row">
                                    	<div class="form-group col-lg-2"  style="margin-bottom:0px">
                                            <label><spring:message code="date.label" /></label>
	                                        <input class="form-control calendar_icon" readonly="readonly" name="createdDate" id="createdDate" size="20" type="text" />
                                        </div>
                                         <div class="form-group col-lg-1"  style="margin-bottom:0px"></div>
                                        <input type="hidden" id="type" value="issue" />
                                          <%-- <input type="hidden" id="type" value="${storeDetailsList.zeroStock}" /> --%>
                                        <div class="form-group col-lg-2"  style="margin-bottom:0px">
                                            <label><spring:message code="delivery_date.label" /><span class="requiredField">*</span>/<spring:message code="time.label" /><span class="requiredField">*</span></label>
	                                        <input class="form-control calendar_icon" readonly="readonly" value="${stockissue.deliveryDate}" style="background-color: white;" name="deliveryDate" id="date" size="20" type="text" onfocus="callCalender('date')" onclick="callCalender('date')" placeholder="DD/MM/YYYY"/>
                                           <span id="deliveryDateError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                         <div class="form-group col-lg-1"  style="margin-bottom:0px"></div>
                                         
                                        <div class="form-group col-lg-2" style="margin-bottom:0px">
<%--                                             <label><spring:message code="requested.label" /> <spring:message code="by.label" /></label>
 --%>                                            
                                             <c:choose>
                                            <c:when test="${flowUnder=='warehouse'}">
                                              <input type="hidden" onblur="criteria(this)"   class="form-control" id="requested" name="Requested_by"   value="${sessionScope.firstName}" />
                                            </c:when>
                                            <c:otherwise>
                                             <input type="hidden" onblur="criteria(this)"   class="form-control" id="requested" name="Requested_by"   value="${sessionScope.firstName}" />
                                            </c:otherwise>
                                            </c:choose>
                                            <span id="requestedByError" style="text-align:right;color:red;font-weight:bold;"></span>
                                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="category.label"/></label>
                             <c:set var="whstockissuevalue" value=""/>
                           	<c:forEach var="accessControl" items="${sessionScope.warehouseStockIssueFeilds}">
			                <c:if test="${accessControl.appDocumentFieldName == 'Category' && accessControl.fieldWrite == true && accessControl.fieldRead == true}">
                            <input type="hidden" id="test" value="${accessControl.appDocumentFieldValue}">
                             <c:set var="whstockissuevalue" value="${accessControl.appDocumentFieldValue}"/>
                           </c:if>
						   </c:forEach>
						   
						   
						   
						   
                           <select class="form-control" id="outletCategory" onchange="searchSubCategories('outletCategory','outletSubcategory')">
                           		<%--  <option value=""><spring:message code="ALL.label"/></option> --%>
                           		

	                            <c:forEach var="categoryList" items="${categoryListIssue}">
	                             <c:if test="${fn:trim(categoryList.categoryName) == whstockissuevalue}">
									<option value="${categoryList.categoryName}" ${categoryList.categoryName == whstockissuevalue ? 'selected' : ''} id="${categoryList.categoryName}" >${categoryList.categoryName}</option>
						 	</c:if>
						 		</c:forEach>
						 		<c:if test="${whstockissuevalue==''}">
						 		<option value=""><spring:message code="ALL.label"/></option>
						 		</c:if>
						 		
						 		<c:if test="${flowUnder!='warehouse'}">
	                            <c:forEach var="categoryList" items="${categoryListIssue}">
									<option value="${categoryList.categoryName}" ${categoryList.categoryName == whstockissuevalue ? 'selected' : ''} id="${categoryList.categoryName}" >${categoryList.categoryName}</option>
						 		</c:forEach>
						 		</c:if>
						 		
	                        </select>
                      </div>
                                       
                                       
                                        </div>
                                         
                                    
                                          <div class="form-group col-lg-1"  style="margin-bottom:0px"></div>
                                          
                                          
                                          
                                            <div class="form-group col-lg-2"  style="margin-bottom:0px">
                                            <label>From Location<span class="requiredField">*</span></label>
                                            <input type="hidden" id = "fromlocation">
                                             <select class="form-control" name="shipped_from" id="fromLocation" onchange="return getStorelistByLocation(this.options[this.selectedIndex].value);">
                                             <c:forEach var="location" items="${locationsList}">
												<option value="${location}" ${location == outletLocation ? 'selected' : ''} >${location}</option>
											</c:forEach>
                                           </select>
                                           <span id="locationError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div> 
                                          
                                        
                                      
                                        <div class="form-group col-lg-2" style="display: none">
                                           
                                         
												
												<input type="hidden" id="pageType" value="new" />
										
                                           
                                        </div>
                                        <div class="form-group col-lg-2" style="display: none">
                                           
                                           <c:forEach var="outlet" items="${allLocationstatesList}">
												<input type="hidden" id="${fn:replace(outlet.locationId,' ','_') }" 
												  value="${outlet.state}" />
											</c:forEach>
                                           
                                        </div>
                                         <div class="form-group col-lg-2" style="display: none">
                                           
                                           <c:forEach var="warehouse" items="${warehouseStatesList}">
												<input type="hidden" id="${fn:replace(warehouse.locationId,' ','_') }" 
												  value="${warehouse.state}" />
											</c:forEach>
                                           
                                        </div>
                                          <div class="form-group col-lg-1"  style="margin-bottom:0px"></div>
                                        </div>
                                    <div class="row">
                                    	 <div class="form-group col-lg-3"  style="margin-bottom:0px">
                                            <label><spring:message code="stock.request.ref.label" /></label>
                                             <input type="text" onblur="criteria(this)"   class="form-control allField searchItems searchBar" value="${stockissue.goods_Request_Ref}" style="background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right" name="searchStockRequest" id="searchStockRequest" placeholder="<spring:message code="stock.request.ref.label" />" />
											<div class=services>
										    		<div class="items">
										     			<ul class="matchedStringUl searchStockRequest" style="width: 89%!important;padding: 0px!important;"></ul>
										   			</div>
												</div>
											<input type="hidden" name="stockRequestRef" id="stockRequestRef" value=""  />
                                            <span id="stockRequestRefError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        
                                        
                               <div class="form-group col-lg-2"  style="margin-bottom:0px">
                                        <label><spring:message code="shiper_id.label" /></label>
                                         <input class="form-control"  value="" style="background-color: white;" name="transporter" id="transporter"  type="text" />
                                        <span id="transporterError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        
                              </div>
                                        
                                       
                                          <div class="form-group col-lg-1"  style="margin-bottom:0px" ></div>
                                           <div class="form-group col-lg-2"  style="margin-bottom:0px" >
                                          
                                           <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="subcategory.label"/></label>
                           <select class="form-control" id="outletSubcategory" >
                           <c:choose>
                           <c:when test="${subcategory == ''}">
                             <option value=""><spring:message code="ALL.label"/></option>
                          </c:when>
                           <c:otherwise>
                              <option value="${subcategory}">${subcategory}</option>
                            <option value=""><spring:message code="ALL.label"/></option>
                           </c:otherwise>
                           		 </c:choose>
                           		
	                           
	                        </select>
                      </div>
                                          
                                          
                                            </div>
                                       <%--  <div class="form-group col-lg-2">
                                            <label><spring:message code="inspected.label" /> <spring:message code="by.label" /> </label>
                                            <input type="text" onblur="criteria(this)"   class="form-control" name="InspectedBy" id="inspected" value="${stockissue.inspectedBy}" placeholder='<spring:message code="enter.name.label"/>'/>
                                            <span id="inspectedByError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div> --%>
                                          <div class="form-group col-lg-1"  style="margin-bottom:0px" ></div>
                                          <div class="form-group col-lg-2"  style="margin-bottom:0px">
                                            <label><spring:message code="tolocation.label" /><span class="requiredField">*</span></label>
                                             <select class="form-control" name="receipt_location" id="tolocation" onchange="getLocationChanges('issue')">
                                             <c:forEach var="location" items="${allLocationsList}">
												<option value="${location}" ${location == stockissue.issue_to ? 'selected' : ''} >${location}</option>
											</c:forEach>
                                           </select>
                                           <span id="tolocationError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div> 
                                     <%--    <div class="form-group col-lg-2">
                                            <label><spring:message code="received.label" /> <spring:message code="by.label" /></label>
                                            <input type="text" onblur="criteria(this)"   class="form-control" id="received" name="Received_by" value="${stockissue.received_by}" placeholder='<spring:message code="enter.name.label"/>'/>
                                            <span id="receivedByError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div> --%>
                                          <div class="form-group col-lg-1"></div>
                                     </div>
                                     
                                     
                                     
                                     <div class="row">
                                     <input type="hidden" id="type" value="issue" />
                                    	<%-- <div class="form-group col-lg-3">
                                            <label><spring:message code="requestdate.label" /></label>
	                                        <input class="form-control calendar_icon" readonly="readonly" style="background-color: white;" name="requestedDate" id="rdate" size="20" type="text" onfocus="callCalender('rdate')" onclick="callCalender('rdate')" placeholder="DD/MM/YYYY"/>
                                           <span id="requestedDateError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div> --%>
                                    <%--  
                                     <div class="form-group col-lg-3">
                                            <label><spring:message code="shipmentrefno.label" /><span class="requiredField">*</span></label>
                                            <input type="text" class="form-control" name="ShipmentRefNo" id="shipmentrefno" placeholder='<spring:message code="enter.ref.label"/>'/>
                                            <span id="ByError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div> --%>
                                     
                                     
                                      <div class="form-group col-lg-2">
                                         <label><spring:message code="requestdate.label" />/<spring:message code="time.label" /></label>
                             <input class="form-control"  value="" style="background-color: white;" name="reqdatetime" id="reqdatetime"  type="text" />
                                        
                                        
                                        </div>
                                       <div class="form-group col-lg-1"></div>
                                     <div class="form-group col-lg-2">
                                            <label><spring:message code="shipmentmode.label" /></label>
                                            <input type="hidden" id = "fromlocation">
                                             <select class="form-control" name="shipped_from" id="shipmentMode">
											 <option value="Ordinary" ${stockissue.shipmentMode == 'Ordinary' ? 'selected' : ''} >Ordinary</option>
                                           	<option value="Road" ${stockissue.shipmentMode == 'Road' ? 'selected' : ''} >Road</option>
												<option value="Rail" ${stockissue.shipmentMode == 'Rail' ? 'selected' : ''} >Rail</option>
												<option value="Express" ${stockissue.shipmentMode == 'Express' ? 'selected' : ''} >Express</option>
                                           </select>
                                        </div>
                                      <div class="form-group col-lg-1"></div>
                                     
                                      <div class="form-group col-lg-2">
                                           <%--  <label><spring:message code="received.label" /> <spring:message code="by.label" /></label>--%>
                                            <input type="hidden" onblur="criteria(this)"   class="form-control" id="received" name="Received_by" value="${sessionScope.firstName}" placeholder='<spring:message code="enter.name.label"/>'/>
                                           <%--   <span id="receivedByError" style="text-align:right;color:red;font-weight:bold;"></span> --%>
                                       
                                       
                                       
                                    <label><spring:message code="delivered.by.label" /> <span class="requiredField">*</span></label>
                                            <input type="text" onblur="criteria(this)"   class="form-control" name="delivered_by" value="${stockissue.delivered_by}" id="delivered" placeholder='<spring:message code="enter.name.label"/>'/>
                                            <span id="deliveredByError" style="text-align:right;color:red;font-weight:bold;"></span>
                                      </div>
                                        
                                      
                                     
                                 <div class="form-group col-lg-1"></div>
                                  <div class="form-group col-lg-2" style="margin-bottom: 0px;margin-top: 23px;display:none" id="franchiseBlink">
                                  <label><spring:message code="customer.newfeedback.emptyspace" /></label>
                               
                           
                         <span class="blink">Franchise Transfer </span>
                               
				     	
                                  </div>
                                     
                                     
                                     </div>
                                     
                                      <div class="row">
                                         
                                        <div class="form-group col-lg-7" style="text-align:center;margin-bottom: 0.0%;margin-top: 2%;">
                                         <input type="hidden" id="desc"/>
                                         	<%-- <label><spring:message code="search.items.here.label" /></label> --%>
                                         	<input type="text"  class="form-control searchItemsForIssue searchBar" style="padding: 4px" id="searchItems"  placeholder="<spring:message code="search.items.here.label" />"  style="background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right"/>
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl receipt" style=""></ul>
								   				</div>
											</div>
  										 </div>
                                        <!--  <div class="col-lg-3">
                                         	 <div id="triggerEvent"></div>
                                         </div> -->
                                         
                                          <div class="form-group col-lg-1" style="padding: 0px;padding-top: 25px;margin-bottom: 0px !important;">
											<input type="checkbox" style="vertical-align: -2px" id="searchScan" />
											 &nbsp;&nbsp;Scan
										</div>
                                         <div class="col-lg-2" style="margin-top: 2%;">
						<input type="file" class="btn bg-olive btn-inline" accept=".xlsx" style="padding: 4px;width: 100%;" id="fileUploadCSV" onchange="addNameToTextBox('fileUploadCSV')"/>
						</div>
						<div class="col-lg-1" style="margin-top: 2%;padding-left: 0px;" >
    					<input type="button"  class="btn bg-olive btn-inline" style="padding: 5px;width: 100%;margin-left: 0%;" value="Upload" id="btnUpload"  onclick="importIssueSkuExcelData(this)" />
    					<!-- <input id="skuMasterFile" class="form-control" placeholder="Choose File" disabled="disabled"> -->
						</div>
						
						<div class="col-lg-1" style="margin-top: 2%;padding-left: 0px;">
    					   <a  onclick="clearTableData();" style="padding:5px;width: 100%;margin-left: 0%;" class="btn bg-olive btn-inline" ><spring:message code="storage_systems_clear.label"/></a>
						</div>
                         </div>

							<div class="table-responsive" style="max-height: 250px; overflow-y: auto;min-height: 250px;">
								<c:set var="totalCost" value="0" />
								<c:choose>
									<c:when test="${flowUnder=='warehouse'}">
										<table id="productsList"
											class="table table-bordered table-hover">
											<thead style="background-color: #3c8dbc; color: #ffffff">
												<tr>
													<th><div>
															<spring:message code="sl.no.label" />
														</div></th>
													<th><spring:message code="item.code.label" /></th>
													<th><spring:message code="ScanCode.label" /></th>
													<th><spring:message code="hsnCode.label" /></th>
													<th><spring:message code="item.desc.label" /></th>
													<th><spring:message code="uom.label" /></th>
													<th><spring:message code="price.label" /></th>
													<th><spring:message code="Reqqty.label" /></th>
													<th><spring:message code="issued.qty.label" /></th>
													<th><spring:message code="actualqty.label" /></th>
													<th>Pack Ref</th>
													<th><spring:message code="avail.qty.label" /></th>
													<th><spring:message code="sale.value" /></th>
													<th><spring:message code="action.label" /></th>
												</tr>
											</thead>
											<tbody style="text-align: center;">


												<c:forEach var="item" items="${stockissue.reciptDetails}"
													varStatus="theCount">
													<tr id="dynamicdiv${theCount.count}">
														<td class="slno">${theCount.count}</td>
														<td id="Name${theCount.count}">${item.item}</td>
														<input type="hidden" id="skuId${theCount.count}" value="${item.skuId}" />
														<input type="hidden" id="pluCode${theCount.count}"
															value="${item.pluCode}" />
														<input type="hidden" id="category${theCount.count}"
															value="${item.category}" />
														<input type="hidden" id="brandCode${theCount.count}"
															value="${item.brand}" />
														<input type="hidden" id="productRange${theCount.count}"
															value="${item.productRange}" />
														<input type="hidden" id="measureRange${theCount.count}"
															value="${item.measurementRange}" />
														<input type="hidden" id="color${theCount.count}"
															value="${item.color}" />
														<input type="hidden" id="size${theCount.count}"
															value="${item.size}" />
														<input type="hidden" id="ean${theCount.count}"
															value="${item.ean}" />
														<input type="hidden" id="utility${theCount.count}"
															value="${item.utility}" />
														<input type='hidden'
															id="trackingRequired${theCount.count}"
															class="trackingRequired" value="${item.trackingRequired}" />
														<td id="itemScanCode${theCount.count}"
															class="itemScanCode" contenteditable="true">${item.itemScanCode}</td>
														<td id="itemHSNCode${theCount.count}"
															class="itemHSNCode" >${item.hsnCode}</td>
														<td id="Desc${theCount.count}">${item.description}</td>
														<td id="UOM${theCount.count}">${item.uom}</td>
														<td class='Price' id="Price${theCount.count}">${item.price}</td>

														<c:choose>
															<c:when test="${item.trackingRequired == false}">
																<td class='Pack' id="Pack${theCount.count}">${item.indentQty }</td>
															</c:when>
															<c:otherwise>
																<td class='Pack' id="Pack${theCount.count}">${item.indentQty }</td>
															</c:otherwise>
														</c:choose>

														<c:choose>
															<c:when test="${item.trackingRequired == false}">
																<td id="Supplied${theCount.count}"
																	onBlur='changeIssued(this);'
																	onkeypress='return (this.innerText.length < 10)'
																	contenteditable='true'>${item.quantity}</td>
																<td class='Received' id="Received${theCount.count}"
																	contenteditable='true'>${item.actualQty}</td>
																<%-- <td onBlur='changeRejected(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true' id="Rejected${theCount.count}" >${item.rejected}</td> --%>
															
															<td class='packReference' id="packReference${theCount.count}" >${item.packageReference}</td>
															
																<td id="availableQty${theCount.count}">${item.avlQty}</td>
															</c:when>
															<c:otherwise>

																<td id="Supplied${theCount.count}"
																	onBlur='changeIssued(this);'
																	onkeypress='return (this.innerText.length < 10)'>${item.quantity}</td>
																<td class='Received' id="Received${theCount.count}">${item.actualQty}</td>
															<td class='packReference' id="packReference${theCount.count}" >${item.packageReference}</td>
															
																<%-- <td onBlur='changeRejected(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true' id="Rejected${theCount.count}" >${item.rejected}</td> --%>
																<td id="availableQty${theCount.count}">${item.avlQty}</td>
															</c:otherwise>

														</c:choose>

														<fmt:formatNumber var="totalCost" groupingUsed="false"
															type="number" minFractionDigits="2" maxFractionDigits="2"
															value="${(item.price)*(item.quantity)}" />

														<td id="Cost${theCount.count}">${totalCost}</td>
														<td id="Del${theCount.count}"><img
															id="Img${theCount.count}"
															src='${pageContext.request.contextPath}/images/itemdelete.png'
															style='width: 12%; cursor: pointer;'
															onclick='deleteItem(this);' title='Delete ${item.item}' /></td>
													</tr>

												</c:forEach>
</tbody>
										</table>

									</c:when>
									<c:otherwise>
										<table id="productsList"
											class="table table-bordered table-hover">
											<thead style="background-color: #3c8dbc; color: #ffffff">
												<tr>
													<th><div>
															<spring:message code="sl.no.label" />
														</div></th>
													<th><spring:message code="item.code.label" /></th>
													<th><spring:message code="itemScanCode.label" /></th>
													<th><spring:message code="hsnCode.label" /></th>
													
													<th><spring:message code="item.desc.label" /></th>
													<th><spring:message code="uom.label" /></th>
													<th><spring:message code="price.label" /></th>
													<th><spring:message code="pack.label" /></th>
													<th><spring:message code="issued.qty.label" /></th>
													<th><spring:message code="actualqty.label" /></th>
													<th><spring:message code="avail.qty.label" /></th>
													<th><spring:message code="cost" /></th>
													<th><spring:message code="action.label" /></th>
												</tr>
											</thead>
											<tbody style="text-align: center;">
												<c:choose>
													<c:when test="${flowUnder=='warehouse'}">
													</c:when>

													<c:otherwise>

														<c:forEach var="stockDetails"
															items="${stockissue.reciptDetails}" varStatus="theCount">


															<tr id="dynamicdiv${theCount.count}"
																style="margin-top: 5px;">
																<td class="slno">${theCount.count}</td>
																<td id="Name${theCount.count}">${stockDetails.skuId}</td>
																<input type="hidden" id="skuId${theCount.count}"
																	value="${stockDetails.skuId}">
																<input type="hidden" id="pluCode${theCount.count}"
																	value="${stockDetails.pluCode}">
																<input type="hidden" id="category${theCount.count}"
																	value="${stockDetails.category}">
																<input type="hidden" id="brandCode${theCount.count}"
																	value="${stockDetails.brand}">
																<input type="hidden" id="productRange${theCount.count}"
																	value="${stockDetails.productRange}">
																<input type="hidden" id="measureRange${theCount.count}"
																	value="${stockDetails.measurementRange}">
																<input type="hidden" id="ean${theCount.count}"
																	value="${stockDetails.ean}">
																<input type="hidden" id="utility${theCount.count}"
																	value="${stockDetails.utility}">
																<input type="hidden" id="color${theCount.count}"
																	value="${stockDetails.color}">
																<input type="hidden" id="size${theCount.count}"
																	value="${stockDetails.size}">
																<input type="hidden"
																	id="trackingRequired${theCount.count}"
																	name="trackingRequired" class="trackingRequired"
																	value="${stockDetails.trackingRequired}">

																<td id="itemScanCode${theCount.count}"
																	class="itemScanCode" contenteditable="true">${stockDetails.itemScanCode}</td>
																	<td id="itemHSNCode${theCount.count}"
																	class="itemHSNCode" >${stockDetails.hsnCode}</td>
																	
																<td id="Desc${theCount.count}">${stockDetails.description}</td>
																<td id="UOM${theCount.count}">${stockDetails.uOM}</td>
																<td class="Price" id="Price${theCount.count}">${stockDetails.price}</td>
																<td id="Pack${theCount.count}" class="Pack"
																	onblur="changePack(this);"
																	onkeypress="return (this.innerText.length < 10)"
																	contenteditable="false">${stockDetails.quantity}</td>
																<td id="Supplied${theCount.count}"
																	onblur="changeIssued(this)" contenteditable="true">${stockDetails.issued}</td>
																<td class="Received" id="Received${theCount.count}"
																	contenteditable="true">${stockDetails.recieved}</td>
																<td id="availableQty${theCount.count}">1</td>
																<td id="Cost1">${stockDetails.avlQty}</td>
																<td id="Del1"><img id="Img${theCount.count}"
																	src="${pageContext.request.contextPath}/images/itemdelete.png"
																	style="width: 12%; cursor: pointer;"
																	onclick="deleteItem(this);"
																	title="Delete ${stockDetails.skuId}"></td>
															</tr>

														</c:forEach>

													</c:otherwise>

												</c:choose>



											</tbody>
										</table>
									</c:otherwise>
								</c:choose>

							</div>
							<!--  </div> -->
                                    <br/> <br/>
                                    <br/>
							<div class="row">
							<div class="form-group  col-lg-4" >
							<div class="row" style="text-align: center;">
						 <input type="button" class="btnCls " style="margin-top: 27px;" onclick="validateStockIssue('Submitted','new','','');" value="Submit" />
					<c:if test="${sessionScope.role == 'super admin'}">
						<input type="button" class="btnCls " style="margin-top: 27px; margin-left: 5px;" onclick="viewAllStockIssues('','all','0');" value="<spring:message code="cancel.label" />" />
					</c:if>
					<c:if test="${sessionScope.role != 'super admin' && flowUnder == 'outlet'}">
		           		<c:forEach var="accessControl" items="${sessionScope.outletGoodsTransfer}">
		                	<c:if test="${accessControl.appSubDocument == 'OutletStockIssue' && accessControl.write == true && accessControl.read == true}">
		                		<input type="button" class="btnCls " style="margin-top: 27px; margin-left: 5px;" onclick="viewAllStockIssues('','all','0');" value="<spring:message code="cancel.label" />" />
		                	</c:if>
		                </c:forEach>
		             </c:if>
		             <c:if test="${sessionScope.role != 'super admin' && flowUnder == 'warehouse'}">
		            <input type="button" class="btnCls " style="margin-top: 27px; margin-left: 5px;" onclick="validateStockIssue('Draft','new','','');" value="Draft" />
		             
			           <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
			                <c:if test="${accessControl.appSubDocument == 'WarehouseStockIssues' && accessControl.write == true && accessControl.read == true}">
			                	<input type="button" class="btnCls " style="margin-top: 27px; margin-left: 5px;" onclick="viewAllStockIssues('','all','0');" value="<spring:message code="cancel.label" />" />
		                	</c:if>
		                </c:forEach>
		             </c:if>
					
					
				
						</div>
						</div>	
						
								 <div class="form-group  col-lg-4">
                                       <textarea class="form-control" onblur="criteria(this)" name="remarks" id="remarks" style="resize: none;" rows="4" placeholder="<spring:message code="enter.remarks.label" />" >${stockissue.remarks}</textarea>
 								     <span id="remarksError" style="text-align:right;color:red;font-weight:bold;"></span>
 								</div>
 										 
 									<div class="form-group col-lg-4" style="border:1px solid #ccc"> 
 										<div class="form-group col-lg-12" style="margin-bottom: 0px; margin-top: 1%;"> 
 									
 									<div class="form-group col-lg-3"> 
 									<label style=" white-space: nowrap;"><spring:message code="summary.itemcount" /> </label>
 									</div>
 									<div class="form-group col-lg-3" style="padding-right: 0px;">
								<c:set var="qtyissued" value="0"  />
	              <c:forEach var="summaryList" items="${stockissue.reciptDetails}" varStatus="thecount">
				<c:set var="qtyissued" value="${qtyissued+((summaryList.quantity))}" scope="page" />
				</c:forEach>
									<input type="text" readonly="readonly" class="form-control" id="itemcount" name="itemcount"  value="" />
								</div>
 									
 									<div class="form-group col-lg-3"> 
							<label style=" white-space: nowrap;"><spring:message code="totalqty.label" /> </label>
							</div>
								<div class="form-group col-lg-3" style="padding-right: 0px;">
								<c:set var="qtyissued" value="0"  />
	              <c:forEach var="summaryList" items="${stockissue.reciptDetails}" varStatus="thecount">
				<c:set var="qtyissued" value="${qtyissued+((summaryList.quantity))}" scope="page" />
				</c:forEach>
									<input type="text" readonly="readonly" class="form-control" id="totalQty" name="totalQty"  value="${qtyissued}" />
								</div>
								</div>
								<div class="form-group col-lg-12" style="margin-bottom: -2%;"> 
								<div class="form-group col-lg-3">
				<label style=" white-space: nowrap;"><spring:message code="discount.label" /> </label>
 
								</div>
								<div class="form-group col-lg-3" style="padding-right: 0px;">
						       <input type="text" readonly="readonly" class="form-control" id="discount" name="discount"  value="" />
								
								</div>
								<div class="form-group col-lg-3">
								
								<label style=" white-space: nowrap;"><spring:message code="cost.label" /> </label>
								</div>
								
								<div class="form-group col-lg-3" style="padding-right: 0px;">
									<input type="text" readonly="readonly" class="form-control" id="totalCost" name="totalCost"  value="${stockissue.issue_total}" />
								</div>
								</div>
								
							</div>
							</div>
						    <input type="hidden" id="whreturnflag" value="1">     	
                                  
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
                             <th>Item Description</th>
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
							<input type="hidden" id="outletlocation" value="${selectedLocation}">  
							<input type="hidden" id="companyType" value="${companyType}">  
							
									  <%-- <c:forEach var="outletDetails" items="${storeDetailsList}"> --%>
							  <input type="hidden"  id="zeroStock" value="" /> 
						<%-- </c:forEach> --%>
						
						
					
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
<%--         <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script>
<!-- DATA TABES SCRIPT -->
      	<script type="text/javascript">
		$(function() {
			 $("#date").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"}); 
		}); 
	</script>--%>
        
</body>
</html>
		    		 