<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : inventorymanager/retailoutlets/allstockreceipts.jsp
 * file type		        : JSP
 * description				: The new storage system form is displayed using this jsp
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
        <!-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script> -->
        <!-- DATA TABLES -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        
<style type="text/css">
.buttons {
	float: right;
	padding-top: 0px;
	/* margin-right: 2%;
	margin-top:1%; */
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

.list a.button {
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
.blinking{-webkit-animation: blink 1s infinite;-moz-animation: blink 1s infinite;animation: blink 1s infinite;color:#3c8dbc;}
@-webkit-keyframes blink{
 0%{ opacity:0;}
 100%{opacity:1;}
}
@-moz-keyframes blink{
    0%{ opacity:0;}
    100%{opacity:1;}
}
@keyframes blink{
    0%{ opacity:0;}
    100%{opacity:1;}
}
}
</style>  
<script type="text/javascript">
$(document).ready(function(){
	/* var err = $("#err").val();
	if(err != "") */
	 // alert(err);
	callCalender('from');
callCalender('to');
  
$("#stockReceipts").val($("#receipt").val());
$("#stockReceipts").focus();
$('#stockReceipts').on('input',function(e){
	if($(this).val().trim()==""){
		viewAllStockReceipts('','all','0');
	}
});


//added by manasa 
$('#mySearch').click(function(){
    var search = $('#stockReceipts').val();
    return searchStockReceipts(search,'','0');
})
$('#stockReceipts').keypress(function(e){
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
debugger

/* var zone = $("#outletZone").val();
var flowUnder = $("#flowUnder").val();
if( zone != null && zone !="" && flowUnder==  'outlet')

	searchlocationsBasedOnZoneForDashboard('outletZone','outletLocation','');

else
	searchlocationsBasedOnZoneForDashboard('outletZone','outletLocation','warehouse'); */

});


</script> 
</head>
<body>


 <!-- Content Header (Page header) -->

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary" style="width:97%;margin-left:1.5%;">
                                <div class="box-header" >


						<c:if test="${operation == 'all'}">
							<h3 class="box-title" style="width: 100%;text-align: center;">
								<spring:message code="allgoodsreceipt.label" />
							</h3>
						</c:if>
						<c:if test="${operation == 'Draft'}">
							<h3 class="box-title" style="width: 100%;text-align: center;">
								<spring:message code="draftstockreceipt.label" />
							</h3>
						</c:if>
					<input type="hidden" id="operation" value="${operation}">
					<input type="hidden" id="warehouselocation" value="${selectedLocation}">
					<input type="hidden" id="sd" value="${startDate}">
				    <input type="hidden" id="ed" value="${endDate}">
					</div><!-- /.box-header -->
                <div class="box-body table-responsive">
                                	
               <div class="col-lg-11" style=" background: #f4f4f4;    padding: 10px 20px;    width: 88%;">
                                	
                                	
                      <div class="row">
                         <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="zone.label"/></label>
                        <c:choose>
                        <c:when test="${flowUnder == 'outlet'}">
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZoneForDashboard('outletZone','toLocation','Retail Outlet')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
			 		
						 		</c:forEach>
	                        </select>
                        </c:when>
                        <c:otherwise>
                        <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZoneForDashboard('outletZone','toLocation','warehouse')">
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
                	 	<input class="form-control calendar_icon form-group " readonly="readonly" value="" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY">
	              </div>
	            </div>
	           
                    </div>
                     <div class="row">
                       <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="location.label"/></label>
                            <input type="hidden" id="tolocation" value="${selectedLocation }">
							        <select class="form-control form-group" id="toLocation" >
<%--                            		 <option value=""><spring:message code="ALL.label"/></option> --%>
	                         <c:if test="${flowUnder == 'outlet'}">
	 				                     <option value=""><spring:message code="ALL.label"/></option>
	 				                </c:if>
	                            <c:forEach var="location" items="${locationsList}">
								<%--  <c:choose>
								 <c:when test="${flowUnder == 'outlet'}"> --%>
								 <c:choose>
						           <c:when test="${location.description == ''}">
							         <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
							        </c:when>
							        <c:otherwise>
							        <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}-${location.description}</option>
							        </c:otherwise>
							    </c:choose>
								<%--  </c:when>
								 <c:otherwise>
								 <option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option>
								 </c:otherwise>
								 
								 </c:choose> --%>
								 <%--  <c:if test="${flowUnder == 'outlet' }">
	                         <option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option>
	                         </c:if> --%>
									
									
						 		</c:forEach>
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
                  <a onclick="searchStockReceipts('','','0')" class="button"><spring:message code="search" /></a>
                  </div>
                  <div class="row">
                 <a type="button" style="margin-top: 18px"  onclick="resetForm();" class="button" ><spring:message code="clearbutton.label"/></a>
                  </div>
                  </div>
                  </div> 
                  
                  <%-- <div class="col-lg-11"></div>
			                <div class="col-lg-1 summaryBtn">
			                <a id="summaryTag"  data-toggle="modal" data-target="#items-modal">
			                	<img class="summaryImg" src="${pageContext.request.contextPath}/images/summary.png" onclick="getstockRequestSummary()" style="cursor: pointer;" >
			                </a>
			                </div> --%>
                  <div class="col-lg-12">
                  <br>
                  </div>
                                	
                                	
                                	
                                	
                                	
                                	
                                	
                                	
                                	
                                	
                                	
                                	
                                	
                                	
                                	
                                	
                                	
                                	
                            <%--     	
                                	<div class="row">
                                	
                                	 <div class="col-lg-2" style="padding-right: 5px;">
								             <label><spring:message code="zone.label"/></label>
							               <div class="col-lg-12" style="    padding-left: 0px;padding-right: 0px;">
							                 <div class="col-lg-10 col-xs-8 col-sm-12 col-md-12" style="   padding-left: 0px;padding-right: 0px;">
								                 <select class="form-control" id="outletLocation" onchange="searchStockRequests('','','0');"><!-- searchStockRequests('','','0'); -->
								                       <option value=""><spring:message code="ALL.label"/></option>
									                   <c:forEach var="zoneList" items="${zoneList}">
															<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${location}" >${zoneList.zoneID}</option>
														</c:forEach>
							                   </select>
							                 </div>
								        	</div>
								        </div>
								        <div class="col-lg-2" style="padding-left: 15px;padding-right: 0px">
								        <label><spring:message code="location.label"/></label>
							               <div class="col-lg-12" style="padding-left: 0px;">
							               <input type="hidden" id="tolocation" value="${selectedLocation }">
							                 <select class="form-control form-group" id="toLocation" onchange="searchStockReceipts('','','0')">
	 				                           <option value=""><spring:message code="ALL.label"/></option>
	 				                             <c:forEach var="location" items="${locationsList}">
													<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}">${location}</option>
												 </c:forEach>
	                                           </select>
								        	</div>
								        </div>
								        <div class="col-lg-4"></div>
								        
								        <div class="col-lg-3" style="    padding-right: 0px;">
								        <div class="col-lg-6" style="    padding-left: 0px;padding-right: 0px;">
								        <label><spring:message code="offer_start_date.label"/></label>
							              <div class="col-lg-12" style="    padding-left: 0px;padding-right: 0px;">
							                	 <div class="col-lg-12 col-xs-8 col-sm-12 col-md-12" style="padding-left: 0px;">
							                	 	<input type="hidden" id="sd" value="12/01/2017">
								                    <input type="hidden" id="ed" value="">
							                	 	<input class="form-control calendar_icon form-group " readonly="readonly" value="" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY">
							                	 </div>
								              </div>
								            </div>
								            <div class="col-lg-6" style="    padding-left: 0px;padding-right: 0px;">
								             <label><spring:message code="offer_end_date.label"/></label>
								               <div class="col-lg-12" style="    padding-left: 0px;padding-right: 0px;">
								                 <div class="col-lg-12 col-xs-8 col-sm-12 col-md-12" style="padding-left: 0px;">
								                 	<input class="form-control calendar_icon  form-group" readonly="readonly" value="" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY">
							                	  </div>
									           </div>
									          </div></div>
								        
								        
								        <div class="col-lg-3" style="    padding-right: 0px;">
								        <div class="col-lg-6" style="    padding-left: 0px;padding-right: 0px;">
								        <label><spring:message code="offer_start_date.label"/></label>
							             <div class="col-lg-12" style="    padding-left: 0px;padding-right: 0px;">
							                	 <div class="col-lg-12 col-xs-8 col-sm-12 col-md-12" style="padding-left: 0px;">
							                	 	<input class="form-control calendar_icon form-group" readonly="readonly" value="" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
								              </div>
								            </div>
								            </div>
								            <div class="col-lg-2" style="padding-left: 0px;padding-right: 5px">
								             <label><spring:message code="offer_end_date.label"/></label>
								                 	<input class="form-control calendar_icon form-group" readonly="readonly" value="" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
									          </div>
									           
								           <div class="col-lg-1" style="padding-left: 0px">
								                <input type="button" style="margin-top: 18px" class="btn bg-olive btn-inline addBtn" onclick="searchStockReceipts('','','0')" value="<spring:message code="search" />" />
								           </div>
									      </div>  --%>
	      								<div class="row">
									      <div class="col-lg-1 col-xs-2" style="">
								                <select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="searchStockReceipts('','','0');">
								               		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
								               		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
								               		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
								              		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
								               	</select>
								           </div>
								           
								           <!--modified by manasa  -->
				                       <div class="col-lg-10 col-xs-8" style="padding-left:0px">
                      <div class="wrapper">	 
                      <input type="text"  class="form-control" style="" value="" id="stockReceipts" placeholder="<spring:message code="search.stock.receipts.label" />" />
							<button id="mySearch" class="searchbutton"></button>
							<!-- <div class="services">
				    			<div class="items">
				     				<ul class="matchedStringUl searchStocks" style=""></ul>
				   				</div>
							</div> -->
							</div>
						<input type="hidden" id="receipt" value="${searchName}">
                    </div>
								           
									       <%--  <div class="col-lg-10 col-xs-10" style="">
								       	 		 <input type="text"  class="form-control searchItems searchBar" value="" id="stockReceipts" placeholder="<spring:message code="search.stock.receipts.label" />" style=""  />
												<div class="services">
									    			<div class="items">
									     				<ul class="matchedStringUl stockReceipts" style=""></ul>
									   				</div>
												</div>
												<input type="hidden" id="receipt" value="${searchName}">
								       	 	</div> --%>
									       <!--  <div class="col-lg-2" style="margin-top: 10px;padding-left: 0px;">
									        <div class="buttons" style="">  -->
									        	<c:if test="${sessionScope.role == 'super admin'}">
									        	  
									        	  <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return newStockReceiptView();" value="<spring:message code="addnew.label" />">
								           </div>
								          <%--  <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return getStockReceiptsByLocation('Draft');" value="<spring:message code="drafts.label" />">
								           </div> --%>
									        		<%-- <a onclick="return newStockReceiptView();" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp;
													<a onclick="return getStockReceiptsByLocation('Draft');" class="button"><font size="2px"><spring:message code="drafts.label" /></font></a> --%>
									      		</c:if>
									      <c:if test="${sessionScope.role != 'super admin' && flowUnder == 'outlet'}">
									           <c:forEach var="accessControl" items="${sessionScope.outletGoodsTransfer}">
									                <c:if test="${accessControl.appSubDocument == 'OutletStockReceipt' && accessControl.write == true}"> 
													<div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return newStockReceiptView();" value="<spring:message code="addnew.label" />">
								           </div>
								          <%--  <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return getStockReceiptsByLocation('Draft');" value="<spring:message code="drafts.label" />">
								           </div> --%>
												</c:if>
											 </c:forEach>
									      </c:if>
									      <c:if test="${sessionScope.role != 'super admin' && flowUnder == 'warehouse'}">
									           <c:forEach var="accessControl" items="${sessionScope.outletGoodsTransfer}">
									                <c:if test="${accessControl.appSubDocument == 'OutletStockReceipt' && accessControl.write == true}"> 
														<div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return newStockReceiptView();" value="<spring:message code="addnew.label" />">
								           </div>
								          <%--  <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return getStockReceiptsByLocation('Draft');" value="<spring:message code="drafts.label" />">
								           </div>	 --%>	</c:if>
											 </c:forEach>
									      </c:if>
										 </div>
									        <!-- </div>
									       </div> -->
									                             <div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;">
									       
                                    <table id="receipts" class="table table-bordered table-striped" style="margin-top:0%;">
                                        <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><div style=""><spring:message code="sl.no.label" /></div></th>
                                                <th><spring:message code="date.label" /></th>
                                            	<th><spring:message code="goodsreceiptref.label" /></th>
                                                <th><spring:message code="location.label" /></th>
                                                <th><spring:message code="shipped.from.label" /></th>
                                                <th><div style=""><spring:message code="receipt.label" /> <spring:message code="total.label" /></div></th>
                                                <th><div style=""><spring:message code="receipt.label" /> <spring:message code="total.label" /> <spring:message code="qty.label" /></div></th>
                                                
                                                <th><spring:message code="stockReceipt.suppliedQty" /></th>
                                                <th><spring:message code="recievedQty.label" /></th>
                                                <th><spring:message code="stockReceipt.recievedQty" /></th>
                                                
                                                
                                                 <th><spring:message code="datetime.label" /> </th>
                                                 
                                                <th><spring:message code="status.label" /> </th>
                                                <th><spring:message code="action.label" /> </th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                           <c:forEach var="stockReceiptList" items="${stockReceiptDetailsList}" varStatus="theCount">
                                        	 <tr>
                                        	 	<td>${stockReceiptList.slNo}</td>
                                                <td>${stockReceiptList.createdDateStr}</td>
                                            	<td>${stockReceiptList.goods_receipt_ref_num}</td>
                                                <td>${stockReceiptList.receipt_location}</td>
                                                <td>${stockReceiptList.shipped_from}</td>
                                                <td>${stockReceiptList.receipt_total}</td>
                                                <td>${stockReceiptList.receipt_total_qty}</td>
                                                <td>${stockReceiptList.supplied}</td>
                                                  <td>${stockReceiptList.recieved}</td>
                                                  <td>${stockReceiptList.acceptedQty}</td>
                                                <td>${stockReceiptList.updatedDateStr}</td>
                                                <td>${stockReceiptList.status}</td>
                                                <td>
                                                 <a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewStockReceipt('${stockReceiptList.goods_receipt_ref_num}');"><spring:message code="view.label"/></a>
                                                 <c:if test="${sessionScope.role == 'super admin'}">
                                                 	&nbsp;&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="editStockReceipt('${stockReceiptList.goods_receipt_ref_num}');"><spring:message code="edit.label"/></a>
                                                 </c:if>
                                                 <c:if test="${sessionScope.role != 'super admin' && flowUnder == 'outlet'}">
									           		<c:forEach var="accessControl" items="${sessionScope.outletGoodsTransfer}">
									                	<c:if test="${accessControl.appSubDocument == 'StockReceipt' && accessControl.write == true}">
									                		&nbsp;&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="editStockReceipt('${stockReceiptList.goods_receipt_ref_num}');"><spring:message code="edit.label"/></a>
									                	</c:if>
									                </c:forEach>
									             </c:if>
									    <c:if test="${sessionScope.role != 'super admin' && flowUnder == 'warehouse'}">
									           		<c:forEach var="accessControl" items="${sessionScope.outletGoodsTransfer}">
									                	<c:if test="${accessControl.appSubDocument == 'StockReceipt' && accessControl.write == true }">
									                		&nbsp;&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="editStockReceipt('${stockReceiptList.goods_receipt_ref_num}');"><spring:message code="edit.label"/></a>
									                	</c:if>
									                </c:forEach>
									             </c:if> 
									              &nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return printbusinessdocument('StockReceipt','${stockReceiptList.goods_receipt_ref_num}')">Print</a>
                                                </td>
                                                <%-- <c:choose>
                                                  <c:when test="${stockReceiptList.status=='Draft'}">
                                                    &nbsp;&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="editStockReceipt('${stockReceiptList.goods_receipt_ref_num}');"><spring:message code="edit.label"/></a>
                                                  </c:when>
                                                  <c:otherwise>
                                                   <td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewStockReceipt('${stockReceiptList.goods_receipt_ref_num}');"><spring:message code="view.label"/></a></td>
                                                  </c:otherwise>
                                                </c:choose> --%>
                                             </tr>
                                           </c:forEach>
                                        </tbody>
                                    </table>
            </div>
              <input type="hidden" id="flowUnder" value="${flowUnder}">  
            <!--modified by manasa  -->
              <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewAllStockReceipts('','${operation}','${totalValue}')">
              	</div>									
              	</c:if>
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewAllStockReceipts('','${operation}','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewAllStockReceipts('','${operation}','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewAllStockReceipts('','${operation}','${totalValue}')">
              	</div> 
              	</c:if>
              	
             
              	<div class="col-lg-6" style="text-align: right;"> 
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
              		  <input type="button" onclick="viewAllStockReceipts('','${operation}',document.getElementById('pagination').value)" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
             
				</div>
              	
              </div>    
              	
              </div>  
              	
              	<!--modified by manasa  -->
              	
              	
              	
                                       
       </div><!-- /.box-body -->
   </div><!-- /.box -->
  
</div>
</div>
</section><!-- /.content -->
		<!-- DATA TABES SCRIPT -->
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
         <!-- page script -->
        <script type="text/javascript">
            $(function() {
                $("#receipts").dataTable({
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