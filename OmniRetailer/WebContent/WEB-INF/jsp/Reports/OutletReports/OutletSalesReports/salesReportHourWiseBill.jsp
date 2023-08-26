
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
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
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


</style>  
<script type="text/javascript">
$(document).ready(function(){
	callCalender('startDateBill');
	callCalender('endDateBill');
	
	var starttime = $("#starttimeValue").val();
	$("#startTime").val(starttime);
	var endtime = $("#endtimeValue").val();
	$("#endTime").val(endtime);
	/* $("#hourwiseBill").val($("#stock").val());
	$("#hourwiseBill").focus(); 
	
	 $('#creditNoteSearch').click(function(){
	        var search = $('#hourwiseBill').val();
	        return viewSalesHourWiseBillReport('salesReporthourWisebill','0','');
	    })
	    $('#hourwiseBill').keypress(function(e){
	        if(e.which == 13){//Enter key pressed
	            $('#creditNoteSearch').click();//Trigger search button click event
	        }
	    }); */
	
	
	    var zone = $("#outletZone").val();
		 if( zone != null && zone !="")
			 {
			 	searchlocationsBasedOnZoneForDashboard('outletZone','location','${flowLocation}');
			 }
	
	
	
});



</script>
</head>
<body>
<div class="hourbill">
<!-- Main content -->

				<section class="content-header">
                    <h1>
                       <c:if test = "${flowLocation ==''}">
                       <spring:message code="outlet_management.reports.label"/>
                       </c:if>
                       <c:if test = "${flowLocation !=''}">
                      <spring:message code="warehouse_management.reports.label"/> 
                      </c:if>&nbsp;<spring:message code="sales.reports.label"/>&nbsp;&#45;&nbsp;Hour Wise Bill Report
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
                 		<label><spring:message code="offer_start_date.label"/></label>
                	 	<input class="form-control calendar_icon form-group dateClear" readonly="readonly" value="${startdate}" style="background-color: white;" id="startDateBill" size="20" type="text" onfocus="callCalender('startDateBill')" onclick="callCalender('startDateBill')" placeholder="DD/MM/YYYY" />
	              </div>
	            </div>
	            
	            
	             <div class="form-group col-lg-2">
                                            <div class="bootstrap-timepicker">
                                            <label><spring:message code="start.time.label"/></label>
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="start_time" value="00:00:00" id="startTime"/>
                                                <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
                                            </div><!-- /.input group -->
                                        </div><!-- /.form group -->
                                         </div>
	            <input type="hidden" id="starttimeValue" value="${startTime}">
	            <input type="hidden" id="endtimeValue" value="${endTime}">
	          
	           <div class=" form-group col-lg-4"></div>
	           
	                <div class="col-lg1-2 col-lg-2" style="background: #ccc;">
	               <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                  <a onclick="viewSalesHourWiseBillReport('salesReporthourWisebill','0','','${flowLocation}')" class="button"><spring:message code="searchbutton.label"/></a>
                  </div>
                 
                   </div></div>
	           <div class="row">
                   
                     
                       <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="location.label"/></label>
                           <select class="form-control" id="location" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="location" items="${locationsList}">
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
	                   <label><spring:message code="offer_end_date.label"/></label>
	                 	<input class="form-control calendar_icon form-group dateClear" readonly="readonly" value="${enddate}" style="background-color: white;" id="endDateBill" size="20" type="text" onfocus="callCalender('endDateBill')" onclick="callCalender('endDateBill')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div>
		          
		          <div class="form-group col-lg-2">
                                            <div class="bootstrap-timepicker">
                                            <label><spring:message code="end.time.label"/></label>
                                            <div class="input-group">                                            
                                                <input type="text" class="form-control timepicker" name="end_time" value="22:00:00" id="endTime"/>
                                                <div class="input-group-addon">
                                                    <i class="fa fa-clock-o"></i>
                                                </div>
                                            </div><!-- /.input group -->
                                        </div><!-- /.form group -->
                                      
                                         </div>
		          <div class=" form-group col-lg-4"></div>
		          
		          
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
				                      	<select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewSalesHourWiseBillReport('salesReporthourWisebill','0','','${flowLocation}');">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      </div>
				                     <div class="col-lg-10 col-xs-10 " style="padding-left: 0px;">
				                    <%--  <div class="wrapper">
				                      	 <input type="text"  class="form-control" style="" value="${searchName}" id="hourwiseBill" placeholder="Search" />
											<button id="creditNoteSearch" class="searchbutton"></button>
											<!-- <div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl searchBills" style=""></ul>
								   				</div>
											</div> -->
										<input type="hidden" id="stock" value="${searchName}">
				                    </div> --%></div>
				                  <%--   <div class="col-lg-1" style="">
                     <input type="button" class="btn bg-olive btn-inline  addBtn" onclick="viewItemWiseTaxGSTReport('save','0');" value="SAVE"/>
                         <input type="hidden" id="stockdownloadurl" value="${downloadurl}">
                  </div> --%>
                  
                   <div class="col-lg-1" style="padding-left: 4px;">
		   <input type="button" class="addBtn btn bg-olive btn-inline" data-toggle="modal" data-target="#myModalIos"  style="font-size: 16px;" value="<spring:message code="save.label" />" />
		   <input type="hidden" id="stockdownloadurl" value="${downloadurl}">
		 </div>
                  
				                  </div>
				                    <div style="overflow: auto;white-space: nowrap;">
                                    <table id="productstocks" class="table table-bordered table-striped">
                                     <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><spring:message code="sl.no.label" /></th>
                                            	
                                            	<th><spring:message code="location.label" /></th>
                                            	<th><spring:message code="date.label" /></th>
                                            	<th><spring:message code="bill.id.label" /></th>
                                            	<th>Yearly bill Id</th>
                                            	<th><spring:message code="serialbillid.label" /></th>
                                            	<th><spring:message code="skuid.label" /></th>
												<th><spring:message code="department.label" /></th>
                                            	<th><spring:message code="salesman.id.label" /></th>
                                                <th><spring:message code="sold.qty.label" ></spring:message></th>
                                                <%-- <th><spring:message code="return.qty.label" /></th>
                                                <th><spring:message code="exchange.qty.label" /></th>
                                                <th><spring:message code="discount.label" /></th>
                                                <th><spring:message code="manual.discount.label" /></th>
                                                <th><spring:message code="tax_amount.label" /></th> --%>
                                                <th><spring:message code="totalsale.label" /></th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                           <c:forEach var="salesReport" items="${salesReportList}" varStatus="theCount">
                                        	 <tr style="border-bottom: 2px solid #ccc;">
                                        	 <td>${theCount.count+index-1}</td>
                                        	 
                                                <td>${salesReport.storeLocation}</td>
                                                <td>${salesReport.dateStr}</td>
                                                 <td>${salesReport.billId}</td> 
                                                 <td>${salesReport.serailBillIdYearly}</td>                                                 
                                        	     <td>${salesReport.serialBillId}</td>
                                        	    <td>${salesReport.skuId}</td> 
                                                 <td>${salesReport.department}</td>
                                            	<td>${salesReport.employeeSaleId}</td>
                                                <td>${salesReport.soldQty}</td>
                                               <%--  <td>${salesReport.returnedQty}</td>
                                                <td>${salesReport.exchangedQty}</td>
                                                  <td>${salesReport.discount}</td>
                                                <td>${salesReport.manualdiscount}</td>
                                                <td>${salesReport.tax}</td> --%>
                                                <td>${salesReport.totalCost}</td>
                                                
                                            </tr>
                                              <c:set var="dataExists" value="true"></c:set>
                                           </c:forEach>
                                           
                                        
                                        
                                        
                                        <c:if test="${dataExists == 'true'}">
                                           	<tr>
                                           	        <c:set var="soldQty" value="0"  />
                                           	        <c:set var="whQty" value="0"  />
                                           	         <c:set var="returnedQty" value="0"  />
                                           	         <c:set var="exchangedQty" value="0"  />
                                           	      <c:set var="totalCost" value="0"  />
                                           	       <c:set var="itemUnitPrice" value="0"  />
                                           	         <c:set var="discountPrice" value="0"  />
                                           	           <c:set var="campaignPrice" value="0"  />
                                           	             <c:set var="taxAmount" value="0"  />
                                           	      
                                           	 <c:forEach var="salesReport" items="${salesReportList}" >
                                           	 <c:set var="itemUnitPrice" value="${itemUnitPrice+((salesReport.itemUnitPrice))}" scope="page" />
                                           	 <c:set var="soldQty" value="${soldQty+((salesReport.soldQty))}" scope="page" />
                                           	 <c:set var="returnedQty" value="${returnedQty+((salesReport.returnedQty))}" scope="page" />
                                           	 <c:set var="exchangedQty" value="${exchangedQty+((salesReport.exchangedQty))}" scope="page" />
                                           	 <c:set var="totalCost" value="${totalCost+((salesReport.totalCost))}" scope="page" />
                                           	  <c:set var="discountPrice" value="${discountPrice+((salesReport.discount))}" scope="page" />
                                           	   <c:set var="campaignPrice" value="${campaignPrice+((salesReport.manualdiscount))}" scope="page" />
                                           	    <c:set var="taxAmount" value="${taxAmount+((salesReport.tax))}" scope="page" />
                                           	      <c:set var="whQty" value="${whQty+((salesReport.weighedSaleQty))}" scope="page" />
                                           	 </c:forEach>
                                              	<td></td>
                                              	<td></td>	
                                              	<td></td>
                                              	<td></td>	
                                              	<td></td>
                                              	<td></td>
                                              	<td></td>
                                              		<td></td>
