<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Vamsi V
 * file name		        : inventorymanager/Shipments/viewShipmentGatePass.jsp
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
        	 <%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css"> --%>
        	<script type="text/javascript" src="${pageContext.request.contextPath}/js/d3pie.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/d3pie.js"></script>	
	<script src="${pageContext.request.contextPath}/js/d3.min.js"></script>
       <script src="${pageContext.request.contextPath}/js/plugins/chartjs/ChartNew.js" type="text/javascript"></script>
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/order.js"></script>
        
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
		margin-top: -10px;
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
	callCalender('from');
	callCalender('to');
var err = $("#err").val();
//if(err != "")
  //alert(err);
$("#searchOrders").val($("#ordersSearch").val());
	$("#searchOrders").focus();
	
	$('#searchOrders').on('input',function(e){
		if($(this).val().trim()==""){
			viewShipmentGatePass('shipmentgatepass','0');
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
     <div class="box-header">
		<%-- <c:if test="${status == 'Pending'}"> 
			<h3 class="box-title">
				<spring:message code="pending.orders"/> 
			</h3>
		</c:if> 
		<c:if test="${status == 'Draft'}"> 
			<h3 class="box-title">
				<spring:message code="drafts.label"/> 
			</h3>
		</c:if> 
		 <c:if test="${status == 'Ordered'}">
			<h3 class="box-title">
				<spring:message code="submitted.orders" />
			</h3>
		</c:if> 
		<c:if test="${status == 'Confirmed'}">
			<h3 class="box-title">
				<spring:message code="confirmed.label" />
			</h3>
		</c:if> 
		<c:if test="${status == 'Delivered'}">
			<h3 class="box-title">
				<spring:message code="fullfilled.label" />
			</h3>
		</c:if> 
		<c:if test="${status == '' || status =='all'}"> --%>
			<h3 class="box-title">
				${status}
			</h3>
		<%-- </c:if>  --%>
	</div><!-- /.box-header -->
	    <div class="box-body table-responsive">
	      
	        <div class="row">
	        <div class="col-lg-3">
               <div class="row">
                <%--  <div class="col-lg-4 col-xs-4 col-sm-2 col-md-2" style="text-align:left;top:5px;padding-right: 0px;">
                   <label><spring:message code="location.label"/></label>
                 </div> --%>
                 <div class="col-lg-8 col-xs-8 col-sm-10 col-md-10" >
                 <label><spring:message code="location.label"/></label>
	             <select class="form-control form-group" id="location" >
	             	<option value="">ALL</option>
	                <c:forEach var="location" items="${locationsList}">
						<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option>
					</c:forEach>
	            </select>
	           </div>
	        </div>
	        </div>
	        <div class="col-lg-5"></div>
	        
	        
	        <div class="col-lg-3" style="padding-left: 0px;padding-right:0px">
						                <div class="col-lg-6" style="padding-left: 0px;padding-right:15px">
						                  	 <input type="hidden" id="type" value="${type}">
							                 <input type="hidden" id="sd" value="${startDate}">
						                     <input type="hidden" id="ed" value="${endDate}">
						            <label><spring:message code="offer_start_date.label"/></label>
						                    <input class="form-control  calendar_icon" value="${startDate}" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
						               </div>
						                <div class="col-lg-6" style="padding-left: 0px;padding-right:15px">
						                <label><spring:message code="offer_end_date.label"/></label>
						                    <input class="form-control  calendar_icon" value="${endDate}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
						               </div>
						               </div>
	        
	       <%--  <div class="col-lg-2">
              <div class="row">
                	<!-- <div class="col-lg-4 col-xs-4 col-sm-2 col-md-2" style="text-align:right;top:5px;padding-right: 5px;"> -->
	                	<input type="hidden" id="type" value="${type}">
	                    <input type="hidden" id="sd" value="${startDate}">
                     	<input type="hidden" id="ed" value="${endDate}">
	                    
	                 <!-- </div> -->
	                
                	  <div class="col-lg-12 col-xs-8 col-sm-10 col-md-10" >
                	   <label><spring:message code="offer_start_date.label"/></label>
	                    <input class="form-control calendar_icon form-group" readonly="readonly" value="" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
	                  </div>
              </div>
            </div>
            <div class="col-lg-2">
               <div class="row">
                 <div class="col-lg-4 col-xs-4 col-sm-2 col-md-2" style="text-align:right;top:5px;padding-right: 5px;">
                   <label><spring:message code="offer_end_date.label"/></label>
                 </div>
                 <div class="col-lg-12 col-xs-8 col-sm-10 col-md-10">
                  <label><spring:message code="offer_end_date.label"/></label>
	                    <input class="form-control calendar_icon form-group" readonly="readonly" value="" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
	                </div>
	           </div>
	          </div> --%>
           <div class="col-lg-1" style="margin-top: 18px;padding-left: 0px">
            
                    <input type="hidden" id="type" value="${type}">
                        <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="searchGatepass('', '','0')" value="<spring:message code="search" />" />
           </div>
	      </div>
	      <div class="row">
                <div class="col-lg-11"></div>
                <div class="col-lg-1 summaryBtn">
                	<%-- <img class="summaryImg" src="${pageContext.request.contextPath}/images/summary.png" style="cursor: pointer;" onclick="getOrderSummary();" > --%>
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
	      <div class="row">
	      <div class="col-lg-1 col-xs-2" style="margin-top: 10px;">
                <select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="searchGatepass('','','0');">
               		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
               		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
               		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
              		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
               	</select>
           </div>
	        <div class="col-lg-10 col-xs-10">
       	 		 <input type="text"  class="form-control searchItems searchBar"  value="" id="searchOrders" placeholder="<spring:message code="search.orders.label" />"style="margin-top: 10px;" />
					<div class="services">
		    			<div class="items">
		     				<ul class="matchedStringUl gatePass" style=""></ul>
		   				</div>
					</div>
					<input type="hidden" id="ordersSearch" value="${searchName}">
       	 	</div>
	        
				
	        	<c:if test="${sessionScope.role == 'super admin'}">
	        	<div class="col-lg-1" style="margin-top: 10px;padding-left: 0px;">
	        <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return viewNewShipmentGatePass('','${status}');" value="<spring:message code="addnew.label" />" />
	         </div>
	         <%-- <div class="col-lg-1" style="margin-top: 10px;padding-left: 0px;">
	        <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return viewOrders('Draft','','0','');" value="<spring:message code="drafts.label" />" />
	        </div> --%>
	        	<%-- 	<a onclick="return viewNewOrder('','${status}');" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp;
					<a onclick="return viewOrders('Draft','','0','');" class="button"><font size="2px"><spring:message code="drafts.label" /></font></a> --%>
	      		</c:if>
				<c:if test="${sessionScope.role != 'super admin'}">
					<c:if test="${flowUnder == 'outlet'}">
			           <c:forEach var="accessControl" items="${sessionScope.outletCustomerOrder}">
			                <c:if test="${accessControl.appDocument == 'outletCustomerOrders' && accessControl.write == true}"> 
			                	<div class="col-lg-1" style="margin-top: 10px;padding-left: 0px;">
	        <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return viewNewShipmentGatePass('','${status}');" value="<spring:message code="addnew.label" />" />
	         </div>
	        <%--  <div class="col-lg-1" style="margin-top: 10px;padding-left: 0px;">
	        <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return viewOrders('Draft','','0','');" value="<spring:message code="drafts.label" />" />
	        </div> --%>
			                	<%-- <a onclick="return viewNewOrder('','${status}');" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp;
								<a onclick="return viewOrders('Draft','','0','');" class="button"><font size="2px"><spring:message code="drafts.label" /></font></a> --%>
							</c:if>
						</c:forEach>
					</c:if>
					<%-- <div class="col-lg-1" style="margin-top: 10px;padding-left: 0px;">
	        <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return viewNewShipmentGatePass('','${status}');" value="<spring:message code="addnew.label" />" />
	         </div> --%>
					
					<c:if test="${flowUnder == 'warehouse'}">
			           <c:forEach var="accessControl" items="${sessionScope.warehouseSalesOrder}">
			                <c:if test="${accessControl.appDocument == 'WarehouseShipmentGatePass' && accessControl.write == true}"> 
			                	<div class="col-lg-1" style="margin-top: 10px;padding-left: 0px;">
	        <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return viewNewShipmentGatePass('','${status}');" value="<spring:message code="addnew.label" />" />
	         </div>
	         <%-- <div class="col-lg-1" style="margin-top: 10px;padding-left: 0px;">
	        <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return viewOrders('Draft','','0','');" value="<spring:message code="drafts.label" />" />
	        </div> --%>
			                	<%-- <a onclick="return viewNewOrder('','${status}');" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp;
								<a onclick="return viewOrders('Draft','','0','');" class="button"><font size="2px"><spring:message code="drafts.label" /></font></a> --%>
							</c:if>
						</c:forEach>
					</c:if>
					<c:if test="${flowUnder == 'management'}">
			           <c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrder}">
			                <c:if test="${accessControl.appDocument == 'OrderManagementSalesOrder' && accessControl.write == true}"> 
			                	<div class="col-lg-1" style="margin-top: 10px;padding-left: 0px;">
	        <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return viewNewShipmentGatePass('','${status}');" value="<spring:message code="addnew.label" />" />
	         </div>
	         <%-- <div class="col-lg-1" style="margin-top: 10px;padding-left: 0px;">
	        <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return viewOrders('Draft','','0','');" value="<spring:message code="drafts.label" />" />
	        </div> --%>
			                	<%-- <a onclick="return viewNewOrder('','${status}');" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp;
								<a onclick="return viewOrders('Draft','','0','');" class="button"><font size="2px"><spring:message code="drafts.label" /></font></a> --%>
							</c:if>
						</c:forEach>
					</c:if>
			</c:if>
		</div>
		<!-- </div>  -->
      <!--  </div> -->
       <%--  </c:if> --%>
	     <!--  </div> -->
	      
         <table id="productstocks" class="table table-bordered table-striped" style="margin-top:0%;">
          <thead style="background-color: #3c8dbc; color: #ffffff">
                 <tr>
                 	 <th><div style=""><spring:message code="sl.no.label" /></div></th>
                 	 <th><spring:message code="po.gatepass.carriercompany.label" /></th>
                     <th><spring:message code="po.gatepass.personname.label" /></th>
                     <th><spring:message code="date.label" /></th>
                     <th><spring:message code="vehicle.number.label" /></th>
                 	 <th><spring:message code="shiporder.label" /></th>
                     <th><spring:message code="loadedby.label" /></th>
                     <th><spring:message code="featuredForm.action" /></th>
                 </tr>
             </thead>
             <tbody style="text-align: center;">
                <c:forEach var="orderDetail" items="${orderDetails}" varStatus="loop">
             	 <tr>
             	 	 <td>${loop.count+index-1}</td>
                 	 <td>${orderDetail.destination}</td>
                     <td>${orderDetail.checkedBy}</td> 
                     <td>${orderDetail.createdDateStr}</td>
                     <td>${orderDetail.gatePassRef}</td>
                     <td>${orderDetail.shipmentOrderRef}</td>
                     <td>${orderDetail.issuedBy}</td>
                   <td>
                   <c:forEach var="accessControl" items="${sessionScope.warehouseSalesOrder}">
                				<c:if test="${accessControl.appDocument == 'WarehouseShipmentGatePass' && accessControl.read == true}">
                					<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewEditGatepass('${orderDetail.gatePassRef}','view');"><spring:message code="view.label"/></a>
                				</c:if>
                			</c:forEach>
                   	
                   <%-- 	&nbsp;&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewEditGatepass('${orderDetail.gatePassRef}','edit');"><spring:message code="edit.label"/></a> --%>
                   	<c:if test="${sessionScope.role == 'super admin'}">
                   		&nbsp;&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewEditGatepass('${orderDetail.gatePassRef}','edit');"><spring:message code="edit.label"/></a>
                   </c:if>
                   <c:if test="${sessionScope.role != 'super admin'}">
						<c:if test="${flowUnder == 'outlet'}">
				           <c:forEach var="accessControl" items="${sessionScope.outletCustomerOrder}">
				                <c:if test="${accessControl.appDocument == 'outletCustomerOrders' && accessControl.write == true && accessControl.read == true}">
				                	&nbsp;&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewEditGatepass('${orderDetail.gatePassRef}','edit');"><spring:message code="edit.label"/></a> 
				                </c:if>
				           </c:forEach>
				        </c:if>
			           <c:if test="${flowUnder == 'warehouse'}">
			           		<c:forEach var="accessControl" items="${sessionScope.warehouseSalesOrder}">
                				<c:if test="${accessControl.appDocument == 'WarehouseShipmentGatePass' && accessControl.write == true}">
                					&nbsp;&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewEditGatepass('${orderDetail.gatePassRef}','edit');"><spring:message code="edit.label"/></a>
                				</c:if>
                			</c:forEach>
			           </c:if>
			    
				      </c:if>
                
                   </td>
                 </tr>
                </c:forEach>
             </tbody>
         </table>
              <input type="hidden" id="flowUnder" name="flowUnder" value= "${flowUnder}">
              <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewShipmentGatePass('${status}','${totalValue}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewShipmentGatePass('${status}','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-maxRecords <= 0}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewShipmentGatePass('${status}','${index - (maxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewShipmentGatePass('${status}','${totalValue}')">
              	</div> 
              	</c:if>
              </div> 
               <div id="triggerEvent"></div>
    <!-- COMPOSE MESSAGE MODAL -->
    
    <div class="col-sm-12 col-lg-12 col-xs-12">
            
         <div class="modal fade popup-display" id="items-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
             <div class="col-sm-2 col-lg-2 col-xs-0">
    		</div>
           <div class="col-sm-10 col-lg-10 col-xs-12">
             <div class="modal-content billsPopUp" style="">
          <!--    <i class="fa fa-angle-up billsPopUpUpArrow" aria-hidden="true"></i> -->
                 <div class="modal-header">
                        <button type="button" class="close" style="font-size: 30px;" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" style="text-align: center;"><div id="locationLable"></div><div id="dateLable"></div></h4>
                    </div>
             <form action="#" method="post">
                 <div class="modal-body">
                  <div class="box-body table-responsive" id="summary">
                  
                     <%-- <table id="itemsList" class="table table-bordered table-hover">
                       <thead style="background-color: #3c8dbc; color: #ffffff">
                         <tr>
                             <th><spring:message code="item.desc.label"/></th>
                             <th><spring:message code="price.label"/></th>
                         </tr>
                       </thead>
                       <tbody style="text-align: center;">
			 			</tbody>
                    </table> --%>
                 </div>
              </div>
             </form> 
             </div><!-- /.modal-content -->
         </div><!-- /.modal-dialog -->
     </div><!-- /.modal -->
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
        
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="receiptstock.label" />"/>
        <input type="hidden" id="status" value="${status}"/>
        <input type="hidden" id="location" value="${selectedLocation}"/>
</body>
</html>