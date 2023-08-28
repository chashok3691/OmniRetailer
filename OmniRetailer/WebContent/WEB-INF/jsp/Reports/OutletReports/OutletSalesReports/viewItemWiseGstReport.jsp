
<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Vijay
 * file name		        : Reports/OutletReports/outletSalesReports/viewCreditNoteReport.jsp
 * file type		        : JSP
 * description				: display price override report
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
        	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
        
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/billings.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
        
<style type="text/css">

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
.summaryImg {
    width: 50%;
    float: right;
    /* margin-right: 0%; */
    padding-bottom: 5px;
}



a.button{
     position: relative;
    text-decoration: none;
    color: white;
    display: inline-block;
    padding: 7px 10px 33px 10px;
    background: #3C8DBC;
    /* border-radius: 5px; */
    /* box-shadow: 1px 0px 2px #000; */
    cursor: pointer;
    margin-top: 15px;
    height: 23px;
    text-align: center;
    margin-bottom: 15px;
    width: 100%;
}

	
		
		.iospopupp {
   	width: 29%!important;
    margin-left: 45%;
    margin-top: 0%;
    border-radius: 2;
    border-radius: 12px;
	
}
</style>  
<script type="text/javascript">
$(document).ready(function(){
	callCalender('startDateGst');
	callCalender('endDateGst');
	$('#creditNoteSearch').click(function(){
        
        return viewItemWiseTaxGSTReport('ItemTaxGSTReport','0','false','${flowLocation}');
    })
    $('#searchCredit').keypress(function(e){
        if(e.which == 13){//Enter key pressed
            $('#creditNoteSearch').click();//Trigger search button click event
        }
    });
	
	/*  var zone = $("#outletZone").val();
	 if( zone != null && zone !="")
		 {
		 	searchlocationsBasedOnZoneForDashboard('outletZone','location','');
		 } */
	
});



</script>
</head>
<body>
<div id="gst">
<!-- Main content -->

				<section class="content-header">
                    <h1>
                       <c:if test = "${flowLocation ==''}">
                       <spring:message code="outlet_management.reports.label"/>
                       </c:if>
                       <c:if test = "${flowLocation !=''}">
                      <spring:message code="warehouse_management.reports.label"/> 
                      </c:if>&nbsp;<spring:message code="sales.reports.label"/>&nbsp;&#45;&nbsp;GST Report
                    </h1>
                  
                </section>
<section class="content">
<div class="row">
  <div class="col-lg-12">
	<div class="box box-primary">
       <div class="box-body">
   <div class="col-lg-12" style=" background: #f4f4f4;    ">

                  <div class="row">
                         <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="zone.label"/></label>
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZoneForDashboard('outletZone','location','${flowLocation}')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
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
                           <label><spring:message code="subcategory.label"/></label>
                           <select class="form-control" id="outletSubcategory" onchange="searchSectionsBasedOnSubCategory('productCategory','outletSubcategory', 'section');">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="subCategoryDetailsList" items="${subCategoryDetailsList}">
									<option value="${subCategoryDetailsList.subcategoryName}" ${subCategoryDetailsList.subcategoryName == subcategory ? 'selected' : ''} id="${subCategoryDetailsList.subcategoryName}" >${subCategoryDetailsList.subcategoryName}</option>
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
                	 	<input class="form-control calendar_icon form-group dateClear" readonly="readonly" value="${startdate}" style="background-color: white;" id="startDateGst" size="20" type="text" onfocus="callCalender('startDateGst')" onclick="callCalender('startDateGst')" placeholder="DD/MM/YYYY" />
	              </div>
	            </div>
	          
	           
	                <div class="col-lg1-2 col-lg-2" style="background: #ccc;">
	               <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                  <a onclick="searchItemWiseTaxGSTReport('ItemTaxGSTReport','0','false','NOPOP','${flowLocation}')" class="button"><spring:message code="searchbutton.label"/></a>
                  </div>
                 
                   </div></div>
                   
                   <div class="modal fade" id="myModalIoss" role="dialog" tabindex="-1">
    <div class="modal-dialog iosmodeldialog">
    
     
    
      <!-- Modal content-->
      <div class="modal-content iospopupp">
        <div class="modal-header" >
       
          <button type="button" class="close" style="margin-top: -17px;margin-right: -9px;" onclick="" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
       <div class="form-group col-lg-12" style="padding: 0px;font-size: 15px">It may take  time. Do you want to continue ?
       
          <!-- <div class="col-lg-1"> -->
         
        <!--  </div> -->
         </div>
        <div class="form-group col-lg-12"></div>
          <div class="col-lg-4 col-sm-6 col-xs-6" style=""></div>
          
         
         
          
          <div class="form-group col-lg-8 col-sm-6 col-xs-6" style="padding-left: 0px; padding-right: 0px;margin-left:50px">
												<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px; display: inline-block; padding: 4px 10px 28px 10px; background: #3c8dbc; cursor: pointer; margin-top: 19.5px; height: 25px; text-align: center; margin-bottom: 19px; width: 45%; margin-left: -30px;">
													<input type="button" class="iosclosebutton1"
														onclick="searchItemWiseTaxGSTReport('ItemTaxGSTReport','0','false','','${flowLocation}');"
														value="OK">
												</div>
												<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px; display: inline-block; padding: 4px 10px 28px 10px; background: #3c8dbc; cursor: pointer; margin-top: 19.5px; height: 25px; text-align: center; margin-bottom: 19px; width: 45%; margin-left: 48px;">
													<input type="button" class="iosclosebutton1"
														data-dismiss="modal" value="Cancel">
												</div>
											</div>



   <br/>
        </div>
        <br/>
        <div class="modal-footer" style="padding:0px;">
         <!--  <input type="button" class="iosclosebutton" data-dismiss="modal" value="Close"/> -->
        </div>
      </div>
      
		</div>
		</div>
	           <div class="row">
                   
                     
                       <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="location.label"/></label>
                           <select class="form-control" id="location" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="location" items="${workLocationsList}">
