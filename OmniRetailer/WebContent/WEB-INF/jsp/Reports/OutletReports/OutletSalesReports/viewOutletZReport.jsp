<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : RaviTeja.N
 * file name		        : Inventory Manager/Reports/viewOutletZReport.jsp
 * file type		        : JSP
 * description				: display outlet sales reports
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <script src="${pageContext.request.contextPath}/js/outletReports/reports.js"></script>
         <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/lineGraphs.js"></script>
    
    <style type="text/css">
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

.box {
    position: relative;
    border-radius: 10px;
    background: #ffffff;
    border-top: 3px solid #d2d6de;
    margin-bottom: 20px;
    width: 100%;
    box-shadow: 0 2px 7px 8px #cccccc;
}
.col-lg2-2
{
margin-left:2px;
}


.iospopupp {
   	width: 61%!important;
    margin-left: 45%;
    margin-top: 0%;
    border-radius: 2;
    border-radius: 12px;
	
}
</style>
    
    <script type="text/javascript">

	$(document).ready(function(){
		
	
		 //callCalenderYYYYMMDD('date');
		 callCalender('fromZRead');
		 callCalender('toZRead');
		 callCalender('date');
	});
</script>
</head>
<body>
<div id="vi">
				<section class="content-header">
                    <h1>
                       <c:if test = "${flowLocation ==''}">
                       <spring:message code="outlet_management.reports.label"/>
                       </c:if>
                       <c:if test = "${flowLocation !=''}">
                      <spring:message code="warehouse_management.reports.label"/> 
                      </c:if>
                      &nbsp;<spring:message code="sales.reports.label"/>&nbsp;&#45;&nbsp;<spring:message code="zreading.reports.label"/>&nbsp;<spring:message code="report.label"/>
                    </h1>
                   <%--  <ol class="breadcrumb">
                        <li><a href="#" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
                        <li><a href="#" onclick="showReportsFlows();"><spring:message code="reports.label"/></a></li>
                        <li><a href="#" onclick="showOutletReportsFlows();"><spring:message code="outlet_management.reports.label"/></a></li>
                        <li><a href="#" onclick="showOutletSalesReportsFlows();"><spring:message code="sales.reports.label"/></a></li>
                        <li class="active"><spring:message code="zreading.reports.label"/></li>
                    </ol> --%>
                </section>
               
      <section class="content">         
               
<div class="row">
  <div class="col-lg-12">
	<div class="box box-primary">
       <div class="box-body table-responsive" style="padding: 30px">  
     
      <div class="backBtn col-lg-12" style="display: none;padding-left: 0px">
       <div class="col-lg-1" style="padding-left: 0px;">
								                <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="viewOutletZReadingReport('outletZReadingReport','0','${flowLocation}');" value="<spring:message code="back.label" />">
								           </div>
       
       </div> 
        <div class=" col-lg-12">
        
        </div>    
        <div class="">
                <div class="col-lg-12 disPlay" style=" background: #f4f4f4;    padding: 10px 20px;    width: 100%;">
                  <div class="row" style="padding-right: 15px">
                         <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="zone.label"/></label>
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZoneForDashboard('outletZone','outletLocation','${flowLocation}')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
                         </div>
                      </div>
                      
                  		<div class="col-lg1-2 col-lg-2">
				            <label><spring:message code="billing_counter.label" /></label>
				            <select class="form-control" name="outletZCounter" id="outletZCounter">
				 	            <option value="">ALL</option>
				 	            <c:if test = "${flowLocation ==''}">
				               <c:forEach var="counter" items="${countersList}">
				            	 <option value="${counter}">${counter}</option>
				 	           </c:forEach>
				 	           </c:if>
				 	            <c:if test = "${flowLocation !=''}">
					            <c:forEach var="countersList" items="${counterDetails.warehouseCountersList}">
									<option value="${countersList.counterName}" ${countersList.counterName == counterId ? 'selected' : ''} id="${countersList.counterName}" >${countersList.counterName}</option>
								</c:forEach>
					            </c:if>
				 	           
				            </select>
				            <span id="counterError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
				          </div>
          
            <div class="col-lg-4"></div>
                     
                         <div class="col-lg1-2 col-lg-2">
              <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                 		<label><spring:message code="offer_start_date.label"/></label>
                	 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${startdate}" style="background-color: white;" id="fromZRead" size="20" type="text" onfocus="callCalender('fromZRead')" onclick="callCalender('fromZRead')" placeholder="DD/MM/YYYY" />
	          <input type="hidden" id="fromXread" value="${startdate}">
	           <input type="hidden" id="toXread" value="${enddate}">
	              </div>
	            </div>
	             <div class="col-lg-1"></div>
	            
	            <div class="col-lg-1" style="padding-right: 15px">
	             <div class="row">
                  <a onclick="searchOutletZReadingReport('outletZReadingReport','0','NOPOP','${flowLocation}')" class="button"><spring:message code="searchbutton.label"/></a>
                  </div>
	            </div>
	           
                    </div>
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
														onclick="searchOutletZReadingReport('outletZReadingReport','0','','${flowLocation}')"
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
                     <div class="row" style="padding-right: 15px">
                       <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="location.label"/></label>
                           <select class="form-control" id="outletLocation" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="location" items="${workLocationsList}">
