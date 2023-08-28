<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Surya.k
 * file name		        : Reports/PromotionReport/itemWiseReport.jsp
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
        	<script type="text/javascript" src="${pageContext.request.contextPath}/js/d3pie.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/d3pie.js"></script>	
	<script src="${pageContext.request.contextPath}/js/d3.min.js"></script>
       <script src="${pageContext.request.contextPath}/js/plugins/chartjs/ChartNew.js" type="text/javascript"></script>
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/order.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/outletReports/PromotionReports.js"></script>
        
<style type="text/css">
@media only screen and (max-width:767px){
.table-responsive{
 overflow:hidden;
}
}
@media only screen and (max-width:1080px)  {

   .table.dataTable {
         width: 100%; 
       
        margin-bottom: 15px;
        overflow-x: auto;
        overflow-y: hidden;
        -webkit-overflow-scrolling: touch;
        -ms-overflow-style: -ms-autohiding-scrollbar;
        border: 1px solid #DDD;
       
    display: inline-block;
    white-space: nowrap;
    
  }
  }
.buttons {
	float: right;
	padding-top: 0px;
	/* margin-right: 2%;
	margin-top:1%; */
}
a.button, .list a.button {
	position:relative;
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 5px 10px 5px 10px;
	background: #3c8dbc;
	border-radius: 5px;
	/* box-shadow:1px 0px 2px #000; */
	cursor:pointer;
	behavior : url(css/PIE.htc); 
}

