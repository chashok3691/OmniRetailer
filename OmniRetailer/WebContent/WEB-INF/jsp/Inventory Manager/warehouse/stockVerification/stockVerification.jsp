<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : inventorymanager/warehouse/stockVerification/stockVerification.jsp
 * file type		        : JSP
 * description				: All verified stocks details are displayed using this jsp
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        
<style type="text/css">
.buttons {
	float: right;
	padding-top: 0px;
	margin-right: 2%;
	margin-top:1%;
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

 .list a.button {
position:relative;
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 5px 10px 5px 10px;
	background: #3c8dbc;

	border-radius: 5px;
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
}
.col-lg1-2{
    width: 25% !important;
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
<script type="text/javascript">
$(document).ready(function(){
	
callCalender('from');
callCalender('to');
$("#searchwarehouseStockVerification").val($("#stockWarehouseVerification").val());
$("#searchwarehouseStockVerification").focus();
$('#searchwarehouseStockVerification').on('input',function(e){
	if($(this).val().trim()==""){
		debugger
		viewWarehouseStockVerification("outletStockVerification","0","${flowUnder}","menu",'${masterverificationCode}');
	}
});
var sDate=$("#sd").val();
var s=sDate.split(' ');
$("#from").val(s[0]);
var eDate=$("#ed").val();
var e=eDate.split(' ');
$("#to").val(e[0]);

});
</script> 
</head>
<body>

 <!-- Content Header (Page header) -->
<%-- <section class="content-header">
   <h1><spring:message code="outlet.management.label" />
     <small><p id="heading"><spring:message code="stock.verification.label" /></p></small>
    </h1>
      <ol class="breadcrumb">
      	<li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><spring:message code="outlet.management.label" /></li>
     </ol>
 </section> --%>
                
<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
                  <div class="box-header" style="text-align: center;">
                     <h3 class="box-title">
						<spring:message code="stockverification.label"/>
					 </h3>
                     </div><!-- /.box-header -->
					<input type="hidden" id="sd" value="${startDate}">
				    <input type="hidden" id="ed" value="${endDate}">
				     <input type="hidden" id="masterverificationCode" value="${masterverificationCode}">
				      <input type="hidden" id="verification_code" value="${verificationCode}">
                                <div class="box-body table-responsive" style="padding-top: 0px;">
                                	
                                	
                                	
                                	
                                	
                                	
                                	
                                	 <div class="col-lg-11" style=" background: #f4f4f4;    padding: 10px 20px;    width: 88%;">
                                	
                                	
                                	 <div class="row">
                         <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="zone.label"/></label>
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZone('outletZone','outletLocation','')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
                         </div>
                      </div>
                      <div class="col-lg-1"></div>
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
                 <%--    <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="brand.label"/></label>
                           <select class="form-control" id="outletBrandId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="brandsList" items="${brandsList}">
									<option value="${brandsList}" ${brandsList == brand ? 'selected' : ''} id="${brandsList}" >${brandsList}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div> --%>
                  
                        <div class="col-lg-1"></div>
                         <div class="col-lg1-2 col-lg-2">
              <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
                 		<label><spring:message code="offer_start_date.label"/></label>
                	 	<input class="form-control calendar_icon form-group" readonly="readonly" value="" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
	              </div>
	            </div>
	           
                    </div>
                     <div class="row">
                       <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="location.label"/></label>
                        <%--    <input type="hidden" id="tolocation" value="${selectedLocation }"> --%>
							        <select class="form-control form-group" id="toLocation" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="location" items="${locationsList}">
									<option value="${location}" ${location == selectedLocation ? 'selected' : ''}  >${location}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                   
                    <div class="col-lg-1"></div>
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
                       <%-- <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="model.label"/></label>
                           <select class="form-control" id="outletDepartmentId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                           
	                        </select>
                      </div>
                      </div> --%>
                       <div class="col-lg-1"></div>
                      <div class="col-lg1-2 col-lg-2">
	               <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="offer_end_date.label"/></label>
	                 	<input class="form-control calendar_icon form-group" readonly="readonly" value="" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div>
                    </div>
                  </div>
                  <div class="col-lg-1" style="    width: 12%;    background: #ccc;">
                  <div class="col-lg-12" style="    border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">
                  <div class="row">
                  <a onclick="searchwarehouseStockVerification('','','0')" class="button"><spring:message code="search" /></a>
                  </div>
                  <div class="row">
                 <a type="button" style="margin-top: 18px"  onclick="resetForm();" class="button" ><spring:message code="clearbutton.label"/></a>
                  </div>
                  </div> <%-- <div class="col-lg-11"></div>
			                <div class="col-lg-1 summaryBtn">
			                <a id="summaryTag"  data-toggle="modal" data-target="#items-modal">
			                	<img class="summaryImg" src="${pageContext.request.contextPath}/images/summary.png" onclick="getstockRequestSummary()" style="cursor: pointer;" >
			                </a>
			                </div> --%>
            
                                	
                          </div>     	
                          <input type="hidden" id="flowUnder" value="${flowUnder}">
							                 <%--  <input type="hidden" id="master_verification_code" value="${masterverificationCode}"> --%>      	
                                	
                                	
                                	
                                	
                                	
                                	
                                	
                                	
                                	
                                	
                                	
                                	
                                	
                                	<%-- <div class="row">
								        <div class="col-lg-3">
								              <label><spring:message code="location.label"/></label>
							               <div class="row">
							                 <div class="col-lg-8 col-xs-8 col-sm-10 col-md-10" >
							                 <select class="form-control form-group" id="location" onchange="searchStockVerification('','','0')">
	 				                           <option value=""><spring:message code="ALL.label"/></option>
	 				                             <c:forEach var="location" items="${locationsList}">
													<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}">${location}</option>
												 </c:forEach>
	                                           </select>
							                 </div>
								        	</div>
								        </div>
								         <div class="col-lg-5"></div>
								         <div class="col-lg-3" style="    padding-right: 0px;">
								        <div class="col-lg-6" style="    padding-left: 0px;padding-right: 0px;">
								        <label><spring:message code="offer_start_date.label"/></label>
							              <div class="col-lg-12" style="    padding-left: 0px;padding-right: 0px;">
							                	 <div class="col-lg-12 col-xs-8 col-sm-12 col-md-12" style="padding-left: 0px;">
							             	<input class="form-control calendar_icon form-group" readonly="readonly" value="" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
							             </div>
								              </div>
								            </div>
							               <input type="hidden" id="flowUnder" value="${flowUnder}">
							                  <input type="hidden" id="master_verification_code" value="${masterverificationCode}">
								            <div class="col-lg-6" style="    padding-left: 0px;padding-right: 0px;">
								             <label><spring:message code="offer_end_date.label"/></label>
								               <div class="col-lg-12" style="    padding-left: 0px;padding-right: 0px;">
								                 <div class="col-lg-12 col-xs-8 col-sm-12 col-md-12" style="padding-left: 0px;">
								                 	<input class="form-control calendar_icon form-group" readonly="readonly" value="" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
							                	  </div>
									           </div>
									          </div></div>
								           <div class="col-lg-1" style="padding-left:0px;">
								                <input type="button" style="padding: 4px 8px;float: right;margin-top: 18px;width:100%" class="btn bg-olive btn-inline" onclick="searchwarehouseStockVerification('','','0')" value="<spring:message code="search" />" />
								           </div>
									      </div>
									     --%>
									    
	      								<%-- <div class="row" style="margin-top:-40px;">
									      <div class="col-lg-1 col-xs-2" style="margin-top: 10px;">
								                <select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="searchwarehouseStockVerification('','','0');">
								               		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
								               		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
								               		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
								              		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
								               	</select>
								           </div>
									        <div class="col-lg-9 col-xs-10" style="margin-top: 10px; padding-left:0px;">
								       	 		 <input type="text"  class="form-control searchItems searchBar" value="" id="searchwarehouseStockVerification" placeholder="<spring:message code="search.stock.verification.label" />" style=""  />
												<div class="services">
									    			<div class="items">
									     				<ul class="matchedStringUl searchwarehouseStockVerification" style=""></ul>
									   				</div>
												</div>
												<input type="hidden" id="stockWarehouseVerification" value="${searchName}">
								       	 	</div>
								       	 	 --%>
								       	 	<div class="col-lg-10"></div>
								       	 	 <div class="col-lg-1" style="padding-left: 0px;">
								               
								                <input type="button" style="padding: 4px 8px;width: 100%;margin-top: 10px;" class="btn bg-olive btn-inline" onclick="newverification('','${masterverificationCode}')" value="<spring:message code="new.label" />" />
								                 
								       </div>
								       	 	
								       	 	
								       	 	 <div class="col-lg-1" style="padding-left:0px;">
								               
								                <input type="button" style="padding: 4px 8px;width: 100%;margin-top: 10px;" class="btn bg-olive btn-inline" onclick="viewStockVerification('outletStockVerification','0','outlet','menu','');" value="<spring:message code="back.label" />" />
								                 
								       </div>
								       	 	
								       	 	<%--  <div class="col-lg-1" style="padding-left:0px;">
								               
								                <input type="button" style="padding: 4px 8px;width: 100%;margin-top: 10px;" class="btn bg-olive btn-inline" onclick="newstockverification()" value="<spring:message code="new.label" />" />
								                 
								       </div> --%>
								          <div>
								        <%--   <input type="button" style="padding: 4px 8px;    width: 100%;margin-top: 10px;" class="btn bg-olive btn-inline" onclick="viewEditWarehouseStockVerification('${whstockverifiObj}','0')" value="<spring:message code="view.stock.verification" />" /> --%>
								           </div>
									      
									      
                                    <table id="verifiedProductStocks" class="table table-bordered table-striped">
                                     <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><div><spring:message code="sl.no.label" /></div></th>
                                             <th><spring:message code="date.label" /></th>
                                            	<%-- <th><spring:message code="location.label" /></th> 
                                                <th><spring:message code="verified.label" /> <spring:message code="date.label" /></th>
                                             <th><spring:message code="verified.label" /> <spring:message code="by.label" /></th>   --%>
                                                
                                                	<th><spring:message code="openstock.label" /></th>
                                                	<th><spring:message code="saleqty.label" /></th>
                                                    <th><spring:message code="closestock.label" /></th>
                                                	<th><spring:message code="dumpstock.label" /></th>
                                                    <th><spring:message code="stockloss.label" /></th>
                                                	<th><spring:message code="losscost.label" /></th>
                                                	<th><spring:message code="dumpcost.label" /></th>  
                                                	
                                               <%--  <th><spring:message code="remarks.label" /></th> --%>
                                                <th><spring:message code="action.label" /> </th>
                                            </tr>
                                        </thead>
                                     
                                        <tbody style="text-align: center;">
                                           <c:forEach var="productStockVerificationDetails" items="${productStockVerificationDetailsList}"  varStatus="theCount">
                                            <tr>
                                           	<td>${theCount.count}</td>
                                              <td>${productStockVerificationDetails.verifiedOnStr}</td>
                                      
                                         <td>
                                            <c:set var="qtyissued" value="0" scope="page" />
                                                <c:forEach var="itemList" items="${productStockVerificationDetails.itemsList}"  varStatus="theCount"> 
                                         	<c:set var="qtyissued" value="${itemList.openStock} " scope="page" />
                                            	 <c:if test="${theCount.count == 1}">
                                            <c:out value="${itemList.openStock} " />
                                            </c:if>
                                            </c:forEach>
                                       <%--      <fmt:formatNumber groupingUsed="false" var="qtyissued" type="number" minFractionDigits="2" maxFractionDigits="2" value="${qtyissued}" /> --%>
                                            
                                            	</td>
                                            	<td>
                                            	<c:set var="qtyissued" value="0" scope="page" />
                                                <c:forEach var="itemList" items="${productStockVerificationDetails.itemsList}"  varStatus="theCount"> 
                                         	<c:set var="qtyissued" value="${itemList.saleQty}" scope="page" />
                                            	 <c:if test="${theCount.count == 1}">
                                            <c:out value="${itemList.saleQty}" />
                                            </c:if>
                                            </c:forEach>
                                            	                                           	
                                            	</td>
                                            	<td>
                                            	<c:set var="qtyissued" value="0" scope="page" />
                                                <c:forEach var="itemList" items="${productStockVerificationDetails.itemsList}"  varStatus="theCount"> 
                                         	<c:set var="qtyissued" value="${itemList.openStock} " scope="page" />
                                            	 <c:if test="${theCount.count == 1}">
                                            <c:out value="${itemList.openStock} " />
                                            </c:if>
                                            </c:forEach>
                                            	
                                            	</td>
                                            	<td>
                                            	<c:set var="qtyissued" value="0" scope="page" />
                                                <c:forEach var="itemList" items="${productStockVerificationDetails.itemsList}"  varStatus="theCount"> 
                                         	<c:set var="qtyissued" value="${itemList.dumpQty}" scope="page" />
                                            	 <c:if test="${theCount.count == 1}">
                                            <c:out value="${itemList.dumpQty} " />
                                            </c:if>
                                            </c:forEach>
                                            	
                                            	
                                            	</td>
                                            	<td>
                                            	
                                            	<c:set var="qtyissued" value="0" scope="page" />
                                                <c:forEach var="itemList" items="${productStockVerificationDetails.itemsList}"  varStatus="theCount"> 
                                         	<c:set var="qtyissued" value="${itemList.stock_loss} " scope="page" />
                                            	 <c:if test="${theCount.count == 1}">
                                            <c:out value="${itemList.stock_loss} " />
                                            </c:if>
                                            </c:forEach>
                                            	
                                            	
                                            	</td>
                                            	<td>
                                            	
                                            	
                                            	<c:set var="qtyissued" value="0" scope="page" />
                                                <c:forEach var="itemList" items="${productStockVerificationDetails.itemsList}"  varStatus="theCount"> 
                                         	<c:set var="qtyissued" value="${itemList.openStock} " scope="page" />
                                            	 <c:if test="${theCount.count == 1}">
                                            <c:out value="${itemList.openStock} " />
                                            </c:if>
                                            </c:forEach>
                                            	
                                            	
                                            	
                                            	
                                            	
                                            	</td> 
                                            	<td>
                                            	
                                            	<c:set var="qtyissued" value="0" scope="page" />
                                                <c:forEach var="itemList" items="${productStockVerificationDetails.itemsList}"  varStatus="theCount"> 
                                         	<c:set var="qtyissued" value="${itemList.dumpCost} " scope="page" />
                                            	 <c:if test="${theCount.count == 1}">
                                            <c:out value="${itemList.dumpCost} " />
                                            </c:if>
                                            </c:forEach>
                                            	
                                            	
                                            	</td>
                                            
                                            	                	
                                            <%-- 	<td>${productStockVerificationDetails.remarks}</td> --%>
                                            	<td style=""><a style="color:#2e7ea7 !important;margin-left:10px;cursor: pointer;" onclick="viewEditStockVerification('${productStockVerificationDetails.verification_code}','0','view');" ><spring:message code="stock.verification.master.view.label" /></a> &nbsp;
                                                 <a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewEditStockVerification('${productStockVerificationDetails.verification_code}','0','edit');"><spring:message code="edit.label"/></a>&nbsp;&nbsp; 
                                                 <input type="button" style="padding: 2px 11px;;margin-top: 0px;" class="btn bg-olive btn-inline" onclick="viewSpecificStockVerification('${productStockVerificationDetails.verification_code}','0');" value="<spring:message code="reports.label"/>">&nbsp;&nbsp;
                                            	</td>	
                                            </tr>
                                          </c:forEach>
                                        </tbody>
                                    </table>
                                    
                                    <%-- <c:if test="${flowUnder=='warehouse'}">
                                    <table id="verifiedProductStocks" class="table table-bordered table-striped">
                                     <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><div><spring:message code="sl.no.label" /></div></th>
                                                <th><spring:message code="verificationcode.label" /></th>
                                            	<th><spring:message code="location.label" /></th>
                                                <th><spring:message code="start.date.label" /></th>
                                                <th><spring:message code="end.date.label" /></th>
                                                <th><spring:message code="remarks.label" /></th>
                                                <th><spring:message code="action.label" /> </th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                           <c:forEach var="productStockVerificationDetails" items="${productStockVerificationDetailsList}">
                                            <tr>
                                            	<td>${productStockVerificationDetails.slNo}</td>
                                            	<td>${productStockVerificationDetails.verification_code}</td>
                                            	<td>${productStockVerificationDetails.location}</td>
                                            	<td>${productStockVerificationDetails.verificationStartDateStr}</td>
                                            	<td>${productStockVerificationDetails.verificationEndDateStr}</td>
                                            	<td>${productStockVerificationDetails.remarks}</td>
                                            	<td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewStockVerification('${productStockVerificationDetails.verification_code}','0')" ><spring:message code="view.stock.verification" /></a> &nbsp;
                                             <a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewWarehouseStockVerification('warehouseStockVerification','0','warehouse','menu');"><spring:message code="view.verfification.label"/></a> 
                                            	</td>	
                                            </tr>
                                          </c:forEach>
                                        </tbody>
                                    </table>
                                    
                                    </c:if> --%>
                                    
                                    
                                    
                                    
                                    
                           <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewWarehouseStockVerification('${flowUnder}StockVerification','${totalValue}','${flowUnder}','','')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewWarehouseStockVerification('${flowUnder}StockVerification','${index - 11}','${flowUnder}','','');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-10 <= 0}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewWarehouseStockVerification('${flowUnder}StockVerification','${index - 11}','${flowUnder}','','');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewWarehouseStockVerification('${flowUnder}StockVerification','${totalValue}','${flowUnder}','','')">
              	</div> 
              	</c:if>          
                                    
                                    
                                    
                                    
                                    
              <%--  <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewWarehouseStockVerification('','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewWarehouseStockVerification('','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-10 <= 0}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewWarehouseStockVerification('','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewWarehouseStockVerification('','${totalValue}')">
              	</div> 
              	</c:if> --%>
              </div>      
           </div><!-- /.box-body -->
       </div><!-- /.box -->
  
</div>
</div>
</section>
		 <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function() {
                $("#verifiedProductStocks").dataTable({
       			  "bPaginate": false,
                  "bLengthChange": false,
                  "bFilter": false,
                  "bSort": false,
                  "bInfo": false,
                  "bAutoWidth": false
    		});
          });
        </script>
        
</body>
</html>