<%-- 									<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option> --%>
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
                      </div>
                   		<div class="col-lg1-2 col-lg-2">
				            <label>Status</label>
				            <select class="form-control" name="ZreportStatus" id="ZreportStatus">
				            	 <option value="">ALL</option>
				            	 <option value="Pending">Pending</option>
				            	 <option value="Closed">Closed</option>
				 	           
				            </select>
				            <span id="counterError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
				          </div>
				          
                      <div class="col-lg-4"></div>
                      <div class="col-lg1-2 col-lg-2">
	               <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="offer_end_date.label"/></label>
	                 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${enddate}" style="background-color: white;" id="toZRead" size="20" type="text" onfocus="callCalender('toZRead')" onclick="callCalender('toZRead')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div>
		          <div class="col-lg-1"></div>
		            
		            <div class="col-lg-1" style="padding-right: 15px">
		             <div class="row">
                  <a onclick="resetForm();" class="button"><spring:message code="clearbutton.label"/></a>
                  </div>
                  </div>
		           
                    </div>
                  </div>
                 <%--  <div class="col-lg-1" style="    width: 12%;    background: #f4f4f4;">
                  <div class="col-lg-12">
                  <div class="row">
                  <a onclick="viewOutletStocks('outletStocks','${stockType}','0');" class="button"><spring:message code="searchbutton.label"/></a>
                  </div>
                  <div class="row">
                  <a onclick="resetForm();" class="button"><spring:message code="clearbutton.label"/></a>
                  </div>
                  </div>
                  </div> --%>
                  
                   <div class="nav-tabs-custom">
 <ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#home" style="text-transform: capitalize;">Daily Report</a></li>
  <li><a data-toggle="tab" onclick="" href="#menu1">Graphical Report</a></li>