<!--                                               	<td></td> -->
                             <td style="padding:3px;width: 160px;"><div style="white-space: nowrap;padding: 5px;background: #727272;"><font color="white"><spring:message code="totals.label" /></font></div></td>
                                            	<fmt:formatNumber var="soldQty" type="number" minFractionDigits="2" maxFractionDigits="2" value="${soldQty}" />
                                            	<fmt:formatNumber var="whQty" type="number" minFractionDigits="2" maxFractionDigits="2" value="${whQty}" />
                                            	<fmt:formatNumber var="returnedQty" type="number" minFractionDigits="2" maxFractionDigits="2" value="${returnedQty}" />
                                            	<fmt:formatNumber var="exchangedQty" type="number" minFractionDigits="2" maxFractionDigits="2" value="${exchangedQty}" />
                                            	<fmt:formatNumber var="discountPrice" type="number" minFractionDigits="2" maxFractionDigits="2" value="${discountPrice}" />
                                            	<fmt:formatNumber var="campaignPrice" type="number" minFractionDigits="2" maxFractionDigits="2" value="${campaignPrice}" />
                                            	<fmt:formatNumber var="taxAmount" type="number" minFractionDigits="2" maxFractionDigits="2" value="${taxAmount}" />
                                            	<fmt:formatNumber var="totalCost" type="number" minFractionDigits="2" maxFractionDigits="2" value="${totalCost}" />
                                                <td style="padding:3px;width: 160px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${soldQty}</div></td>
                                               <%--  <td style="padding:3px;width: 160px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${soldQty}</div></td>
                                                <td style="padding:3px;width: 160px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${returnedQty}</div></td>
                                                <td style="padding:3px;width: 160px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${exchangedQty}</div></td>
                                                <td style="padding:3px;width: 160px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${discountPrice}</div></td>
                                            	<td style="padding:3px;width: 160px;"><div  style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${taxAmount}</div></td> --%>
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
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewSalesHourWiseBillReport('salesReporthourWisebill','${totalValue}','false','${flowLocation}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewSalesHourWiseBillReport('salesReporthourWisebill','${index - (maxRecords + 1)}','false','${flowLocation}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewSalesHourWiseBillReport('salesReporthourWisebill','${index - (maxRecords + 1)}','false','${flowLocation}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewSalesHourWiseBillReport('salesReporthourWisebill','${totalValue}','false','${flowLocation}')">
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
              		  <input type="button" onclick="viewSalesHourWiseBillReport('salesReporthourWisebill',document.getElementById('pagination').value,'false','${flowLocation}')" class="btn bg-olive btn-inline  addBtn" value="GO">
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
 <input type="button" class="iosclosebutton1" onclick="viewSalesHourWiseBillReport('salesReporthourWisebill','0','save','${flowLocation}')"  value="Ok">
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/timepicker/bootstrap-timepicker.min.js" ></script>
		<script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function() {
            	$(".timepicker").timepicker({
            	      showInputs: false,
            	      showMeridian:false,
            	      showSeconds:true,
            	      
            	   });
            	
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


