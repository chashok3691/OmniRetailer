<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sneha
 * file name		        : FinancialManagement/Reconciliation.jsp
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
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/FinantialManagement/orginizationMaster.js"></script>
         <script type="text/javascript" src="${pageContext.request.contextPath}/js/procurement/shipmentNotes.js"></script>
        
<style type="text/css">
@media only screen and (max-width:767px){
.table-responsive{
 overflow:hidden;
}
}
.calendars-popup {
    z-index: 1045 !important;
}
.manStar
{
    font-size: 16px;
    color: red;
    margin-left: 5px;
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


.table-responsive {
    min-height: .01%;
    overflow-x: auto;
}


</style>  

<script type="text/javascript">
 $(document).ready(function(){
	 callCalender('start_date');
	  callCalender('end_date');
	  callCalender('payment_date');
	  callCalender('date');
	  callCalender('editpayment_date');
	  callCalender('editdate');
	  callCalender('paiddate');
	  callCalender('editpaiddate');
	  
	 
 });
</script>
</head>
<body>
<!-- Main content -->
<section class="content">
<div class="row" >
  <div class="col-lg-12" >
  <div class="box box-primary" style="">
       <div class="box-header" style="text-align: center;padding-bottom: 0px; ">				
		<h3 class="box-title" style="border: 1px solid gray;padding: 5px;padding-left: 40px;padding-right: 40px;"><spring:message code="Accounting.PettyCash.label"/></h3>

	</div><!-- /.box-header -->
	    <div class="box-body table-responsive" style="over-flow:auto;">
	      
	      <div class="row" style="padding-left:15px;padding-right:15px;margin-bottom: 52px;">
                              <div class="col-lg-11" style="background: #eee; width: 88%; padding-top: 0px; padding-bottom: 0px;height: 140px">
                  <div class="row" style="padding-bottom: 15px;">
                  <input type="hidden" id="orderworkflow" value="${status}"/>
                         <div class="col-lg-3">
                       <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                        <label><spring:message code="Organization.label"/></label>
                          <select class="form-control" id="organization" onchange="getOrganizationlocations()">
                           <option value=""><spring:message code="ALL.label"/></option>
                           		 <c:forEach var="organization" items="${OrganizationList}">
							<option value="${organization.organizationId}" ${organization.organizationId == selectedOrganization ? 'selected' : ''} id="${organization.organizationId}" >${organization.organizationId}</option>
						</c:forEach>
	                        </select>
                         </div>
                      </div>  
                      
                      
                     <div class="col-lg-3">
              <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">  
                      <label><spring:message code="location.label"/></label>
	             <select class="form-control form-group" id="location" onchange="countersByLocation('outletLocation','counterId');">
                     	<option value=""><spring:message code="ALL.label"/></option>
                        <c:forEach var="location" items="${OrganizationlocationsList}">
						
							<option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
							
							
	 					</c:forEach>
                 </select>
                  </div>
                  </div>    
                     
              
                 
                 <div class="col-lg-2">
                 
				 </div>
					
                      <div class="col-lg-2">
                 
					  </div>
                          
	          <div class="col-lg-2">
              <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                  <input type="hidden" id="type" value="${type}">
				  <input type="hidden" id="sd" value="${startDate}">
				  <input type="hidden" id="ed" value="${endDate}">
				  <label><spring:message code="offer_start_date.label"/></label>
				  <input class="form-control  calendar_icon" value="${startDate}" style="background-color: white;" id="start_date" autocomplete="off" size="20" type="text"  onfocus="callCalender('start_date')" onclick="callCalender('start_date')" placeholder="DD/MM/YYYY" />
	          </div>
	          </div>	   
	                      	         	         
          </div>
                    
             <div class="row">
                       <div class="col-lg-3">
                       <div class="col-lg-9" style="padding-left:0px;padding-right: 0px;">
                        
                        <label><spring:message code="zone.label"/></label>
                           <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZoneForDashboard('outletZone','outletLocation','')">
                           		 <option value="" selected><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
                     
                      </div>
                      </div>
                      
                      <div class="col-lg-3">
                       
                      </div>
                      
                    <div class="col-lg-2">
                    
                     </div>
                     
                     <div class="col-lg-2" >
                
					</div>
					
                <div class="col-lg-2">
	               <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
	                  <label><spring:message code="offer_end_date.label"/></label>
				      <input class="form-control  calendar_icon" value="${endDate}" style="background-color: white;" id="end_date" autocomplete="off" size="20" type="text" onfocus="callCalender('end_date')" onclick="callCalender('end_date')" placeholder="DD/MM/YYYY" />
		           </div>
		          </div>   
		                        
               </div>
              
                  </div>
                  <div class="col-lg-1" style="padding-right:15px;border-right: 1px solid #ccc;padding-top: 7px;padding-bottom: 22px;width: 12%;padding: 10px 15px;background: #ccc;height: 140px;">
                  <div class="col-lg-9" style="">
                  <div class="row">
                  
                   <input type="hidden" id="type" value="${type}">
                      
                   <input type="button" style="margin-top:18px;width: 135%;" class="btn bg-olive btn-inline addBtn" onclick="getPettyCash('','pettyCash','','false')" value="<spring:message code="search" />" />
                  </div>
                  <div class="row">
                  <a onclick="getPettyCash('back','pettyCash','','false')" style="margin-top:31px;width: 135%;"  class="btn bg-olive btn-inline addBtn"><spring:message code="clearbutton.label"/></a>
                  </div>
                  </div></div>
                     <div class="row">
	           <div class="col-lg-12">
                  <div class="col-lg-7" style="margin-top: 11px; padding-left: 0px;padding-right:7px;">
                      <div class="wrapper">	 
                         <input type="text"  class="form-control"  value="" id="searchAccount"  />												
					  </div>
						
                    </div>
   	
		       <div class="col-lg-2" style="margin-top: 10px;padding-left:0px;padding-right:1px;">
	           <input type="button" style="float: right;" data-toggle="modal" data-target="#newPaymentModal" class="btn bg-olive btn-inline addBtn" onclick="" value="<spring:message code="New.payment.label" />" />
	          </div>
           
            <div class="col-lg-2" style="margin-top: 10px;padding-left:5px;padding-right:1px;">
	           <input type="button" style="float: right;" data-toggle="modal" data-target="#newRceiptsModal"  class="btn bg-olive btn-inline addBtn" onclick="" value="New Receipt" />
	          </div>
           <div class="col-lg-1" style="float:right;padding-right:0px;margin-top:10px;padding-left:5px;">
            <input type="button" class="btn bg-olive btn-inline  addBtn" onclick="getPettyCash('back','pettyCash','','true')" value="Save" >
            <input type="hidden" id="stockdownloadurl" value="${downloadurl}">                         
           </div>
          
           </div>
		        </div>
                </div>
                
         <input type="hidden" id="fileDownloadurl" value="${filePath}">
         
<div id="Error" class="Error" style="margin-top:-40px;text-align:center;color:red;font-weight:bold;">${err}</div>
<div id="Success" class="Error" style="margin-top:-40px;text-align:center;color:blue;font-weight:bold;">${success}</div>
  
  
   <div class="col-lg-12 nopadding"   style=" margin-top: -1%;">
   <div class="col-lg-6 nopadding" style="">
    
   
   <table id="cashReceiptList" class="table table-bordered table-striped" style="margin-top:0px;width:100%;">
          
          <thead style="background-color: #3c8dbc; color: #ffffff">
                
                <tr>
                     <th><spring:message code="Txn.sno"/></th>
                     <th><spring:message code="export.select.location.label"/></th>
                      <th><spring:message code="receipt.Id" /></th>
                 	 <th><spring:message code="Txn.Date" /></th>
                 	 <th><spring:message code="Txn.Description" /></th>                 	 
                     <th><spring:message code="receipt.amt"/></th>
                      <th><spring:message code="Action.label" /></th>             	
                 </tr>
                 
             </thead>
             <tbody style="text-align: center;white-space: nowrap;">
                  <c:forEach var="cashReceipts" items="${paymentsList.cashReceipts}" varStatus="TheCount">
                   <tr>
                    <td>${TheCount.count}</td>
             	 	<td>${cashReceipts.location}</td>
             	 	<td>${cashReceipts.receiptId}</td>
             	 	<td>${cashReceipts.transactionDateStr}</td>
             	 	 <td>${cashReceipts.transactionDescription}</td>
             	 	 <td>${cashReceipts.receiptAmount}</td>	 
                    <td><a style="color:#2e7ea7 !important;cursor: pointer;margin-right:6px;" onclick="viewCashReceipt('View','${cashReceipts.receiptId}')">View</a>
                         <a style="color:#2e7ea7 !important;cursor: pointer;margin-right:6px;" onclick="viewCashReceipt('Edit','${cashReceipts.receiptId}')">Open</a> 
                      </td>
                     </tr>
                </c:forEach> 
             </tbody>
         </table> 
   </div>
    <div class="col-lg-6 nopadding" style="">
    <table id="cashPaymentList" class="table table-bordered table-striped" style="margin-top:0px;width:100%;">
          
          <thead style="background-color: #3c8dbc; color: #ffffff">
                
                <tr>
                  
                    <th><spring:message code="Txn.sno"/></th>
                     <th><spring:message code="export.select.location.label"/></th>
                      <th><spring:message code="payment.Id" /></th>
                 	 <th><spring:message code="Txn.Date" /></th>
                 	 <th><spring:message code="Txn.Description" /></th>                 	 
                     <th><spring:message code="paid.amt"/></th>
                     <th><spring:message code="Action.label" /></th>           	
                 </tr>
                 
             </thead>
             <tbody style="text-align: center;white-space: nowrap;">
                  <c:forEach var="cashPayments" items="${paymentsList.cashPayments}" varStatus="TheCount">
                   <tr>
                    <td>${TheCount.count}</td>
                   <td>${cashPayments.location}</td>
             	 	<td>${cashPayments.paymentId}</td>
             	 	<td>${cashPayments.transactionDateStr}</td>
             	 	 <td>${cashPayments.transactionDescription}</td>
             	 	 <td>${cashPayments.paidAmount}</td>	             	      
                      <td><a style="color:#2e7ea7 !important;cursor: pointer;margin-right:6px;" onclick="viewCashPayments('View','${cashPayments.paymentId}')">View</a>
                         <a style="color:#2e7ea7 !important;cursor: pointer;margin-right:6px;" onclick="viewCashPayments('Edit','${cashPayments.paymentId}')">Open</a> 
                      </td>
                     </tr>
                </c:forEach> 
               
             </tbody>
         </table> 
   </div>
         
            </div>
                    
         </div>
 	</div>
	</div>
	
<!--New Payments model start  -->
<div class="modal fade" id="newPaymentModal" role="dialog">
          <div class="modal-dialog modal-lg" style="margin-top: 7%">
          <div class="modal-content" style="width: 75%;margin-left: 15%;">
           <div class="modal-header">
        	          	<h3 class="box-title" style="text-align: center;" ><label style="border: 1px solid gray;padding: 5px;padding-left: 40px;padding-right: 40px;">Cash Payment</label></h3>


          </div>
           <div id="paymentError" class="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
            <div id="paymentSuccess" class="Error" style="text-align:center;color:blue;font-weight:bold;">${success}</div>
   <div class="modal-body" style="padding-top:0px;">
   
   <div class="row" style="padding:0px;">
  <div class="col-sm-12 col-lg-12 col-xs-12" style="padding:0px;">
  <div class="col-sm-3 col-lg-3 col-xs-3">
   <label>Location</label>
   <select class="form-control" id="paymentLocation" onchange="">
     <%--  <c:forEach var="location" items="${locationsList}">
		<option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
	 	</c:forEach> --%>
	 	<c:forEach var="organizationlocation" items="${OrganizationlocationsList}">			
			<option value="${organizationlocation.locationId}" ${organizationlocation.locationId == selectedLocation ? 'selected' : ''}>${organizationlocation.locationId}</option>			
	 	</c:forEach>
       </select>
  </div>
  <div class="col-sm-6 col-lg-6 col-xs-6">
  
  </div>
  <div class="col-sm-3 col-lg-3 col-xs-3">
   <label>Date<span class="manStar">*</span></label>
	<input class="form-control  calendar_icon" value="" style="background-color: white;" id="payment_date" autocomplete="off" size="20" type="text"  onfocus="callCalender('payment_date')" onclick="callCalender('payment_date')" placeholder="DD/MM/YYYY" />
	         
  </div>
  
  </div>
  
  <div class="col-sm-12 col-lg-12 col-xs-12" style="padding:0px;margin-bottom:20px;">
  <div class="col-sm-3 col-lg-3 col-xs-3">
   <label>Claimed by</label>
  <input class="form-control" type="text" id="voucherno" value=""/>
  </div>
  <div class="col-sm-6 col-lg-6 col-xs-6">
  </div>
  <div class="col-sm-3 col-lg-3 col-xs-3">    
  <label>Paid Date<span class="manStar"></span></label>
	<input class="form-control  calendar_icon" value="" style="background-color: white;" id="paiddate" autocomplete="off" size="20" type="text"  onfocus="callCalender('paiddate')" onclick="callCalender('payment_date')" placeholder="DD/MM/YYYY" />     
  </div>
  </div>
 <!-- filters end -->  
 
 <div class="col-sm-12 col-lg-12 col-xs-12">
   <table id="slabLis" class="table table-bordered table-striped" style="margin-top:0px;width:100%;">  
          <thead style="background-color: #3c8dbc; color: #ffffff">
                <tr>
                  
                     <th><spring:message code="Txn.sno"/></th>
                     <th>Voucher No</th>
                 	 <th>Description</th> 
                 	 <th>Vendor Name</th>
                 	 <th>Approved By</th>                	 
                     <th>Amount</th>
                     <th><spring:message code="Action.label" /></th>           	
                 </tr>
                 
             </thead>
             <tbody style="text-align: center;white-space: nowrap;">
                 <tr id="productrange1">
																	<td style="width: 12%" id="sno1">1</td>
																	<td><input class="form-control " type="text" id="" placeholder=""/></td>
																	<td ><input class="form-control minQtyProduct" type="text" id="1description" placeholder="Description*"/></td>
																	<td><input class="form-control " type="text" id="" placeholder=""/></td>
																	<td><input class="form-control " type="text" id="" placeholder=""/></td>
																	<td ><input class="form-control minAmtProduct" type="text" id="1amt" placeholder="Amount*"
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
																	
																	
                                                     <td style="width: 7%"><div style="width: 60px;">
															<img
																src="${pageContext.request.contextPath}/images/addslab.png"
																style="width: 33px; cursor: pointer;"
																onclick="addProductOfferSlab()"> <img
																src="${pageContext.request.contextPath}/images/itemdelete1.png"
																style="width: 24px; cursor: pointer;" id="1imgProduct"
																	onclick="deleteProductSlab($(this).closest('tr').attr('id'))">
														</div></td>

																</tr>
             </tbody>
         </table> 	 
      
  </div>
 
 <div class="col-sm-12 col-lg-12 col-xs-12" style="border-top: 1px solid lightgray;padding-top: 10px;padding-bottom: 10px;border-bottom: 1px solid lightgrey;margin-top: 20px;
    width: 98%;margin-left: 1%;">
 <div class="col-sm-3 col-lg-3 col-xs-3">       
 </div>
 <div class="col-sm-3 col-lg-3 col-xs-3">
 <!-- <label>Total Payments</label>       --> 
 </div>
 <div class="col-sm-3 col-lg-3 col-xs-3">
<%-- <input class="form-control minQtyProduct" readonly="readonly" type="text" value="${totalPayments}" id="totalPayments"/>  --%>
 </div>
 <div class="col-sm-3 col-lg-3 col-xs-3">       
 </div>    
  </div>
 
<div class="col-sm-12 col-lg-12 col-xs-12" style="margin-top: 20px;">
 <div class="col-sm-3 col-lg-3 col-xs-3">       
 </div>
 <div class="col-sm-3 col-lg-3 col-xs-3">
 <input type="button" style="width: 60%;" class="btn bg-olive btn-inline addBtn" onclick="createCashPayment('new','pettyCash')" value="Submit" />	              
 </div>
 <div class="col-sm-3 col-lg-3 col-xs-3">
 <input type="button" style="width: 60%;" class="btn bg-olive btn-inline addBtn" data-dismiss="modal" onclick="getPettyCash('back','pettyCash','','false')" value="Cancel" />              
 </div>
 <div class="col-sm-3 col-lg-3 col-xs-3">       
 </div>    
  </div> 
 
  </div> 
<!-- model body end -->      
   </div>
   </div>
 </div>
    </div>

<!--New Payments model end  -->

	
<!--View Payments model start  -->
<div class="modal fade" id="viewPaymentModal" role="dialog">
          <div class="modal-dialog modal-lg" style="margin-top: 7%">
          <div class="modal-content" style="width: 75%;margin-left: 15%;">
           <div class="modal-header">
        	          	<h3 class="box-title" style="text-align: center;" ><label style="border: 1px solid gray;padding: 5px;padding-left: 40px;padding-right: 40px;">View Cash Payment</label></h3>

          </div>
           <div id="" class="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
            <div id="" class="Error" style="text-align:center;color:blue;font-weight:bold;">${success}</div>
   <div class="modal-body" style="padding-top:0px;">
   
   <div class="row" style="padding:0px;">
  <div class="col-sm-12 col-lg-12 col-xs-12" style="padding:0px;">
  <div class="col-sm-3 col-lg-3 col-xs-3">
   <label>Location</label>
   <select class="form-control" disabled="disabled" id="paymentLocation" onchange="">
     <option value=""><spring:message code="ALL.label"/></option>
      <c:forEach var="location" items="${OrganizationlocationsList}">
		<option value="${location.locationId}" ${location.locationId ==  paymentsList.cashBookList[0].location  ? 'selected' : ''}>${location.locationId}</option>
	 	</c:forEach>
       </select>
  </div>
  <div class="col-sm-6 col-lg-6 col-xs-6">
  
  </div>
  <div class="col-sm-3 col-lg-3 col-xs-3">
   <label>Date</label>
	<input class="form-control  calendar_icon" value="${paymentsList.cashBookList[0].transactionDateStr} " disabled="disabled" style="background-color: white;" id="payment_date" autocomplete="off" size="20" type="text"  onfocus="callCalender('payment_date')" onclick="callCalender('payment_date')" placeholder="DD/MM/YYYY" />
	         
  </div>
  </div>
  
  <div class="col-sm-12 col-lg-12 col-xs-12" style="padding:0px;margin-bottom:20px;">
  <div class="col-sm-3 col-lg-3 col-xs-3">
   <label>Claimed by</label>
  <input class="form-control" type="text" value="${paymentsList.cashBookList[0].voucherNo} " disabled="disabled" id="voucherno" value=""/>
  </div>
  <div class="col-sm-6 col-lg-6 col-xs-6">
  </div>
  <div class="col-sm-3 col-lg-3 col-xs-3"> 
  <label>Paid Date<span class="manStar"></span></label>
	<input class="form-control  calendar_icon" value="" style="background-color: white;" id="paiddate" autocomplete="off" size="20" type="text"  onfocus="callCalender('paiddate')" onclick="callCalender('paiddate')" placeholder="DD/MM/YYYY" />             
  </div>
  </div>
 <!-- filters end -->  
 
 <div class="col-sm-12 col-lg-12 col-xs-12">
   <table id="" class="table table-bordered table-striped" style="margin-top:0px;width:100%;">  
          <thead style="background-color: #3c8dbc; color: #ffffff">
                <tr>
                  
                     <th><spring:message code="Txn.sno"/></th>
                     <th>Voucher No</th>
                 	 <th>Description</th>
                 	 <th>Vendor Name</th>
                 	 <th>Approved By</th>                 	 
                     <th>Amount</th>
                     <th><spring:message code="Action.label" /></th>           	
                 </tr>
                 
             </thead>
             <tbody style="text-align: center;white-space: nowrap;">
                 <tr id="productrange1">
																	<td style="width: 12%" id="sno1">1</td>
																	<td ><input class="form-control " type="text" disabled="disabled" value="" id=""/></td>
																	<td ><input class="form-control minQtyProduct" type="text" disabled="disabled" value="${paymentsList.cashBookList[0].transactionDescription} " id="1description"/></td>
																	<td ><input class="form-control " type="text" disabled="disabled" value="" id=""/></td>
																	<td ><input class="form-control " type="text" disabled="disabled" value="" id=""/></td>
																	<td ><input class="form-control minAmtProduct" type="text" disabled="disabled" value="${paymentsList.cashBookList[0].transactionAmount} " id="1amt"
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
																	
																	
                                                     <td style="width: 7%"  ><div style="width: 60px; " >
															<img
																src="${pageContext.request.contextPath}/images/addslab.png"
																style="width: 33px; cursor: pointer;"
																 > <img
																src="${pageContext.request.contextPath}/images/itemdelete1.png"
																style="width: 24px; cursor: pointer;" id="1imgProduct"
																	>
														</div></td>

																</tr>
             </tbody>
         </table> 	 
      
  </div>
 
 <div class="col-sm-12 col-lg-12 col-xs-12" style="border-top: 1px solid lightgray;padding-top: 10px;padding-bottom: 10px;border-bottom: 1px solid lightgrey;margin-top: 20px;
    width: 98%;margin-left: 1%;">
 <div class="col-sm-3 col-lg-3 col-xs-3">       
 </div>
 <div class="col-sm-3 col-lg-3 col-xs-3">
 <!-- <label>Total Payments</label>       --> 
 </div>
 <div class="col-sm-3 col-lg-3 col-xs-3">
<%-- <input class="form-control minQtyProduct" readonly="readonly" type="text" value="${totalPayments}" id="totalPayments"/>  --%>
 </div>
 <div class="col-sm-3 col-lg-3 col-xs-3">       
 </div>    
  </div>
 
<div class="col-sm-12 col-lg-12 col-xs-12" style="margin-top: 20px;">
 <div class="col-sm-3 col-lg-3 col-xs-3">       
 </div>
 <div class="col-sm-3 col-lg-3 col-xs-3">
 <input type="button" style="width: 60%; display: none" class="btn bg-olive btn-inline addBtn" onclick="createCashPayment('cash','pettyCash')" value="Submit" />	              
 </div>
 <div class="col-sm-3 col-lg-3 col-xs-3">
 <input type="button" style="width: 60%;" class="btn bg-olive btn-inline addBtn" data-dismiss="modal" onclick="getPettyCash('back','pettyCash','','false')" value="Cancel" />              
 </div>
 <div class="col-sm-3 col-lg-3 col-xs-3">       
 </div>    
  </div> 
 
  </div> 
<!-- model body end -->      
   </div>
   </div>
 </div>
    </div>

<!--View Payments model end  -->

	
<!--Edit Payments model start  -->
<div class="modal fade" id="editPaymentModal" role="dialog">
          <div class="modal-dialog modal-lg" style="margin-top: 7%">
          <div class="modal-content" style="width: 75%;margin-left: 15%;">
           <div class="modal-header">
        	          	<h3 class="box-title" style="text-align: center;" ><label style="border: 1px solid gray;padding: 5px;padding-left: 40px;padding-right: 40px;">Edit Cash Payment</label></h3>

          </div>
           <div id="editpaymentError" class="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
            <div id="editpaymentSuccess" class="Error" style="text-align:center;color:blue;font-weight:bold;">${success}</div>
   <div class="modal-body" style="padding-top:0px;">
   
   <div class="row" style="padding:0px;">
  <div class="col-sm-12 col-lg-12 col-xs-12" style="padding:0px;">
  <div class="col-sm-3 col-lg-3 col-xs-3">
   <label>Location</label>
   <select class="form-control" id="editpaymentLocation" onchange="">
     <%-- <option value=""><spring:message code="ALL.label"/></option>
      <c:forEach var="location" items="${locationsList}">
		<option value="${location.locationId}" ${location.locationId == paymentsList.cashBookList[0].location ? 'selected' : ''}>${location.locationId}</option>
	 	</c:forEach> --%>
	 		<c:forEach var="organizationlocation" items="${OrganizationlocationsList}">			
			<option value="${organizationlocation.locationId}" ${organizationlocation.locationId == paymentsList.cashBookList[0].location ? 'selected' : ''}>${organizationlocation.locationId}</option>			
	 	</c:forEach>
       </select>
  </div>
  <div class="col-sm-6 col-lg-6 col-xs-6">
  
  </div>
  <div class="col-sm-3 col-lg-3 col-xs-3">
   <label>Date<span class="manStar">*</span></label>
	<input class="form-control  calendar_icon" value="${paymentsList.cashBookList[0].transactionDateStr }" style="background-color: white;" id="editpayment_date" autocomplete="off" size="20" type="text"  onfocus="callCalender('editpayment_date')" onclick="callCalender('editpayment_date')" placeholder="DD/MM/YYYY" />
	         
  </div>
    	<input type="hidden" class="form-control" value="${paymentsList.cashBookList[0].transactionId}" style="background-color: white;" id="editapaymenttransationId" autocomplete="off" size="20" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"   placeholder="Received Amt" />
  
  </div>
  
  <div class="col-sm-12 col-lg-12 col-xs-12" style="padding:0px;margin-bottom:20px;">
  <div class="col-sm-3 col-lg-3 col-xs-3">
   <label>Claimed by</label>
  <input class="form-control" value="${paymentsList.cashBookList[0].voucherNo }" type="text" id="editvoucherno" value=""/>
  </div>
  <div class="col-sm-6 col-lg-6 col-xs-6">
  </div>
  <div class="col-sm-3 col-lg-3 col-xs-3"> 
  <label>Paid Date<span class="manStar"></span></label>
	<input class="form-control  calendar_icon" value="" style="background-color: white;" id="editpaiddate" autocomplete="off" size="20" type="text"  onfocus="callCalender('editpaiddate')" onclick="callCalender('editpaiddate')" placeholder="DD/MM/YYYY" />             
  </div>
  </div>
 <!-- filters end -->  
 
 <div class="col-sm-12 col-lg-12 col-xs-12">
   <table id="editslabLis" class="table table-bordered table-striped" style="margin-top:0px;width:100%;">  
          <thead style="background-color: #3c8dbc; color: #ffffff">
                <tr>
                  
                     <th><spring:message code="Txn.sno"/></th>
                     <th>Voucher No</th>
                 	 <th>Description</th>  
                 	 <th>Vendor Name</th>   
                 	 <th>Approved By</th>            	 
                     <th>Amount</th>
                     <th><spring:message code="Action.label" /></th>           	
                 </tr>
                 
             </thead>
             <tbody style="text-align: center;white-space: nowrap;">
                 <tr id="productrange1">
																	<td style="width: 12%" id="sno1">1</td>
																	<td><input class="form-control " type="text" value="" id=""/></td>
																	<td ><input class="form-control minQtyProduct" type="text" value="${paymentsList.cashBookList[0].transactionDescription }" id="1editdescription"/></td>
																	<td><input class="form-control " type="text" value="" id=""/></td>
																	<td><input class="form-control " type="text" value="" id=""/></td>
																	<td ><input class="form-control minAmtProduct" type="text" value="${paymentsList.cashBookList[0].transactionAmount }" id="1editamt"
																		oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" /></td>
																	
																	
                                                     <td style="width: 7%"><div style="width: 60px;">
															<img
																src="${pageContext.request.contextPath}/images/addslab.png"
																style="width: 33px; cursor: pointer;"
																> <img
																src="${pageContext.request.contextPath}/images/itemdelete1.png"
																style="width: 24px; cursor: pointer;" id="1imgProduct"
																	>
														</div></td>

																</tr>
             </tbody>
         </table> 	 
      
  </div>
 
 <div class="col-sm-12 col-lg-12 col-xs-12" style="border-top: 1px solid lightgray;padding-top: 10px;padding-bottom: 10px;border-bottom: 1px solid lightgrey;margin-top: 20px;
    width: 98%;margin-left: 1%;">
 <div class="col-sm-3 col-lg-3 col-xs-3">       
 </div>
 <div class="col-sm-3 col-lg-3 col-xs-3">
 <!-- <label>Total Payments</label>       --> 
 </div>
 <div class="col-sm-3 col-lg-3 col-xs-3">
<%-- <input class="form-control minQtyProduct" readonly="readonly" type="text" value="${totalPayments}" id="totalPayments"/>  --%>
 </div>
 <div class="col-sm-3 col-lg-3 col-xs-3">       
 </div>    
  </div>
 
<div class="col-sm-12 col-lg-12 col-xs-12" style="margin-top: 20px;">
 <div class="col-sm-3 col-lg-3 col-xs-3">       
 </div>
 <div class="col-sm-3 col-lg-3 col-xs-3">
 <input type="button" style="width: 60%;" class="btn bg-olive btn-inline addBtn" onclick="updateCashPayment('edit','pettyCash')" value="Submit" />	              
 </div>
 <div class="col-sm-3 col-lg-3 col-xs-3">
 <input type="button" style="width: 60%;" class="btn bg-olive btn-inline addBtn" data-dismiss="modal" onclick="getPettyCash('back','pettyCash','','false')" value="Cancel" />              
 </div>
 <div class="col-sm-3 col-lg-3 col-xs-3">       
 </div>    
  </div> 
 
  </div> 
<!-- model body end -->      
   </div>
   </div>
 </div>
    </div>

<!--Edit Payments model end  -->

<!--New Receipts model start  -->
<div class="modal fade" id="newRceiptsModal" role="dialog">
          <div class="modal-dialog modal-lg" style="margin-top: 7%">
          <div class="modal-content" style="width: 75%;margin-left: 15%;">
           <div class="modal-header">
          	<h3 class="box-title" style="text-align: center;" ><label style="border: 1px solid gray;padding: 5px;padding-left: 40px;padding-right: 40px;">New Receipt</label></h3>

          
          </div>
           <div id="receiptError" class="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
           <div id="receiptSuccess" class="Error" style="text-align:center;color:blue;font-weight:bold;">${success}</div>
   <div class="modal-body" style="padding-top:0px;">
   
   <div class="row" style="padding:0px;">
  <div class="col-sm-12 col-lg-12 col-xs-12" style="padding:0px;">
  <div class="col-sm-3 col-lg-3 col-xs-3">
   <label>Location</label>
   <select class="form-control" id="receiptLocation" onchange="">
     <%-- <option value=""><spring:message code="ALL.label"/></option>
       <c:forEach var="location" items="${locationsList}">
		<option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
	 	</c:forEach> --%>
	 	<c:forEach var="organizationlocation" items="${OrganizationlocationsList}">			
			<option value="${organizationlocation.locationId}" ${organizationlocation.locationId == selectedLocation ? 'selected' : ''}>${organizationlocation.locationId}</option>			
	 	</c:forEach>
       </select>
  </div>
  <div class="col-sm-3 col-lg-3 col-xs-3">
  
  </div>
  <div class="col-sm-3 col-lg-3 col-xs-3">
  
  </div>
  <div class="col-sm-3 col-lg-3 col-xs-3">
   <label>Received Amt<span class="manStar">*</span></label>
	<input class="form-control" value="" style="background-color: white;" id="received_amt" autocomplete="off" size="20" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"   placeholder="Received Amt" />
	         
  </div>
  </div>
  
  <div class="col-sm-12 col-lg-12 col-xs-12" style="padding:0px;">
  <div class="col-sm-3 col-lg-3 col-xs-3">
   <label>Received From</label>
  <select class="form-control" id="received_from" onchange="">
     <option value=""><spring:message code="ALL.label"/></option>
       <option value="Bank">Bank</option>
         <option value="Cash">Cash</option>
       </select>
  </div>
  <div class="col-sm-3 col-lg-3 col-xs-3">
   <label>Bank Account <span class="manStar">*</span></label>
  <select class="form-control" id="bank_account" onchange="">
     <option value=""><spring:message code="ALL.label"/></option>
      <c:forEach var="accountName" items="${accountName}">
		<option value="${accountName}" >${accountName}</option>
	 	</c:forEach>
       </select>
  </div>
  <div class="col-sm-3 col-lg-3 col-xs-3">
   <label>Purpose</label>
  
         	<input class="form-control" value="" style="background-color: white;" id="purpose" autocomplete="off" size="20" type="text"   placeholder="purpose" />
       
  </div>
  <div class="col-sm-3 col-lg-3 col-xs-3">         
  </div>
  </div>
  
   <div class="col-sm-12 col-lg-12 col-xs-12" style="padding:0px;margin-bottom:20px;">
  <div class="col-sm-3 col-lg-3 col-xs-3">
   <label>Date<span class="manStar">*</span></label>
  	<input class="form-control  calendar_icon" value="" style="background-color: white;" id="date" autocomplete="off" size="20" type="text"  onfocus="callCalender('date')" onclick="callCalender('date')" placeholder="DD/MM/YYYY" />

  </div>
  <div class="col-sm-3 col-lg-3 col-xs-3">
   <label>Given By</label>
  	<input class="form-control" value="" style="background-color: white;" id="given_by" autocomplete="off" size="20" type="text"   placeholder="Given By" />

  </div>
  <div class="col-sm-3 col-lg-3 col-xs-3">
   <label>Received By</label>
  	<input class="form-control" value="" style="background-color: white;" id="received_by" autocomplete="off" size="20" type="text"   placeholder="Received By" />

  </div>
  <div class="col-sm-3 col-lg-3 col-xs-3">         
  </div>
  </div>
  
 <!-- filters end -->  
 
 
 <div class="col-sm-12 col-lg-12 col-xs-12" style="margin-bottom:20px;">
  
   <label>Transaction Description<span class="manStar">*</span></label>
  	<textarea class="form-control" rows="5" cols="5" value="" placeholder="Description*" style="background-color: white; resize:none;" id="txn_description" ></textarea>

 
  </div>
 
 
<div class="col-sm-12 col-lg-12 col-xs-12" style="margin-top: 20px;">
 <div class="col-sm-3 col-lg-3 col-xs-3">       
 </div>
 <div class="col-sm-3 col-lg-3 col-xs-3">
 <input type="button" style="width: 60%;" class="btn bg-olive btn-inline addBtn" onclick="createPettyCashReceipt('new','pettyCash')" value="Submit" />	              
 </div>
 <div class="col-sm-3 col-lg-3 col-xs-3">
 <input type="button" style="width: 60%;" class="btn bg-olive btn-inline addBtn" data-dismiss="modal" onclick="getPettyCash('back','pettyCash','','false')" value="Cancel" />              
 </div>
 <div class="col-sm-3 col-lg-3 col-xs-3">       
 </div>    
  </div> 
 
  </div> 
<!-- model body end -->      
   </div>
   </div>
 </div>
    </div>

<!--New Receipts model end  -->

		
		
<!--View Receipts model start  -->
<div class="modal fade" id="viewRceiptsModal" role="dialog">
          <div class="modal-dialog modal-lg" style="margin-top: 7%">
          <div class="modal-content" style="width: 75%;margin-left: 15%;">
           <div class="modal-header">
          		<h3 class="box-title" style="text-align: center;" ><label style="border: 1px solid gray;padding: 5px;padding-left: 40px;padding-right: 40px;">View Receipt</label></h3>
          
          </div>
           <div id="" class="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
           <div id="" class="Error" style="text-align:center;color:blue;font-weight:bold;">${success}</div>
   <div class="modal-body" style="padding-top:0px;">
   
   <div class="row" style="padding:0px;">
  <div class="col-sm-12 col-lg-12 col-xs-12" style="padding:0px;">
  <div class="col-sm-3 col-lg-3 col-xs-3">
   <label>Location</label>
   <select class="form-control" id="receiptLocation" disabled="disabled" onchange="">
     <option value=""><spring:message code="ALL.label"/></option>
       <c:forEach var="location" items="${OrganizationlocationsList}">
		<option value="${location.locationId}" ${location.locationId == paymentsList.cashBookList[0].location ? 'selected' : ''}>${location.locationId}</option>
	 	</c:forEach>
       </select>
  </div>
  <div class="col-sm-3 col-lg-3 col-xs-3">
  
  </div>
  <div class="col-sm-3 col-lg-3 col-xs-3">
  
  </div>
  <div class="col-sm-3 col-lg-3 col-xs-3">
   <label>Received Amt</label>
	<input class="form-control" value="${paymentsList.cashBookList[0].transactionAmount}" disabled="disabled" style="background-color: white;" id="received_amt" autocomplete="off" size="20" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"   placeholder="Received Amt" />
	         
  </div>
  </div>
  
  <div class="col-sm-12 col-lg-12 col-xs-12" style="padding:0px;">
  <div class="col-sm-3 col-lg-3 col-xs-3">
   <label>Received From</label>
  <select class="form-control" id="received_from" disabled="disabled" onchange="">
     <option value=""><spring:message code="ALL.label"/></option>
       <option value="Bank" ${'Bank' == paymentsList.cashBookList[0].receivedFrom ? 'selected' : ''}>Bank</option>
         <option value="Cash" ${'Cash' == paymentsList.cashBookList[0].receivedFrom ? 'selected' : ''}>Cash</option>
       </select>
  </div>
  <div class="col-sm-3 col-lg-3 col-xs-3">
   <label>Bank Account</label>
  <select class="form-control" id="bank_account" disabled="disabled" onchange="">
     <option value=""><spring:message code="ALL.label"/></option>
      <c:forEach var="accountName" items="${accountName}">
		<option value="${accountName}" ${accountName == paymentsList.cashBookList[0].bankAccount ? 'selected' : ''}>${accountName}</option>
	 	</c:forEach>
       </select>
  </div>
  <div class="col-sm-3 col-lg-3 col-xs-3">
   <label>Purpose</label>
  
         	<input class="form-control" value="${paymentsList.cashBookList[0].purpose}" disabled="disabled" style="background-color: white;" id="purpose" autocomplete="off" size="20" type="text"   placeholder="purpose" />
       
  </div>
  <div class="col-sm-3 col-lg-3 col-xs-3">         
  </div>
  </div>
  
   <div class="col-sm-12 col-lg-12 col-xs-12" style="padding:0px;margin-bottom:20px;">
  <div class="col-sm-3 col-lg-3 col-xs-3">
   <label>Date</label>
  	<input class="form-control  calendar_icon" value="${paymentsList.cashBookList[0].transactionDateStr}" disabled="disabled"  style="background-color: white;" id="date" autocomplete="off" size="20" type="text"  onfocus="callCalender('date')" onclick="callCalender('date')" placeholder="DD/MM/YYYY" />

  </div>
  <div class="col-sm-3 col-lg-3 col-xs-3">
   <label>Given By</label>
  	<input class="form-control" value="${paymentsList.cashBookList[0].givenBy}" disabled="disabled"  style="background-color: white;" id="given_by" autocomplete="off" size="20" type="text"   placeholder="Given By" />

  </div>
  <div class="col-sm-3 col-lg-3 col-xs-3">
   <label>Received By</label>
  	<input class="form-control" value="${paymentsList.cashBookList[0].receivedBy}" disabled="disabled" style="background-color: white;" id="received_by" autocomplete="off" size="20" type="text"   placeholder="Received By" />

  </div>
  <div class="col-sm-3 col-lg-3 col-xs-3">         
  </div>
  </div>
  
 <!-- filters end -->  
 
 
 <div class="col-sm-12 col-lg-12 col-xs-12" style="margin-bottom:20px;">
  
   <label>Transaction Description</label>
  	<textarea class="form-control" rows="5" cols="5"  disabled="disabled"  style="background-color: white; resize:none;" id="txn_description" >${paymentsList.cashBookList[0].transactionDescription}</textarea>

 
  </div>
 
 
<div class="col-sm-12 col-lg-12 col-xs-12" style="margin-top: 20px;">
 <div class="col-sm-3 col-lg-3 col-xs-3">       
 </div>
 <div class="col-sm-3 col-lg-3 col-xs-3">
 <input type="button" style="width: 60%; display: none" class="btn bg-olive btn-inline addBtn" onclick="createPettyCashReceipt('new','pettyCash')" value="Submit" />	              
 </div>
 <div class="col-sm-3 col-lg-3 col-xs-3">
 <input type="button" style="width: 60%;" class="btn bg-olive btn-inline addBtn" data-dismiss="modal" onclick="getPettyCash('back','pettyCash','','false')" value="Cancel" />              
 </div>
 <div class="col-sm-3 col-lg-3 col-xs-3">       
 </div>    
  </div> 
 
  </div> 
<!-- model body end -->      
   </div>
   </div>
 </div>
    </div>

<!--View Receipts model end  -->

		
		
<!--Edit Receipts model start  -->
<div class="modal fade" id="editRceiptsModal" role="dialog">
          <div class="modal-dialog modal-lg" style="margin-top: 7%">
          <div class="modal-content" style="width: 75%;margin-left: 15%;">
           <div class="modal-header">
                		<h3 class="box-title" style="text-align: center;" ><label style="border: 1px solid gray;padding: 5px;padding-left: 40px;padding-right: 40px;">Edit Receipt</label></h3>

          
          </div>
           <div id="editreceiptError" class="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
           <div id="editreceiptSuccess" class="Error" style="text-align:center;color:blue;font-weight:bold;">${success}</div>
   <div class="modal-body" style="padding-top:0px;">
   
   <div class="row" style="padding:0px;">
  <div class="col-sm-12 col-lg-12 col-xs-12" style="padding:0px;">
  <div class="col-sm-3 col-lg-3 col-xs-3">
   <label>Location</label>
   <select class="form-control" id="editreceiptLocation" onchange="">
    <%--  <option value=""><spring:message code="ALL.label"/></option>
       <c:forEach var="location" items="${locationsList}">
		<option value="${location.locationId}" ${location.locationId == paymentsList.cashBookList[0].location ? 'selected' : ''}>${location.locationId}</option>
	 	</c:forEach> --%>
	 		<c:forEach var="organizationlocation" items="${OrganizationlocationsList}">			
			<option value="${organizationlocation.locationId}" ${organizationlocation.locationId == paymentsList.cashBookList[0].location ? 'selected' : ''}>${organizationlocation.locationId}</option>			
	 	</c:forEach>
	 	
       </select>
  </div>
  <div class="col-sm-3 col-lg-3 col-xs-3">
  
  </div>
  <div class="col-sm-3 col-lg-3 col-xs-3">
  
  </div>
  <div class="col-sm-3 col-lg-3 col-xs-3">
   <label>Received Amt<span class="manStar">*</span></label>
	<input class="form-control" value="${paymentsList.cashBookList[0].transactionAmount}" style="background-color: white;" id="editreceived_amt" autocomplete="off" size="20" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"   placeholder="Received Amt" />
	         
  </div>
  </div>
  	<input type="hidden" class="form-control" value="${paymentsList.cashBookList[0].transactionId}" style="background-color: white;" id="edittransationId" autocomplete="off" size="20" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"   placeholder="Received Amt" />
  
  <div class="col-sm-12 col-lg-12 col-xs-12" style="padding:0px;">
  <div class="col-sm-3 col-lg-3 col-xs-3">
   <label>Received From</label>
  <select class="form-control" id="editreceived_from" onchange="">
     <option value=""><spring:message code="ALL.label"/></option>
         <option value="Bank" ${'Bank' == paymentsList.cashBookList[0].receivedFrom ? 'selected' : ''}>Bank</option>
         <option value="Cash" ${'Cash' == paymentsList.cashBookList[0].receivedFrom ? 'selected' : ''}>Cash</option>
       </select>
  </div>
  <div class="col-sm-3 col-lg-3 col-xs-3">
   <label>Bank Account <span class="manStar">*</span></label>
  <select class="form-control" id="editbank_account" onchange="">
     <option value=""><spring:message code="ALL.label"/></option>
      <c:forEach var="accountName" items="${accountName}">
				<option value="${accountName}" ${accountName == paymentsList.cashBookList[0].bankAccount ? 'selected' : ''}>${accountName}</option>

	 	</c:forEach>
       </select>
  </div>
  <div class="col-sm-3 col-lg-3 col-xs-3">
   <label>Purpose</label>
  
         	<input class="form-control" value="${paymentsList.cashBookList[0].purpose}" style="background-color: white;" id="editpurpose" autocomplete="off" size="20" type="text"   placeholder="purpose" />
       
  </div>
  <div class="col-sm-3 col-lg-3 col-xs-3">         
  </div>
  </div>
  
   <div class="col-sm-12 col-lg-12 col-xs-12" style="padding:0px;margin-bottom:20px;">
  <div class="col-sm-3 col-lg-3 col-xs-3">
   <label>Date<span class="manStar">*</span></label>
  	<input class="form-control  calendar_icon" value="${paymentsList.cashBookList[0].transactionDateStr}" style="background-color: white;" id="editdate" autocomplete="off" size="20" type="text"  onfocus="callCalender('editdate')" onclick="callCalender('editdate')" placeholder="DD/MM/YYYY" />

  </div>
  <div class="col-sm-3 col-lg-3 col-xs-3">
   <label>Given By</label>
  	<input class="form-control" value="${paymentsList.cashBookList[0].givenBy}" style="background-color: white;" id="editgiven_by" autocomplete="off" size="20" type="text"   placeholder="Given By" />

  </div>
  <div class="col-sm-3 col-lg-3 col-xs-3">
   <label>Received By</label>
  	<input class="form-control" value="${paymentsList.cashBookList[0].receivedBy}" style="background-color: white;" id="editreceived_by" autocomplete="off" size="20" type="text"   placeholder="Received By" />

  </div>
  <div class="col-sm-3 col-lg-3 col-xs-3">         
  </div>
  </div>
  
 <!-- filters end -->  
 
 
 <div class="col-sm-12 col-lg-12 col-xs-12" style="margin-bottom:20px;">
  
   <label>Transaction Description<span class="manStar">*</span></label>
  	<textarea class="form-control" rows="5" cols="5" value="" style="background-color: white; resize:none;" id="edittxn_description" >${paymentsList.cashBookList[0].transactionDescription}</textarea>

 
  </div>
 
 
<div class="col-sm-12 col-lg-12 col-xs-12" style="margin-top: 20px;">
 <div class="col-sm-3 col-lg-3 col-xs-3">       
 </div>
 <div class="col-sm-3 col-lg-3 col-xs-3">
 <input type="button" style="width: 60%;" class="btn bg-olive btn-inline addBtn" onclick="createPettyCashReceipt('edit','pettyCash')" value="Submit" />	              
 </div>
 <div class="col-sm-3 col-lg-3 col-xs-3">
 <input type="button" style="width: 60%;" class="btn bg-olive btn-inline addBtn" data-dismiss="modal" onclick="getPettyCash('back','pettyCash','','false')" value="Cancel" />              
 </div>
 <div class="col-sm-3 col-lg-3 col-xs-3">       
 </div>    
  </div> 
 
  </div> 
<!-- model body end -->      
   </div>
   </div>
 </div>
    </div>

<!--Edit Receipts model end  -->

		
   <div class="col-sm-12 col-lg-12 col-xs-12">
            
         <div class="modal fade popup-display" id="items-modal" tabindex="-1" role="dialog" aria-hidden="true">
          <div class="modal-body">
                  <div class="box-body table-responsive" id="summary">
                 </div>
              </div>
</div>
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

 <div class="col-sm-12 col-lg-12 col-xs-12" style="margin-top: -20px;margin-bottom: 20px;font-size: 16px;text-align: right;">
 <div class="col-sm-6 col-lg-6 col-xs-6"></div>
 
<div class="col-sm-6 col-lg-2 col-xs-6">
  <label>Total Receipts</label>                
</div>       
<div class="col-sm-6 col-lg-1 col-xs-6">
 <input class="form-control minQtyProduct" readonly="readonly" type="text" value="${totalReceipts}" id="totalReceipts"/>              
</div>      
        


<div class="col-sm-6 col-lg-2 col-xs-6">
<label>Total Payments</label>                       
</div>
 
<div class="col-sm-6 col-lg-1 col-xs-6">
<input class="form-control minQtyProduct" readonly="readonly" type="text" value="${totalPaymentValue}" id="totalPaymentsValue"/>                   
</div>        
        
             
</div> 

        
        <input type="hidden" id="deleteActionLabel" value="<spring:message code="order_id.label" />"/>
        <input type="hidden" id="status" value="${status}"/>
        <input type="hidden" id="location" value="${selectedLocation}"/>
        
        <input type="hidden" id="flowUnder" name="flowUnder" value= "${flowUnder}">
              
              <div class="row" style="padding-left: 15px;padding-right: 15px">
              	<c:if test="${index-1 == 0 && totalRecords >maxRecords}">
              		<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="getPettyCash('data','pettyCash','${totalValue}','false')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-maxRecords >0}">
              				<div class="form-group col-lg-6" style="text-align: left;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="getPettyCash('data','pettyCash','${index - (maxRecords + 1)}','false');"> ${index} - ${totalValue} of ${totalRecords} 
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
              		<input type="button" class='paginationButton' value="&#60;" onclick="getPettyCash('data','pettyCash','${index - (maxRecords + 1)}','false');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="getPettyCash('data','pettyCash','${totalValue}','false')">
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
              		  <input type="button" onclick="getPettyCash('data','pettyCash',document.getElementById('pagination').value,'false');" class="btn bg-olive btn-inline  addBtn" value="GO">
              		</div>
				</div>
              	
              	
              </div>
        
        
  </body>
</html>