</ul>
<div class="tab-content">
  <div id="home" class="tab-pane fade in active">
                
                 <div class="form-group col-lg-12"></div> 
                
                <div class="row">
                
                 <div class="col-lg-1 col-xs-2">
                       <div class="row">
                       <div class="col-lg-12 col-xs-12"><br></div>
               <div class="col-lg-12 col-xs-12">
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewOutletZReadingReport('outletZReadingReport','0','${flowLocation}');">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      	</div> 
				                    </div>
				                    
				                  
				 </div>
               
               <div class="col-lg-5 col-xs-4" style="padding-left: 0px;">
       	 		 <input type="text"  class="form-control searchItems"  value="${searchName}" id="searchZreport" placeholder="<spring:message code="search.shipment.receipts" />" style="margin-top: 18px;height:30px;text-align: left;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
					<div class="services">
		    			<div class="items">
		     				<ul class="matchedStringUl searchZreport" style=""></ul>
		   				</div>
					</div>
					<input type="hidden" id="searchZreportFiletr" value="${searchName}">
       	 	</div>
       	 	
             <div class="col-lg-1 nopadding">
            <label><spring:message code="location.label" /></label>
            <select class="form-control" name="location" id="location" onchange="return changeInfoBasedOnLocation(this.options[this.selectedIndex].value,'${flowLocation}');">
               <c:forEach var="location" items="${workLocationsList}">
            	 <option value="${location.locationId}">${location.locationId}</option>
 	           </c:forEach>
 	        </select>
          </div>
            <input type="hidden" id="flowLocation" value="${flowLocation}">     
           <div class=" col-lg-2">
            <label><spring:message code="billing_counter.label" /></label>
            <select class="form-control" name="counter" id="counter">
               
                
 	            <c:if test = "${flowLocation ==''}">
               <c:forEach var="counter" items="${countersList}">
            	 <option value="${counter}">${counter}</option>
 	           </c:forEach>
 	           </c:if>
 	            <c:if test = "${flowLocation !=''}">
	                            <c:forEach var="countersList" items="${counterDetails.warehouseCountersList}">
									<option value="${countersList.counterName}" ${countersList.counterName == counterId ? 'selected' : ''} id="${countersList.counterName}" >${countersList.counterName}</option>
						 		</c:forEach>
	                       </c:if>
 	           
            </select>
            <span id="counterError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
          </div>
           
           <div class=" col-lg-1 nopadding">
              <label><spring:message code="date.label" /> <span class="requiredField">*</span> </label>
              <input class="form-control calendar_icon" readonly="readonly" style="padding-left: 2px !important;background-color: white;" name="date" id="date" size="20" type="text" onfocus="callCalender('date')" onclick="callCalender('date')" placeholder="DD/MM/YYYY"/>
             <span id="dateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
           </div>
           
         <div class="col-lg-2" style="text-align: right;margin-top:14px;">
		   <input type="button" class="btn bg-olive btn-inline" onclick="generateReport('Z','');" style="" value="Generate Report">
		 
		 </div>
                
         </div>
                
                <table id="productstocks" class="table table-bordered table-striped disPlay">
                      <thead style="background-color: #3c8dbc; color: #ffffff">
                             <tr>
                                <th><div><spring:message code="sl.no.label" /></div></th>
                             
                             	<th><spring:message code="zone.label" /></th>
                             	
                                <%-- <th><spring:message code="product.code.label" /></th> --%>
                                <th><spring:message code="location.label" /></th>
                                <th><spring:message code="date.label" /></th>
                                <th><spring:message code="counter.delete.label" /></th>
                               	<th><spring:message code="cashier.label" /></th>
                               	   <th><spring:message code="billing_total_price.label" /></th>
                                <th><spring:message code="tax.label" /></th>
                                 <th><spring:message code="netSales.label" /></th>
                                   <th ><spring:message code="EmployeeForm.action" /></th>
                             </tr>
                         </thead>
                         <tbody style="text-align: center;">
                            <c:forEach var="reportsList" items="${reports.reportsList}" varStatus="theCount">
                         	 <tr>
                                <td>${theCount.index+index}</td>
                               
                             	<td>${reportsList.zone}</td>
                               
                                <%-- <td>${stockDetails.productId}</td> --%>
                                <td class="locations">${reportsList.location}</td>
                                <td class="dates">${fn:replace(reportsList.createdDate, '.0', '')}</td>
                                <%--  <fmt:formatNumber var="formattedBillableTime" type="number"  minFractionDigits="2" maxFractionDigits="2" value="${stockDetails.quantity}" /> --%>
                                <td>${reportsList.counter}</td>
                               
                                 <td>${reportsList.cashier}</td>
                                  <td class="totalAmount">${reportsList.totalAmount}</td>
                                  <td>${reportsList.tax}</td>
                                   <td>${reportsList.netSales}</td>
                                <td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="return viewOutletZReport('outletZReadingReport','${reportsList.location}','${reportsList.counter}','${reportsList.businessCycleDateStr}','','false')">View</a>&nbsp;&nbsp;&nbsp;
                             </tr>
                            </c:forEach>
                         </tbody>
                     </table>
                
                
              <%--  <div class="row" >
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-12" style="text-align:right">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewOutletZReadingReport('outletZReadingReport','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-12" style="text-align:right">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewOutletZReadingReport('outletZReadingReport','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-10 <= 0}">
              		<div class="form-group col-lg-12" style="text-align:right">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-12" style="text-align:right">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewOutletZReadingReport('outletZReadingReport','${index - 11}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewOutletZReadingReport('outletZReadingReport','${totalValue}')">
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
              		  <input type="button" onclick="viewOutletZReadingReport('outletXReadingReport',document.getElementById('pagination').value);" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
             				</div>
              	
              	
              </div>
                 

 --%>
             
             
                     <div class="row">
    
              	<c:if test="${index-1 == 0 && totalRecords > maxRecords}">
              		<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${index + maxRecords-1} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewOutletZReadingReport('outletZReadingReport','${index+maxRecords-1}','${flowLocation}')">
              	</div>
              	</c:if>
              		
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewOutletZReadingReport('outletZReadingReport','${index - maxRecords-1}','${flowLocation}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-maxRecords <= 0}">
              		<div class="form-group col-lg-2" >
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-2">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewOutletZReadingReport('outletZReadingReport','${index - maxRecords-1}','${flowLocation}');"> ${index} - ${index+maxRecords-1} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewOutletZReadingReport('outletZReadingReport','${index+maxRecords-1}','${flowLocation}')">
              	</div> 
              	</c:if>
              	<div class="form-group col-lg-4"></div>
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
              		  <input type="button" onclick="viewOutletZReadingReport('outletZReadingReport',document.getElementById('pagination').value,'${flowLocation}')" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
				</div>
              </div>   
          
             
              
                </div>
                 <input type="hidden" id="flowLocation" value="${flowLocation}">
                
                  <div id="menu1" class="tab-pane fade in ">
                              <h3 style="text-transform: capitalize;">Z Reading Graphical Report</h3>
                               <canvas id="pricevar" height="450 !important;" width="1020  !important;"></canvas>
                              </div>
                              
                              <c:if test="${totalValue > 0}">
                              <input type="hidden" id="graphRecords" value="${(totalValue+1)-index}"/>
                              </c:if>
                
                </div>
                </div>
                </div>
             
                </div>
                </div>
                </div>
                </div>
                 <!-- DATA TABES SCRIPT -->
       <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        
         <!-- page script -->
      <!--   <script type="text/javascript">
            $(function() {
                //$("#example1").dataTable();
                $('#productstocks').dataTable({
                    "bPaginate": false,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": false,
                    "bInfo": false,
                    "bAutoWidth": false
                });
            });
            
       	 
		  var graphRecords=1;
	       	if($("#graphRecords").length > 0)
			{
			graphRecords = $("#graphRecords").val();
			var count=0;

		 		var tempLabels = [], tempValues = [],locationCheck = [],finalLabels = [], dateValueComparison=[]; locationArray = [], label = [],labels = [];
				// below function is used get all the labels existing in the data table
		 		$('.dates').each( function(){
		 			count++;
        			var beforeSplitValue= $(this).text();
        			var afterSplitValue = beforeSplitValue.split(' ');
        			lValue = afterSplitValue[0];
   					 afterSplitValue= lValue.split('-');
   					 lValue = afterSplitValue[2]+'/'+afterSplitValue[1]+'/'+afterSplitValue[0];
   					var cleanLabel = "";
   					for(var i=0;i<10;i++)
   						{
   						if(i != 6 && i != 7)
   						cleanLabel += lValue[i];
   						}
        			
        		 if(count<=graphRecords)
        			 {
         				
						 tempLabels.push(lValue); 
						 }
				});
				
					count=0; 
				// below function is used to eliminate duplicate locations existing in the data table
					$('.locations').each( function(){
		    			count++;
		    			var addNew = true;
		    			var temp = $(this).text();
		    			if(count<=graphRecords)
		    				for( var i = 0 ; i <= locationCheck.length ;i++ )
		    				if(temp === locationCheck[i])
		    					addNew = false;
		    			
		    			if(addNew)
		    				locationCheck.push($(this).text());  
		    			});
					
					count=0;
					// below function is used to all the locations existing in the data table
					$('.locations').each( function(){
		    			count++;
		    			if(count<=graphRecords)
		    	   		locationArray.push($(this).text());       
		    			});
					
				count=0;
					// below function is used to all the y-axis values existing in the data table

				$('.totalAmount').each( function(){
			count++;
			if(count<=graphRecords)
	   		tempValues.push($(this).text());       
			});
				
				// below loop is used to eliminate duplicate labels existing in the data table
				for(var i=0;i<graphRecords;i++)
					{
						var addNew = true;
						var temp = tempLabels[i];
						for(var j=0; j<labels.length;j++)
							{
								if(temp === labels[j])
									{
										addNew = false;	
									}
							}
						if(addNew)
							labels.push(tempLabels[i]);   
					}
				var j=1;
				// below loop is used to generate the missing dates as labels for x-axis
// 				for(i=0;i<labels.length;i++)
// 			{
// 					var newLabel=true;
// 					if(i>0)
// 						while(finalLabels[j-1] !== labels[i])
// 					{
// 						finalLabels.push(decr_Date(finalLabels[j-1],'/'));
// 						j++;
// 						newLabel=false;
// 					}
// 					if(newLabel)
// 						finalLabels.push(labels[i]);
// 			}
				
				var dynamicArrays = [];
				// below loop is used to generate the dynamic arrays based on each unique locations
				for (i=0;i<locationCheck.length;i++)
					{
						dynamicArrays[locationCheck[i]] = [];
				  	}
				
				var j=1;	
				// below loop is used to store the values of y-Axis into dynamic arrays based on each unique locations

			for(var i=0; i<graphRecords;i++)
			{
				count=0;
				var addNew = true;
				var temp = locationArray[i] +" "+ tempLabels[i];
				for(var l=0;l<label.length;l++)
				{
						var temp2 = label[l];
						if(temp === temp2)
							{
								addNew = false;
							}
					}
				if(!addNew)
					{
					for(var l=0;l<locationCheck.length;l++)
					{
							if(locationArray[i] === [locationCheck[l]][0])
							{
								var sum = (parseFloat(dynamicArrays[locationCheck[l]])+ parseFloat(tempValues[i])).toFixed(2);;
								dynamicArrays[locationCheck[l]].pop();
								dynamicArrays[locationCheck[l]].push(sum);
							}
					}
					}
				if(addNew)
										for(var l=0;l<locationCheck.length;l++)
											{
													if(locationArray[i] === [locationCheck[l]][0])
													{
														
														dateValueComparison.push(locationArray[i] + " " + tempLabels[i]);
			
													var t;
														for(var v=0;v<dateValueComparison.length;v++)
														{
															var s= dateValueComparison[v].split(" ");
															t=locationArray[i] + " " + s[s.length-1];
															var lcount=0;
															for(var w=0;w<dateValueComparison.length;w++)
															{
															if(t===dateValueComparison[w])
																{
																	lcount = 1;
																}
															}
															if(lcount===0){
															dynamicArrays[locationCheck[l]].push("0");
															dateValueComparison.push(t);
															}
														}
													dynamicArrays[locationCheck[l]].push(tempValues[i]);
													label.push(locationArray[i] +" "+ tempLabels[i]);

													}
											}
								}
				// Based on Locations, below loop is used to store the values of y-Axis as zero if the values does not exist for the labels of x-axis 

			for (var k=0;k<locationArray.length;k++)
				{
				for(var v=0;v<dateValueComparison.length;v++)
				{
					var s= dateValueComparison[v].split(" ");
					var t=locationArray[k] + " " + s[s.length-1];
					var lcount=0;
					for(var w=0;w<dateValueComparison.length;w++)
						{
							if(t===dateValueComparison[w])
								{
									lcount = 1;
								}
						}
					if(lcount===0){
						for(var l=0;l<locationCheck.length;l++)
						{
								if(locationArray[k] === [locationCheck[l]][0])
								{
									dynamicArrays[locationCheck[l]].push("0");
									dateValueComparison.push(t);
								}
						}
					}
				}
				}
				
			debugger;
			
				new Chart(document.getElementById("pricevar").getContext("2d")).Line(getlinegraph([locationCheck[0]][0],[locationCheck[1]][0],[locationCheck[2]][0],[locationCheck[3]][0], 
				[locationCheck[4]][0],[locationCheck[5]][0],[locationCheck[6]][0],[locationCheck[7]][0],[locationCheck[8]][0],[locationCheck[9]][0],labels, dynamicArrays[locationCheck[0]],
				dynamicArrays[locationCheck[1]],dynamicArrays[locationCheck[2]],dynamicArrays[locationCheck[3]],dynamicArrays[locationCheck[4]],dynamicArrays[locationCheck[5]]
				,dynamicArrays[locationCheck[6]],dynamicArrays[locationCheck[7]],dynamicArrays[locationCheck[8]],dynamicArrays[locationCheck[9]]),newOpts('','Amount'));

		}
		
		
		
            
         
        
      
//         		new Chart(document.getElementById("pricevar").getContext("2d")).Line(getlinegraph("Amount",labels,values),newOpts('','Amount'));
        		
        /* 	if($("#graphRecords").length > 0)
        		{
        		graphRecords = $("#graphRecords").val();
        	
        	var count=0;
        	  var labels = [], values = [];
			
        	  $('#productstocks tbody tr td:nth-child(4)').each( function(){
        			count++;
        			var beforeSplitValue= $(this).text();
        			var afterSplitValue = beforeSplitValue.split(' ');
        			lValue = afterSplitValue[0];
   					 afterSplitValue= lValue.split('-');
   					 lValue = afterSplitValue[2]+'/'+afterSplitValue[1]+'/'+afterSplitValue[0];
   					var cleanLabel = "";
   					for(var i=0;i<10;i++)
   						{
   						if(i != 6 && i != 7)
   						cleanLabel += lValue[i];
   						}
        			
        		 if(count<=graphRecords)
        			 {
         				labels.push( cleanLabel );
          			 }
        		});
        	  
        		count=0;
        		$('#productstocks tbody tr td:nth-child(7)').each( function(){
        			count++;
        			if(count<=graphRecords)
        	   		values.push( $(this).text());       
        			});
        		
              	 new Chart(document.getElementById("pricevar").getContext("2d")).Line(getlinegraph("Amount",labels,values),newOpts('','Amount'));
        		} */ 
        		
        </script>
                
               -->  </section>
                </div>
                
                </body>
</html>