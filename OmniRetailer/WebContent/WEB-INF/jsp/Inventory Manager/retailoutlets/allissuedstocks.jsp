<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : inventorymanager/retailoutlets/allissuedstocks.jsp
 * file type		        : JSP
 * description				: The new storage system form is displayed using this jsp
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script> -->
        <!-- DATA TABLES -->
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/goodstransfer.js"></script>
  
       

<style type="text/css">
.buttons {
	float: right;
	padding-top: 0px;
	/* margin-right: 2%;
	margin-top:1%; */
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
    width: 22%!important;
    margin-left:45%;
    margin-top: 0%;
    border-radius: 0;
}

.searchbutton{
background-image: url(../images/search.png);
    background-position: right;
    text-align: left;
    height: 30PX;
    background-repeat: no-repeat;
    margin-bottom: 2px;
    background-origin: content-box;
    width: 41px;
    padding: 4px 10px;
    border-left: 1px solid #ccc;
    /* background: #3c8dbc; */
    z-index: 999;
    position: absolute;
    background-color: #3c8dbc;
        right: 3;
    top: 0;
}
.wrapper {
    /* border:1px solid #000;
    display:inline-block; */
    position:relative;
}

a.button, .list a.button {
	position:relative;
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 5px 10px 5px 10px;
	background: #3c8dbc;
	border-radius: 5px;
/* 	box-shadow:1px 0px 2px #000; */
	cursor:pointer;
	behavior : url(css/PIE.htc); 
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
</style>  
<script type="text/javascript">

	/* var err = $("#err").val();
	if(err != "") */
	 // alert(err);
	
$(document).ready(function() {
	callCalender('from');
	callCalender('to');
    $("input:text").focus(function() { $(this).select(); } );

$("#allIssuedStocks").val($("#stocksIssued").val());
$("#allIssuedStocks").focus();
$('#allIssuedStocks').on('input',function(e){
	if($(this).val().trim()==""){
		viewAllStockIssues('','all','0');
	}
});


//added by manasa

$('#mySearch').click(function(){
    var search = $('#allIssuedStocks').val();
    return searchWHStockIssues(search,'','0',false);
})
$('#allIssuedStocks').keypress(function(e){
    if(e.which == 13){//Enter key pressed
        $('#mySearch').click();//Trigger search button click event
    }
});

var sDate=$("#sd").val();
var s=sDate.split(' ');
$("#from").val(s[0]);

var eDate=$("#ed").val();
var e=eDate.split(' ');
$("#to").val(e[0]);
//getallProductsByCriteria("","","-1");

					// added to fetch locations based on zone 
			/* 		var zone = $("#outletZone").val();
					if( zone != null && zone !="")
					{
						searchlocationsBasedOnZoneForDashboard('outletZone','fromlocation','warehouseLocation');
					} */

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
              <div class="box-header" style="text-align:center">
						<c:if test="${operation == 'all'}">
							<h3 class="box-title" style="font-size: 22px;">
								<spring:message code="allgoodsindent.label" />
							</h3>
						</c:if>
						<c:if test="${operation == 'Draft'}">
							<h3 class="box-title">
								<spring:message code="draftstockissue.label" />
							</h3>
						</c:if>
					</div><!-- /.box-header -->
							<input type="hidden" id="operation" value="${operation}">
				             <input type="hidden" id="sd" value="${startDate}">
				          <input type="hidden" id="ed" value="${endDate}">
                                <div class="box-body table-responsive">
                               <div class="col-lg-11" style="background: #f4f4f4;padding: 10px 20px;width: 88%;">
                                <div class="row">
                                	<div class="col-lg-7">
										<div class="col-lg-4"
											style="padding-left: 0px; padding-right: 5px;">
											<label><spring:message code="zone.label" /></label> <select
												class="form-control" id="outletZone" onchange="searchlocationsBasedOnZoneForDashboard('outletZone','fromlocation','warehouseLocation')">
												<option value=""><spring:message code="ALL.label" /></option>
												<c:forEach var="zoneList" items="${zoneList}">
													<option value="${zoneList.zoneID}"
														${zoneList.zoneID == zone ? 'selected' : ''}
														id="${zoneList}">${zoneList.zoneID}</option>
												</c:forEach>
											</select>
										</div>

								            <c:choose>
                                             <c:when test="${flowUnder=='warehouse'}">
							               <div class="col-lg-3" style="    padding-left: 0px;padding-right: 5px;">
							               <label>From Location</label><%-- <spring:message code="warehouse.label"/> --%>
								                 <select class="form-control" id="warehouseLocation" ><!-- searchStockRequests('','','0'); -->
								                       <option value=""><spring:message code="ALL.label"/></option>
									                   <c:forEach var="warehouselocationsList" items="${warehouselocationsList}">
															<option value="${warehouselocationsList}" ${warehouselocationsList == warehouse ? 'selected' : ''} id="${warehouselocationsList}" >${warehouselocationsList}</option>
														</c:forEach>
							                   </select>
							                     <input type="hidden" class="form-control" name="skuid" id="skuidpo" readonly="readonly" value="${itemwise}"/>
								        	</div>
								        	</c:when>
								        	<c:otherwise>
								        	 <div class=" col-lg-6"></div>
								        	</c:otherwise>
								        	</c:choose>
								        
								        </div>
								       <div class="col-lg-2"></div>
								       <div class=" col-lg-3">
										<div class="col-lg-12"
											style="padding-left: 0px; padding-right: 5px;">
							                 		<label><spring:message code="offer_start_date.label"/></label>
							                	 	<input class="form-control calendar_icon " readonly="readonly" value="" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
								              </div>	
									          </div>
								          
									      </div>
									      
									      
									<div class="row">
                                	<div class="col-lg-7">
										<div class="col-lg-4"
											style="padding-left: 0px; padding-right: 5px;">
							                   <label>To Location</label><%-- <spring:message code="outletid.label"/> --%>
							                 <select class="form-control" id="fromlocation" >
	 				                             <option value=""><spring:message code="ALL.label"/></option>
	 				                <c:forEach var="location" items="${locationsList}">

								 <c:choose>
						           <c:when test="${location.description == ''}">
							         <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
							        </c:when>
							        <c:otherwise>
							        <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}-${location.description}</option>
							        </c:otherwise>
							    </c:choose>
								
												
								 </c:forEach>
	                              </select>
							       </div>
							       
							       
							       
							       <c:choose>
                                    <c:when test="${flowUnder=='warehouse'}">
								        	  <div class="col-lg-3" style="    padding-left: 0px;padding-right: 5px;">
							               <label><spring:message code="itemwise.label"/></label>
								                 <select class="form-control" id="itemwise"  data-show-subtext="true" data-live-search="true" onchange="searchWHStockIssues('','','0','false');">
							                   </select>
							                     <input type="hidden" class="form-control" name="skuid" id="skuidpo" readonly="readonly" value="${itemwise}"/>
								        	</div>
								        </c:when>
								        	<c:otherwise>
								        	 <div class=" col-lg-6"></div>
								        	</c:otherwise>
								       </c:choose>
								    
								    </div>
								       <div class=" col-lg-2"></div>
								       <div class=" col-lg-3">
										<div class="col-lg-12"
											style="padding-left: 0px; padding-right: 0px;">
								                <label><spring:message code="offer_end_date.label"/></label>
								                 	<input class="form-control calendar_icon " readonly="readonly" value="" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
									           </div>
									          </div>
									      </div>
                                	  
                                	  </div>
                     <div class="col-lg-1" style="width: 12%;background: #ccc;height: 115px;">
                  	<div class="col-lg-12" style="border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">
                  <div class="row">
                  <input type="button" style="padding: 4px 8px;width: 100%;margin-top: 18px;" class="btn bg-olive btn-inline" onclick="searchWHStockIssues('','','0','false');" value="<spring:message code="search" />" />
				</div>
                  <div class="row">
                 <input type="button" style="padding: 4px 8px;width: 100%;margin-top: 18px;"  onclick="resetForm();" class="btn bg-olive btn-inline" value="<spring:message code="clearbutton.label"/>" />
                  </div>
                  </div>
                  </div> 
                                	
						<%-- <c:choose>
						<c:when test="${flowUnder=='warehouse'}">
						<div class="row">
			                <div class="col-lg-11"></div>
			                <div class="col-lg-1 summaryBtn">
			                <a id="summaryTag"  data-toggle="modal" data-target="#items-modal">
			                	<img class="summaryImg" src="${pageContext.request.contextPath}/images/summary.png" onclick="getstockIssueSummary()" style="cursor: pointer;" >
			                </a>
			                </div>
			          </div>
									      
						 </c:when>
						</c:choose> --%>
 <br>
 <div class="col-lg-12" style="padding:0px;">
	      			<div class="row">
	      			 <input type="hidden" id="fileDownloadurl" value="${filePath}">
				      <div class="col-lg-1 col-xs-2" style="margin-top: 11px;">
			                <select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="searchWHStockIssues('','','0','false');">
			               		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
			               		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
			               		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
			              		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
			               	</select>
			           </div>
								           
								           
				    <div class="col-lg-9 col-xs-9" style="padding-left:0px;margin-top: 11px;">
                      <input type="hidden" id="stocksIssued" value="${searchName}">
					  <div class="wrapper">	 
                      <input type="text"  class="form-control" style="" value="" id="allIssuedStocks" placeholder="<spring:message code="search.issued.stocks.label" />" />
							<button id="mySearch" class="searchbutton"></button>
					</div>
                    </div>
									     
									        <div class="col-lg-2" style="margin-top: 10px;padding-left: 0px;    height: 20px;">
									       
									        	<c:if test="${sessionScope.role == 'super admin'}">
									        		<a onclick="return newStockIssueView();" style="width: 47%;margin-right: 4%;height: 30px;padding-top: 4px;" class="btn bg-olive btn-inline"><spring:message code="addnew.label" /></a>
									        		<a onclick="searchWHStockIssues('','','0','true');" style="width: 47%;height: 30px;padding-top: 4px;" class="btn bg-olive btn-inline"><spring:message code="save.label" /></a></c:if>
									      <c:if test="${sessionScope.role != 'super admin' && flowUnder == 'outlet'}">
									           <c:forEach var="accessControl" items="${sessionScope.outletGoodsTransfer}">
									                <c:if test="${accessControl.appSubDocument == 'OutletStockIssue' && accessControl.write == true}"> 
													<a onclick="return newStockIssueView();" style="width: 47%;margin-right: 4%;height: 30px;padding-top: 4px;" class="btn bg-olive btn-inline"><spring:message code="addnew.label" /></a>
												<a onclick="searchWHStockIssues('','','0','true');" style="width: 47%;height: 30px;padding-top: 4px;" class="btn bg-olive btn-inline"><spring:message code="save.label" /></a></c:if>
												
											 </c:forEach>
									      </c:if>
									      <c:if test="${sessionScope.role != 'super admin' && flowUnder == 'warehouse'}">
									           <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
									                <c:if test="${accessControl.appSubDocument == 'WarehouseStockIssues' && accessControl.write == true}"> 
													<a onclick="return newStockIssueView();" style="width: 47%;margin-right: 4%;height: 30px;padding-top: 4px;" class="btn bg-olive btn-inline" ><spring:message code="addnew.label" /></a>
													<a onclick="searchWHStockIssues('','','0','true');" style="width: 47%;height: 30px;padding-top: 4px;" class="btn bg-olive btn-inline"><spring:message code="save.label" /></a></c:if>
											 </c:forEach>
									      </c:if>
										
									        </div>
				</div>
							</div>
                                    <table id="issues" class="table table-bordered table-striped">
                                        <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                                            	<th><spring:message code="sl.no.label" /></th>
                                            	<th><spring:message code="stockreceipt.issueref" /></th>
                                            	<th><spring:message code="outletid.label" /></th>
                                            	<th><spring:message code="issue.date.label" /></th>
                                                <th><spring:message code="requestedby.label" /></th>
                                                <th><spring:message code="status.label" /></th>
                                                <th><spring:message code="indentQty.label" />
                                                <th><spring:message code="allocatedqty.label" /> 
                                                 <c:choose>
                                             <c:when test="${flowUnder=='warehouse'}">
                                             <th><spring:message code="actualqty.label" /> </th>
                                             </c:when>
                                             <c:otherwise>
                                             </c:otherwise>
                                             </c:choose>
                                                <th><spring:message code="variance.label" /> </th>
                                                <th><spring:message code="action.label" /> </th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                           <c:forEach var="stockIssueList" items="${stockIssueDetailsList}" >
                                        	 <tr>
                                        	 <td><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value='${stockIssueList.goods_Request_Ref}' /></td>
                                        	 	<td>${stockIssueList.slNo}</td>
                                        	 		<td>${stockIssueList.goods_issue_ref_num}</td>
                                            	<td>${stockIssueList.issue_to}</td>
                                            	<td>${stockIssueList.deliveryDate}</td>
                                            	 <c:choose>
                                             <c:when test="${flowUnder=='warehouse'}">
                                              <td>${stockIssueList.indentedBy}</td>
                                             </c:when>
                                             <c:otherwise>
                                              <td>${stockIssueList.requestedBy}</td>
                                             </c:otherwise>
                                             </c:choose>
                                            	
                                                <td>${stockIssueList.status}</td>
                                                
                                              <c:choose>
                                             <c:when test="${flowUnder=='warehouse'}">
                                             <c:choose>
                                             <c:when test="${ not empty itemwise}">
                                              <c:forEach var="itemDetails" items="${stockIssueList.reciptDetails}" varStatus="theCount">
                                              <c:choose>
                                             <c:when test="${itemDetails.skuId == itemwise}">
                                           <c:set var="indentQty" value="${itemDetails.indentQty}"  />
                                           <c:set var="issuedQty" value="${itemDetails.quantity}"  />
                                           <c:set var="actualQty" value="${itemDetails.actualQty}"  />
                                             </c:when></c:choose>
                                             </c:forEach>
                                            	<td class="saveall" id="${stockIssueList.goods_issue_ref_num}">${indentQty}</td>
                                            	<input type="hidden" value="${stockIssueList}" id="stockIssueDetailsList" />
                                            	<input type="hidden" value="${stockIssueList.reciptDetails}" id="stockIssueItemsList" />
                                            	<td contenteditable="true" id="Issued${stockIssueList.goods_issue_ref_num}">
                                            	${issuedQty}</td>
                                                <td contenteditable="true" id="actualQty${stockIssueList.goods_issue_ref_num}">${actualQty}</td>
                                             </c:when>
                                             <c:otherwise>
                                             <td>${stockIssueList.requestedQty}</td>
                                               <td>${stockIssueList.issuedQty}</td>
                                                    <td>${stockIssueList.actualQty}</td>
                                               </c:otherwise>
                                             </c:choose>
                                             
                                             </c:when>
                                             <c:otherwise>
                                               <td>${stockIssueList.quantity}</td>
                                               <td>${stockIssueList.issued}</td>
                                             
                                             </c:otherwise>
                                             </c:choose>
                                             
                                                <td>
                                                <c:choose>
                                                 <c:when test="${flowUnder=='warehouse'}">
                                                  <c:choose>
                                                   <c:when test="${stockIssueList.requestedQty == '0.0'}">
                                            	<c:out value="0.0"></c:out> %
                                                </c:when>
                                                <c:when test="${stockIssueList.issuedQty>stockIssueList.requestedQty}">
                                                  <fmt:formatNumber type="percent" var="variance" maxIntegerDigits="3" value="${(stockIssueList.issuedQty-stockIssueList.requestedQty)/(stockIssueList.requestedQty)}" />
                                               ${variance}
                                                </c:when>
                                                
                                                <c:otherwise>
                                                <fmt:formatNumber type="percent" var="variance" maxIntegerDigits="3" value="${(stockIssueList.requestedQty-stockIssueList.issuedQty)/(stockIssueList.requestedQty)}" />
                                               ${variance}
                                                </c:otherwise>
                                                </c:choose>
                                                </c:when>
                                                <c:otherwise>
                                                 <c:choose>
                                                   <c:when test="${stockIssueList.quantity == '0.0'}">
                                            	<c:out value="0.0"></c:out> %
                                                </c:when>
                                                <c:when test="${stockIssueList.issued>stockIssueList.quantity}">
                                                  <fmt:formatNumber type="percent" var="variance" maxIntegerDigits="3" value="${(stockIssueList.issued-stockIssueList.quantity)/(stockIssueList.quantity)}" />
                                               ${variance}
                                                </c:when>
                                                
                                                <c:otherwise>
                                                <fmt:formatNumber type="percent" var="variance" maxIntegerDigits="3" value="${(stockIssueList.quantity-stockIssueList.issued)/(stockIssueList.quantity)}" />
                                               ${variance}
                                                </c:otherwise>
                                                </c:choose>
                                                </c:otherwise>
                                                </c:choose>
                                                
                                                <td>
                                                 <a onclick="viewStockIssue('${stockIssueList.goods_issue_ref_num}');" style="color:#2e7ea7 !important;cursor: pointer;"><spring:message code="view.label"/></a>
                                                 <c:if test="${sessionScope.role == 'super admin'}">
                                                 	&nbsp;&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="editStockIssue('${stockIssueList.goods_issue_ref_num}');"><spring:message code="edit.label"/></a>
                                                 </c:if>
                                                 <c:if test="${sessionScope.role != 'super admin' && flowUnder == 'outlet'}">
									           		<c:forEach var="accessControl" items="${sessionScope.outletGoodsTransfer}">
									                	<c:if test="${accessControl.appSubDocument == 'OutletStockIssue' && accessControl.write == true}">
									                		&nbsp;&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="editStockIssue('${stockIssueList.goods_issue_ref_num}');"><spring:message code="edit.label"/></a>
									                	</c:if>
									                </c:forEach>
									             </c:if>
									           
									         <c:choose>
                                                 	<c:when test="${ not empty stockIssueList.nextActivities || not empty stockIssueList.nextWorkFlowStates}">
									        <c:if test="${sessionScope.role != 'super admin' && flowUnder == 'warehouse'}">
									           		<c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
									                	<c:if test="${accessControl.appSubDocument == 'WarehouseStockIssues' && accessControl.write == true}">
									                		&nbsp;&nbsp;&nbsp;<a onclick="editStockIssue('${stockIssueList.goods_issue_ref_num}');" style="color:#2e7ea7 !important;cursor: pointer;"><spring:message code="edit.label"/></a>
									                	</c:if>
									                </c:forEach>
									             </c:if>
									       
									       </c:when></c:choose>
									         
									
									              <c:choose>
                                         <c:when test="${flowUnder=='warehouse'}">
									              <a  class="clickable" data-toggle="collapse" id="row${stockIssueList.slNo}" data-target=".row${stockIssueList.slNo}"> <span style="float:right" onclick="expand(${stockIssueList.slNo});" id="categoryExpand${stockIssueList.slNo}"><i class="fa fa1 fa-sort-desc"></i></span></a>
                                                </c:when>
                                                </c:choose>
                                                
                                                  <c:if test="${stockIssueList.status != 'Draft' &&  stockIssueList.status != 'Submitted' && stockIssueList.status != 'Approved'}">
                                                <a onclick="getStockIssuePDF('${stockIssueList.goods_issue_ref_num}')" style="color:#2e7ea7 !important;cursor: pointer;">Print</a>
                                                </c:if>
                                                </td>
                                             </tr>
                                             <c:choose>
                                             <c:when test="${flowUnder=='warehouse'}">
                                              <tr  class="collapse rowone${stockIssueList.slNo}">
                                             <td></td>
                                              <td></td>
                                            	<td style="padding:3px;"><div style="padding: 5px;background: #c1c1c1;"><spring:message code="sl.no.label" /></div></td>
                                            	<td style="padding:3px;"><div style="padding: 5px;background: #c1c1c1;"><spring:message code="itemneme.label" /></div></td>
                                            	<td style="padding:3px;"><div style="padding: 5px;background: #c1c1c1;"><spring:message code="skuid.label" /></div></td>
                                                <td style="padding:3px;"><div style="padding: 5px;background: #c1c1c1;"><spring:message code="grade.label" /></div></td>
                                                <td style="padding:3px;"><div style="padding: 5px;background: #c1c1c1;"><spring:message code="Reqqty.label" /></div></td>
                                               <td style="padding:3px;"><div style="padding: 5px;background: #c1c1c1;"><spring:message code="issued.label" /></div></td>
                                                  <td style="padding:3px;"><div style="padding: 5px;background: #c1c1c1;"><spring:message code="actualqty.label" /></div></td>
                                                <td style="padding:3px;"><div style="padding: 5px;background: #c1c1c1;"><spring:message code="approvedby.label" /></div></td>
                                               <td style="padding:3px;"><div style="padding: 5px;background: #c1c1c1;"> <spring:message code="EmployeeForm.action" /></div></td>
                                               <td></td>
                                               </tr>
                                              <c:forEach var="itemDetails" items="${stockIssueList.reciptDetails}" varStatus="theCount">
                                              <tr  class="collapse rowone${stockIssueList.slNo}" >
                                            	<td></td>
                                            	 <td></td>
                                            	<td>${theCount.count}</td>
                                            	<td>${itemDetails.description}</td>
                                                <td id="skuId${stockIssueList.goods_issue_ref_num}${theCount.count}">${itemDetails.skuId}</td>
                                                <td>-</td>
                                                <td>${itemDetails.indentQty}</td>
                                                <td  style="border: 1px solid rgba(0, 0, 0, 0.1);" id="Issued${stockIssueList.goods_issue_ref_num}${theCount.count}" contenteditable="true">${itemDetails.quantity}</td>
                                                <td  style="border: 1px solid rgba(0, 0, 0, 0.1);" class="${stockIssueList.goods_issue_ref_num}" id="actualQty${stockIssueList.goods_issue_ref_num}${theCount.count}" contenteditable="true">${itemDetails.actualQty}</td>
                                                <td></td>
                                                 <td style="padding: 0px;"><img src="${pageContext.request.contextPath}/images/save.png" style="width:25%;cursor:pointer;" id="update${theCount.count}" onclick="validateStockIssue(this,'gridupdate','${stockIssueList.goods_issue_ref_num}','')"/></td>
        							<td></td>
        							</tr>
        							</c:forEach>
                                             
                                         
                                             
                                             </c:when>
                                             </c:choose>
                                              </c:forEach>
                                        </tbody>
                                    </table>
                                      <c:choose>
                                             <c:when test="${flowUnder=='warehouse'}">
                                                                        <div class="panel-group" id="accordion">
             <div class="col-lg-12" style="">
              <div class="col-lg-4" style="">
                  <a  data-toggle="modal" > <input type="button" style=" margin-left: 0%; font-size: 16px;   border-radius: 0px;      float: right;" class="btn bg-olive btn-inline" onclick="saveallStockIssue(this)" value="<spring:message code="saveall.label" />" /></a>
           </div>
              <div class="col-lg-4" style="">
               <a  data-toggle="modal" > <input type="button" style=" margin-right: 20%; font-size: 16px;   border-radius: 0px;      float: right;" class="btn bg-olive btn-inline" onclick="issuetooutlets(this,'false')" value="<spring:message code="create.pick.list" />" /></a>
           </div>
            <div class="col-lg-4" style="">
                  <a  data-toggle="modal" > <input type="button" style=" margin-left: 20%; font-size: 16px;   border-radius: 0px;      float: left;" class="btn bg-olive btn-inline" onclick="issuetooutlets(this,'true')" value="<spring:message code="issue.to.outlets.label" />" /></a>
           </div>
           
              </div></div>
                                             
                                             
                                             </c:when>
                                             <c:otherwise></c:otherwise></c:choose>
                                       <input type="hidden" id="flowUnder" value="${flowUnder}">  
         <!--modified by manasa  -->
         <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewAllStockIssues('','${operation}','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewAllStockIssues('','${operation}','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewAllStockIssues('','${operation}','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewAllStockIssues('','${operation}','${totalValue}')">
              	</div> 
              	</c:if>
              	
              	
              	<div class="col-lg-6" style="text-align: right;"> 
              	<div class="col-lg-8" style="text-align: right;padding-right: 0px;margin-top: 2px;font-size: 16px;"><spring:message code="pages.label" /></div>
              	<div class="col-lg-2" style="padding-right: 0px;">
              		<select class="form-control" id="pagination">
              		<c:set var="totalRecords" value="${totalRecords}"></c:set>
              	<c:forEach var="i" begin="0" end="${totalRecords}">
              	<c:if test="${(totalRecords)>0}">
              		<option value="${(i*maxRecords)}" ${index == i*maxRecords ? 'selected' : ''}> ${i+1}</option>
              		<c:set var="totalRecords" value="${totalRecords-maxRecords}"></c:set>
              	</c:if>
				</c:forEach>
					</select>
              	
              	</div>
              		<div class="col-lg-2" style="padding-right: 0px;">
              		  <input type="button" onclick="viewAllStockIssues('','${operation}',document.getElementById('pagination').value)" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
             
				</div>
              	
              </div>    
              	
              </div>  
              	
              	<!--modified by manasa  -->
              	
              </div>                               
          </div><!-- /.box-body -->
      </div><!-- /.box -->
  
</div>
</div>

  <div id="triggerEvent"></div>
    <!-- COMPOSE MESSAGE MODAL -->
     <div class="modal fade" id="myModalIos" role="dialog" tabindex="-1">
    <div class="modal-dialog iosmodeldialog">
    
      <!-- Modal content-->
      <div class="modal-content iospopup">
     <!--    <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div> -->
        <div class="modal-body">
          <p><div id="po"></div></p>
        </div>
        <div class="modal-footer" style="padding:0px;">
          <input type="button" class="iosclosebutton" onclick="return viewAllStockIssues('','all','0');" data-dismiss="modal" value="Close"/>
        </div>
      </div>
		</div>
		</div>
    <div class="col-sm-12 col-lg-12 col-xs-12" >
            
         <div class="modal fade popup-display" id="items-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
             <div class="col-sm-8 col-lg-8 col-xs-0">
    		</div>
           <div class="col-sm-4 col-lg-4 col-xs-12">
             <div class="modal-content billsPopUp" style="">
          
                 <div class="modal-header">
                        <button type="button" class="close" style="font-size: 30px" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" style="text-align: center;"><spring:message code="issue.summary.label" /></h4>
                    </div>
             <form action="#" method="post">
                 <div class="modal-body">
                  <div class="box-body table-responsive" id="summary">
                   <div id="stockIssueSummary"></div> 	
                  
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
         <!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script> -->
      
         <!-- page script -->
        <script type="text/javascript">
       
            $(function() {
                $("#issues").dataTable({
       			  "bPaginate": false,
                  "bLengthChange": false,
                  "bFilter": false,
                  "bSort": false,
                  "bInfo": false,
                  "bAutoWidth": false
    			});
                 });
           

        </script>
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="receiptstock.label" />"/>
</body>
</html>