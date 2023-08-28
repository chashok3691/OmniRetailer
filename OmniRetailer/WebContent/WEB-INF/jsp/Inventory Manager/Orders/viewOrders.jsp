<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah Y
 * file name		        : inventorymanager/Orders/vieOrders.jsp
 * file type		        : JSP
 * description				: The new storage system form is displayed using this jsp
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
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

.sticky-col {
  position: sticky !important;
  position: -webkit-sticky;    
  z-index: 9;
  /* background-color: white; */
}

.first-col {
 /*  width: 100px;
  min-width: 100px;
  max-width: 100px; */
  left: 0px;    
}

.second-col {
    left: 30px;
}
.third-col {
    min-width: 100px;
    max-width: 100px; 
    left: 80px;
}
.fourth-col {
    min-width: 200px;
    max-width: 200px;
    left: 195px;
}

#overflowtext{

width : 250px;
overflow: hidden;
text-overflow: ellipsis;
 text-align: left;
}
 
</style>  
<script type="text/javascript">
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
	
	debugger;
	/* if( zone != null && zone !="" && flowUnder==  'outlet')
		searchlocationsBasedOnZoneForDashboard('outletZone','location1','');
	else
		searchlocationsBasedOnZoneForDashboard('outletZone','location1','');
 */
	
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
     <div class="box-header" style="padding-bottom: 0px;">
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
		<div style="text-align: center;">
		<h3 class="box-title" style="border: 1px solid gray;padding: 5px;padding-left: 40px;padding-right: 40px;">
				<c:if test="${status == ''}">
				All Orders
				</c:if>
				<c:if test="${status != ''}">
				${status}
				</c:if>
				<input type="hidden" value="Orders"  id="IsOrderPage">
				<input type="hidden" value="${sessionScope.serviceAreaRequired}" id="GoogleKeyId"/>
				<input type="hidden" value="${sessionScope.b2cRequired}" id="b2cRequired"/>
				
			</h3>
		
		</div>
			
		<%-- </c:if>  --%>
	</div><!-- /.box-header -->
	    <div class="box-body table-responsive">
	      
	      
	      
	      <div class="row" style="padding-left:15px;padding-right:15px;">
                              <div class="col-lg-11" style="background: #eee; width: 88%; padding-top: 7.5px; padding-bottom: 7.5px;">
                  <div class="row" style="padding-bottom: 15px;">
                  <input type="hidden" id="orderworkflow" value="${status}"/>
                         <div class="col-lg-2">
                       <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="zone.label"/></label>
                        <c:choose>
                        <c:when test="${flowUnder == 'outlet' }">
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZoneForDashboard('outletZone','location1','')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
	                        </c:when>
	                        <c:otherwise>
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZoneForDashboard('outletZone','location1','')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
	                        </c:otherwise>
	                        </c:choose>
                         </div>
                      </div>
                      
                     <div class="col-lg-2">
                       <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;white-space: nowrap;">
                           <label><spring:message code="order.value.start.label"/></label>
                             <%--  <fmt:formatNumber var="formattedBillableTime" type="number"  value="${orderDetails.orderStartValue}" /> --%>
                           <input type="text" class="form-control" name="orderStartValue" id="orderStartValue"  oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"  value="${orderStartValue}" placeholder="Enter Order Value Start" />
                       </div>
                      </div>
                       
                       
                        <c:if test="${status ==''}">
                         <div class="col-lg-2">
                          <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                            <label><spring:message code="order_status.label" /></label>
                              <select  style="opacity: 1.5; background-color:white" class="form-control" name="status" id="orderStatus">
                                       <option value="" ${'all' == status ? 'selected' : ''}>All</option>
                                       <option value="Ordered" ${'Ordered' == status ? 'selected' : ''}>Ordered</option>
                                       <option value="Confirmed" ${'Confirmed' == status ? 'selected' : ''}>Confirmed</option>
                                       <option value="Cancelled" ${'Cancelled' == status ? 'selected' : ''}>Cancelled</option>
                                       <option value="Pending" ${'Pending' == status ? 'selected' : ''}>Pending</option>
                                       <option value="Packed" ${'Packed' == status ? 'selected' : ''}>Packed</option>
                                       <option value="Shipped" ${'Shipped' == status ? 'selected' : ''}>Shipped</option>
                                       <option value="Delivered" ${'Delivered' == status ? 'selected' : ''}>Delivered</option>
                                       <option value="Returned" ${'Returned' == status ? 'selected' : ''}>Returned</option>
                                       <option value="Closed" ${'Closed' == status ? 'selected' : ''}>Closed</option>
                                       <option value="Reject" ${'Reject' == status ? 'selected' : ''}>Reject</option>
                                       <option value="Re-Order" ${'Re-Order' == status ? 'selected' : ''}>Re-Order</option>
                                       <option value="Draft" ${'Draft' == status ? 'selected' : ''}>Draft</option>
                               </select>
 	                 </div>
	            </div>
                        </c:if>
                        
                         <c:if test="${status !=''}">
                         <div class="col-lg-2">
                          <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                            <label><spring:message code="order_status.label" /></label>
                              <select  style="opacity: 1.5; pointer-events: none;background-color:white" class="form-control" name="status" id="orderStatus">
                                       <option value="" ${'all' == status ? 'selected' : ''}>All</option>
                                       <option value="Ordered" ${'Ordered' == status ? 'selected' : ''}>Ordered</option>
                                       <option value="Confirmed" ${'Confirmed' == status ? 'selected' : ''}>Confirmed</option>
                                       <option value="Cancelled" ${'Cancelled' == status ? 'selected' : ''}>Cancelled</option>
                                       <option value="Pending" ${'Pending' == status ? 'selected' : ''}>Pending</option>
                                       <option value="Packed" ${'Packed' == status ? 'selected' : ''}>Packed</option>
                                       <option value="Shipped" ${'Shipped' == status ? 'selected' : ''}>Shipped</option>
                                       <option value="Delivered" ${'Delivered' == status ? 'selected' : ''}>Delivered</option>
                                       <option value="Returned" ${'Returned' == status ? 'selected' : ''}>Returned</option>
                                       <option value="Closed" ${'Closed' == status ? 'selected' : ''}>Closed</option>
                                       <option value="Reject" ${'Reject' == status ? 'selected' : ''}>Reject</option>
                                       <option value="Re-Order" ${'Re-Order' == status ? 'selected' : ''}>Re-Order</option>
                                       <option value="Draft" ${'Draft' == status ? 'selected' : ''}>Draft</option>
                               </select>
 	                 </div>
	            </div>
                        </c:if>
                       
                       
                        
	                <div class="col-lg-3">
              <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                 			 <input type="hidden" id="type" value="${type}">
							                 <input type="hidden" id="sd" value="${startDate}">
						                     <input type="hidden" id="ed" value="${endDate}">
						            <label><spring:message code="offer_start_date.label"/></label>
						                    <input class="form-control  calendar_icon" readonly="readonly"  style="background-color: white;" id="from" size="20" type="text"  onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
	              
	              </div>
	            </div>
	       <!-- Added by:Swathi
	       Purpose :To add Start Timeslot field    
	         -->   
	             <div class="col-lg-3">  
              <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
            <label><spring:message code="start.timeslot.label"/></label>
            <select class="form-control" name="deliverySlotStartTime" id="deliverySlotStartTime" onchange="startTimeChange(this.options[this.selectedIndex].index,'deliverySlotEndTime')">
            <%-- <option value="all"><spring:message code="ALL.label"/></option> --%>
            <option value="" ${'all' == deliverySlotStartTime ? 'selected' : ''}>All</option>
			 <c:forEach var="startTime" items="${startTimeList}" varStatus="TheCount">
		                                             <option value="${startTime},${endTimeList[TheCount.index]}" ${startTime == deliverySlotStartTime ? 'selected' : ''}>${startTime} -${endTimeList[TheCount.index]}</option>
		                                          
													 </c:forEach>
 			   </select>          </div>
	 </div>
	            
	            
                    </div>
                     <div class="row">
                       <div class="col-lg-2">
                       <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                          <label><spring:message code="location.label"/></label>
	             <select class="form-control form-group" id="location1" >
	             	<option value="">ALL</option>
	                <c:forEach var="location1" items="${locationsList}">
	                 <c:if test="${location1 !='B2C'}"> 
	                <option value="${location1}" ${location1 == selectedLocation ? 'selected' : ''} id="${location1}" >${location1}</option>
	                 </c:if> 
						<%-- <option value="${location1}" ${location1 == selectedLocation ? 'selected' : ''} id="${location1}" >${location1}</option> --%>
					</c:forEach>
	            </select> 
                      </div>
                      </div>
                   
                       
                     
                        <div class="col-lg-2">
                       <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;white-space: nowrap;">
                           <label><spring:message code="order.value.end.label"/></label>
                          <input type="text" class="form-control"  name="orderEndValue" value="${orderEndValue}" id="orderEndValue" oninput="this.value = this.value.replace(/[^0-9.]/g, '');" placeholder="Enter Order Value End"/>
                      </div>
                      </div>
               
		               <div class="col-lg-2">
                       <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="order_channel" /></label>
                      
                           		  <select class="form-control" name="orderChannel" id="orderChannelId">
                                  <option value="all"><spring:message code="ALL.label"/></option>
                                   <option value="Online" ${'Online' == orderChannel ? 'selected' : ''}>Online</option>
                                  <option value="Mobile" ${'Mobile' == orderChannel ? 'selected' : ''}>Mobile</option>
                                  <option value="Sales Executive" ${'Sales Executive' == orderChannel ? 'selected' : ''}>Sales Executive</option>
                                  <option value="Direct" ${'Direct' == orderChannel ? 'selected' : ''}>Direct</option>
                                  </select>
                                 <!--  <select class="form-control" name="orderChannel" id="orderChannel">
                                   <option value="Online" >Online</option>
                                  <option value="Phone">Phone</option>
                                  <option value="Sales Executive" >Sales Executive</option>
                                  <option value="Direct" >Direct</option>
                                  </select> -->
	                        
                      </div>
                      </div>
                          <div class="col-lg-3">
	               <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
	                  <label><spring:message code="offer_end_date.label"/></label>
						      <input class="form-control  calendar_icon" style="background-color: white;" id="to" size="20" type="text" readonly="readonly" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div>
		        
		        
		        <!-- Added by:Swathi
	       			 Purpose :To add End Timeslot field    
	         -->  
		          <div class="col-lg-2">  
              <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;display:none">
            <label><spring:message code="end.timeslot.label"/></label>
		<select class="form-control" name="deliverySlotEndTime" id="deliverySlotEndTime" >
		<option value="" ${'all' == deliverySlotEndTime ? 'selected' : ''}>All</option> 			 
	            <c:forEach var="endTime" items="${endTimeList}">
				<option value="${endTime}" ${endTime == deliverySlotEndTime ? 'selected' : ''}>${endTime}</option>
			</c:forEach>
		</select>           
 </div>
	 </div>
                    </div>
                  </div>
                  <div class="col-lg-9" style="padding-right:15px;    background: #ccc;    border-right: 1px solid #ccc;    width: 12%; padding-top: 2px;padding-bottom: 23px;">
                  <div class="col-lg-12" style="">
                  <div class="row">
                  
                   <input type="hidden" id="type" value="${type}">
                       <%--  <input type="button"  class="buttonsearch" onclick="searchOrders('','','0')" value="<spring:message code="search" />" /> --%>
                        <%-- <a onclick="searchOrders('','','0')" class="buttonsearch"><spring:message code="search"/></a> --%>
                   <input type="button" style="margin-top:22px" class="btn bg-olive btn-inline addBtn" onclick="searchOrders('','','0','false')" value="<spring:message code="search" />" />
                  </div>
                  <div class="row">
                  <a onclick="resetForm();" style="margin-top:34px"  class="btn bg-olive btn-inline addBtn"><spring:message code="clearbutton.label"/></a>
                  </div>
                  </div></div>
                
                </div>
	      
	       <%--  <div class="row">
	        <div class="col-lg-3">
               <div class="row">
                 <div class="col-lg-4 col-xs-4 col-sm-2 col-md-2" style="text-align:left;top:5px;padding-right: 0px;">
                   <label><spring:message code="location.label"/></label>
                 </div>
                 <div class="col-lg-8 col-xs-8 col-sm-10 col-md-10" >
                 <label><spring:message code="location.label"/></label>
	             <select class="form-control form-group" id="location" >
	             	<!-- <option value="">ALL</option> -->
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
						                    <input class="form-control  calendar_icon" readonly="readonly" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
						               </div>
						                <div class="col-lg-6" style="padding-left: 0px;padding-right:15px">
						                <label><spring:message code="offer_end_date.label"/></label>
						                    <input class="form-control  calendar_icon" readonly="readonly" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
						               </div>
						               </div>
	        
	        <div class="col-lg-2">
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
	          </div>
           <div class="col-lg-1" style="margin-top: 18px;padding-left: 0px">
            
                    <input type="hidden" id="type" value="${type}">
                        <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="searchOrders('','','0')" value="<spring:message code="search" />" />
           </div>
	      </div> --%>
	      <div class="row">
                <div class="col-lg-11"></div>
                <div class="col-lg-1 summaryBtn">
                	<img class="summaryImg" src="${pageContext.request.contextPath}/images/summary.png" style="cursor: pointer;" onclick="getOrderSummary();" >
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
	      <div class="col-lg-1 col-xs-2" style="margin-top: 10px;">
                <select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="searchOrders('','','0','false');">
               		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
               		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
               		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
              		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
               	</select>
           </div>
           
           <div class="col-lg-8" style="margin-top: 10px; padding-left: 1px;">
                      <div class="wrapper">	 
                     <input type="text"  class="form-control"  value="${searchName}" id="searchOrders" placeholder="<spring:message code="search.orders.label" />"/>
							<button id="mySearch" class="searchbutton"></button>
							<!-- <div class="services">
				    			<div class="items">
				     				<ul class="matchedStringUl searchStocks" style=""></ul>
				   				</div>
							</div> -->
							</div>
						<input type="hidden" id="ordersSearch" value="${searchName}">
                    </div>
           
	       <%--  <div class="col-lg-9 col-xs-10">
       	 		 <input type="text"  class="form-control searchItems searchBar"  value="" id="searchOrders" placeholder="<spring:message code="search.orders.label" />"style="margin-top: 10px;" />
					<div class="services">
		    			<div class="items">
		     				<ul class="matchedStringUl searchOrders" style=""></ul>
		   				</div>
					</div>
					<input type="hidden" id="ordersSearch" value="${searchName}">
       	 	</div>
	         --%>
				
	        	<c:if test="${sessionScope.role == 'super admin'}">
	        	<div class="col-lg-1" style="margin-top: 10px;padding-left: 0px;margin-left: 7px;">
	        <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return viewNewOrder('','${status}');" value="<spring:message code="addnew.label" />" />
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
			                	<div class="col-lg-1" style="margin-top: 10px;padding-left: 0px;margin-left: 7px;">
	        <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return viewNewOrder('','${status}');" value="<spring:message code="addnew.label" />" />
	         </div>
	         <div class="col-lg-1" style="margin-top: 10px;padding-left: 0px; margin-left: -7px;">
	        <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return viewOrders('Draft','','0','');" value="<spring:message code="drafts.label" />" />
	        </div>
			                	<%-- <a onclick="return viewNewOrder('','${status}');" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp;
								<a onclick="return viewOrders('Draft','','0','');" class="button"><font size="2px"><spring:message code="drafts.label" /></font></a> --%>
							</c:if>
						</c:forEach>
					</c:if>
					<c:if test="${flowUnder == 'warehouse'}">
			           <c:forEach var="accessControl" items="${sessionScope.warehouseSalesOrder}">
			                <c:if test="${accessControl.appDocument == 'WarehouseShipmentOrders' && accessControl.write == true}"> 
			                	<div class="col-lg-1" style="margin-top: 10px;padding-left: 0px;margin-left: 7px;">
	        <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return viewNewOrder('','${status}');" value="<spring:message code="addnew.label" />" />
	         </div>
	        <%--  <div class="col-lg-1" style="margin-top: 10px;padding-left: 0px; margin-left: -7px;">
	        <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return viewOrders('Draft','','0','');" value="<spring:message code="drafts.label" />" />
	        </div> --%>
	          <div class="col-lg-1" style="margin-top: 10px;padding-left: 0px; margin-left: -5px;">
	       <input type="button" class="addBtn btn bg-olive btn-inline"  onclick="searchOrders('','','0','true')"  value="<spring:message code="save.label" />" />
	        </div>
			                	<%-- <a onclick="return viewNewOrder('','${status}');" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp;
								<a onclick="return viewOrders('Draft','','0','');" class="button"><font size="2px"><spring:message code="drafts.label" /></font></a> --%>
							</c:if>
						</c:forEach>
					</c:if>
					<c:if test="${flowUnder == 'management'}">
			           <c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrder}">
			                <c:if test="${accessControl.appDocument == 'OrderManagementSalesOrder' && accessControl.write == true}"> 
			  <div class="col-lg-1" style="margin-top: 10px;padding-left: 0px;margin-left: 7px;">
	        <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return viewNewOrder('','${status}');" value="<spring:message code="addnew.label" />" />
	         </div>
	       <%--   <div class="col-lg-1" style="margin-top: 10px;padding-left: 0px; margin-left: -5px;">
	        <input type="button" style="" class="btn bg-olive btn-inline addBtn" onclick="return viewOrders('Draft','','0','management');" value="<spring:message code="drafts.label" />" />
	        </div> --%>
	        
	        
	         <div class="col-lg-1" style="margin-top: 10px;padding-left: 0px; margin-left: -5px;">
	       <input type="button" class="addBtn btn bg-olive btn-inline" data-toggle="modal" data-target="#myModalIos"  value="<spring:message code="allocate.label" />" />
	        </div>
	        
	         <div class="col-lg-1" style="margin-top: 10px;padding-left: 0px; margin-left: -5px;">
	       <input type="button" class="addBtn btn bg-olive btn-inline"  onclick="searchOrders('','','0','true')"  value="<spring:message code="save.label" />" />
	        </div>
	        
			                	<%-- <a onclick="return viewNewOrder('','${status}');" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>&nbsp;&nbsp;&nbsp;
								<a onclick="return viewOrders('Draft','','0','');" class="button"><font size="2px"><spring:message code="drafts.label" /></font></a> --%>
							</c:if>
						</c:forEach>
					</c:if>
					
					
					
					
					
					
			</c:if>
		</div>
		 <input type="hidden" id="fileDownloadurl" value="${orderDetails[0].urlOfSaveOrders}">
		<!-- </div>  -->
      <!--  </div> -->
       <%--  </c:if> --%>
	     <!--  </div> -->
	 <div id="orderitemsForLocations">         
	  <div style="overflow:auto">    
         <table id="productstocks" class="table table-bordered table-striped" style="margin-top:0%;">
          <thead style="background-color: #3c8dbc; color: #ffffff">
                 <tr>
                  <c:if test="${sessionScope.role == 'super admin'}"> 
                                             	<th class="sticky-col first-col" style="width: 60px;background-color: #a1dbf1 !important;" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                                             </c:if>
                                         	<c:if test="${flowUnder == 'management'}">
			           <c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrder}">
    										   <c:if test="${accessControl.appDocument == 'OrderManagementSalesOrder' && accessControl.write == true}"> 
                                            		<th class="sticky-col first-col" style="width: 60px;background-color: #a1dbf1 !important;" align="center" ><input type='checkbox' name='selectall' onClick='selectAll(this)'></th>
                                            	</c:if>
                                            </c:forEach>
                 </c:if>
                 
                 
                 	 <th class="sticky-col second-col" style="background-color: #a1dbf1 !important;"><spring:message code="sl.no.label" /></th>
                 	 <th class="sticky-col third-col" style="background-color: #a1dbf1 !important;"><spring:message code="location.label" /></th>
                 	 <th  class="sticky-col fourth-col" style="background-color: #a1dbf1 !important;"><spring:message code="order_id.label" /></th>
                        <th><spring:message code="bill_id.label" /></th>
                     
                     <th><spring:message code="order_on.label" /></th>
                     <th><spring:message code="mobileNumber.label" /></th>
                      <th><spring:message code="customerName.label" /></th>
                     <th><spring:message code="landmark.label" /></th>
                     <th><spring:message code="area.label" /></th>
                     <th><spring:message code="deliverySlot.label" /></th>
                     <th><spring:message code="delivery_date.label" /></th>
                      <th><spring:message code="confirm_time.label" /></th>
                       <th><spring:message code="confirm_date.label" /></th>
                     <th><spring:message code="order_channel" /></th>
