<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/master/stockRequestsll.jsp
 * file type		        : JSP
 * description				: The department details table is displayed using this jsp
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
        <!-- DATA TABLES -->
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
          <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
         <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
          <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
          <script type="text/javascript" src="${pageContext.request.contextPath}/js/stockTransfer/stockRequest.js"></script>
<style type="text/css">
.buttons {
	float: right;
	padding-top: 0px;
	margin-right: 1%;
	margin-top:1%;
}
.iosclosebutton1 {
    width: 100%;
    border: 1px solid #3c8dbc;
    background: #3c8dbc;
    color: #fff;
    font-size: 15px!important;
    padding: 0px 0 0px 0;
    height: 24px!important;
    font-size: 18px;
    letter-spacing: 1px;
    float: right;
}
.list a.button {
position:relative;
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 5px 15px 5px 15px;
	background: #3c8dbc;

	border-radius: 5px;
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
}
a.button{
   position: relative;
    text-decoration: none;
    color: white;
    display: inline-block;
    padding: 7px 10px 32px 10px;
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
.col-lg1-2{
    width: 25% !important;
}
.iosclosebutton {
    width: 25%;
    border: 1px solid #3c8dbc;
    background: #3c8dbc;
    color: #fff;
    font-size: 15px!important;
    padding: 3px 0 4px 0;
    height: 30px!important;
    font-size: 18px;
    letter-spacing: 1px;
    float: right;
}
.iospopup {
    width: 30%!important;
    margin-left:45%;
    margin-top: 0%;
    border-radius: 0;
}
.modal-dialog {
    width: auto;
    margin: 30px auto;
}
.modal-dialog
{
 margin-top: 14.5%;
 }
.billsPopUp
{
	position: relative;
    border: 2px solid gray;
    border-radius: 10px;
    background: #eee;
    min-height: 400px;
    max-height: 500px;
  /*   margin-right:2%; */
}
.billsPopUpUpArrow
{
	float: right;
    margin-right: 1%;
    font-size: 35px;
    color: gray;
    position: relative;
    margin-top: -2.3%;
    border-bottom: 3px solid lightgrey;
    height: 25px;
    border-bottom-width: 2px;
}
@media (min-width:1400px) and (max-width:1600px)
{
.billsPopUp {
    	margin-left: -20px !important;
      /*   margin-right:2% !important; */
}
.modal-dialog
{
 margin-top: 13%;
 }
.billsPopUpUpArrow {
  margin-top: -2% !important;
  border-bottom-width: 3px !important;
 }
   
}

@media only screen and (max-width:479px)
{
.billsPopUp {
    margin-right: -30px;
    margin-left: -30px;
}
.summaryImg{
		width: auto;
    float: left;
	}
}
@media (min-width: 1200px){
	.summaryBtn{
		margin-top: 3px;
	}
}
@media (min-width: 1200px){
	.summaryImg{
	     width: 50%;
    float: right;
	}
}
.billsPopUp::after {
    content: "";
    position: absolute;
    bottom: 100%;
    /* left: 50%; */
    right: 1.5%;
    /* margin-left: 9px; */
    border-width: 14px;
    border-style: solid;
    border-color: transparent transparent #eee transparent;
}
.fa1{
   /*    border: 1px solid grey;
    border-radius: 50%;
    width: 29px;
    text-align: center;
    height: 28px; */
        margin-top: -10px;
    font-size: 26px;
        cursor: pointer;
    color: grey;
}
.fa-sort-asc{
margin-top: 5px !important;
}
.modal-header .close {
   margin-top: -9px;
   color: #000;
   margin-right: -4px;
   width: 22px;
   margin-top: -31px;
}
</style> 
<script type="text/javascript">
$(document).ready(function(){
	callCalender('fromDate');
	callCalender('to');
/* var err = $("#err").val();
if(err != "")
  alert(err); */


$("#searchStock").val($("#stockRequestsSearch").val());
$("#searchStock").focus();
var reqtype = $("#requestType").val();
$('#searchStock').on('input',function(e){
	if($(this).val().trim()==""){
		viewStockRequest(reqtype,'0');

	}
});

//added by manasa
$('#mySearch').click(function(){
    var search = $('#searchStock').val();
    return searchStockRequests(search,'','0');
})
$('#searchStock').keypress(function(e){
    if(e.which == 13){//Enter key pressed
        $('#mySearch').click();//Trigger search button click event
    }
});


var sDate=$("#sd").val();
var s=sDate.split(' ');
$("#fromDate").val(s[0]);

var eDate=$("#ed").val();
var e=eDate.split(' ');
$("#to").val(e[0]); 


// added to fetch locations based on zone 
/* var zone = $("#outletZone").val();
var location = $("#outletLocation").val();
debugger;
var flowUnder = $("#flowUnder").val();


if( zone != null && zone !="" && flowUnder !=  'outlet'  && location == "")
	searchlocationsBasedOnZoneForDashboard('outletZone','outletLocation','warehouse');

else if(location == "")
	
	searchlocationsBasedOnZoneForDashboard('outletZone','outletLocation','');
else
	{
	
	} */

});
</script>        
</head>
<body>
 <!-- Content Header (Page header) -->


<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
  <div class="box box-primary">
  
                      <div class="box-body table-responsive">
                          <div class="row">
	                          <div class="form-group col-lg-12" style="text-align: center;">
		                			<label style="font-size: 22px;text-align: center"><spring:message code="all.stock.request.label" /></label>
		                     </div>
		                     </div>
		                      <div class="col-lg-11" style=" background: #f4f4f4;    padding: 10px 20px;    width: 88%;">
                                	
                                	
                         <div class="row">
                         <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="zone.label"/></label>
                        <c:choose>
                        <c:when test="${flowUnder == 'outlet'}">
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZoneForDashboard('outletZone','outletLocation','Retail Outlet')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
	                        </c:when>
	                        <c:otherwise>
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZoneForDashboard('outletZone','outletLocation','warehouse')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
	                        
	                        
	                        </c:otherwise>
	                        </c:choose>
	                        
	                        
                         </div>
                      </div>
                      <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="category.label"/></label>
                           <select class="form-control" id="outletCategory" onchange="searchSubCategories('outletCategory','outletSubcategory')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="categoryList" items="${categoryList}">
									<option value="${categoryList.categoryName}" ${categoryList.categoryName == category ? 'selected' : ''} id="${categoryList.categoryName}" >${categoryList.categoryName}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                    <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="brand.label"/></label>
                           <select class="form-control" id="outletBrandId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="brandsList" items="${brandsList}">
									<option value="${brandsList}" ${brandsList == brand ? 'selected' : ''} id="${brandsList}" >${brandsList}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                  
                       
                         <div class="col-lg1-2 col-lg-2">
              <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
                 		<label><spring:message code="offer_start_date.label"/></label>
                	 	<input class="form-control calendar_icon form-group " readonly="readonly" value="" style="background-color: white;" id="fromDate" size="20" type="text" onfocus="callCalender('fromDate')" onclick="callCalender('fromDate')" placeholder="DD/MM/YYYY">
	              </div>
	            </div>
	           	<input type="hidden" id="sd" value="${startDate}">
			   	<input type="hidden" id="ed" value="${endDate}">
                    </div>
                     <div class="row">
                       <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="location.label"/></label>
                            <input type="hidden" id="tolocation" value="${selectedLocation }">
							        <select class="form-control" id="outletLocation" ><!-- searchStockRequests('','','0'); -->

									          <c:choose>
									          <c:when test="${flowUnder == 'outlet'}">
	 				                     <%-- <option value=""><spring:message code="ALL.label"/></option> --%>
	 				                
									           <c:forEach var="outletlocationsList" items="${outletlocationsList}">
<%-- 										        	<option value="${outletlocationsList}" ${outletlocationsList == selectedLocation ? 'selected' : ''} id="${outletlocationsList}" >${outletlocationsList}</option> --%>
											<c:choose>
								 <c:when test="${flowUnder == 'outlet'}">
								 <c:choose>
						           <c:when test="${outletlocationsList.description == ''}">
							         <option value="${outletlocationsList.locationId}" ${outletlocationsList.locationId == selectedLocation ? 'selected' : ''}>${outletlocationsList.locationId}</option>
							        </c:when>
							        <c:otherwise>
							        <option value="${outletlocationsList.locationId}" ${outletlocationsList.locationId == selectedLocation ? 'selected' : ''}>${outletlocationsList.locationId}-${outletlocationsList.description}</option>
							        </c:otherwise>
							    </c:choose>
								 </c:when>
								 <c:otherwise>
								<option value="${outletlocationsList}" ${outletlocationsList == selectedLocation ? 'selected' : ''} id="${outletlocationsList}" >${outletlocationsList}</option> 
								 </c:otherwise>
								 
								 </c:choose>
											
												</c:forEach>
												</c:when>
										<c:otherwise>
										
										<%-- <option value=""><spring:message code="ALL.label"/></option> --%>
										  <c:forEach var="outletlocationsList" items="${outletlocationsList}">
<%-- 										        	<option value="${outletlocationsList}" ${outletlocationsList == selectedLocation ? 'selected' : ''} id="${outletlocationsList}" >${outletlocationsList}</option> --%>
											
											<option value="${outletlocationsList.locationId}" ${outletlocationsList.locationId == selectedLocation ? 'selected' : ''} id="${outletlocationsList.locationId}" >${outletlocationsList.locationId}</option> 
								
										</c:forEach>
										
										
										</c:otherwise>		
												</c:choose>
												
												
												
												
												
							               </select>
                      </div>
                      </div>
                   
                       <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="subcategory.label"/></label>
                           <select class="form-control" id="outletSubcategory" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="subCategoryDetailsList" items="${subCategoryDetailsList}">
									<option value="${subCategoryDetailsList.subcategoryName}" ${subCategoryDetailsList.subcategoryName == subcategory ? 'selected' : ''} id="${subCategoryDetailsList.subcategoryName}" >${subCategoryDetailsList.subcategoryName}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                       <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="model.label"/></label>
                           <select class="form-control" id="outletDepartmentId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                           
	                        </select>
                      </div>
                      </div>
                     
                      <div class="col-lg1-2 col-lg-2">
	               <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="offer_end_date.label"/></label>
	                 	<input class="form-control calendar_icon  form-group" readonly="readonly" value="" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY">
		           </div>
		          </div>
                    </div>
                  </div>
                  <div class="col-lg-1" style="    width: 12%;    background: #ccc;">
                  <div class="col-lg-12" style="    border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">
                  <div class="row">
                  <a onclick="searchStockRequests('','','0')" class="button"><spring:message code="search" /></a>
                  </div>
                  <div class="row">
                 <a type="button" style="margin-top: 18px"  onclick="resetForm();" class="button" ><spring:message code="clearbutton.label"/></a>
                  </div>
                  </div></div>
                  <div class="col-lg-12">
                  <br>
                  </div>
		                     
		                     
		                  
									       <div class="row">
			                <div class="col-lg-11"></div>
			                <div class="col-lg-1 summaryBtn">
			                <a id="summaryTag"  data-toggle="modal" data-target="#items-modal">
			                	<img class="summaryImg" src="${pageContext.request.contextPath}/images/summary.png" onclick="getstockRequestSummary()" style="cursor: pointer;" >
			                </a>
			                </div>
			          </div>
									      
									      <div class="row">
									      <div class="col-lg-1 col-xs-2" style="margin-top: 11px;">
								                <select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="searchStockRequests('','','0')">
								               		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
								               		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
								               		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
								              		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
								               	</select>
								           </div>
								           
								           
								            <!--modified by manasa  -->
				                       <div class="col-lg-8 col-xs-8" style="padding-left:0px;margin-top: 11px;">
                      <div class="wrapper">	 
                      <input type="text"  class="form-control" style="" value="" id="searchStock" placeholder="<spring:message code="search.stock.request.label" />" />
							<button id="mySearch" class="searchbutton"></button>
							<!-- <div class="services">
				    			<div class="items">
				     				<ul class="matchedStringUl searchStocks" style=""></ul>
				   				</div>
							</div> -->
							</div>
						<input type="hidden" id="stockRequestsSearch" value="${searchName}">
                    </div>
								           
									       <%--  <div class="col-lg-8 col-xs-10" style="margin-top: 10px;padding-left:0px;">
								       	 		 <input type="text"  class="form-control searchItems" value="" id="searchStock" placeholder="<spring:message code="search.stock.request.label" />" style="text-align: left;height:30PX;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"  />
												<div class="services">
									    			<div class="items">
									     				<ul class="matchedStringUl stockRequests" style=""></ul>
									   				</div>
												</div>
												<input type="hidden" id="stockRequestsSearch" value="${searchName}">
								       	 	</div> --%>
								       	 	   <div class="col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;margin-top: -8px;">
                           <label><spring:message code="location.label"/></label>
                            <input type="hidden" id="tolocation" value="${selectedLocation }">
							        <select class="form-control" id="warehouseLocation" ><!-- searchStockRequests('','','0'); -->
								        <option value=""><spring:message code="ALL.label"/></option>
									           <c:forEach var="outletlocationsList" items="${locationsList}">
										        	<option value="${outletlocationsList}" ${outletlocationsList == warehouse ? 'selected' : ''} id="${outletlocationsList}" >${outletlocationsList}</option>
												</c:forEach>
							               </select>
                      </div>
                      </div>
								       	 	 <div class="col-lg-1" style="margin-top: 10px;padding-left: 0px;    height: 20px;">
								       	 	  <c:if test="${sessionScope.role != 'super admin' && flowUnder == 'outlet'}">
									           <c:forEach var="accessControl" items="${sessionScope.outletGoodsTransfer}">
									                <c:if test="${accessControl.appSubDocument == 'OutletStockRequest' && accessControl.write == true}"> 
									                <a onclick="return newStockRequestView();" style="padding: 4px 8px;    width: 100%;" class="btn bg-olive btn-inline" ><spring:message code="addnew.label" /></a>&nbsp;&nbsp;&nbsp;
														</c:if>
											 </c:forEach>
									      </c:if>
									      <c:if test="${sessionScope.role != 'super admin' && flowUnder == 'warehouse'}">
									           <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
									                <c:if test="${accessControl.appSubDocument == 'StockRequest' && accessControl.write == true}"> 
									                <a onclick="return newStockRequestView();" style="padding: 4px 8px;    width: 100%;" class="btn bg-olive btn-inline" ><spring:message code="addnew.label" /></a>&nbsp;&nbsp;&nbsp;
														</c:if>
											 </c:forEach>
									      </c:if>
									 <c:if test="${sessionScope.role == 'super admin' }">
									                <a onclick="return newStockRequestView();" style="padding: 4px 8px;    width: 100%;" class="btn bg-olive btn-inline" ><spring:message code="addnew.label" /></a>&nbsp;&nbsp;&nbsp;
									      </c:if>
									      
									      </div>
									       </div>
									      
					<div id="example1_wrapper" class="table table-bordered table-striped" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;"> 		      
                          <table id="example1" class="table table-bordered table-striped" style="margin-left: 0px; width: 100%;">
                              <thead style="background-color: #3c8dbc; color: #ffffff">
                             <tr>
                             <th style="width: 40px" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                             	 <th><div style=""><spring:message code="sl.no.label" /></div></th>
                             	 <th style="text-align: left;"><spring:message code="stock.request.ref.label" /></th>
                                 <th>Category</th>
                                 <th><spring:message code="outletid.label" /></th>
                                 <th><spring:message code="request.date.label" /></th>
                                  <th><spring:message code="Reqqty.label" /></th>
                                  <th><spring:message code="approvedqty.label" /></th>
                                  <th>Total items</th>
                                   <th><spring:message code="requested.by.label" /></th>
                                 <th><spring:message code="delivery_date.label" /></th>
                                 <%-- <th><spring:message code="shipment_mode.label" /></th> --%>
                                 <th><spring:message code="procurement.status.label" /></th>
                                 <th><spring:message code="EmployeeForm.action" /></th>
                             </tr>
                         </thead>
                         <tbody style="text-align: center;">
                          <c:forEach var="stockRequests" items="${stockRequestsList}" varStatus="theCount">
                             <tr>
                             <input type="hidden" value="${stockRequests}" id="${stockRequests.stockRequestId}"/>
                              <td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${stockRequests.stockRequestId}' /></td>
                            	 <td>${stockRequests.slNo}</td>
                            	 <td style="float:left;">${stockRequests.stockRequestId}</td>
                            	 <td>${stockRequests.category}</td>
                                 <td>${stockRequests.fromStoreCode}</td>
                                 <td>${stockRequests.createdDateStr}</td>
                                 <td>${stockRequests.requestedQty}</td>
                                 <td>${stockRequests.approvedQty}</td>
                                 <td>${stockRequests.noofitems}</td>
                                 <td>${stockRequests.requestedUserName}</td>
                                 <td>${stockRequests.deliveryDateStr}</td>
                                 <td>${stockRequests.status}</td>
                                 <td style="text-align: left;"> <a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewStockRequestDetails('${stockRequests.stockRequestId}','view')">View</a>
                                   <c:if test="${sessionScope.role == 'super admin'}"> &nbsp;&nbsp;&nbsp;
                                 	<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewStockRequestDetails('${stockRequests.stockRequestId}','edit')">Edit</a>
                                                 </c:if>
                                                 <c:choose>
                                                 	<c:when test="${ not empty stockRequests.nextActivities || not empty stockRequests.nextWorkFlowStates}">
                                                 	  <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
    												<c:if test="${accessControl.appSubDocument == 'StockRequest' && accessControl.write == true}"> 
    												&nbsp;&nbsp;&nbsp;&nbsp;
                                 	<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewStockRequestDetails('${stockRequests.stockRequestId}','edit')">Edit</a>
                                                	</c:if>
                                                </c:forEach>
                                                 	</c:when>
                                                 	
                                                 </c:choose>
                                &nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return printbusinessdocument('StockRequest','${stockRequests.stockRequestId}')">Print</a>
                                 <a  class="clickable" data-toggle="collapse" id="row${stockRequests.slNo}" data-target=".row${stockRequests.slNo}"> <span style="float:right" onclick="expand(${stockRequests.slNo})" id="categoryExpand${stockRequests.slNo}"><i class="fa fa1 fa-sort-desc"></i></span></a>
                                 </td> 
 							</tr>
 							   <tr  class="collapse rowone${stockRequests.slNo}">
                                             <td></td>
                                            	<td style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;"><spring:message code="sl.no.label" /></div></td>
                                            	<td style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;"><spring:message code="itemneme.label" /></div></td>
                                            	<td style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;"><spring:message code="skuid.label" /></div></td>
                                                <td style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;"><spring:message code="grade.label" /></div></td>
                                                 <td style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;"><spring:message code="uom.label" /></div></td>
                                                <td style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;"><spring:message code="Reqqty.label" /></div></td>
                                               <td style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;"><spring:message code="approvedqty.label" /></div></td>
                                                 <c:choose>
                                                 	<c:when test="${ not empty stockRequests.nextActivities || not empty stockRequests.nextWorkFlowStates}">
                                                <td style="padding:3px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;"> <spring:message code="EmployeeForm.action" /></div></td>
                                                </c:when>
                                                <c:otherwise><td></td>
                                                </c:otherwise></c:choose>
                                               <td></td>
                                                <td></td>
                                                <td></td>
                                               <td></td>
                                               
                                                </tr>
                                              <c:forEach var="itemDetails" items="${stockRequests.stockRequestItems}" varStatus="theCount">
                                              <tr class="collapse rowone${stockRequests.slNo}" >
                                              <td></td>
                                            	<td>${theCount.count}</td>
                                            	<td>${itemDetails.itemDesc}</td>
                                                <td id="skuId${stockRequests.stockRequestId}${theCount.count}">${itemDetails.skuId}</td>
                                                <td>-</td>
                                                 <td>${itemDetails.uom}</td>
                                                <td>${itemDetails.quantity}</td>
                                                <td style="padding: 0px;"> <input type="number" style="border: none;    border: none;height: 100%;text-align: center;" class="${stockRequests.stockRequestId}" value="${itemDetails.approvedQty}" id="approvedQty${stockRequests.stockRequestId}${theCount.count}" /></td>
                                              
                                                 <c:choose>
                                                 	<c:when test="${  not empty stockRequests.nextActivities || not empty stockRequests.nextWorkFlowStates}">
                                                <td style="padding: 0px;"><img src="${pageContext.request.contextPath}/images/save.png" style="width:30%;cursor:pointer;" id="update${theCount.count}" onclick="validateStockRequest(this,'gridupdate','${stockRequests.stockRequestId}')"></td>
													</c:when>  
                                                <c:otherwise><td></td>
                                                </c:otherwise></c:choose>
                                               <td></td>
                                                <td></td>
                                                   <td></td>
													<td></td>
        							</tr></c:forEach>
                             </c:forEach>
                         </tbody>
                     </table>
                     </div>
                     </div>
             <div class="panel-group" id="accordion">
             <div class="col-lg-12" style="">
              <c:choose>
              <c:when test="${flowUnder=='warehouse'}">
          <%--     <div class="col-lg-3" >
              <div class="col-lg-12" style="border-top: 2px solid #ccc;padding-left: 0px;padding-right: 0px;">
                <div class="col-lg-8 col-sm-8" style="text-align: right;font-size: 16px"><spring:message code="total.outlets.label" />:</div>
					<div class="col-lg-4 col-sm-4"></div>
					 <div class="col-lg-8 col-sm-8" style="text-align: right;font-size: 16px"><spring:message code="Indents.opened" />:</div>
					<div class="col-lg-4 col-sm-4"></div>
              </div>
              </div>
              
              <div class="col-lg-6" style=""></div>
               <div class="col-lg-3" >
               <div class="col-lg-12" style="border-top: 2px solid #ccc;padding-left: 0px;padding-right: 0px;">
             <div class="col-lg-8 col-sm-8" style="text-align: right;font-size: 16px"><spring:message code="total.quantity" />:</div>
					<div class="col-lg-4 col-sm-4"></div>
					 <div class="col-lg-8 col-sm-8" style="text-align: right;font-size: 16px"><spring:message code="pos.created" />:</div>
					<div class="col-lg-4 col-sm-4"></div></div>
              </div> --%>
              <div class="col-lg-6" style="">
              <%--  <a  data-toggle="modal" data-target="#myModalIos"> <input type="button" style="     margin-right: 20%; font-size: 16px;   border-radius: 0px;      float: right;" class="btn bg-olive btn-inline" onclick="generateIndents(this)" value="<spring:message code="generateindents.label" />" /></a> --%>
           </div>
            <div class="col-lg-3" style="">
                   <%--  <a  data-toggle="modal" data-target="#myModalIos"><input type="button" style="     margin-left: 20%;font-size: 16px;   border-radius: 0px;       float: left;" class="btn bg-olive btn-inline" onclick="createprovisionalPo(this,'false')" value="<spring:message code="createprovisinalpo.label" />" /></a> --%>
           </div>
            <div class="col-lg-3" style="padding-right: 0px;" >
             <div class="col-lg-12" style="border-top: 2px solid #ccc;padding-left: 0px;padding-right: 0px;    border-radius: 5px; background: #ccc;">
                 <div class="col-lg-8 col-sm-8" style="text-align: right;font-size: 16px"><spring:message code="total.outlets.label" /></div>
					<div class="col-lg-4 col-sm-4">: ${TotalOutlets} </div>
					<%--  <div class="col-lg-12" style="border-top: 2px solid #eee;padding-left: 0px;padding-right: 0px;"></div>
                    <div class="col-lg-8 col-sm-8" style="text-align: right;font-size: 16px"><spring:message code="Indents.opened" /></div>
					<div class="col-lg-4 col-sm-4">: ${IndentsOpened} </div> --%>
					<c:forEach var="statuswiselist" items="${statuswiselist}" varStatus="theCount">
					 <div class="col-lg-12" style="border-top: 2px solid #eee;padding-left: 0px;padding-right: 0px;"></div>
             
                 <div class="col-lg-8 col-sm-8" style="text-align: right;font-size: 16px">${statuswiselist.statusName}</div>
					<div class="col-lg-4 col-sm-4">: ${statuswiselist.quantity} </div>
					</c:forEach>
					 <%-- <div class="col-lg-12" style="border-top: 2px solid #eee;padding-left: 0px;padding-right: 0px;"></div>
					 <div class="col-lg-8 col-sm-8" style="text-align: right;font-size: 16px"><spring:message code="total.quantity" /></div>
					<div class="col-lg-4 col-sm-4">: ${TotalIndentQty} </div> --%>
					 <div class="col-lg-12" style="border-top: 2px solid #eee;padding-left: 0px;padding-right: 0px;"></div>
             <div class="col-lg-8 col-sm-8" style="text-align: right;font-size: 16px"><spring:message code="total.indent.requests" /></div>
					<div class="col-lg-4 col-sm-4">: ${TotalIndents} </div>
					</div>
              </div>
                <div class="col-lg-6" style="">
               <a data-toggle="modal" data-target="#myModalIos"> <input type="button" style="margin-right: 20%; font-size: 16px;border-radius: 0px;float: right;"class="btn bg-olive btn-inline" onclick="openedIndents(this)" value="<spring:message code="generateindents.label" />" /></a>
           </div>
            <div class="col-lg-3" style="">
            <a  data-toggle="modal" data-target="#myModalIos"><input type="button" style="margin-left: 20%;font-size: 16px;border-radius: 0px;float: left;" class="btn bg-olive btn-inline" onclick="createprovisionalPo(this,'false')" value="<spring:message code="createprovisinalpo.label" />" /></a>
           </div>
          <!--   <div class="col-lg-2" style="">
                    <a style="    color: #337ab7; font-size: 25px;cursor: pointer;" data-toggle="modal" data-target="#myModalSummary"><i class="fa fa-info-circle" aria-hidden="true"></i></a>
           </div> -->
              </c:when>
              
              <c:otherwise>
              
              </c:otherwise>
              </c:choose>
              </div></div>
                      <div class="panel-group" id="accordion">
    
              <input type="hidden" id="flowUnder" value="${flowUnder}">
              <div class="row" style="margin-right:0%; padding-left:12px">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewStockRequest('','${totalValue}');">
              	</div>									
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewStockRequest('','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-maxRecords <= 0}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewStockRequest('','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewStockRequest('','${totalValue}')">
              	</div> 
              	</c:if>
              	
              	
              	
              	<div class="col-lg-6" style="text-align: right;     padding-right: 10px; "> 
              	<div class="col-lg-8" style="text-align: right;padding-right: 0px;margin-top: 2px;font-size: 16px;"><spring:message code="pages.label" /></div>
              	<div class="col-lg-2" style="padding-right: 0px;">
              		<select class="form-control" id="pagination">
              		<c:set var="totalRecords" value="${totalRecords+1}"></c:set>
              	<c:forEach var="i" begin="0" end="${totalRecords}">
              	<c:if test="${(totalRecords)>0}">
              		<option value="${(i*maxRecords)}" ${index-1 == i*maxRecords ? 'selected' : ''}> ${i+1}</option>
              		<c:set var="totalRecords" value="${totalRecords-maxRecords}"></c:set>
              	</c:if>
				</c:forEach>
					</select>
              	
              	</div>
              		<div class="col-lg-2" style="padding-right: 0px;">
              		  <input type="button" onclick="viewStockRequest('',document.getElementById('pagination').value)" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
             
				</div>
              	
              </div>    
              	
              </div>  
              	
                 </div>
                              
                 <!-- /.box-body -->
             </div><!-- /.box -->
  
</div>
  <div id="triggerEvent"></div>
   <div class="modal fade" id="myModalIos" role="dialog" tabindex="-1">
    <div class="modal-dialog iosmodeldialog" style="width: 128%;margin-left: -283px; margin-top: 4%; zoom:85%;">
    
      <!-- Modal content-->
      <div class="modal-content iospopup">
        <div class="modal-header" style="background-color: lightgray;">
       <center><div style="padding-right: 319px;font-size: x-large;white-space: nowrap; color: #3895D3;text-align: left;"><b>Indent Generate Options</b></div></center>
 	   <button type="button" class="close" style="border: 1px solid !important;background: #ccc;" onclick="return viewStockRequest(document.getElementById('requestType').value,'0','warehouse');" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
          <div id="po"></div>
        </div>
        <div class="modal-footer" style="padding:27px;border: none;">
        </div>
      </div>
		</div>
		</div>
		<div class="modal fade" id="myModalSummary" role="dialog" tabindex="-1">
    <div class="modal-dialog iosmodeldialog">
    
      <!-- Modal content-->
      <div class="modal-content iospopup">
   
        <div class="modal-body" style="padding:0px">
          <div class="col-lg-8 col-sm-8" style="text-align: right"><spring:message code="total.outlets.label" />:</div>
					<div class="col-lg-4 col-sm-4"></div>
					 <div class="col-lg-8 col-sm-8" style="text-align: right"><spring:message code="Indents.opened" />:</div>
					<div class="col-lg-4 col-sm-4"></div>
               <div class="col-lg-8 col-sm-8" style="text-align: right"><spring:message code="total.quantity" />:</div>
					<div class="col-lg-4 col-sm-4"></div>
					 <div class="col-lg-8 col-sm-8" style="text-align: right"><spring:message code="pos.created" />:</div>
					<div class="col-lg-4 col-sm-4"></div>
        </div>
        <div class="modal-footer" style="padding:0px;">
          <input type="button" class="iosclosebutton" data-dismiss="modal" value="Close"/>
        </div>
      </div>
		</div>
		</div>
    <!-- COMPOSE MESSAGE MODAL -->
    
    <div class="col-sm-12 col-lg-12 col-xs-12" >
            
         <div class="modal fade popup-display" id="items-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
             <div class="col-sm-6 col-lg-6 col-xs-0">
    		</div>
           <div class="col-sm-6 col-lg-6 col-xs-12">
             <div class="modal-content billsPopUp" style="">
          
                 <div class="modal-header">
                        <button type="button" class="close" style="font-size: 30px" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" style="text-align: center;"><spring:message code="indent.summary.label" /><div id="locationLable">${verificationCode}</div><div id="dateLable"></div></h4>
                    </div>
             <form action="#" method="post">
                 <div class="modal-body">
                  <div class="box-body table-responsive" id="summary">
                   <div id="stockrequestSummary"></div> 	
                  
                 </div>
              </div>
             </form> 
             </div><!-- /.modal-content -->
         </div><!-- /.modal-dialog -->
     </div><!-- /.modal -->
 	</div>
  </div>
</section><!-- /.content -->
		<!-- DATA TABES SCRIPT -->
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
         <!-- page script -->
        <script type="text/javascript">
            $(function() {
            	// $("#example1").dataTable();
                $('#example1').dataTable({
                    "bPaginate": false,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": false,
                    "bInfo": false,
                    "bAutoWidth": true
                });
            });
        </script>
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="sku.label" />"/>
           <input type="hidden" id="err" value="${err}" />
           <input type="hidden" id="requestType" value="${requestType}" />
           
</body>
</html>