<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : vijay
 * file name		        : Reports/retailoutlets/DumReport.jsp
 * file type		        : JSP
 * description				: The Dump  form is displayed using this jsp
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
                	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
                 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
</head>
<style>

@media only screen and (max-width:767px){
.table-responsive{
 overflow:hidden;
}
}
@media only screen and (max-width:1440px)  {

   .dataTable1 {
         width: 100%; 
       
         margin-bottom: 15px; 
        overflow-x: auto;
        overflow-y: hidden;
        -webkit-overflow-scrolling: touch;
        -ms-overflow-style: -ms-autohiding-scrollbar;
        border: 1px solid #DDD;
    white-space: nowrap;
    
  }

} 
@media only screen and (max-width:1180px)  {

   .dataTable2 {
         width: 100%; 
       
         margin-bottom: 15px; 
        overflow-x: auto;
        overflow-y: hidden;
        -webkit-overflow-scrolling: touch;
        -ms-overflow-style: -ms-autohiding-scrollbar;
        border: 1px solid #DDD;
       
    white-space: nowrap;
    
  }

} 
.allignment{
  /*    width: 13.3%; */
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
a.download{
    display: inline-block;
    /* padding-left: 15px; */
    float: right;
    padding-right: 5px;
    font-size: 22px;
    font-weight: bold;
    cursor: pointer;
    color: grey;
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
  /*   height: 24px; */
    padding: 0px 6px;
    }
    
    .calendar_icon {
    background-position: 3px 3px;
    }
   .form-group {
    margin-bottom: 10px;
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
    width: 25%!important;
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
.modal-body{
padding: 39px;
padding-top: 15px;
}
</style>
<script type="text/javascript">
/*  
 * width: 100%; 
 
 margin-bottom: 15px; 
overflow-x: auto;
overflow-y: hidden;
-webkit-overflow-scrolling: touch;
-ms-overflow-style: -ms-autohiding-scrollbar;
border: 1px solid #DDD;

display: inline-block;
white-space: nowrap;
 */
$(document).ready(function(){
	if($("#flowUnder").val()=='outlet'){
		$("#dumpTable").removeClass("dataTable2");
		$("#dumpTable").addClass("dataTable1");
	
	}
	else{
		$("#dumpTable").removeClass("dataTable1");
		$("#dumpTable").addClass("dataTable2");
	}
	callCalender('startDateDump');
	callCalender('endDateDump');
	
	$('#mySearch').click(function(){
        var searchName = $('#searchName').val();
        return viewOutletDumpReport('outletDumpReport','0');
    })
    $('#searchName').keypress(function(e){
        if(e.which == 13){//Enter key pressed
            $('#mySearch').click();//Trigger search button click event
        }
    });
	
// 	Added to fetch the locations based on zone 
/* 	 var zone = $("#outletZone").val();
	 if( zone != null && zone !="")
		 {
		 	searchlocationsBasedOnZoneForDashboard('outletZone','outletLocation','');
		 }
		 */

});
</script>
<body>


<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
      <div class="box-header" align="center">
		<h3 class="box-title" >
			<spring:message code="dump.report.label" />
		</h3>
		</div><!-- /.box-header -->
             <div class="box-body table-responsive">
                  <input type="hidden" id="stockdownloadurl" value="${downloadurl}">
              <div class="col-lg-11" style=" background: #f4f4f4;    padding: 10px 20px;    width: 88%;">
                  <div class="row">
                         <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="zone.label"/></label>
                           <select class="form-control" id="outletZone" onchange="searchZonallocationsBasedOnZone('outletZone','outletLocation','')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		
						 		</c:forEach>
	                        </select>
                         </div>
                      </div>
                      
                        <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="category.label"/></label>
                           <select class="form-control" id="outletCategory" onchange="searchSubCategories('outletCategory','outletSubcategory')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="categoryList" items="${categoryList}">
									<option value="${categoryList.categoryName}" ${categoryList.categoryName == category ? 'selected' : ''} id="${categoryList}" >${categoryList.categoryName}</option>
						 								 	
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
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="department.label"/></label>
                           <select class="form-control" id="outletDepartmentId" onchange="searchSubDepartmens('outletDepartmentId', 'outletSubDepartmentId');">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="departmentList" items="${departmentList}">
									<option value="${departmentList.primaryDepartment}" ${departmentList.primaryDepartment == department ? 'selected' : ''} id="${departmentList.primaryDepartment}" >${departmentList.primaryDepartment}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                       
                         <div class="col-lg1-2 col-lg-2">
              <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                 		<label><spring:message code="offer_start_date.label"/></label>
                	 	<input class="form-control calendar_icon form-group dateClear"  readonly="readonly" value="${startDate}" style="background-color: white;" id="startDateDump" size="20" type="text" onfocus="callCalender('startDateDump')" onclick="callCalender('startDateDump')" placeholder="DD/MM/YYYY" />
	              </div>
	            </div>
	           
                    </div>
                     <div class="row">
                       <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="location.label"/></label>
                           <select class="form-control" id="outletLocation" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                              <c:forEach var="location" items="${locationsList}">
<%-- 									<option value="${locations}" ${locations == loc ? 'selected' : ''} id="${location}" >${locations}</option> --%>
						 		<c:choose>
							   <c:when test="${location.description == ''}">
							    <option value="${location.locationId}" ${location.locationId == loc ? 'selected' : ''}>${location.locationId}</option>
							   </c:when>
							  <c:otherwise>
							   <option value="${location.locationId}" ${location.locationId == loc ? 'selected' : ''}>${location.locationId}-${location.description}</option>
							  </c:otherwise>
							 </c:choose>
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
									<option value="${subCategoryDetailsList.subcategoryName}" ${subCategoryDetailsList.subcategoryName == subCategory ? 'selected' : ''} id="${subCategoryDetailsList.subcategoryName}" >${subCategoryDetailsList.subcategoryName}</option>
						 			</c:forEach>
	                        </select>
                      </div>
                      </div>
                       <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="section.label"/></label>
                           <select class="form-control" id="section" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            
	                        </select>
                      </div>
                      </div>
                        <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="subdepartment.label"/></label>
                           <select class="form-control" id="outletSubDepartmentId" >
                           <option value=""><spring:message code="ALL.label"/></option>
                           		   <c:forEach var="subdepartmentList" items="${subdepartmentList}">
									<option value="${subdepartmentList}" ${subdepartmentList == subDepartment ? 'selected' : ''} id="${subdepartmentList}" >${subdepartmentList}</option>
						 		</c:forEach>
	                          
	                        </select>
                      </div>
                      </div>
                      <div class="col-lg1-2 col-lg-2">
	               <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="offer_end_date.label"/></label>
	                 	<input class="form-control calendar_icon form-group dateClear" id="endDateDump" value="${endDate}" readonly="readonly"  style="background-color: white;" size="20" type="text" onfocus="callCalender('endDateDump')" onclick="callCalender('endDateDump')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div>
                    </div>
                  </div>
                  <div class="col-lg-1" style="    width: 12%;    background: #ccc;">
                  <div class="col-lg-12" style="    border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">
                  <div class="row">
                  <a onclick="viewOutletDumpReport('outletDumpReport','0');" class="button"><spring:message code="searchbutton.label"/></a>
                  </div>
                  <div class="row">
                  <a onclick="resetForm();" class="button"><spring:message code="clearbutton.label"/></a>
                  </div>
                  </div></div>
                    <div class="row">
                     <div class="col-lg-3" style="padding-left:15px;">
                 <%--    <label><spring:message code="startprice.label"/></label> --%>
                    
                      </div>
                     
                       
                        
                       <div class="col-lg-3">
                     
                      </div>
                     <div class="col-lg-3">
                      
                      </div>
                    
                    </div>
                    <br>
                    <br>
                   <div class="row">
				                       <div class="col-lg-1 col-xs-2">
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="return viewOutletDumpReport('outletDumpReport','0')">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
				                     <div class="col-lg-10 col-xs-10 " style="padding-left: 0px;">
				                     <div class="wrapper">
				                      	 <input type="text"  class="form-control" style="" value="${searchName}" id="searchName" placeholder="<spring:message code="search.dump.report" />" />
											<button id="mySearch" class="searchbutton"></button>
															                    </div></div>
				                    
				                        <div class="col-lg-1" style="">
		   <input type="button" class="addBtn btn bg-olive btn-inline" data-toggle="modal" data-target="#myModalIos" style="font-size: 14px;" value="<spring:message code="save.label" />" />
		 </div>
				                  </div>
				                    
                     <div>
                      <div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;">
                     <table id="dumpTable" class="table table-bordered table-striped">
                      <thead style="background-color: #3c8dbc; color: #ffffff">
                             <tr>
                               <th><spring:message code="sl.no.label" /></th>
                                                	<th><spring:message code="export.select.location.label" /></th>
                                                	<th><spring:message code="report.skuid.label" /></th>
                                                	<th><spring:message code="product.name.table.label" /></th> 
                                                 	<th><spring:message code="ean.label" /></th> 
                                                  	<th><spring:message code="submitted.time.label" /></th>
                                                  	<th><spring:message code="updated.date.label" /></th>
                                                  	<th><spring:message code="write.off.time.label" /></th> 
                                                   	<th><spring:message code="book.qty.label" /></th> 
                                                    <th><spring:message code="verified.qty.label" /></th>
                                            		<th><spring:message code="dump.qty.label" /></th>
                                            		<th><spring:message code="stock.loss.qty.label" /></th> 
                                            		<th><spring:message code="previous.procurement.quantity.label"></spring:message></th> 
                                            		
                                            		
                                            
                                            		<th><spring:message code="costprice.label" /></th> 
                                            		<th><spring:message code="dumpcost.label" /></th> 
                                               		<th><spring:message code="losscost.label" /></th>
                                                	<th><spring:message code="clse.qty"/></th>
                                               		<th><spring:message code="stockcost.label" /></th>
                                                    <th><spring:message code="percentage.dump.label" /></th>
                                                    <th><spring:message code="percentage.loss.label" /></th>
                                                    <th><spring:message code="percentage.of.procurement.label"/></th>
                             </tr>
                         </thead>
                         <tbody style="text-align: center;">
                         <!--modified and added totals by manasa  -->
                         
                         <c:set var="dataExists" value="false"></c:set>
                                         <c:set var="bookQty" value="0.0"></c:set>
                                         <c:set var="dumpqtyVal" value="0.0"></c:set>
                                         <c:set var="stovkLossQty" value="0.0"></c:set>
                                         <c:set var="costPrice" value="0.0"></c:set>
                                           <c:set var="dumpcostVal" value="0.0"></c:set>
                                           <c:set var="lossCost" value="0.0"></c:set>
                                           <c:set var="closeQty" value="0.0"></c:set>
                                           <c:set var="closeStockVal" value="0.0"></c:set>
                                            <c:set var="stockCOSTtotal" value="0.0"></c:set>
                                             <c:set var="verifiedQtyVal" value="0.0"></c:set>
                                           
                                           
                         <c:forEach var="DumpReport" items="${WarehouseReportObj}" varStatus="theCount">
                         	 <tr>
                         	 <td>${theCount.count+index-1}</td>
                         	 <td>${DumpReport.location}</td>
                         	 <td>${DumpReport.sku_id}</td>
                         	<td>${DumpReport.productName}</td>
                         	<td>${DumpReport.ean}</td>
                         	<td>${DumpReport.createdDateStr}</td>
                         	<td>${DumpReport.updatedOnStr}</td>
                         	<c:choose>
                         	<c:when test="${DumpReport.status == 'Write Off'}">
                         	<td>${DumpReport.updatedOnStr}</td>
                         	</c:when>
                         	<c:otherwise>
                         	<td></td>
                         	</c:otherwise>
                         	</c:choose>
                         	
                         	
                         	
                         		<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${DumpReport.sku_book_stock}" var="bookStock"/>
                         	<td>${bookStock}</td>
                          <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${DumpReport.sku_physical_stock}" var="physicalStock"/>
                         	<td>${physicalStock}</td>
                         	<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${DumpReport.dumpQty}" var="dumpqty"/>
                         	<td>${dumpqty}</td>
                         	<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${DumpReport.stockLossQty}" var="stockLossQty"/>
                         	 <td>${stockLossQty}</td>
                         	     

                         	<td>${DumpReport.prevProcQty}</td>
                         	 
                         	 
                         	 <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${DumpReport.skuCostPrice}" var="stockCostPrice"/>
                         	 <td>${stockCostPrice}</td>
                         	  <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${DumpReport.dumpCost}" var="dumpcost"/>
                         	 <td>${dumpcost}</td>
                         	 
                         	 <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${DumpReport.stock_loss}" var="stockLoss"/>
                         	  <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${DumpReport.closedStock}" var="closedStock"/>
                         	   <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${DumpReport.stockCost}" var="stockCOST"/>
                         	 <td>${stockLoss}</td>
                         	 <td>${closedStock}</td>
                         	 <td>${stockCOST}</td> 
                         	 
                         	<%-- 
                         	 <td>${DumpReport.sku_physical_stock}</td>
                         	 <td>${DumpReport.dumpQty}</td>
                         	 <td>${DumpReport.stockLossQty}</td>
                         	 <td>${DumpReport.skuCostPrice}</td>
                         	 <td>${DumpReport.dumpCost}</td>
                         	 
                         	 
                         	 <td>${DumpReport.stock_loss}</td>
                         	 <td>${DumpReport.closedStock}</td>
                         	 <td>${DumpReport.stockCost}</td> --%>
                         	  <td>${DumpReport.dumpPer}</td>
                         	 <td>${DumpReport.lossPer}
                         	 
                         	 
                         	 
                         	<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" groupingUsed = "false" value="${bookQty+DumpReport.sku_book_stock}" var="bookQty"/> 
                         	 <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" groupingUsed = "false" value="${verifiedQtyVal+DumpReport.sku_physical_stock}" var="verifiedQtyVal"/>
                        	<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" groupingUsed = "false" value="${dumpqtyVal+DumpReport.dumpQty}" var="dumpqtyVal"/>
                         	<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" groupingUsed = "false" var="stovkLossQty" value="${stovkLossQty+DumpReport.stockLossQty}"/>
                         		<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" var="closeStockVal" groupingUsed = "false" value="${closeStockVal+DumpReport.closedStock}"/>
                         		<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" groupingUsed = "false" var="lossCost" value="${lossCost+DumpReport.stock_loss}"/>
                         		<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" groupingUsed = "false" var="costPrice" value="${costPrice+DumpReport.skuCostPrice}"/>
                         		<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" groupingUsed = "false" value="${stockCOSTtotal+DumpReport.stockCost}" var="stockCOSTtotal"/>
                         		<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" groupingUsed = "false" value="${dumpcostVal+DumpReport.dumpCost}" var="dumpcostVal"/>
                         		
                        
                          <%--	<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" var="costPrice" value="${costPrice+DumpReport.skuCostPrice}"/>
                         	<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" var="dumpCost" value="${dumpCost+DumpReport.dumpCost}"/>
                         	<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" var="lossCost" value="${lossCost+DumpReport.stock_loss}"/>
                         
                         	<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" var="closeStock" value="${closeStock+DumpReport.stockCost}"/> --%>
                         	
                         	  <%--  <c:set var="bookQty" value="${bookQty+DumpReport.sku_book_stock}"></c:set> --%>
                                       <%-- <c:set var="verifiedQty" value="${verifiedQty+DumpReport.sku_physical_stock}"></c:set> --%>
                                         <%-- <c:set var="dumpQty" value="${dumpQty+DumpReport.dumpQty}"></c:set> --%>
                                          <%--  <c:set var="stovkLossQty" value="${stovkLossQty+DumpReport.stockLossQty}"></c:set> --%>
											 <%--  <c:set var="costPrice" value="${costPrice+DumpReport.skuCostPrice}"></c:set> --%>
											 <%--  <c:set var="dumpcostVal" value="${dumpcostVal+DumpReport.dumpCost}"></c:set> --%>
											 <%--  <c:set var="lossCost" value="${lossCost+DumpReport.stock_loss}"></c:set> --%>
											 <%--  <c:set var="closeQty" value="${closeQty+DumpReport.closedStock}"></c:set> --%>
											 <%--  <c:set var="closeStock" value="${closeStock+DumpReport.stockCost}"></c:set> --%> 
                         	 <td>${DumpReport.dumpPerforProc}</td>
                         	 </tr>
                         	   <c:set var="dataExists" value="true"></c:set>
                         	 </c:forEach>
                         	 
                          <c:if test="${dataExists == 'true'}">	 
                         	 <tr style="border-top: 2px solid #ccc;">
                         	 <td></td>
                         	  <td></td>
                         	 <td></td>
                         	 <td></td>
                         	 <td></td>
                         	 <td></td>
                         	 <td></td>
                         	 <td style="font-weight:bold;font-size:16px;padding-top:5px">Totals</td>
                         	 
                         	 <td>${bookQty}</td>
                         	 <td>${verifiedQtyVal}</td>
                         	 <td>${dumpqtyVal}</td>
                         	 <td>${stovkLossQty }</td>
                 <td></td>
                         	 <td><%-- ${costPrice } --%></td>
                         	 
                         	  <td>${dumpcostVal}</td>
                         	 <td>${lossCost }</td>
                         	 <td>${closeStockVal }</td>
                         	 <td>${stockCOSTtotal }</td>
                         	 <td></td>
                         	 <td></td>
                     <td></td>    	 
                         	 </tr>
                     </c:if>    	 
                         	  <!--//..modified and added totals by manasa  -->
                         	 
                        </tbody>
                     </table>
                     </div>
                     </div>


<!-- <div class="col-lg-8"></div> -->
<!--                        <div class="col-lg-4" style="padding-right: 0px; text-align: right;" > -->
<!--              <div class="col-lg-12" style="border-top: 2px solid #ccc;padding-left: 0px;padding-right: 0px;    border-radius: 5px; background: #ccc;"> -->
<!--                  <div class="col-lg-6 col-sm-6" style="text-align: right;font-size: 16px">Total Quantity</div> -->
<%-- 					<div class="col-lg-6 col-sm-6" style="text-align: left;">: ${totalquantity} </div> --%>
				
<!-- 					 <div class="col-lg-12" style="border-top: 2px solid #eee;padding-left: 0px;padding-right: 0px;"></div> -->
<!--              <div class="col-lg-6 col-sm-6" style="text-align: right;font-size: 16px">Total Cost Value</div> -->
<%-- 					<div class="col-lg-6 col-sm-6" style="text-align: left;">: ${totalcost} </div> --%>
<!-- 					</div> -->
<!--               </div> -->
            <div class="row">
              		<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewOutletDumpReport('outletDumpReport','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewOutletDumpReport('outletDumpReport','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-10 <= 0}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewOutletDumpReport('outletDumpReport','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewOutletDumpReport('outletDumpReport','${totalValue}')">
              	</div> 
              	</c:if>
              	
              	
              	
              	    	
  	<div class="col-lg-6" style="float:right;">
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
              		  <input type="button" onclick="viewOutletDumpReport('outletDumpReport',document.getElementById('pagination').value);" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
             
				</div>
              </div> 
            
              </div>    
<div id="triggerEvent"></div>
   <div class="modal fade" id="myModalIos" role="dialog" tabindex="-1">
    <div class="modal-dialog iosmodeldialog">
    
      <!-- Modal content-->
      <div class="modal-content iospopup">
        <div class="modal-header">
       
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
       <div class="form-group col-lg-12" style="padding: 0px;font-size: 15px">Are you sure,you want to save the  file
       
         
         </div>
        <div class="form-group col-lg-12"></div>
          <div class="col-lg-4 col-sm-6 col-xs-6" style=""></div>
          <div class="form-group col-lg-8 col-sm-6 col-xs-6" style="padding-left: 0px; padding-right: 0px;">
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
 <input type="button" class="iosclosebutton1"  onclick="viewOutletDumpReport('outletDumpReport','0','save')"  value="Ok">
</div>
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
  <input type="button" class="iosclosebutton1" data-dismiss="modal" value="Cancel">
</div></div>
   <br/>
        </div>
        <br/>
        <div class="modal-footer" style="padding:0px;">
         
        </div>
      </div>
      
		</div>
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
                $("#dumpTable").dataTable({
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