table.dataTable {
    clear: both;
    margin-top: 3px !important;
    margin-bottom: 6px !important;
    max-width: none !important;
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
		margin-top: 9px;
	}
}
@media (min-width: 1200px){
	.summaryImg{
	    width: 50%;
    float: right;
    margin-right: 5%;
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
<!-- <script type="text/javascript">
$(document).ready(function(){
	callCalender('from');
	callCalender('to');
var err = $("#err").val();
//if(err != "")
  //alert(err);
  
  $(".active-menu").removeClass("active-menu");
	     var status = $("#orderworkflow").val();
	     status = status+"SalesOrderManagement";
	     $("#"+status).addClass("active-menu");
  
$("#searchOrders").val($("#ordersSearch").val());
	$("#searchOrders").focus();
	
	$('#searchOrders').on('input',function(e){
		if($(this).val().trim()==""){
			searchOrders('','','0');
		}
	});
	
	
	 $('#mySearch').click(function(){
	        var search = $('#searchOrders').val();
	        return searchOrders(search,'','0');
	    })
	    $('#searchOrders').keypress(function(e){
	    
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
	
	
	// added to fetch locations based on zone 
	
	var zone = $("#outletLocation").val();
	var flowUnder = $("#flowUnder").val();
	
	
	if( zone != null && zone !="" && flowUnder==  'outlet')
		searchlocationsBasedOnZoneForDashboard('outletZone','location','');
	else
		searchlocationsBasedOnZoneForDashboard('outletZone','location','warehouse');

	
});
</script> -->
<script type="text/javascript">
$(document).ready(function(){
	callCalender('startDate');
	callCalender('endDate');
	
});
</script> 

</head>
<body>


 <!-- Content Header (Page header) -->
	<%-- <section class="content-header">
				<h1><spring:message code="outlet.management.label" />
     				<small><spring:message code="customer.label" /> <spring:message code="orders.label" /></small>
    			</h1>
                 <ol class="breadcrumb">
                    <li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
                        <li class="active"><spring:message code="outlet.management.label"/></li>
                    </ol>
                </section> --%>
<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
      <div class="box-body table-responsive" style="padding: 35px;">
	      
	      <div class="row" style="padding-left:15px;padding-right:15px;">
                              <div class="col-lg-11" style="background: #eee; width: 88%; padding-top: 7.5px; padding-bottom: 7.5px;">
                  <div class="row" style="padding-bottom: 15px;">
                  <input type="hidden" id="orderworkflow" value="${status}"/>
                         <div class="col-lg-3">
                       <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="zone.label"/></label>
                        <c:choose>
                        <c:when test="${flowUnder == 'outlet' }">
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZoneForDashboard('outletZone','location','')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
	                        </c:when>
	                        <c:otherwise>
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZoneForDashboard('outletZone','location','warehouse')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
	                        </c:otherwise>
	                        </c:choose>
                         </div>
                      </div>

                         <div class="col-lg-3">
                          <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                            <label><spring:message code="Promotion.Name" /></label>
                              <select  style="opacity: 1.5;background-color:white" class="form-control" name="status" id="promotion_name">
                                      <option value="" >ALL</option>
                                       <c:forEach var="promotion" items="${lst_offers}">
										<option value="${promotion.offerName}" ${promotion.offerName == promotionName ? 'selected' : ''} id="${promotion.offerName}" >${promotion.offerName}</option>
									</c:forEach>
                                      
                               </select>
 	                 </div>
	            </div>
	            
	               <div class="col-lg-3">
                       <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;display:none;" >
                           <label><spring:message code="order.value.start.label"/></label>
                             <%--  <fmt:formatNumber var="formattedBillableTime" type="number"  value="${orderDetails.orderStartValue}" /> --%>
                           <input type="text" class="form-control" name="orderStartValue" id="orderStartValue"  oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"  value="${orderStartValue}" placeholder="Enter Order Value Start" />
                       </div>
                   </div>
	            
	            
	            
	           <div class="col-lg-3">
              <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                 			 <input type="hidden" id="type" value="${type}">
							                 <input type="hidden" id="sd" value="${startdateSt}">
						                     <input type="hidden" id="ed" value="${endDateSt}">
						            <label><spring:message code="offer_start_date.label"/></label>
						                    <input class="form-control calendar_icon"  value="${startdateSt}" style="background-color: white;" autocomplete="off" id="startDate" size="20" type="text" readOnly="readOnly" onfocus="callCalender('startDate')" onclick="callCalender('startDate')" placeholder="DD/MM/YYYY" />
	              </div>
	            </div>
	           
                    </div>
                     <div class="row">
                       <div class="col-lg-3">
                       <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                          <label><spring:message code="location.label"/></label>
		             <select class="form-control form-group" id="location" >
		             	<option value="">ALL</option>
		                <c:forEach var="location" items="${locationsList}">
							<option value="${location.locationId}" ${location.locationId == loc ? 'selected' : ''} id="${location.locationId}" >${location.locationId}</option>
						</c:forEach>
		            </select> 
                      </div>
                      </div>

		               <div class="col-lg-3">

                      </div>
                      
                      
                   <div class="col-lg-3">
                       <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;display:none;">
                           <label><spring:message code="order.value.end.label"/></label>
                          <input type="text" class="form-control"  name="orderEndValue" value="${orderEndValue}" id="orderEndValue" oninput="this.value = this.value.replace(/[^0-9.]/g, '');" placeholder="Enter Order Value End"/>
                      </div>
                   </div>
                      
                      
                  <div class="col-lg-3">
	               <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
	                  <label><spring:message code="offer_end_date.label"/></label>
						      <input class="form-control  calendar_icon"  value="${endDateSt}" style="background-color: white;" autocomplete="off" id="endDate" size="20" type="text" onfocus="callCalender('endDate')" onclick="callCalender('endDate')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div>
		          
		          
                    </div>
                  </div>
                  <div class="col-lg-1" style="padding-right:15px;border-right: 1px solid #ccc;padding-top: 7px;padding-bottom: 22px;width: 12%;padding: 10px 15px;background: #ccc;height: 140px;">
                  <div class="col-lg-9" style="">
                  <div class="row">
                  
                   <input type="hidden" id="type" value="${type}">
                       <%--  <input type="button"  class="buttonsearch" onclick="searchOrders('','','0')" value="<spring:message code="search" />" /> --%>
                        <%-- <a onclick="searchOrders('','','0')" class="buttonsearch"><spring:message code="search"/></a> --%>
                   <input type="button" style="margin-top:22px;width: 135%;" class="btn bg-olive btn-inline addBtn" onclick="viewItemWisePromotionSales(0,'')" value="<spring:message code="search" />" />
                  </div>
                  <div class="row">
                  <a  type="button" style="margin-top:31px;width: 135%;"  class="btn bg-olive btn-inline addBtn" onclick="viewItemWisePromotionSales(0,'')"><spring:message code="clearbutton.label"/></a>
                  </div>
                  </div></div>
                
                </div>
	      
	     
	      <div class="row">
                <div class="col-lg-11"></div>
                <div class="col-lg-1 summaryBtn">
                	<img class="summaryImg" src="${pageContext.request.contextPath}/images/summary.png" style="cursor: pointer;display:none;" onclick="getOrderSummary();" >
                </div>
          </div>
	        		<%--  <c:if test="${type != 'management' }">
	        		  <div class="row">
				      <div class="col-lg-1 col-xs-2" style="margin-top: 10px;">
			                <select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="searchOrders('','','0');">
			               		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
			               		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
			               		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
			              		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
			               	</select>
			           </div>
       					<div class="col-lg-11 col-xs-10">
		        	 		 <input type="text"  class="form-control searchItems"  value="" id="searchOrders" placeholder="<spring:message code="search.orders.label" />"style="margin-top: 10px;    width: ;margin-left:;height:30PX;text-align: center;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
								<div class="services">
					    			<div class="items">
					     				<ul class="matchedStringUl searchOrders" style=""></ul>
					   				</div>
								</div>
								<input type="hidden" id="ordersSearch" value="${searchName}">
		        	 	</div>
		        	 	</div>
		        	 </c:if> --%>
	        <%-- <c:if test="${type == 'management' }"> --%>
	        
<div id="Error" class="Error" style="margin-top:-40px;text-align:center;color:red;font-weight:bold;">${err}</div>
  <div id="Success" class="Error" style="margin-top:-40px;text-align:center;color:blue;font-weight:bold;">${success}</div>
	        
	        
	      <div class="row">
	
		</div>
<div class="nav-tabs-custom">
 <ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#home" style="text-transform: capitalize;">${criteria} Shift Report</a></li>
  <li><a data-toggle="tab" onclick="" href="#menu1">Graphical Report</a></li>
</ul>
<div class="tab-content">
  <div id="home" class="tab-pane fade in active">
				                    <div class="row">
				                      
				                       <div class="col-lg-1">
				                      
				                      </div>
				                      <div class="col-lg-6">
				                       <%-- <div class="row">
				                         <div class="col-lg-4" style="text-align:right;top:5px;">
				                           <label><spring:message code="outletlocation.label"/></label>
				                         </div>
				                         <div class="col-lg-7">
				                           <select class="form-control" id="outletLocation" onchange="viewBills('','0');">
 				                             <c:forEach var="location" items="${locationsList}">
												<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option>
											 </c:forEach>
                                         </select>
				                         </div>
				                      </div> --%>
				                      </div>
				                      <div class="col-lg-4"></div>
				                       <div class="col-lg-1" style="text-align: center;margin-top: 17px;padding-left: 0px;">
		   <input type="button" class="addBtn btn bg-olive btn-inline" onclick="viewItemWisePromotionSales(0,'save')" style="font-size: 16px;" value="<spring:message code="save.label" />" />
		 </div>
				                    </div>
				                  
				                   <input type="hidden" id="stockdownloadurl" value="${downloadurl}">
				                  
				                    <div style="overflow: auto;">
                                    <table id="productstocks" class="table table-bordered table-striped">
                                     <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>                                            	
                                                <th><spring:message code="sl.no.label" /></th>                                                
                                                 <th><spring:message code="location.label" /></th> 
                                                 <th><spring:message code="counter_date.label" /></th>
                                            	<th>Counter</th>
                                            	<th>Bill ID</th>
                                            	<th>SKU ID</th>
                                                <th>SKU Description</th>
                                                <th>Sold Qty</th>
                                                 <th>MRP</th>
                                                  <th>Promotion ID</th>
                                                  <th>Promotion Name</th>
                                                <th>Discount Amt</th>
                                                <th><spring:message code="cost.price.label" /></th>   
                                                <th>Sale Price</th>                                               
                                            </tr>
                                        </thead>
                                       
                                           <c:forEach var="salesReport" items="${salesReportList}" varStatus="theCount">
                                          
                                        	 <tr style="border-bottom: 2px solid #ccc;">
                                        	 
                                        	    <td>${theCount.count+index-1}</td>
                                        	 	<td>${salesReport.storeLocation}</td>
                                            	<td style="white-space: nowrap;">${salesReport.promotionDateStr}</td>
                                            	<td>${salesReport.counter}</td>
                                            	<td style="white-space: nowrap;">${salesReport.serialBillId}</td>
                                                <td style="white-space: nowrap;">${salesReport.skuId}</td>
                                                <td style="white-space: nowrap;">${salesReport.itemName}</td>                                           
                                                <td>${salesReport.soldQty}</td>
                                                <td>${salesReport.mrp}</td>
                                                <td>${salesReport.discountId}</td>
                                                 <td style="white-space: nowrap;">${salesReport.promotionName}</td>
                                                 <td>${salesReport.discountPrice}</td>                                           
                                                <td>0</td>
                                                <td>${salesReport.itemPrice}</td>
                                                
                                        	 </tr>                                                                           
                                           </c:forEach>
                                           
                                        </tbody>
                                    </table></div>
                                    
                                    
                                    
                                                                      
                                    <input type="hidden" id="stockdownloadurl" value="${downloadurl}">
                                    <input type="hidden" id="totalnum" value="${totalRecords}">
             <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords > maxRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
	              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
	              		<input type="button" class='paginationButton' value="&#62;" onclick="viewItemWisePromotionSales('${totalValue}','')">
	              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
			              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewItemWisePromotionSales('${index - (maxRecords + 1)}','');"> ${index} - ${totalValue} of ${totalRecords} 
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
	              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewItemWisePromotionSales('${index - (maxRecords + 1)}','');"> ${index} - ${totalValue} of ${totalRecords} .
	              		<input type="button" class='paginationButton' value="&#62;" onclick="viewItemWisePromotionSales('${totalValue}','')">
	              	</div> 
              	</c:if>
              	
              	<div class="col-lg-6" style="text-align: right;"> 
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
              		  <input type="button" onclick="viewItemWisePromotionSales(document.getElementById('pagination').value,'')" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
              		</div>
              	
              	
              </div>  </div>  
              
  <div id="menu1" class="tab-pane fade in ">
 <h3 style="text-transform: capitalize;">${criteria} Wise Graphical Report</h3>
 <canvas id="pricevar" height="400 !important;" width="1020  !important;"></canvas>
                              
                              </div>
  </div></div>            
               
             </div><!-- /.box-body -->
         </div><!-- /.box -->
</div>
</div>
</section>
		 <script src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function() {
                $("#productstocks").dataTable({
       			  "bPaginate": false,
                  "bLengthChange": false,
                  "bFilter": false,
                  "bSort": false,
                  "bInfo": false,
                  "bAutoWidth": false
    			});
                 });
        </script>
        
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="order_id.label" />"/>
        <input type="hidden" id="status" value="${status}"/>
        <input type="hidden" id="location" value="${selectedLocation}"/>
</body>
</html>