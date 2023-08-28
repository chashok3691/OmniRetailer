<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : inventorymanager/retailoutlets/stockLedger.jsp
 * file type		        : JSP
 * description				: The new storage system form is displayed using this jsp
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
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        
<style type="text/css">

a.button{
  position: relative;
    text-decoration: none;
    color: white;
    display: inline-block;
    padding: 4px 10px 28px 10px;
    background: #3c8dbc;
    /* border-radius: 5px; */
    /* box-shadow: 1px 0px 2px #000; */
    cursor: pointer;
    margin-top: 19.5px;
    height: 25px;
    text-align: center;
    margin-bottom: 19px;
    width: 100%;
}
.allignment{
  /*    width: 13.3%; */
    padding-right: 0px;
    padding-left: 0px;
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
    /* border: 2px solid gray; */
    border-radius: 10px;
   /*  background: #eee; */
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
		margin-top: 5px;
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
    /* border-color: transparent transparent #eee transparent; */
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
a.button, .list a.button {
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
/* .table-bordered>tbody>tr>td, .table-bordered>tbody>tr>th, .table-bordered>tfoot>tr>td, .table-bordered>tfoot>tr>th, .table-bordered>thead>tr>td, .table-bordered>thead>tr>th{
 border: 0px !important;
}
 */
/* body.modal-open {
margin-left: auto;
 margin-right: auto; 
padding-right: 0px !important;
}
 */
</style>  
<script>
$(document).ready(function(){
callCalender('from');
callCalender('to');

/* $(window).resize(function() {

	  $(".modal-box").css({
	    top: ($(window).height() - $(".modal-box").outerHeight()) / 2,

	    left: ($(window).width() - $(".modal-box").outerWidth()) / 2
	  });
	});
	 */
	 
	 
	 

$("#supplierReport").val($("#stock").val());
$("#supplierReport").focus();
$('#supplierReport').on('input',function(e){
	if($(this).val().trim()==""){
		viewCustomerVisits('customerVisits','0','false')
	}
});


$('#mySearch').click(function(){
    var search = $('#supplierReport').val();
    viewCustomerVisits('customerVisits','0','false');
})
$('#supplierReport').keypress(function(e){
    if(e.which == 13){//Enter key pressed
        $('#mySearch').click();//Trigger search button click event
    }
});



// added to fetch locations based on zone 


//if($("#stocksObj").val()!="" && $("#stocksLineChart").length > 0)
    //new Chart(document.getElementById("stocksLineChart").getContext("2d")).Line(getprocurementconsumptiongraph(),newopts);
});

</script>
</head>
<body>

<%-- <section class="content-header">
   <h1><spring:message code="outlet.management.label" />
     <small><p id="heading"><spring:message code="stocks.label" /></p></small>
    </h1>
      <ol class="breadcrumb">
      	<li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><spring:message code="outlet.management.label" /></li>
     </ol>
 </section> --%>
 <!-- Content Header (Page header) -->

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
  <div class="box box-primary">
          <div class="box-header" align="center">
				<h3 class="box-title" >
					<spring:message code="customer.visits.label" />
				</h3>			
				</div><!-- /.box-header -->
			
                    <div class="box-body table-responsive">
                     <div class="col-lg-11" style=" background: #f4f4f4;    padding: 10px 20px;    width: 88%;">
              <form id="xReportsDisplay">
                  <div class="row">
                         <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="zone.label"/></label>
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZone('outletZone','outletLocation','')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
                         </div>
                      </div>
                     <div class="col-lg1-2 col-lg-3 form-group">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="customerCategory.label" /></label>
                           <select id="customerCategory"  class="form-control clearError" >
                           		<option value="">ALL</option>
		                	  	<option value="BASIC" ${customerCategory == 'BASIC' ? 'selected' : ''}>BASIC</option>
		                	  	<option value="GENERIC" ${customerCategory == 'GENERIC' ? 'selected' : ''}>GENERIC</option>
		                	  	<option value="PLUS" ${customerCategory == 'PLUS' ? 'selected' : ''}>PLUS</option>
		                	  	<option value="PREMIUM" ${customerCategory == 'PREMIUM' ? 'selected' : ''}>PREMIUM</option>
							    <option value="SILVER" ${customerCategory == "SILVER" ? 'selected' : ''}>SILVER</option>
								<option value="GOLD" ${customerCategory == "GOLD" ? 'selected' : ''}>GOLD</option>
							    <option value="PLATINUM" ${customerCategory == "PLATINUM" ? 'selected' : ''}>PLATINUM</option>
							    <option value="EMPLOYEE PREMIUM" ${customerCategory == "EMPLOYEE PREMIUM" ? 'selected' : ''}>EMPLOYEE PREMIUM</option>
							   <option value="EMPLOYEE GENERIC" ${customerCategory == "EMPLOYEE GENERIC" ? 'selected' : ''}>EMPLOYEE GENERIC</option>
							    <option value="MEMBERSHIP SILVER" ${customerCategory == "MEMBERSHIP SILVER" ? 'selected' : ''}>MEMBERSHIP SILVER</option>
							    <option value="MEMBERSHIP PLATINUM" ${customerCategory == "MEMBERSHIP PLATINUM" ? 'selected' : ''}>MEMBERSHIP PLATINUM</option>
							   <option value="MEMBERSHIP GOLD" ${customerCategory == "MEMBERSHIP GOLD" ? 'selected' : ''}>MEMBERSHIP GOLD</option>
							</select>
                      </div>
                      </div>
                    <div class="col-lg1-2 col-lg-2">
                      <%--  <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="brand.label"/></label>
                           <select class="form-control" id="outletBrandId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="brandsList" items="${brandsList}">
									<option value="${brandsList}" ${brandsList == brand ? 'selected' : ''} id="${brandsList}" >${brandsList}</option>
						 		</c:forEach>
	                        </select>
                      </div> --%>
                      </div>
                  
                       
                         <div class="col-lg1-2 col-lg-2">
              <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
                 		<label><spring:message code="offer_start_date.label"/></label>
                	 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${startdate}" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
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
	                             <c:choose>
							                        <c:when test="${location.description == ''}">
							                          <option value="${location.locationId}" ${location.locationId == storeLocation ? 'selected' : ''}>${location.locationId}</option>
							                       </c:when>
							                        <c:otherwise>
							                          <option value="${location.locationId}" ${location.locationId == storeLocation ? 'selected' : ''}>${location.locationId}-${location.description}</option>
							                        </c:otherwise>
							                      </c:choose>
<%-- 							          <option value="${location}" ${location == storeLocation ? 'selected' : ''} id="${location}" >${location}</option> --%>
	 					         </c:forEach>
	                        </select>
                      </div>
                      </div>
                   
                       <div class="col-lg1-2 col-lg-2">
                    <%--  <div class=" col-lg-10">
                           <label><spring:message code="customer.type.label" /> <span style="color:red; font-size:2">*</span></label>
                           <select id="customerType" name ="customerType" class="form-control clearError" >
                           		<option value="NORMAL" ${customerCategory == 'NORMAL' ? 'selected' : ''}>NORMAL</option>
		                	  	<option value="BASIC" ${customerCategory == 'BASIC' ? 'selected' : ''}>BASIC</option>
		                	  	<option value="GENERIC" ${customerCategory == 'GENERIC' ? 'selected' : ''}>GENERIC</option>
		                	  	<option value="PLUS" ${customerCategory == 'PLUS' ? 'selected' : ''}>PLUS</option>
		                	  	<option value="PREMIUM" ${customerCategory == 'PREMIUM' ? 'selected' : ''}>PREMIUM</option>
							    <option value="SILVER" ${customerCategory == "SILVER" ? 'selected' : ''}>SILVER</option>
								<option value="GOLD" ${customerCategory == "GOLD" ? 'selected' : ''}>GOLD</option>
							    <option value="PLATINUM" ${customerCategory == "PLATINUM" ? 'selected' : ''}>PLATINUM</option>
							    <option value="EMPLOYEE PREMIUM" ${customerCategory == "EMPLOYEE PREMIUM" ? 'selected' : ''}>EMPLOYEE PREMIUM</option>
							   <option value="EMPLOYEE GENERIC" ${customerCategory == "EMPLOYEE GENERIC" ? 'selected' : ''}>EMPLOYEE GENERIC</option>
							</select>
                      </div> --%>
                      </div>
                      
                       <div class="col-lg1-2 col-lg-3 form-group">
                      <%--  <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label>Supplier</label>
                           <select class="form-control" id="outletSupplierId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="supplierList" items="${supplierList}">
									<option value="${supplierList.firmName}" ${supplierList.firmName == supplierid ? 'selected' : ''} id="${supplierList.firmName}" >${supplierList.firmName}</option>
						 		</c:forEach>
	                        </select>
                      </div> --%>
                      </div>
                      <%--  <div class="col-lg1-2 col-lg-2">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="model.label"/></label>
                           <select class="form-control" id="outletDepartmentId" >
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                           
	                        </select>
                      </div>
                      </div> --%>
                     
                      <div class="col-lg1-2 col-lg-2">
	               <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;">
	                   <label><spring:message code="offer_end_date.label"/></label>
	                 	<input class="form-control calendar_icon form-group" readonly="readonly" value="${enddate}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div>
                    </div>
                  </div>
                  <div class="col-lg-1" style="    width: 12%;    background: #ccc;">
                  <div class="col-lg-12" style="    border-top: 5px solid #ccc; border-bottom: 5px solid #ccc;">
                  <div class="row">
                  <a onclick="viewCustomerVisits('customerVisits','0','false')" class="btn bg-olive btn-inline" style="padding: 4px 8px;margin-bottom: 16px;width: 100%;margin-top: 16px;"><spring:message code="searchbutton.label"/></a>
                  </div>
                  <div class="row">
                  <a onclick="resetForm();" style="padding: 4px 8px;margin-bottom: 16px;width: 100%;margin-top: 16px;" class="btn bg-olive btn-inline"><spring:message code="clearbutton.label"/></a>
                  </div>
                  </div></div> <%-- <div class="col-lg-11"></div>
			                <div class="col-lg-1 summaryBtn">
			                <a id="summaryTag"  data-toggle="modal" data-target="#items-modal">
			                	<img class="summaryImg" src="${pageContext.request.contextPath}/images/summary.png" onclick="getstockRequestSummary()" style="cursor: pointer;" >
			                </a>
			                </div> --%>
                  <div class="col-lg-12">
                  <br>
                  </div>
                      <%--  <div class="col-lg-1" style="float: right;margin-top: 17px;padding-left: 0px;padding-right:0px">
		   <input type="button" class="addBtn btn bg-olive btn-inline" data-toggle="modal" data-target="#myModalIos" style="font-size: 16px;" value="<spring:message code="save.label" />" />
		 </div> --%><br>

		 <div class="col-lg-1 col-xs-2" style="padding-left: 0px;">
                <select class="form-control" id="maxRecords" style="padding: 3px 4px;" onchange="viewCustomerVisits('customerVisits','0','false')">
               		<option value="10" ${maxRecords == '10' ? 'selected' : ''}>10</option>
               		<option value="25" ${maxRecords == '25' ? 'selected' : ''}>25</option>
               		<option value="50" ${maxRecords == '50' ? 'selected' : ''}>50</option>
              		<option value="100" ${maxRecords == '100' ? 'selected' : ''}>100</option>
               	</select>
           </div>
                  <div class="col-lg-10 col-xs-12" style="padding-left: 0px;padding-right: 0px;">
                      	
                      	<div class="wrapper">
	        	 		 <input type="text"  class="form-control" value="${searchName}" id="supplierReport" placeholder="<spring:message code="search.items.here.label" />" />
						<!-- 	<input type="button" value="Search" id="mySearch"> -->
						<button id="mySearch" class="searchbutton"></button>
						 
							</div>
                      	
                      	 <%-- <input type="text" value="${searchName}"  class="form-control searchItems searchBar" style=""  id="supplierReport" placeholder="<spring:message code="search.items.here.label" />" />
							<div class="services">
				    			<div class="items">
				     				<ul class="matchedStringUl shipmentreceiptReport" style=""></ul>
				   				</div>
							</div> --%>
						<input type="hidden" id="stock" value="${searchName}">
                    </div>
                    <div class="col-lg-1" style="text-align: center;padding-right: 0px;padding-bottom: 4px;">
		   <input type="button" class="addBtn btn bg-olive btn-inline" data-toggle="modal" data-target="#myModalIos"  style="font-size: 16px;" value="<spring:message code="save.label" />" />
		 </div>
                    
                    
                          <div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;width:100%;position: relative;white-space: nowrap;">
				        <table id="example1" class="table table-bordered table-striped">
           <thead style="background-color: #3c8dbc; color: #ffffff">
               <tr>
                  <th><div ><spring:message code="s.no.label" /></div></th>
                   <th><div ><spring:message code="contact.number.label" /></div></th>
                    <th><spring:message code="customer.id.label" /></th>
                   <th><spring:message code="name.label" /></th>
                    <th>Email</th>
                   <th><spring:message code="customerCategory.label" /></th>
                   <th><spring:message code="location.label" /></th>
                   <th>First Visited Date</th>
                   <th><spring:message code="walkinCount.label" /></th>
                   <th><spring:message code="onlineCount.label" /></th>
                    <th><spring:message code="avgBillAmt.label" /></th>
                   <th><spring:message code="conversionRatio.label" /></th>
                   <!-- <th >Item</th> -->
                   <%-- <th><div ><spring:message code="Billing_amount.label" /></div></th>
                   <th><div ><spring:message code="billing_discount.label" /></div></th> --%>
               </tr>
           </thead>
           <tbody style="text-align: center;">
            <c:forEach var="customerDetails" items="${customerVisitList}" varStatus="theCount">
             <tr>
                <td>${customerDetails.slNo}</td>
                 <td>${customerDetails.phoneNumber}</td>
                  <td>${customerDetails.customerId}</td>
                 <td>${customerDetails.customerName}</td>
                 <td>${customerDetails.emailId}</td>
                 <td>${customerDetails.category}</td>
                 <td>${customerDetails.store_location}</td>
                 <td>${customerDetails.recentVisitDate}</td>
                  <td>${customerDetails.walkInCount}</td>
                 <td>${customerDetails.onlineCount}</td>
                 <td>${customerDetails.avgBillAmt}</td>
                 <td>${customerDetails.convertionRatio}</td>
                
			</tr>
            </c:forEach>
          
           </tbody>
       </table></div>
                      
              <div class="row" style=" margin-bottom: 6px;">
                <div class="col-lg-12">
              
               <div class="col-lg-10"></div>
             
              <div class="col-lg-2" style="float:right;border:1px solid #cccc;padding :3px;" > 
               <fmt:formatNumber var="totalTurnoverAmount" type="number" minFractionDigits="2" maxFractionDigits="2" value="${totalTurnover}" />
<!-- 	               <div class="col-lg-8" style="padding-left:0px;padding-right: 0px;"> -->
	                   <label style="font-size:16px;font-weight:bold"><spring:message code="turnover.label"/></label>:&nbsp;${totalTurnoverAmount}
<!-- 	                 	<input value="" type="text" style="background-color: white;" id="to" size="20" type="text" /> -->
<!-- 		           </div> -->
		          </div>
               <div class="col-lg-1" style="float:right;border:1px solid #cccc;padding :3px;margin-right: 6px;">
	               
	                   <label style="font-size:16px;font-weight:bold"><spring:message code="noOFVisits.label"/></label>:&nbsp;${noOfCustomerVisits}
	                 	<!-- <input value="" type="text" style="background-color: white;" id="to" size="20" type="text" /> -->
		        
		          </div>
              
              </div>
          </div>            
                     
<!--         <input type="hidden" id="supplierdownloadurl" value=""> -->
              <div class="row">
               <input type="hidden" id="flowUnder" value="${flowUnder}">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewCustomerVisits('customerVisits','${totalValue}','false')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewCustomerVisits('customerVisits','${index - (maxRecords + 1)}','false');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="return viewCustomerVisits('customerVisits','${index - (maxRecords + 1)}','false');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="viewCustomerVisits('customerVisits','${totalValue}','false')">
              	</div> 
              	</c:if>
              	
              	
              	
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
              		  <input type="button" onclick="viewCustomerVisits('customerVisits',document.getElementById('pagination').value,'false')" class="btn bg-olive btn-inline  addBtn" value="GO">
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
        <div class="modal-body" style="">
       <div class="form-group col-lg-12" style="padding: 0px;font-size: 15px">Are you sure,you want to save the  file
       
          <!-- <div class="col-lg-1"> -->
          <input type="hidden" id="stockdownloadurl" value="${filepath}">
        <!--  </div> -->
         </div>
        <div class="form-group col-lg-12"></div>
          <div class="col-lg-4 col-sm-6 col-xs-6" style=""></div>
          <div class="form-group col-lg-8 col-sm-6 col-xs-6" style="padding-left: 0px; padding-right: 0px;">
<div class="col-lg-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-right: 5px;">
 <input type="button" class="iosclosebutton1" onclick="printCustomerVisits('customerVisits','0','true')"  value="Ok">
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
    
    
    
    
    
 <%--  <form action="#" method="post" id="xReportsDisplay">
            <%@ include file="suppliesReport.jsp" %>
         </form> --%>
   
    
    
    
    
    
    
    
    
    
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
                 <div class="modal-body" style="">
                  <div class="box-body table-responsive" id="summary">
                  <canvas id="stocksLineChart" height="350 !important;" width="600  !important;"></canvas>
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
                $("#stockLedger").dataTable({
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