<%--                  	 <th><spring:message code="order_status.label" /></th> --%>
                     <th><spring:message code="order_amount.label" /></th>
                     <th>Logistic Order Status</th>
                     <th><spring:message code="action.label" /></th>
                 </tr>
             </thead>
             <tbody style="text-align: center;white-space: nowrap;">
                <c:forEach var="orderDetails" items="${orderDetails}">
             	 <tr>
             	 
             	   <c:if test="${sessionScope.role == 'super admin'}"> 
                                             	<td class="sticky-col first-col" style="background: #f9f9f9;"><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall"  value="${orderDetails.orderId}" /></td>
                                             </c:if>
                                         <c:if test="${flowUnder == 'management'}">
			           <c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrder}">
    										   <c:if test="${accessControl.appDocument == 'OrderManagementSalesOrder' && accessControl.write == true}"> 
                                            		<td class="sticky-col first-col" style="background: #f9f9f9;"><input type="checkbox" name="selectall" class="selectableCheckbox" id="selectall" value="${orderDetails.orderId}"  /></td>
                                            	</c:if>
                                            </c:forEach>
                                            </c:if>
             	 
             	 	 <td class="sticky-col second-col" style="background: #f9f9f9;">${orderDetails.slNo}</td>
             	 	 <td class="sticky-col third-col" style="background: #f9f9f9;">${orderDetails.saleLocation}</td>
                 	 <td class="sticky-col fourth-col" style="background: #f9f9f9;">${orderDetails.orderId}</td>
                 	 <td> ${orderDetails.billId} </td>
                 	 
                 	  <td>${orderDetails.orderDate}</td>
                   
                     <td>${orderDetails.mobile_num}</td>
                     <td>${orderDetails.shipmentName}</td>
                  <td><div id="overflowtext"> <a href="#" data-toggle="tooltip"  title="${orderDetails.shipement_address_location}">${orderDetails.shipement_address_location}</a></div></td>    
                     <td>${orderDetails.shipement_address_city}</td>
                     <c:if test="${orderDetails.deliverySlotStartTime != '' && orderDetails.deliverySlotStartTime !=undefined}">
                     <td>${orderDetails.deliverySlotStartTime}/${orderDetails.deliverySlotEndTime}</td></c:if>
                      <c:if test="${orderDetails.deliverySlotStartTime == '' || orderDetails.deliverySlotStartTime ==undefined}">
                     <td></td></c:if>
                     <td>${orderDetails.deliveryDate}</td>
                      <c:if test="${orderDetails.confirmedSlotStartTime != '' && orderDetails.confirmedSlotStartTime !=undefined}">
                      <td>${orderDetails.confirmedSlotStartTime}/${orderDetails.confirmedSlotEndTime}</td></c:if>
                      <c:if test="${orderDetails.confirmedSlotStartTime == '' || orderDetails.confirmedSlotStartTime ==undefined}">
                     <td></td></c:if>
                       <td>${orderDetails.confirmedDate}</td>
                     <td>${orderDetails.orderChannel}</td>
