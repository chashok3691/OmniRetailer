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
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<script type="text/javascript">
$(document).ready(function(){
	callCalender('startDate');
	callCalender('endDate');
	
});
</script> 

</head>
<body>



<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
      <div class="box-body table-responsive" style="padding: 10px;">
	      
	      <div class="row" style="padding-left:15px;padding-right:15px;">
                              <div class="col-lg-11" style="background: #eee; width: 88%; padding-top: 7.5px; padding-bottom: 7.5px;">
                  <div class="row" style="padding-bottom: 15px;">
                  <input type="hidden" id="orderworkflow" value="${status}"/>
                     <div class="col-lg1-3 col-lg-3">
                       <div class="col-lg-12" style="">
                        <label><spring:message code="zone.label"/></label>
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZoneForDashboard('outletZone','outletLocation','')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
                         </div>
                </div>
                     <div class="col-lg-3">
                       <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="sales.channel"/></label>
                         <select class="form-control" id="saleschannel" >
                           		<option value=""><spring:message code="ALL.label"/></option>
								<option value="<spring:message code="sales.channel.direct"/>"><spring:message code="sales.channel.direct"/></option>
								<option value="<spring:message code="sales.channel.online"/>"><spring:message code="sales.channel.online"/></option>
								<option value="<spring:message code="sales.channel.mobile"/>"><spring:message code="sales.channel.mobile"/></option>
								<option value="<spring:message code="sales.channel.salesExecutive"/>"><spring:message code="sales.channel.salesExecutive"/></option>
	                       </select>
                         </div>
                      </div>
	               <div class="col-lg-3">
                      
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
                     
                     <div class="col-lg1-3 col-lg-3">
	            
               <div class="col-lg-12" style="">
                 <label><spring:message code="location.label"/></label>
	             <select class="form-control form-group" id="outletLocation" onchange="countersByLocation('outletLocation','counterId');">
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
	        </div>
                     
                     
                <div class="col-lg-3">
                       <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                          <label><spring:message code="status.label"/></label>
		             <select class="form-control form-group" id="OrderStatus" >
		             	<%-- <option value=""  ${OrderStatus== '' ? 'selected' : ''}>ALL</option> --%>
		             	<option value="Ordered" ${OrderStatus== 'Ordered' ? 'selected' : ''}>Ordered</option>
		             	<option value="draft" ${OrderStatus== 'draft' ? 'selected' : ''}>Draft</option>
		            </select> 
                      </div>
                      </div>
                      
                   <div class="col-lg-3">
                      
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
                   <input type="button" style="margin-top:22px;width: 135%;" class="btn bg-olive btn-inline addBtn" onclick="viewPendingCartsReports('0','','pendingCartReport')" value="<spring:message code="search" />" />
                  </div>
                  <div class="row">
                  <a  type="button" style="margin-top:31px;width: 135%;"  class="btn bg-olive btn-inline addBtn" onclick="viewPendingCartsReports('0','Clear','pendingCartReport')"><spring:message code="clearbutton.label"/></a>
                  </div>
                  </div></div>
                
                </div>
	      
	     
	      <div class="row">
                <div class="col-lg-11"></div>
                <div class="col-lg-1 summaryBtn">
                	<img class="summaryImg" src="${pageContext.request.contextPath}/images/summary.png" style="cursor: pointer;display:none;" onclick="" >
                </div>
          </div>
	        	
	        
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
				                       <select class="form-control" id="maxRecords" style="padding: 3px 4px;margin-top: 22px;s" onchange="viewPendingCartsReports('0','','pendingCartReport');">
				                      		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
				                      		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
				                      		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
				                     		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
				                      	</select>
				                      
				                      </div>
				                      <div class="col-lg-9" style="margin-top: 20px;width: 81%;padding-left: 0px;">
				                      <div class="wrapper">
				                      	 <input type="text"  class="form-control" style=""  id="searchCart" placeholder="Search for cart items"  value="${searchCriteria}"/>
											<button id="mySearch" class="searchbutton" onclick="viewPendingCartsReports('0','','pendingCartReport');"></button>
										
				                    </div>    
				                      </div>
				                       <div class="col-lg-1"></div>
				                      
				                       <div class="col-lg-1" style="text-align: center;margin-top: 17px;padding-left: 0px;margin-left:15px">
		   <input type="button" class="addBtn btn bg-olive btn-inline" onclick="viewPendingCartsReports(0,'save','')" style="font-size: 16px;" value="<spring:message code="save.label" />" />
		 </div>
				                    </div>
				                  
				                   <input type="hidden" id="stockdownloadurl" value="${downloadurl}">
				                  
				                    <div style="overflow: auto;">
                                    <table id="productstocks" class="table table-bordered table-striped">
                                     <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>                                            	
                                                <th><spring:message code="sl.no.label" /></th>                                                
                                                 <th>Cart ID</th> 
                                                 <th>Date</th>
                                            	<th>Location</th>
                                            	<th>Phone Number</th>
                                            	<th>User Name</th>
                                            	<th>No of Items</th>
                                            	<th>Cart Value</th>
                                            	<th>Status</th>
                                            	<th>Action</th>
                                                                                              
                                            </tr>
                                        </thead>
                                       <tbody>
                                           <c:forEach var="cart" items="${cartList}" varStatus="theCount">
                                          
                                        	 <tr style="border-bottom: 2px solid #ccc;text-align: center;">
                                        	 
                                        	    <td>${theCount.count+index-1}</td>
                                        	 	<td>${cart.cartId}</td>
                                            	<td >${cart.dateTimeStr}</td>
                                            	<td>${cart.location}</td>
                                            	<td>${cart.userId}</td>
                                            	<td>${cart.userId}</td>
                                            	<td>${cart.totalItems}</td>
                                            	<td>${cart.totalCost}</td>
                                            	<td>${cart.status}</td>
                                                <td><a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewCartDetails('${cart.cartId}','view')"><spring:message code="view.label"/></a></td>
                                        	 </tr>                                                                           
                                           </c:forEach>
                                           
                                        </tbody>
                                    </table></div>
                                    
                                    
                                    
                                                                      
                                    <input type="hidden" id="stockdownloadurl" value="${downloadurl}">
                                    <input type="hidden" id="totalnum" value="${totalRecords}">
             <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords > maxRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
	              		<input type="button" class='paginationButton' value="&#60;" onclick="viewPendingCartsReports('${index - (maxRecords + 1)}','','pendingCartReport')"> ${index} - ${totalValue} of ${totalRecords} 
	              		<input type="button" class='paginationButton' value="&#62;" onclick="viewPendingCartsReports('${totalValue}','')">
	              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
			              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewPendingCartsReports('${index - (maxRecords + 1)}','');"> ${index} - ${totalValue} of ${totalRecords} 
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
	              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewPendingCartsReports('${index - (maxRecords + 1)}','','pendingCartReport');"> ${index} - ${totalValue} of ${totalRecords} .
	              		<input type="button" class='paginationButton' value="&#62;" onclick="viewPendingCartsReports('${totalValue}','')">
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
              		  <input type="button" onclick="viewPendingCartsReports(document.getElementById('pagination').value,'','pendingCartReport')" class="btn bg-olive btn-inline  addBtn" value="GO">
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