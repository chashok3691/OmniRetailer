
<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Vijay
 * file name		        : Reports/OutletReports/outletSalesReports/NewReport.jsp
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
        <script src="${pageContext.request.contextPath}/js/outletReports/reports.js"></script>  
        
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
        
<style type="text/css">
.iospopupp {
   	width: 29%!important;
    margin-left: 45%;
    margin-top: 0%;
    border-radius: 2;
    border-radius: 12px;
	
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

.col-lg1-2{
width:25% !important;
}
</style>  
<script type="text/javascript">
$(document).ready(function(){
	
	
	/* $('#mySearch').click(function(){
        var search = $('#searchPrices').val();
        return viewOutletPriceChangeReport('outletPriceChangeReport','0',search,'','');
    }) */
    $('#searchPrices').keypress(function(e){
        if(e.which == 13){//Enter key pressed
            $('#mySearch').click();//Trigger search button click event
        }
    });
	
	callCalender('startDateOverride');
	callCalender('endDateOverride');
/* 	
	 var zone = $("#outletZone").val();
	 if( zone != null && zone !="")
		 {
		 	searchlocationsBasedOnZoneForDashboard('outletZone','outletLocation','');
		 } */
});



</script>
</head>
<body>
<div id="override">
<!-- Main content -->

				<section class="content-header">
                    <label style="width:100%;text-align: center;"><label style="border:1px solid gray;border-radius: 5px;padding: 5px;padding-left: 20px;padding-right: 20px;font-size: 18px;">Standard Sales Detailed Report</label></label>
                  
                </section>
<section class="content">
<div class="row">
  <div class="col-lg-12">
	<div class="box box-primary">
       <div class="box-body">
   <div class="col-lg-12" >

                   <div class="col-lg-11" style=" background: #f4f4f4;    padding: 8px 20px;    width: 88%;">
                  <div class="row">
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
                      <div class=" col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                    <label>Sales Channel</label>
	             	<select class="form-control form-group" id="salesChannel" style=" padding-left: 5px !important;" onchange="">
                    	<option value=""><spring:message code="ALL.label"/></option>
							<option value="<spring:message code="sales.channel.direct"/>" ${selectedSalesChannel == 'Direct' ? 'selected' : ''}><spring:message code="sales.channel.direct"/></option>
							<option value="<spring:message code="sales.channel.online"/>" ${selectedSalesChannel == 'Online' ? 'selected' : ''}><spring:message code="sales.channel.online"/></option>
							<option value="<spring:message code="sales.channel.mobile"/>" ${selectedSalesChannel == 'Mobile' ? 'selected' : ''}><spring:message code="sales.channel.mobile"/></option>
							<option value="<spring:message code="sales.channel.salesExecutive"/>" ${selectedSalesChannel == 'Sales Executive' ? 'selected' : ''}><spring:message code="sales.channel.salesExecutive"/></option>
                 	</select>
                      </div>
                      </div>
                     
                  <div class="col-lg-2">
					<%-- <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
					 <label>Sales Channel</label>
					 <select class="form-control form-group" id="salesChannel" style=" padding-left: 5px !important;" onchange="">
							<option value=""><spring:message code="ALL.label"/></option>
								<option value="<spring:message code="sales.channel.direct"/>"><spring:message code="sales.channel.direct"/></option>
								<option value="<spring:message code="sales.channel.online"/>"><spring:message code="sales.channel.online"/></option>
								<option value="<spring:message code="sales.channel.mobile"/>"><spring:message code="sales.channel.mobile"/></option>
								<option value="<spring:message code="sales.channel.salesExecutive"/>"><spring:message code="sales.channel.salesExecutive"/></option>
					 </select>
					 </div> --%>
					 </div>
                       
                         <div class="col-lg1-2 col-lg-2">
              <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
                 		<label><spring:message code="offer_start_date.label"/></label>
                	 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${startdate}" style="background-color: white;" id="startDateOverride" size="20" type="text" onfocus="callCalender('startDateOverride')" onclick="callCalender('startDateOverride')" placeholder="DD/MM/YYYY" />
	              </div>
	            </div>
	           
                    </div>
                     <div class="row">
                       <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="location.label"/></label>
                           <select class="form-control" id="outletLocation" onchange="searchCategorybasedonlocation('outletLocation','outletCategory','outletBrandId');">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="location" items="${locationsList}">
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
                   
                       <div class=" col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label>Tenders</label>
                          <select class="form-control" id="TenderName" >
                           		 <option value=""><spring:message code="ALL.label"/></option> 
	                             <c:forEach var="tender" items="${tenderDetails}">
	                             <c:if test="${tender.onlineTender == true}">
									<option value="${tender.modeOfPayment}" ${selectedTender == tender.modeOfPayment ? 'selected' : ''}>${tender.tenderName}</option>
						 		</c:if>
						 		</c:forEach> 
	                        </select>
                      </div>
                      </div>
                      
                     <div class="col-lg-2">
					 </div>
                      <div class="col-lg1-2 col-lg-2">
	               <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="offer_end_date.label"/></label>
	                 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${enddate}" style="background-color: white;" id="endDateOverride" size="20" type="text" onfocus="callCalender('endDateOverride')" onclick="callCalender('endDateOverride')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div>
                    </div>
                  </div>
                  <div class="col-lg-1" style="    width: 12%;    background: #ccc;">
                  <div class="col-lg-12" style="    border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">
                  <div class="row">
                 <a onclick="viewStandardSalesDetailedReport('standardSalesDetailedReport','0','','','${flowLocation}')" class="button"><spring:message code="searchbutton.label"/></a>
                  </div>
                  <div class="row">
                  <a onclick="viewStandardSalesDetailedReport('standardSalesDetailedReport','0','','clear','${flowLocation}')" class="button"><spring:message code="clearbutton.label"/></a>
                  </div>
                  </div></div> 
                  <div class="col-lg-12">
                  <br>
                  </div>
 
 <br><br>
	     </div>
           <div class="col-lg-12">
                  <br>
                  </div>
                  
          
				                    <div class="row">
				                       <div class="col-lg-1 col-xs-2">
				                      	<%-- <select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="('outletNewReport','0','','');">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select> --%>
				                      </div> 
				                     <div class="col-lg-10 col-xs-10 " style="    padding-left: 0px;">
				                     <%-- <div class="wrapper">
				                      	 <input type="text"  class="form-control" style="" value="${searchName}" id="searchPrices" placeholder="<spring:message code="search.items.here.label" />" />
											<button id="mySearch" class="searchbutton"></button>
											<!-- <div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl searchBills" style=""></ul>
								   				</div>
											</div> -->
										<input type="hidden" id="bill" value="${searchName}">
				                    </div> --%></div>
				                    <div class="col-lg-1" style="text-align: center;">
		   <input type="button" class="addBtn btn bg-olive btn-inline" onclick="viewStandardSalesDetailedReport('standardSalesDetailedReport','0','save','','${flowLocation}')"  style="font-size: 16px;" value="<spring:message code="save.label" />" />
		 </div> 
				                  </div>
				                    <div style="overflow: auto;white-space: nowrap;">
                                    <table id="StandardSalesDetailed" class="table table-bordered table-striped">
                                     <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            		
                                                <th><spring:message code="sl.no.label"/></th>
                                                <th>Date</th> 
                                            	<th>Store ID</th> 
                                            	<th>Store Description</th>
                                                <th>Order Ref</th>
                                                <th>Bill Id</th>
                                                <th>Yearly Bill Id</th> 
                                                <th>Serial Bill ID</th>
                                                 <th>Line No</th>
                                                <th>SKU</th>
                                                <th>HSN No</th>
                                                <th>Qty</th>
                                                <th>Discount</th>
                                                <th>Sale Price</th>
                                                <th>Tax % </th>
                                                <th>Tax Value</th>
                                                <th>Store State</th>
                                                <th>Shipped State</th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                             <c:forEach var="items" items="${StandardSalesList}" varStatus="theCount">
                                        	 <tr>
                                        	 	<td>${theCount.index+index}</td>
                                        	    <td>${items.billingDateStr}</td>
                                        	    <td>${items.storeLocation}</td>
                                        	 	<td>${items.storeDescription}</td>
                                        	 	<td>${items.orderRef}</td>
                                        	 	<td>${items.billId}</td>
                                        	 	<td>${items.serailBillIdYearly}</td>
                                        	 	<td>${items.serialBillId}</td>
                                        	 	<td>${items.lineNumber}</td>
                                        	 	<td>${items.skuId}</td>
                                        	 	<td>${items.hsnCode}</td>
                                        	 	<td>${items.totalQuantity}</td>
                                        	 	<td>${items.discount}</td>
                                        	 	 <td>${items.totalSoldValue}</td>
                                        	 	<td>${items.taxRate}</td>
                                        	 	<td>${items.taxValue}</td>
                                        	 	<td>${items.storeState}</td>
                                        	 	<td>${items.customerDeliveryState}</td>
                                        	 	
                                            </tr>
                                           </c:forEach> 
                                        </tbody>
                                    </table>
                                    </div>
              <div class="row">
               <input type="hidden" id="flowUnder" value="${flowUnder}">
               <input type="hidden" id="totalnum" value="${totalRecords}">
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewStandardSalesDetailedReport('standardSalesDetailedReport','${totalValue}','','','${flowLocation}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="viewStandardSalesDetailedReport('standardSalesDetailedReport','${index - 11}','','','${flowLocation}');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="viewStandardSalesDetailedReport('standardSalesDetailedReport','${index - 11}','','','${flowLocation}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewStandardSalesDetailedReport('standardSalesDetailedReport','${totalValue}','','','${flowLocation}')">
              	</div> 
              	</c:if>
               
                     
                   	<div class="col-lg-6" style="float:right;">
              	<div class="col-lg-8" style="text-align: right;padding-right: 0px;margin-top: 2px;font-size: 16px;"><spring:message code="pages.label" /></div>
              	<div class="col-lg-2" style="padding-right: 0px;">
              		<select class="form-control" id="pagination">
              		<c:set var="totalRecords" value="${totalRecords}"></c:set>
              	<c:forEach var="i" begin="0" end="${totalRecords}">
              	<c:if test="${(totalRecords)>0}">
              		<option value="${(i*maxRecords)}" ${index-1 == i*maxRecords ? 'selected' : ''}> ${i+1}</option>
              		<c:set var="totalRecords" value="${totalRecords-maxRecords}"></c:set>
              	</c:if>
				</c:forEach>
					</select>
              	
              	</div>
              		<div class="col-lg-2" style="padding-right: 0px;">
              		  <input type="button" onclick="viewStandardSalesDetailedReport('standardSalesDetailedReport',document.getElementById('pagination').value,'','','${flowLocation}')" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
             
				</div>
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
														onclick="('outletNewReport','0','','')"
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

    <div id="triggerEvent"></div>
                           
                           
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
 <input type="button" class="iosclosebutton1" onclick=""  value="Ok">
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
    
    
                           
                           
                           
    <!-- COMPOSE MESSAGE MODAL -->
    
    <div class="col-sm-12 col-lg-12 col-xs-12">
            
         <div class="modal fade popup-display" id="items-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
             <div class="col-sm-2 col-lg-2 col-xs-0">
    		</div>
           <div class="col-sm-10 col-lg-10 col-xs-12">
             <div class="modal-content billsPopUp" style="">
          <!--    <i class="fa fa-angle-up billsPopUpUpArrow" aria-hidden="true"></i> -->
                 <div class="modal-header" style="border-bottom-color: #fff !important;">
                        <button type="button" class="close" style="font-size: 30px;" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" style="text-align: center;" ><spring:message code="procurementvsconsumption.label" /><h4>
                    </div>
             <form action="#" method="post">
                 <div class="modal-body">
                  <div class="box-body table-responsive" id="summary">
                <%--   <canvas id="stocksLineChart" height="350 !important;" width="600  !important;"></canvas> --%>
                 </div>
              </div>
             </form> 
             </div><!-- /.modal-content -->
         </div><!-- /.modal-dialog -->
     </div><!-- /.modal -->
 	</div>
  </div>
              
 	</div>
  </div>
 

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