<%--                      <td>${orderDetails.orderStatus}</td> --%>
                     <td>${orderDetails.totalOrderAmount}</td>
                      <td>${orderDetails.logisticsOrderStatus}</td>
                   <td>
                   	<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewOrderDetails('${orderDetails.orderId}','orders','${status}','view');"><spring:message code="view.label"/></a>
                   	<c:if test="${sessionScope.role == 'super admin'}">
                   		&nbsp;&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewOrderDetails('${orderDetails.orderId}','orders','${status}','edit');"><spring:message code="edit.label"/></a>
                   </c:if>
                   <c:if test="${sessionScope.role != 'super admin'}">
						<c:if test="${flowUnder == 'outlet'}">
				           <c:forEach var="accessControl" items="${sessionScope.outletCustomerOrder}">
				                <c:if test="${accessControl.appDocument == 'outletCustomerOrders' && accessControl.write == true && accessControl.read == true}">
				                	&nbsp;&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewOrderDetails('${orderDetails.orderId}','orders','${status}','edit');"><spring:message code="edit.label"/></a> 
				                </c:if>
				           </c:forEach>
				        </c:if>
			           <c:if test="${flowUnder == 'warehouse'}">
			           		<c:forEach var="accessControl" items="${sessionScope.warehouseSalesOrder}">
                				<c:if test="${accessControl.appDocument == 'WarehouseShipmentOrders' && accessControl.write == true && accessControl.read == true}">
                					&nbsp;&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewOrderDetails('${orderDetails.orderId}','orders','${status}','edit');"><spring:message code="edit.label"/></a>
                				</c:if>
                			</c:forEach>
			           </c:if>
			           <c:if test="${flowUnder == 'management'}">
			           		<c:forEach var="accessControl" items="${sessionScope.orderManagemetSalesOrder}">
                				<c:if test="${accessControl.appDocument == 'OrderManagementSalesOrder' && accessControl.write == true}">
                					&nbsp;&nbsp;&nbsp;<a style="color:#2e7ea7 !important;cursor: pointer;" onclick="viewOrderDetails('${orderDetails.orderId}','orders','${status}','edit');"><spring:message code="edit.label"/></a>
                				</c:if>
                			</c:forEach>
			           </c:if>
			           
			           
			           
			           
				      </c:if>
                   
                   
                   
                   
                   </td>
                 </tr>
                </c:forEach>
             </tbody>
         </table>
         </div>
         </div>
              <input type="hidden" id="flowUnder" name="flowUnder" value= "${flowUnder}">
              <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewOrders('${status}','','${totalValue}','')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewOrders('${status}','','${index - (maxRecords + 1)}','');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewOrders('${status}','','${index - (maxRecords + 1)}','');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewOrders('${status}','','${totalValue}','')">
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
              		  <input type="button" onclick="viewOrders('${status}','',document.getElementById('pagination').value,'');" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
				</div>
              	
              	
              </div> 
               <div id="triggerEvent"></div>
    <!-- COMPOSE MESSAGE MODAL -->
    
    
    
    
		  <div id="triggerEvent"></div>
   <div class="modal fade" id="myModalIos" role="dialog" tabindex="-1">
    <div class="modal-dialog iosmodeldialog">
    
      <!-- Modal content-->
      <div class="modal-content iospopup">
        <div class="modal-header">
       
          <button type="button" class="close" onclick="" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
       <div class="form-group col-lg-12" style="padding: 0px;font-size: 15px">
       
      
                   
                          <label><spring:message code="location.label"/></label>
	             <select class="form-control form-group" id="modaloutletlocation" >
<!-- 	             	<option value="">ALL</option> -->
	                <c:forEach var="location" items="${locationsList}">
	                 <c:if test="${location !='B2C'}"> 
						<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option>
					 </c:if> 
					</c:forEach>
	            </select> 
                     
                    
       
          <!-- <div class="col-lg-1"> -->
         
        <!--  </div> -->
         </div>
        <div class="form-group col-lg-12"></div>
          <div class="col-lg-2 col-sm-6 col-xs-6" style=""></div>
          <div class="form-group col-lg-8 col-sm-6 col-xs-6" style="padding-left: 0px; padding-right: 0px;">
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
 <input type="button" class="iosclosebutton1" onclick="AssigendOrdersToLocation('order')"  value="Ok">
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
        
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="order_id.label" />"/>
        <input type="hidden" id="status" value="${status}"/>
        
       <%--  <input type="hidden" id="location" value="${selectedLocation}"/> --%>
</body>
</html>