<%-- 									<option value="${location}" ${location == loc ? 'selected' : ''} id="${location}" >${location}</option> --%>
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
                           <label><spring:message code="category.label"/></label>
                           <select class="form-control" id="productCategory" onchange="searchSubCategories('productCategory','outletSubcategory')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="categoryList" items="${categoryList}">
									<option value="${categoryList.categoryName}" ${categoryList.categoryName == category ? 'selected' : ''} id="${categoryList.categoryName}" >${categoryList.categoryName}</option>
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
                       <div class="col-lg1-2 col-lg-2" style="display: none;">
                      <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="subdepartment.label"/></label>
                           <select class="form-control" id="outletSubDepartmentId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                          
	                        </select>
                      </div>
                      </div>
                     <div class="col-lg1-2 col-lg-2">
					<div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
					 <label>Sales Channel</label>
					 <select class="form-control form-group" id="salesChannel" style=" padding-left: 5px !important;" onchange="">
							<option value=""><spring:message code="ALL.label"/></option>
								<option value="<spring:message code="sales.channel.direct"/>"><spring:message code="sales.channel.direct"/></option>
								<option value="<spring:message code="sales.channel.online"/>"><spring:message code="sales.channel.online"/></option>
								<option value="<spring:message code="sales.channel.mobile"/>"><spring:message code="sales.channel.mobile"/></option>
								<option value="<spring:message code="sales.channel.salesExecutive"/>"><spring:message code="sales.channel.salesExecutive"/></option>
					 </select>
					 </div>
					 </div>
                     <div class="col-lg1-2 col-lg-2">
	               <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="offer_end_date.label"/></label>
	                 	<input class="form-control calendar_icon form-group dateClear" readonly="readonly" value="${enddate}" style="background-color: white;" id="endDateGst" size="20" type="text" onfocus="callCalender('endDateGst')" onclick="callCalender('endDateGst')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div>
		          
		          <div class="col-lg1-2 col-lg-2"style="background: #ccc;">
		          <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                  <a onclick="resetForm();" class="button"><spring:message code="clearbutton.label"/></a>
                  </div>
                  </div>
                   
                 
                  
                </div></div>
 
 
 <br><br>
	
          <div class="row">
                <div class="col-lg-12"><br></div>
                </div>
          
          
				                    <div class="row">
				                       <div class="col-lg-1 col-xs-2">
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewItemWiseTaxGSTReport('ItemTaxGSTReport','0','false','${flowLocation}');">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
				                     <div class="col-lg-8 col-xs-8 ">
				                     <div class="wrapper">
				                      	 <input type="text"  class="form-control" style="" value="${searchName}" id="searchCredit" placeholder="Search" />
											<button id="creditNoteSearch" class="searchbutton"></button>
											<!-- <div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl searchBills" style=""></ul>
								   				</div>
											</div> -->
										
				                    </div></div>
				                  <%--   <div class="col-lg-1" style="">
                     <input type="button" class="btn bg-olive btn-inline  addBtn" onclick="viewItemWiseTaxGSTReport('save','0');" value="SAVE"/>
                         <input type="hidden" id="stockdownloadurl" value="${downloadurl}">
                  </div> --%>
                  
                   <div class="col-lg-1" style="padding-left: 4px;">
		   <input type="button" class="addBtn btn bg-olive btn-inline" data-toggle="modal" data-target="#myModalIos"  style="font-size: 16px;" value="<spring:message code="save.label" />" />
		   <input type="hidden" id="stockdownloadurl" value="${downloadurl}">
		 </div>
		  <div class="col-lg-2" style="">
                                      <input type="button" class="btn bg-olive btn-inline  addBtn" onclick="" value="Save as GST File"/>
                                      <input type="hidden" id="stockdownloadurlforgst" value="">
                                   </div>
                  
				                  </div>
				                    <div style="overflow: auto;white-space: nowrap;">
                                    <table id="productstocks" class="table table-bordered table-striped">
                                     <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            		
                                                <th><spring:message code="sl.no.label" /></th>
                                                <th><spring:message code="product.name.table.label" /></th> 
                                                 <th><spring:message code="hsnCode.label" /></th> 
                                                <th><spring:message code="report.uom.label" /></th> 
                                                <th><spring:message code="location.label" /></th> 
                                                 <th><spring:message code="saleqty.label" /></th> 
                                                 <th>Taxable Value</th> 
                                                  <th><spring:message code="taxrate.label" /></th> 
                                                 <th>CGST 2.5 </th>
                                                 <th>SGST 2.5 </th>
                                                 <th>CGST 6.0</th>
                                                 <th>SGST 6.0</th>
                                                 <th>CGST 9.0</th>
                                                 <th>SGST 9.0</th>
                                                 <th>CGST 14.0</th>
                                                 <th>SGST 14.0</th>
                                                 <th><spring:message code="total.tax.amount.label" /></th> 
                                                 <th><spring:message code="billing_total_price.label" /></th>
                                      </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                           <c:forEach var="warehouseReport" items="${WarehouseReportObj.reportsList}" varStatus="theCount">
                                        	 <tr>
                                        	 	 <td>${theCount.count+index-1}</td>
                                        	 	<td style="text-align: left;">${warehouseReport.itemDesc}</td>
                                        	 	<td>${warehouseReport.hsnCode}</td>
                                        	 	<td>${warehouseReport.uom}</td>
                                        	 	<td>${warehouseReport.store_location}</td>
                                        	 	<td>${warehouseReport.quantity}</td>
                                        	 	<td>${warehouseReport.tax}</td>
                                        	 	<td>${warehouseReport.taxRate}</td>
                                        	 	<td>${warehouseReport.cgst2_5}</td>
                                        	 	<td>${warehouseReport.sgst2_5}</td>
                                        	 	<td>${warehouseReport.cgst6}</td>
                                        	 	<td>${warehouseReport.sgst6}</td>
                                        	 	<td>${warehouseReport.cgst9}</td>
                                        	 	<td>${warehouseReport.sgst9}</td>
                                        	 	<td>${warehouseReport.cgst14}</td>
                                        	 	<td>${warehouseReport.sgst14}</td>
                                        	 	<td>${warehouseReport.taxValue}</td>
                                        	     <td>${warehouseReport.totalCost}</td>
                                        	 
                                        	 	
                                            </tr>
                                              <c:set var="dataExists" value="true"></c:set>
                                           </c:forEach>
                                           
                                        <c:if test="${dataExists == 'true'}" >
                                           <tr>
                                             <c:set var="tax" value="0"  />
                                              <c:set var="cgstValue" value="0"  />
                                              <c:set var="sgstValue" value="0"  />
                                              <c:set var="cgst6" value="0"  />
                                              <c:set var="sgst6" value="0"  />
                                               <c:set var="cgst9" value="0"  />
                                              <c:set var="sgst9" value="0"  />
                                               <c:set var="cgst14" value="0"  />
                                              <c:set var="sgst14" value="0"  />
                                              <c:set var="taxAmt" value="0"  />
                                               <c:set var="qty" value="0"  />
                                              <c:set var="totalCost" value="0"  />
                                           <c:forEach var="warehouseReport" items="${WarehouseReportObj.reportsList}">
                                           
                                           <c:set var="qty" value="${qty+((warehouseReport.quantity))}" scope="page" />
                                            <c:set var="tax" value="${tax+((warehouseReport.tax))}" scope="page" />
                                            <c:set var="cgstValue" value="${cgstValue+((warehouseReport.cgst2_5))}" scope="page" />
                                              <c:set var="sgstValue" value="${sgstValue+((warehouseReport.sgst2_5))}" scope="page" />
                                                <c:set var="cgst6" value="${cgst6+((warehouseReport.cgst6))}" scope="page" />
                                                  <c:set var="sgst6" value="${sgst6+((warehouseReport.sgst6))}" scope="page" />
                                                   <c:set var="cgst9" value="${cgst9+((warehouseReport.cgst9))}" scope="page" />
                                                  <c:set var="sgst9" value="${sgst9+((warehouseReport.sgst9))}" scope="page" />
                                                   <c:set var="cgst14" value="${cgst14+((warehouseReport.cgst14))}" scope="page" />
                                                  <c:set var="sgst14" value="${sgst14+((warehouseReport.sgst14))}" scope="page" />
                                                   <c:set var="taxAmt" value="${taxAmt+((warehouseReport.taxValue))}" scope="page" />
                                                  <c:set var="totalCost" value="${totalCost+((warehouseReport.totalCost))}" scope="page" />
                                           </c:forEach>
                                           
                                           <td></td>
                                           <td></td>
                                           <td></td>
                                           <td></td>
                                         <td style="padding:3px;width: 160px;"><div style="white-space: nowrap;padding: 5px;background: #727272;"><font color="white"><spring:message code="totals.label" /></font></div></td>
                                         <td style="padding:3px;width: 160px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${qty}</div></td>
                                          <td style="padding:3px;width: 160px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${tax}</div></td>
                                           <td></td>
                                          <td style="padding:3px;width: 160px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${cgstValue}</div></td>
                                          <td style="padding:3px;width: 160px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${sgstValue}</div></td>
                                           <td style="padding:3px;width: 160px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${cgst6}</div></td>
                                           <td style="padding:3px;width: 160px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${sgst6}</div></td>
                                           <td style="padding:3px;width: 160px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${cgst9}</div></td>
                                           <td style="padding:3px;width: 160px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${sgst9}</div></td>
                                           <td style="padding:3px;width: 160px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${cgst14}</div></td>
                                           <td style="padding:3px;width: 160px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${sgst14}</div></td>
                                           <td style="padding:3px;width: 160px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${taxAmt}</div></td>
                                           <td style="padding:3px;width: 160px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${totalCost}</div></td>
                                           
                                           </tr>
                                        </c:if>   
                                           
                                           
                                        </tbody>
                                    </table>
                                    </div>
             <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewItemWiseTaxGSTReport('ItemTaxGSTReport','${totalValue}','false','${flowLocation}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewItemWiseTaxGSTReport('ItemTaxGSTReport','${index - (maxRecords + 1)}','false','${flowLocation}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewItemWiseTaxGSTReport('ItemTaxGSTReport','${index - (maxRecords + 1)}','false','${flowLocation}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewItemWiseTaxGSTReport('ItemTaxGSTReport','${totalValue}','false','${flowLocation}')">
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
              		  <input type="button" onclick="viewItemWiseTaxGSTReport('ItemTaxGSTReport',document.getElementById('pagination').value,'false','${flowLocation}')" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
             
				</div>
              </div>    
              
              
              
              
              
                           <div id="triggerEvent"></div>
    <!-- COMPOSE MESSAGE MODAL -->
    
    <div class="modal fade" id="myModalIos" role="dialog" tabindex="-1">
    <div class="modal-dialog iosmodeldialog">
    
      <!-- Modal content-->
      <div class="modal-content iospopup">
        <div class="modal-header">
       
          <button type="button" class="close" onclick="" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
       <div class="form-group col-lg-12" style="padding: 0px;font-size: 15px">Are you sure,you want to save the  file
       
          <!-- <div class="col-lg-1"> -->
          <input type="hidden" id="stockdownloadurl" value="${downloadurl}">
        <!--  </div> -->
         </div>
        <div class="form-group col-lg-12"></div>
          <div class="col-lg-4 col-sm-6 col-xs-6" style=""></div>
          <div class="form-group col-lg-8 col-sm-6 col-xs-6" style="padding-left: 0px; padding-right: 0px;">
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
 <input type="button" class="iosclosebutton1" onclick="viewItemWiseTaxGSTReport('ItemTaxGSTReport','0','true','${flowLocation}')"  value="Ok">
</div>
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
  <input type="button" class="iosclosebutton1" data-dismiss="modal" value="Cancel">
</div></div>
   <br/>
        </div>
        <br/>
        <div class="modal-footer" style="padding:0px;">
         <!--  <input type="button" class="iosclosebutton" data-dismiss="modal" value="Close"/> -->
        </div>
      </div>
      
		</div>
		</div>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
       </div></div>

</section>
		<script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function() {
                $("#productstocks").dataTable(
             		{
             			"bPaginate": false,
                           "bLengthChange": false,
                           "bFilter": false,
                           "bSort": false,
                           "bInfo": false,
                           "bAutoWidth": false
             		});
                 });
        </script>
       </div>
</body>
</html>


